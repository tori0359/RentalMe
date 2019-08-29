package com.me.rentalme.login.find.controller;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.login.find.service.LoginFindService;
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
public class FindController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	LoginFindService loginFindService; 
	
	/**
	* 등록된 이메일로 아이디 찾기
	* 
	* @param  String email : 이메일주소
	* @return String 
	* @author 황인준
	* @exception
	* 등록일자 : 2019-08-14 
	*/
	
	@RequestMapping(value = "/emailFindId", method = RequestMethod.GET)
	public @ResponseBody List<UserVo> findEmailId(@RequestParam("email") String email, Model model) {
		log.debug("등록된 이메일로 아이디 찾기 컨트롤러 ...");
		
		
		//등록한 이메일로 사용자 정보를 가지고온다.
		List<UserVo> infoList = loginFindService.getId(email);

		return infoList;
		
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
	@RequestMapping(value = "/login/email/findPw", method = RequestMethod.PUT)
	public String modifyChgPw(String chgPw1, String chgPw2) {
		log.debug("비밀번호 변경 컨트롤러...");
		
		//서비스 작성(변경할 비밀번호, 변경할 비밀번호 확인, return int)
		
		return "login/login"; //성공 : 로그인페이지로 이동
	}
	
}
