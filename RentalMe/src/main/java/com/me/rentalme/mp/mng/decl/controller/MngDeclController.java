package com.me.rentalme.mp.mng.decl.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 신고접수 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
public class MngDeclController {
	
	Logger log = LoggerFactory.getLogger(getClass());

	/**
	* 신고접수 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mp/mng/decl", method = RequestMethod.GET)
	public ModelAndView getDeclList() {
		log.debug("신고접수 리스트 컨트롤러...");
	
		ModelAndView mav = new ModelAndView("/mp/manager/mngDeclList");
		return mav;
	}
}
