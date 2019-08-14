package com.me.rentalme.login.find.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.model.entity.UserVo;

/**
* 아이디, 비밀번호 찾기 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.14
*/
@Controller
@RequestMapping("/login")
public class FindController {
	
	Logger log = LoggerFactory.getLogger(getClass());

	/**
	* 등록된 이메일로 아이디 찾기 폼
	* 
	* @param  
	* @return String 
	* @author 황인준
	* @exception
	* 등록일자 : 2019-08-14 
	*/
	@RequestMapping(value = "/email/findId", method = RequestMethod.GET)
	public String findEmailId() {
		log.debug("등록된 이메일로 아이디 찾기 폼 컨트롤러...");
		
		return "login/find/emailId";
	}
	
	/**
	* 등록된 이메일로 아이디 찾기
	* 
	* @param  String email : 이메일주소
	* @return String 
	* @author 황인준
	* @exception
	* 등록일자 : 2019-08-14 
	*/
	@RequestMapping(value = "/email/findId", method = RequestMethod.POST)
	public ModelAndView findEmailId(String email) {
		log.debug("등록된 이메일로 아이디 찾기 컨트롤러 ...");
		
		//Service 작성 - return : bean, parameter : email
		//UserVo bean = findService.findEmailId(email);
		
		ModelAndView mav = new ModelAndView();
		//성공 : 등록된 이메일 아이디찾기 결과
		//mav.addObject("bean", bean); // 아이디, 가입일자 전송
		mav.setViewName("login/find/resultId");
		
		return mav;
	}
	
	/**
	* 등록된 이메일로 비밀번호 찾기 폼
	* 
	* @param  
	* @return String 
	* @author 황인준
	* @exception
	* 등록일자 : 2019-08-14 
	*/
	@RequestMapping(value = "/email/findPw", method = RequestMethod.GET)
	public String findEmailPw() {
		log.debug("등록된 이메일로 비밀번호 찾기 폼 컨트롤러");
		
		return "login/find/emailPw";
	}
	
	/**
	* 등록된 이메일로 비밀번호 찾기 
	* 
	* @param  UserVo
	* @return String 
	* @author 황인준
	* @exception
	* 등록일자 : 2019-08-14 
	*/
	@RequestMapping(value = "/email/findPw", method = RequestMethod.POST)
	public String findEmailPw(UserVo bean) {
		log.debug("등록된 이메일로 비밀번호 찾기 컨트롤러");
		
		//서비스 작성(bean - id, email)
		
		return "login/find/changePw";
	}
	
	/**
	* 비밀번호 변경
	* 
	* @param  String chgPw1	- 변경할 비밀번호
	* @param  String chhPw2	- 변경할 비밀번호 확인
	* @return String 
	* @author 황인준
	* @exception
	* 등록일자 : 2019-08-14 
	*/
	@RequestMapping(value = "/login/email/findPw", method = RequestMethod.POST)
	public String modifyChgPw(String chgPw1, String chgPw2) {
		log.debug("비밀번호 변경 컨트롤러...");
		
		//서비스 작성(변경할 비밀번호, 변경할 비밀번호 확인, return int)
		
		return "login/login"; //성공 : 로그인페이지로 이동
	}
	
}
