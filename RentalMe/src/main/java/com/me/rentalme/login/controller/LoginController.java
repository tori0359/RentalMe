package com.me.rentalme.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.login.service.LoginService;
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
	
	@Inject
	LoginService loginService;
	
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
	* @param  UserVo userVo
	* @param  HttspSessio session
	* @return String 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(UserVo userVo, HttpSession session) {
		log.debug("로그인 컨트롤러...");
		
		//1. 입력한 로그인 아이디를 DB로부터 가져온다.
		String userId = userVo.getUserId();
		UserVo loginUser = loginService.getId(userId);
		
		//2. 입력한 비밀번호와 hash 처리된 비밀번호와 비교한다.
		ModelAndView mav = new ModelAndView();

		if(loginUser != null) {
			String msg = "";
			String userPw = userVo.getUserPw();
			String loginPw = loginUser.getUserPw();
			String loginMbNo = loginUser.getMbNo();
			
			System.out.println("회원번호:"+loginMbNo);
			
			//입력한 아이디가 DB에 있는 경우 입력한 비밀번호와 DB에 저장된 비밀번호 암호화 값과 비교
			if(BCrypt.checkpw(userPw, loginPw)) {
				//암호화된 비밀번호와 같은 경우 세션에 저장한다.(sessionId : loginUserId)
				session.setAttribute("loginUserId", userId);
				//회원번호를 세션에 담는다.
				session.setAttribute("loginMbNo", loginMbNo);
				
				mav.setViewName("redirect:/");
			}else {
				//암호화된 비밀번호가 다른 경우
				msg = "pwFail";
				mav.addObject("msg", msg);
				mav.setViewName("login/login");
			}
		}
		
		return mav;
	}
	

}
