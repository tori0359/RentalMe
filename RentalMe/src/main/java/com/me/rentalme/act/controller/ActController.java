package com.me.rentalme.act.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
* 이벤트 경매 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.18
*/
@Controller
@RequestMapping("/act")
public class ActController {

	private static final Logger logger = LoggerFactory.getLogger(ActController.class);
	/**
	* 이벤트 경매 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getActList() {
		
		ModelAndView mav = new ModelAndView("act/actList");
		return mav;
	}
	
	/**
	* 이벤트 경매 상세보기
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value="/{idx}", method=RequestMethod.GET)
	public ModelAndView getActDetail(@PathVariable int idx) {
		
		
		ModelAndView mav = new ModelAndView("act/actDetail");
		return mav;
	}
	
	/**
	* 이벤트 경매 상세설명
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value="/gds/{idx}", method=RequestMethod.GET)
	public ModelAndView getDiscript(@PathVariable int idx) {
		
		
		ModelAndView mav = new ModelAndView("act/actGdsDetail");
		return mav;
	}
	
	
	/**
	* 이벤트 경매 경매참여 - 컨트롤러 생성 잠시 보류
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	///////////////////////// 이벤트 경매 현장 전
	@RequestMapping(value="/ac", method=RequestMethod.GET)
	public String getActDei(HttpSession session) {
		logger.info("index...");
		System.out.println(session.getId()+">>>"+session.getAttributeNames());
		return "act/actDetail";
	}
	
	///////////////////////// 이벤트 경매 현장
	@RequestMapping(value="/bid", method=RequestMethod.GET)
	public String getActNow(HttpSession session) {
		logger.info("index...");
		System.out.println(session.getId()+">>>"+session.getAttributeNames());
		return "act/actBid";
	}
	
	
	
}
