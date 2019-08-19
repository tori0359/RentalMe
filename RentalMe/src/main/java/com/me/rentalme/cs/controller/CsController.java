package com.me.rentalme.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
* 고객센터 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.18
*/
@Controller
@RequestMapping("/cs")
public class CsController {

	/**
	* 고객센터 리스트 
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getCsList() {
		
		
		ModelAndView mav = new ModelAndView("cs/csList");
		return mav;
	}
	
	/**
	* 고객센터 - 문의 등록 폼 
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/csQuest", method = RequestMethod.GET)
	public ModelAndView getCsQuestForm() {
		
		
		ModelAndView mav = new ModelAndView("cs/csQuestAdd");
		return mav;
	}
	
	/**
	* 고객센터 - 문의 등록 
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/csQuest", method = RequestMethod.POST)
	public ModelAndView setCsQuestAdd() {
		
		
		ModelAndView mav = new ModelAndView("cs/csList");
		return mav;
	}
}
