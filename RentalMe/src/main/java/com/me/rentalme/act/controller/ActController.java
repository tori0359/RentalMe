package com.me.rentalme.act.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.act.service.ActService;



/**
* 이벤트 경매 컨트롤러
* 
* @author 신지영
* @version ver1.0
* @see 
* 등록일자 : 2019.09.04
*/
@Controller
@RequestMapping("/act")
public class ActController {
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	ActService actService;
	
	
	/**
	* 이벤트 경매 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 신지영
	* @exception 
	*/
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView getActList() throws SQLException{
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("alist", actService.actList());
		mav.addObject("alist2",actService.actEndList());
				
		mav.setViewName("act/actList");
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
		
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("act/actDetail");
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
	
	
}
