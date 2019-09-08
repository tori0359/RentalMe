package com.me.rentalme.act.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	List<Object> bidList=new ArrayList<Object>();										//현재 낙찰가에 응찰한 사람
	String list;
					
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
			json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(mapping);
			//System.out.println("json값 : "+json);
			
			System.out.println(mapping.get("type"));
			if(String.valueOf(mapping.get("type")).equals("adminMsg")) {
				bidList=new ArrayList<Object>();
			}else if(String.valueOf(mapping.get("type")).equals("bid")) {
				bidList.add(session.getAttributes().get("loginUserId"));
			}else if(String.valueOf(mapping.get("type")).equals("enter")) {
				
				Map<String,Object> listAll=new HashMap<String,Object>();
				listAll.put("type", "bidlist");
				listAll.put("text", bidList);
				listAll.put("id", session.getAttributes().get("loginUserId"));
				listAll.put("cnt", "");
				
				list=mapper.writerWithDefaultPrettyPrinter().writeValueAsString(listAll);
				
				TextMessage msg=new TextMessage(list);
				Set<String> keys=map.keySet();
				Iterator<String> ite=keys.iterator();
				while(ite.hasNext()) {
					map.get(ite.next()).sendMessage(msg);
				}
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
	}
	
	
	
 
//	public void timeThread(WebSocketSession session) {
//		Timer m_timer = new Timer();
//		TimerTask m_task = new TimerTask() {
//			ObjectMapper mapper = new ObjectMapper();
//			@Override
//			public void run() {
//				Map<String,Object> serverMsg=new HashMap<String,Object>();
//				serverMsg.put("type", "bidlist");
//				serverMsg.put("text", bidList);
//				serverMsg.put("id", session.getAttributes().get("loginUserId"));
//				serverMsg.put("cnt", "");
//			}
//		};
//		m_timer.schedule(m_task, 10000, 3000);
//	}
	
}
