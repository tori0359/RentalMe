package com.me.rentalme.rental.pay.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 렌탈페이지 - 결제하기
* [아임포트, 카카오페이] - 서비스 추가 예정 보류
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.18
*/
@Controller
@RequestMapping("/rental/pay")
public class RentalPayController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	* 카카오페이 결제
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/kakaoPay", method = RequestMethod.POST)
	public ModelAndView kakaoPay() {
		log.debug("카카오페이 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("rental/rentalAppliLgList");
		return mav;
	}	
	
}
