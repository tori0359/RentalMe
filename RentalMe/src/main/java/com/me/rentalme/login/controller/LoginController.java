package com.me.rentalme.login.controller;


import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

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
	* @param  HttpServletRequest req
	* @return ModelAndView mav 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest req) {
		log.debug("로그인 폼 컨트롤러...");
		
		ModelAndView mav = new ModelAndView("login/login");
		
		//이메일로 아이디찾기에서 넘어온 아이디 값이 있으면 userId값을 담아 로그인 페이지로 이동
		if(req.getParameter("userId") != null) {
			String userId = req.getParameter("userId");
			mav.addObject("userId", userId);
		}

		return mav;
	}
	
	/**
	* 로그인
	* 
	* @param  UserVo userVo
	* @param  HttspSessio session
	* @param  Model model - LoginInterceptor UserVo를 사용하기 위해서 사용
	* @return ModelAndView mav
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(UserVo userVo, HttpSession session, Model model, HttpServletRequest req) {
		log.debug("로그인 컨트롤러...(서비스에서 작성했어야 하나... 만들다보니 컨트롤러에 추후 이동[보류])");
		
		String msg = "";
		
		/* 로그인 유효성 체크 */
		//입력한 아이디
		String userId = userVo.getUserId();
		
		/* 입력한 아이디의 정보를 DB로부터 가져온다. */
		UserVo loginUser = loginService.getId(userId);

		/*
		 * 비밀번호 조건
		 * 1. 로그인 사용자는 회원테이블에 존재해야 한다. 
		 * 2. 로그인 사용자는 사용자 상태코드가 정상
		 * 3. 이메일 인증 Y
		 * 4. 입력한 비밀번호와 암호화된 비밀번호와 일치
		 * 5. 오류횟수가 5회 미만
		 * */ 
		ModelAndView mav = new ModelAndView();

		if(loginUser != null) {
			String userPw 		= userVo.getUserPw();							//입력한 비밀번호
			String loginId 		= loginUser.getUserId();						//DB에 담긴 아이디
			String loginPw 		= loginUser.getUserPw();						//DB에 담긴 비밀번호
			String emailKey 	= loginUser.getEmailKey();						//이메일 키값(Y : 인증, 난수key : 비인증)
			int userStsCd		= Integer.parseInt(loginUser.getUserStsCd());	//유저 상태 코드(1: 정상, 2: 정지-사용중지, 3: 삭제-강제탈퇴)
			int pwFailCnt		= Integer.parseInt(loginUser.getPwFailCnt());	//비밀번호 오류 횟수(5회이상 정지사용자로 변경)
				
			/*오류횟수 5회이상일 경우 계정 정지*/
			if(pwFailCnt >= 5) {
				//사용자 상태코드를 정지 상태로 변경.
				loginService.setUserBann(loginId);
										
				msg = "pwFailCntOver";
				mav.addObject("msg", msg);
				mav.setViewName("login/login");
				return mav;
			}

			if(userStsCd == 2) {				//정지사용자
				msg = "bannedId";
				mav.addObject("msg", msg);
				mav.setViewName("login/login");
				return mav;
			}else if(userStsCd == 3) {			//강제탈퇴 사용자(사용불가 사용자 입니다.)
				msg = "kickId";
				mav.addObject("msg", msg);
				mav.setViewName("login/login");
				return mav;
			}

			//이메일 인증을 한 사용자 이고 사용자 상태가 정상인 사용자
			if(emailKey.equals("Y") && userStsCd == 1) {
				//입력한 아이디가 DB에 있는 경우 입력한 비밀번호와 DB에 저장된 비밀번호 암호화 값과 비교
				if(BCrypt.checkpw(userPw, loginPw)) {
					
					//사용하고 있는 브라우저 확인 체크
					String userAgent = req.getHeader("User-Agent");
					String browser = "";										//사용자가 로그인 한 브라우저
					String browserStsCd = "";									//DB에 입력할 브라우저 코드
					
					System.out.println("로그인 유저정보 : "+loginUser.toString());
					
					String loginStsCd   		= loginUser.getLoginStsCd();	//로그인상태 체크
					String loginBrowserStsCD 	= loginUser.getBrowserStsCd();	//로그인 브라우저 코드
					String loginBrowserNm = "";									//로그인한 브라우저 코드명
					
					//Db에 저장된 로그인 한 유저의 브라우저
					if(loginBrowserStsCD.equals("1")) {
						loginBrowserNm = "IE";
					}else if(loginBrowserStsCD.equals("2")) {
						loginBrowserNm = "Opera";
					}else if(loginBrowserStsCD.equals("3")) {
						loginBrowserNm = "Firefox";
					}else if(loginBrowserStsCD.equals("4")) {
						loginBrowserNm = "Chrome";
					}else if(loginBrowserStsCD.equals("5")) {
						loginBrowserNm = "Safari";
					}

					//로그인하려는 사람의 브라우저
					if (userAgent.indexOf("Trident") > 0 || userAgent.indexOf("MSIE") > 0) {
						browser = "IE";
						browserStsCd = "1";
					} else if (userAgent.indexOf("Opera") > 0) {
						browser = "Opera";
						browserStsCd = "2";
					} else if (userAgent.indexOf("Firefox") > 0) {
						browser = "Firefox";
						browserStsCd = "3";
					} else if (userAgent.indexOf("Safari") > 0) {
						if (userAgent.indexOf("Chrome") > 0) {
							browser = "Chrome";
							browserStsCd = "4";
						} else {
							browser = "Safari";
							browserStsCd = "5";
						}
					}
					
					System.out.println("입력한 유저 브라우저 :  "+browser);
					System.out.println("로그인 유저 상태값 :  "+loginStsCd+", 로그인 유저 브라우저 : "+ loginBrowserNm);
					
					//로그인이 되어있고 같은 브라우저일 경우 이미 사용중인 아이디 이다.
					if(loginStsCd.equals("1") && loginBrowserNm.equals(browser)) {	
						msg = "usingId";
						mav.addObject("msg", msg);
						System.out.println("사용중인아이디 : "+msg);
						mav.setViewName("login/login");
						return mav;								
					}else {					//사용중인 아이디가 아닐 경우
						if(loginStsCd.equals("1")) {
							if(!loginBrowserNm.equals(browser)) {
								//서로 다른 브라우저이므로 로그인이 가능
								System.out.println("입력한 유저 브라우저 : "+ browser 
										+ ", 로그인 상태 유저 브라우저 : "+ loginBrowserNm);
							}
						}else {
							loginService.chgLoginStsCd(userId, browserStsCd);
							session.setAttribute("flag", "Y");
						}
					}									
					
					if(pwFailCnt > 0) {
						//비밀번호 오류횟수 초기화
						loginService.initPwFailCnt(loginId);
					}
					
					//로그인 사용자정보를 model 객체에 담는다.(로그인 session은 LoginInterceptor에서 처리한다.)
					model.addAttribute("loginUser", loginUser);
					
					//자동로그인에 체크가 되어있을 경우
					if(userVo.isUseLogin()) {
						//세션쿠키값을 가지고 온다.
						String sessionKey = session.getId();
						//쿠키세션 시간 설정
						int sessionCookieTime = 60*60*24*7; //7일
						Date sessionDt = new Date(System.currentTimeMillis() + (1000 * sessionCookieTime));
						
						//로그인 유지
						loginService.keepLogin(userId, sessionKey, sessionDt);
					}
					
					mav.setViewName("redirect:/main");
					return mav;
				}else {
					/*오류횟수를 1회 증가한다.*/
					pwFailCnt += 1;
					loginService.addPwFailCnt(pwFailCnt, loginId);
					
					/*암호화된 비밀번호가 다른 경우*/
					msg = "pwFail";
					mav.addObject("msg", msg);
					mav.setViewName("login/login");
					return mav;
				}
			}else {				
				//이메일 인증을 하지 않은 사용자인 경우
				msg = "notEmailKey";
				mav.addObject("msg", msg);
				mav.setViewName("login/login");
				return mav;
			}
		}
		//등록된 사용자가 아닌경우
		msg = "notUserId";
		mav.addObject("msg", msg);
		mav.setViewName("login/login");
		return mav;
	}
	
	/**
	* 로그아웃
	* 
	* @param  HttspSessio session
	* @return String 
	* @author 황인준
	* @exception 
	*/
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		log.debug("로그아웃 컨트롤러");
		
		//세션에 담긴 사용자 아이디
		String sessionUserId = (String)session.getAttribute("loginUserId");
		String sessionMbNo = (String)session.getAttribute("loginMbNo");
		
		
		//세션의 값이 있을 경우
		if(sessionUserId != null && sessionMbNo != null) {
			String userId = sessionUserId;
			
			
			System.out.println("flag값은 : "+session.getAttribute("flag"));
			//현재로그인한 사람일 때 
			//로그인상태, 브라우저코드 초기화
			if(session.getAttribute("flag") != null) {
				loginService.chgLogoutStsCd(userId);
				session.removeAttribute("flag");
			}
			
			session.removeAttribute("flag");
			session.removeAttribute("loginUserId");
			session.removeAttribute("loginMbNo");
			
			//설정된 모든 세션의 값을 삭제
			session.invalidate();
			
			//쿠키세션
			Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");
			
			//쿠키세션을 가지고 있을 경우
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				resp.addCookie(loginCookie);
				
				Date sessionDt = new Date(System.currentTimeMillis() + (1000 * 0));
				loginService.keepLogin(userId, "none", sessionDt);
			}
		}

		return "redirect:/main";
	}
	

}
