package com.me.rentalme.act.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.TreeMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ActHandler extends TextWebSocketHandler{
	//채팅서버
	Map<String,WebSocketSession> map=new HashMap<String,WebSocketSession>();			//소켓에 연결된 client
	Map<String,Map<String, Integer>> premap=new LinkedHashMap<String, Map<String, Integer>>();//응찰한 사람 전부 아이디, 시간,가격 넣음
	Map<String,Integer> pricemap=new LinkedHashMap<String, Integer>();			//아이디 가격 넣음
	List<Object> bidList=new ArrayList<Object>();										//현재 낙찰가에 응찰한 사람
	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss.SSS");
//	String list;
	int totalprice;							//낙찰가
	boolean interup=true;					//중간에 응찰시 스레드를 끊음
///////////////////////////////////////////////////////////////////////////////////////////////////////////
	//소켓이 접속했을 때 이벤트
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("Connect...");
		map.put(session.getId(), session);
		System.out.println(session.getId()+">websocket>"+session.getAttributes().get("loginUserId"));
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////
	//소켓이 끊어졌을 때 이벤트
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("Close...");
		map.remove(session.getId());
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////
	//소켓이 메시지를 보냈을 때 이벤트
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 클라이언트에 전달
		System.out.println("메시지"+message.getPayload());
		
		//gson은 추가했으나 사용안함 jaxon으로 사용
		//json -> map 
		ObjectMapper mapper = new ObjectMapper();
		String json = message.getPayload();
		try {
			Map<String, Object> mapping = new HashMap<String, Object>();
			mapping = mapper.readValue(json, new TypeReference<Map<String, String>>(){});
			
			//현재 소켓에 연결된 인원 수를 cnt에 넣는다.
			mapping.put("cnt", this.map.size());
			System.out.println("누가 이 메시지를 보냈지?:"+mapping.get("id"));
			//map -> json
			//System.out.println("json값 : "+json);
			json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(mapping);
			if(String.valueOf(mapping.get("type")).equals("adminMsg")) {
				bidList=new ArrayList<Object>();
				totalprice=totalprice+Integer.parseInt(String.valueOf(mapping.get("text")));
				mapping.put("text", totalprice);
			}else if(String.valueOf(mapping.get("type")).equals("bid")) {
				bidList.add(session.getAttributes().get("loginUserId"));
				Map<String, Integer> inmap=new HashMap<String, Integer>();				//맵에 들어갈 맵
				inmap.put(dayTime.format(new Date(System.currentTimeMillis())), totalprice);		//현재 시간과 가격을 넣는다
				premap.put(String.valueOf(session.getAttributes().get("loginUserId")), inmap);
				System.out.println("아이디시간:"+idtimeMap(premap).toString());
				System.out.println("아이디시간 오름차순:"+funcAsc(idtimeMap(premap)).toString());
				System.out.println("최종맵:"+changeMap(funcAsc(idtimeMap(premap)),premap).toString());
				System.out.println("최종맵에서 아이디 가격:"+idpriceMap(changeMap(funcAsc(idtimeMap(premap)),premap)).toString());
				
				String listMsg="{\"type\":\"listMsg\",\"text\":\""+idpriceMap(changeMap(funcAsc(idtimeMap(premap)),premap))+"\",\"id\":\"admin\",\"cnt\":0}";
				mapping = mapper.readValue(listMsg, new TypeReference<Map<String, String>>(){});
				listMsg = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(mapping);
				TextMessage msg= new TextMessage(listMsg);
				Set<String> keys=map.keySet();
				Iterator<String> ite=keys.iterator();
				while(ite.hasNext()) {
					map.get(ite.next()).sendMessage(msg);
				}
				
				
				interup=false;
			}else if(String.valueOf(mapping.get("type")).equals("enter")) {

			}else if(String.valueOf(mapping.get("type")).equals("countDown")) {
				System.out.println("카운트 들어옴");
				interup=true;
				timeThread();
			}
			
			
		} catch (JsonGenerationException e) { 
			e.printStackTrace(); 
		} catch (JsonMappingException e) {
			e.printStackTrace(); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		}
		
		//변경된 json값을 넣어준다.
		TextMessage msg= new TextMessage(json);
		Set<String> keys=map.keySet();
		Iterator<String> ite=keys.iterator();
		while(ite.hasNext()) {
			map.get(ite.next()).sendMessage(msg);
		}
		
		System.out.println("bidList:"+ bidList.toString());
		System.out.println("premap:"+ premap.toString());
		System.out.println("lm:"+idtimeMap(premap));
		
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
	public Map<String,String> idtimeMap(Map<String,Map<String, Integer>> premap) {					//맵안에 맵뽑아 아이디,시간 맵만들기
		Iterator<String> preMapIter = premap.keySet().iterator();
        Map<String,String> othermap=new HashMap<String,String>();
        Map<String,Integer> trashmap=new HashMap<String,Integer>();
        
        while(preMapIter.hasNext()) {
 
            String key = preMapIter.next();
            trashmap = premap.get(key);
            Iterator<String> trashiter = trashmap.keySet().iterator();
            while(trashiter.hasNext()) {
            	String key2 = trashiter.next();
            	othermap.put(key, key2);
            }
        }
        return othermap;
	}
	public Map<String,Integer> idpriceMap(Map<String,Map<String, Integer>> premap) {					//맵안에 맵뽑아 아이디,가격 맵만들기
		Iterator<String> preMapIter = premap.keySet().iterator();
        Map<String,Integer> othermap=new HashMap<String,Integer>();
        Map<String,Integer> trashmap=new HashMap<String,Integer>();
        
        while(preMapIter.hasNext()) {
 
            String key = preMapIter.next();
            trashmap = premap.get(key);
            Iterator<String> trashiter = trashmap.keySet().iterator();
            while(trashiter.hasNext()) {
            	String key2 = trashiter.next();
            	int price = trashmap.get(key2);
            	othermap.put(key, price);
            }
        }
        return othermap;
	}
	
	public Map<String,String> funcAsc(Map<String,String> map) {			//아이디 시간
		Map<String,String> ascMap=new LinkedHashMap<String, String>();
		List<String> keySetList = new ArrayList<String>(map.keySet());
		 Collections.sort(keySetList, (o1, o2) -> (map.get(o1).compareTo(map.get(o2))));		//오름차순 정렬
		 for(String key : keySetList) {
			 ascMap.put(key, map.get(key));
	     }
		 return ascMap;
	}
	
	public Map<String,Map<String, Integer>> changeMap(Map<String,String> map, Map<String,Map<String, Integer>> premap){
		Map<String,Map<String, Integer>> lastMap=new LinkedHashMap<String, Map<String,Integer>>();
		Set<String> set = map.keySet();
		Iterator<String> iterator = set.iterator();
		while(iterator.hasNext()){
		  String key = (String)iterator.next();
		  lastMap.put(key, premap.get(key));
		}
		
		return lastMap;
	}
		
	public void timeThread() {
		Timer m_timer = new Timer();
		TimerTask m_task = new TimerTask() {
			int count=5;
			TextMessage msg;
			@Override
			public void run() {
				if(count>0&&interup) {
					msg = new TextMessage(count+"");
					count--;
				}else if(count==0&&interup){
					System.out.println("첫번째리스트:"+bidList.get(0));
					String endMsg="{\"type\":\"endMsg\",\"text\":\""+bidList.get(0)+"\",\"id\":\"admin\",\"cnt\":0}";
					ObjectMapper mapper = new ObjectMapper();
					Map<String, Object> mapping = new HashMap<String, Object>();
					try {
						mapping = mapper.readValue(endMsg, new TypeReference<Map<String, String>>(){});
						endMsg = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(mapping);
					} catch (IOException e) {
						e.printStackTrace();
					}
					msg= new TextMessage(endMsg);
					count--;
				}else {
					System.out.println("끝...");
					m_timer.cancel();
					count--;
				}
				
				if(count>=-1) {
					Set<String> keys=map.keySet();
					Iterator<String> ite=keys.iterator();
					while(ite.hasNext()) {
						try {
							map.get(ite.next()).sendMessage(msg);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		};
		m_timer.schedule(m_task, 1000, 1000);
	}
	
//	//별도의 스태틱 함수로 구현 // 맵 순서주는 함수
//
//	public static List sortByValue(final Map map) {
//
//	        List<String> list = new ArrayList();
//	        list.addAll(map.keySet());
//	        
//	        Collections.sort(list,new Comparator() {
//	            
//	            public int compare(Object o1,Object o2) {
//	                Object v1 = map.get(o1);
//	                Object v2 = map.get(o2);
//
//
//	                return ((Comparable) v2).compareTo(v1);
//	            }
//	        });
//	        Collections.reverse(list); // 주석시 오름차순
//	        return list;
//	    }
	
}

