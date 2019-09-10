package com.me.rentalme.join.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.me.rentalme.auth.service.HpAuthService;
import com.me.rentalme.auth.service.MailAuthService;
import com.me.rentalme.join.service.JoinService;
import com.me.rentalme.model.entity.UserVo;

/**
* 회원가입 컨트롤러
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.12
* 수정일자 : 2019.09.02
*/
@Controller
@RequestMapping(value="/join")
public class JoinController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	JoinService joinService; 
	
	@Inject
	MailAuthService mailAuthService;
	
	@Inject
	HpAuthService hpAuthService;
	
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
	* 회원정보 등록 폼
	* 
	* @param  None 
	* @return String 
	* @author 황인준
	* @exception None
	*/
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() {
		log.debug("회원정보 등록 폼 컨트롤러");
		
		return "join/info";
	}
	
	/**
	* 회원정보 입력
	* 
	* @param  UserVo userVo 
	* @param  HttpServletREquest req  
	* @return String 
	* @author 황인준
	* @exception None
	*/
	@RequestMapping(value = "/info", method = RequestMethod.POST)
	public ModelAndView registerInfo(UserVo userVo, HttpServletRequest req) {
		log.debug("회원정보 입력 컨트롤러...");
		
		//회원번호 시퀀스추가
		joinService.addMemNoSeq();
		
		//회원번호 조회
		joinService.getMemNo();
				
		//회원가입
		joinService.addInfo(userVo);
		
		//인증 메일 보내기 (2019-08-27 : 회원가입 양식에서 인증하는 방식으로 변경으로 인한 삭제)
		//mailAuthService.mailSendWithUserKey(userVo.getEmail(), userVo.getUserId(), req);
		
		
		return new ModelAndView("join/compl");
	}

	/**
	* 아이디 중복체크
	* 
	* @param  String uesrId - 사용자 아이디
	* @return String 
	* @author 황인준
	* @exception None
	*/
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	public void checkId (@RequestParam("userId")String userId, HttpServletResponse res) {
		log.debug("아이디 중복체크 컨트롤러");
		
		//아이디 중복체크
		String msg = joinService.getId(userId);
		
		try {
			res.getWriter().write(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}		

	}
	/**
	* 핸드폰 인증코드 발송
	* 
	* @param  String hp - 입력한 핸드폰 번호
	* @return String 
	* @author 황인준
	* 등록일자 : 2019-09-05
	*/	
	@RequestMapping(value="/hpCodeSend", method = RequestMethod.POST)
	public void sendHpCode(@RequestParam String hp, HttpServletResponse res) {
		//System.out.println("view에서 넘어온 핸드폰번호 : "+hp);
		//핸드폰으로 인증 번호 보내기
		
		String key = hpAuthService.sendHp(hp);
		
		try {
			res.getWriter().write(key);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	* 이메일 인증코드 발송
	* 
	* @param  String uesrId - 사용자 아이디
	* @return  
	* @author 황인준
	* @exception None
	*/
	@RequestMapping(value = "/emailCodeSend", method = RequestMethod.GET)
	public void sendEmailCode (@RequestParam("email") String email, HttpServletResponse res) {
		log.debug("인증코드 발송 컨트롤러");
		
		//인증 메일 보내기 
		String key = mailAuthService.mailSendWithUserEmail(email);
		
		try {
			res.getWriter().write(key);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	* 회원가입 후 인증상태(Y) 업데이트 (2019-08-27 : 회원가입 양식에서 인증하는 방식으로 변경으로 인한 삭제)
	* 
	* @param  String userId   : 사용자아이디
	* @param  String emailKey : 사용자 이메일 키(난수)
	* @return String 
	* @author 황인준
	* @exception None
	*/
//	@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
//	public String updateEmailConfirm(@RequestParam String userId,@RequestParam String emailKey) {
//		log.debug("회원가입 후 인증상태(Y) 업데이트 컨트롤러");
//		
//		mailAuthService.updateEamilConfirm(userId, emailKey);
//		
//		return "join/authRegCompl";
//	}
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
