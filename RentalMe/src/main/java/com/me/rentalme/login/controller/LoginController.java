package com.me.rentalme.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.rentalme.model.entity.UserVo;

/**
* 로그인 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.13
* 수정일자 : 2019.08.14
*/
@Controller
public class LoginController {
	
//	@Inject
//	LoginService loginService;
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	/**
	* 로그인 폼
	* 
	* @param  
	* @return String 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		log.debug("로그인 폼 컨트롤러...");

		return "login/login";
	}
	
	/**
	* 로그인
	* 
	* @param  UserVo
	* @param  HttpServletRequest - session처리하기 위해.
	* @return String 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVo bean, HttpServletRequest req) {
		log.debug("로그인 컨트롤러...");
		
		//Service에서 세션 처리 
		//int result = loginService.login(bean, req);
		
		return "redirect:/";
	}
	

}
