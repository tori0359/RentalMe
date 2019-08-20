package com.me.rentalme.mp.mng.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
* 마이페이지(관리자) - 사용자관리
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/mp/mng")
public class MngUserController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	* 사용자 리스트
	* 
	* @param  
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView getUserList() {
		log.debug("사용자 리스트 컨트롤러");
		
		//사용자 리스트 서비스 작성
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mp/manager/mngUserList");
		return mav;
	}

	/**
	* 사용자 상세정보
	* 
	* @param  String memNo - 회원번호
	* @return ModelAndView 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/act/{memNo}", method = RequestMethod.GET)
	public ModelAndView getUserDetail(@PathVariable("memNo") String memNo) {
		log.debug("사용자 상세정보 컨트롤러");
		
		//사용자 상세정보 서비스 작성
		
		
		ModelAndView mav = new ModelAndView("mp/manager/mngUserDetail");
		return mav;
	}

}
