package com.me.rentalme.login.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.model.entity.UserVo;

/**
* 로그인 서비스
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.13
*/
@Service
public class LoginServiceImpl implements LoginService {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	//@Inject
	//LoginDao loginDao; 
	
	/**
	* 로그인
	* 
	* @param  UserVo
	* @return String 
	* @author 황인준
	* @exception none
	*/
	@Override
	public int login(UserVo bean, HttpServletRequest req) {
		
		//HttpSession session = req.getSession();
		
		//로그인 다오 이동
		
		//loginDao.loginCheck();
		
		//세션처리
		
		return 0;
	}

}
