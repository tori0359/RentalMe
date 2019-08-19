package com.me.rentalme.mp.mng.rental.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 마이페이지(관리자) 등록 컨트롤러
* 
* @author 황인준
* @version ver1.0 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/mp")
public class MngRentalController {

	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	* 마이페이지(관리자) - 상품등록 폼
	* 
	* @param  
	* @return String 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/", method = RequestMethod.GET)
	public String getPrdRegisterForm() {
		log.debug("마이페이지(관리자) 상품 등록 폼 컨트롤러");
		
		return "mp/manager/mngRentalAdd";
	}
	
	/**
	* 마이페이지(관리자) - 상품등록 
	* 
	* @param  String prdDiv - 중분류
	* @return ModelAndView
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/mng/rental/{prdDiv}", method = RequestMethod.POST)
	public ModelAndView getRentalList(@PathVariable String prdDiv) {
		log.debug("마이페이지(관리자) 상품 등록 컨트롤러");
		
		//서비스 등록
		if(prdDiv.equals("lg")) {
			//대형가전 등록 서비스 작성
		}else if(prdDiv.equals("sm")) {
			//소형가전 등록 서비스 작성
		}else if(prdDiv.equals("kitc")) {
			//주방용품 등록 서비스 작성
		}else if(prdDiv.equals("furn")) {
			//가구 등록 서비스 작성
		}else if(prdDiv.equals("rest")) {
			//기타 등록 서비스 작성
		}else if(prdDiv.equals("pkg")) {
			//패키지 등록 서비스 작성
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/manager/mngMainList");
		return mav;
	}
}
