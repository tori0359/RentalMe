package com.me.rentalme.mp.mng.act.cotroller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.act.service.ActService;
import com.me.rentalme.model.entity.ActVo;


/**
* 마이페이지(관리자) - 이벤트 경매 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/mp/mng")
public class MngActController {
	
	@Inject
	ActService actService;
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	 * @throws SQLException 
	* 이벤트 경매 
	* 
	* @param  String code - c : 이벤트 경매 등록 폼, R : 이벤트 경매 리스트
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/actList", method = RequestMethod.GET)
	public ModelAndView getAct() throws SQLException{
		
		ModelAndView mav=new ModelAndView();
		
		/////
		///////
		ArrayList<ActVo> list=new ArrayList<ActVo>(actService.mngListAct());
		mav.addObject("actList", actService.actList() );
		mav.addObject("actList", actService.mngListAct());
		System.out.println(actService.mngListAct());		
		System.out.println(actService.mngListAct());		
		
		mav.setViewName("/mp/manager/mngActList");
		
		return mav;
	}
	/**
	* 이벤트 경매 등록 
	* 
	* @param  ProductVo - 상품
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/actInsertPage")
	public ModelAndView addActPage() {
		log.debug("이벤트 경매 등록 페이지 컨트롤러");
		
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mp/manager/mngActAdd");
		
		//
		return mav;
	}
	/**
	 * @throws ParseException 
	 * @throws SQLException 
	* 이벤트 경매 등록 
	* 
	* @param  ProductVo - 상품
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	
	@RequestMapping(value="")
	public ModelAndView modalInsert() {
		
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	@RequestMapping(value = "/actInsert", method = RequestMethod.POST)
	public String addAct(@RequestParam("actStTime") @DateTimeFormat(pattern ="yyyy-MM-dd HH:mm" ) String actStTime,@RequestParam("actEdTime") @DateTimeFormat(pattern ="yyyy-MM-dd HH:mm" ) 
	String actEdTime,MultipartHttpServletRequest mtfRequest,@ModelAttribute ActVo actVo) throws SQLException, ParseException {
		log.debug("이벤트 경매 등록 컨트롤러");
		
		int cnt=1;
		String currentTime=System.currentTimeMillis()+"";
		System.out.println("커런트타임"+currentTime);
		System.out.println("시작시간"+actStTime.charAt(4));
		System.out.println("종료시간"+actEdTime.charAt(5));
		int restTime=0;
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm");
		
		String format_time1 = format1.format (System.currentTimeMillis());
		
		   int ctime=0;
		   int actStartTime=0;
		   int actEndTime=0;
		for(int i=0;i<actStTime.length();i++) {
			actStartTime=actStTime.charAt(i);
			actEndTime=actEdTime.charAt(i);
			
			if(i==10) {
				actEndTime=0;
			}
			restTime=actStartTime-actEndTime;
			ctime=format_time1.charAt(i);
			System.out.print(actEndTime);
			System.out.println(ctime);
		}
		int restTime2=0;
		restTime2=actEndTime-ctime;
		System.out.println(restTime2);
		
		System.out.println("현재시간"+format_time1);
		/*
		 * SimpleDateFormat transFormat=new SimpleDateFormat("yyyy-MM-dd T HH:mm"); Date
		 * actStTime=(Date)transFormat.parse(startTime); Date
		 * actEdTime=(Date)transFormat.parse(endTime);
		 */
		
		String uploadDir="C:\\java\\workspace4\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\RentalMe\\imgs\\";
		String uploadRDS="/imgs/";
		
		List<MultipartFile> fileList = mtfRequest.getFiles("imgfile");
		
		
	        
		 for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	            String fName=currentTime + originFileName;
	            
	            String safeFile = uploadDir+fName;
	            String img=uploadRDS+fName;
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	              
	                e.printStackTrace();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	            if(cnt==1) {
	            	actVo.setImg1(img);
	            	cnt++;
	            }else if(cnt==2) {
	            	actVo.setImg2(img);
	            	cnt++;
	            }else if(cnt==3) {
	            	actVo.setImg3(img);
	            	cnt++;
	            }else if(cnt==4) {
	            	actVo.setImg4(img);
	            }
	        }
		 
		actService.addAct300(actVo);
		actService.addAct100(actVo);
		return "redirect:/mp/mng/actList";
	}

	
	
	
	
	

	
	
	
	@RequestMapping(value = "searchCode", produces = "application/json; charset=utf-8")
	   public void searchList(HttpServletRequest req, HttpServletResponse res, String param) {
	      System.out.println("js코드");
	      res.setCharacterEncoding("utf-8");
	    
	      
	      try {
	         String classifi = param;
	         System.out.println("대분류"+classifi);
	         List<String> goodsList = new ArrayList<String>();
	         if(classifi.equals("10")) {
	        	 goodsList.add("에어컨");
	        	 goodsList.add("냉난방기");
	        	 goodsList.add("냉장고");
	        	 goodsList.add("TV");
	        	 goodsList.add("세탁기");
	        	 goodsList.add("빨래건조기");
	        	 goodsList.add("공기청정기");
	        	 goodsList.add("복합기/프린터");
	         }
	         else if(classifi.equals("20")) {
	        	 goodsList.add("커피머신");
	        	 goodsList.add("제습기");
	        	 goodsList.add("청소기");
	        	 goodsList.add("드라이어");
	        	 goodsList.add("빔프로젝터");
	        	 goodsList.add("컴퓨터/노트북");
	        	 goodsList.add("비데");
	        	 goodsList.add("면도기");
	         }
	         else if(classifi.equals("30")) {
	        	 
	        	 goodsList.add("음식물처리기");
	        	 goodsList.add("제빙기");
	        	 goodsList.add("전자레인지");
	        	 goodsList.add("컴퓨터/에어프라이어");
	        	 goodsList.add("오븐");
	         }
	         else if(classifi.equals("40")) {
	        	 
	        	 goodsList.add("침대");
	        	 goodsList.add("매트리스");
	        	 goodsList.add("쇼파");
	        	 goodsList.add("책상");
	         }
	         else if(classifi.equals("50")) {
	        	 goodsList.add("악기");
	        	 goodsList.add("명품");
	        	 goodsList.add("귀금속");
	         }
	         else if(classifi.equals("60")) {
	        	 goodsList.add("침실패키지");
	        	 goodsList.add("주방패키지");
	        	 goodsList.add("욕실패키지");
	        	 goodsList.add("기타패키지");
	         }
	         
	         
	       
	        
	     //    JSONArray jsonArray = new JSONArray();
	       //  JSONArray jsonarray=new JSONArray();
	         org.json.JSONArray jsonArray=new org.json.JSONArray();
	         
	         for(int i=0; i<goodsList.size(); i++) {
	            jsonArray.put(goodsList.get(i).toString());
//	            System.out.println(jsonArray.get(i));
	         }
	         
	         
	         PrintWriter pw = res.getWriter();
	         pw.print(jsonArray.toString());
	         pw.flush();
	         pw.close();
	         
//	         for(int i=0; i<jsonArray.length(); i++) {
//	            System.out.println(jsonArray.get(i));
//	         }
	         
	      } catch(Exception e) {
	         System.out.println("ajax error");
	      }
	   }

	@RequestMapping(value="searchList", method=RequestMethod.GET)
	@ResponseBody
	public List<ActVo> serchList(@RequestParam("param") String goodsNum,Model model) throws SQLException{
		List<ActVo> goodsList=actService.goodsList(goodsNum);
		System.out.println("왜 안나오냐");
	
		
		ArrayList<String> array=new ArrayList();
		
		
		for(int i=0;i<goodsList.size();i++) {
			array.add(i, goodsList.get(i).toString());
		}
		for(int i=0;i<goodsList.size();i++) {
			System.out.println("전체 리스트"+goodsList.get(i).getGdsCd());
			StringBuilder act=new StringBuilder(goodsList.get(i).getGdsCd());
			act.setCharAt(0,'3');
			act.setCharAt(1,'0');
			System.out.println(act.toString());
		
			System.out.println();
			System.out.println("전체 리스트 수정"+goodsList.get(i).getGdsCd());
			System.out.println("전체 리스트"+goodsList.get(i).getGdsNm());
		}
		System.out.println("hi"+array.get(0).toString());
		return goodsList;
	}
	
	/*
	 * @RequestMapping(value="selectGoods", method=RequestMethod.GET)
	 * 
	 * @ResponseBody public ActVo selectGoods(@RequestParam("param") String
	 * goodsNum) throws SQLException{ ActVo actVo=new ActVo();
	 * actVo.setGdsCd(goodsNum);
	 * 
	 * System.out.println(actVo.getGdsCd()); ActVo
	 * goodsInfo=actService.goodsInfo(actVo.getGdsCd()); return goodsInfo; }
	 */





}
