package com.me.rentalme.join.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.rentalme.join.service.JoinService;
import com.me.rentalme.model.entity.UserVo;

/**
* 회원가입 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.12
* 수정일자 : 2019.08.13
*/
@Controller
@RequestMapping(value="/join")
public class JoinController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	JoinService joinService; 
	
	/**
	* 회원가입 페이지 
	* 
	* @param  none
	* @return String 
	* @author 황인준
	* @exception none
	*/
	@RequestMapping(value="/signup", method = RequestMethod.GET)
	public String getSignUp() {
		log.debug("회원가입 컨트롤러 페이지...");
		
		return "join/joinus";
	}
	
	/**
	* 약관동의 페이지 
	* 
	* @param  none
	* @return String 
	* @author 황인준
	* @exception none
	*/
	@RequestMapping(value="/terms", method=RequestMethod.GET)
	public String getTerms() {
		log.debug("약관동의 컨트롤러...");
		
		return "join/terms";
	}
	
	/**
	* 회원정보 입력
	* 
	* @param  UserVo 
	* @return String 
	* @author 황인준
	* @exception None
	*/
	@RequestMapping(value = "/info", method = RequestMethod.POST)
	public String registerInfo(UserVo bean) {
		log.debug("회원정보 입력 컨트롤러...");
		
		int result = joinService.addInfo(bean);
		
		//회원정보 입력 성공 시 가입완료 페이지로 이동
		if(result > 0) {
			return "join/compl";		
		}
		//회원정보 입력 실패 시 입력페이지로 다시 이동 (비밀번호만 초기화 되고 나머지 값 유지)
		return null;
		
	}
	
	/**
	* 가입완료 페이지
	* 
	* @param  None 
	* @return String - 로그인페이지로 이동
	* @author 황인준
	* @exception None
	*/
	@RequestMapping(value = "/compl", method = RequestMethod.POST)
	public String getCompl() {
		log.debug("가입완료 컨트롤러...");
	
		return "login/login";
	}
}
