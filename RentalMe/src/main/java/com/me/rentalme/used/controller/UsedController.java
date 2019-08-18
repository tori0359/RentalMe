package com.me.rentalme.used.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
* 중고거래 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.18
*/
@Controller
@RequestMapping("/used")
public class UsedController {

	/**
	* 중고거래 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getUsedList() {
		
		
		ModelAndView mav = new ModelAndView("used/usedList");
		return mav;
	}
	
	/**
	* 중고거래 상세보기
	* 
	* @param  int idx
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/{idx}", method = RequestMethod.GET)
	public ModelAndView getUsedDetail(@PathVariable("idx") int idx) {
		
		
		ModelAndView mav = new ModelAndView("used/usedDetail");
		return mav;
	}
	
	/**
	* 나의 중고상점 리스트
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/store", method = RequestMethod.GET)
	public ModelAndView getUsedMyStroe() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMyStore");
		return mav;
	}
	
	/**
	* 중고거래 상품등록 폼
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng", method = RequestMethod.GET)
	public ModelAndView getUsedPrd() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMng");
		return mav;
	}
	
	/**
	* 중고거래 상품등록 
	* 
	* @param  None
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng", method = RequestMethod.POST)
	public ModelAndView addUsedPrd() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMyStore");
		return mav;
	}
	
	/**
	 * 중고거래 상품수정
	 * 
	 * @param  None
	 * @return ModelAndView 
	 * @author 황인준
	 * @exception 
	 */
	@RequestMapping(value = "/mng", method = RequestMethod.PUT)
	public ModelAndView modifyUsedPrd() {
		
		
		ModelAndView mav = new ModelAndView("used/usedMyStore");
		return mav;
	}

}
