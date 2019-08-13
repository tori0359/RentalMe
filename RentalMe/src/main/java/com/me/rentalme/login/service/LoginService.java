package com.me.rentalme.login.service;

import javax.servlet.http.HttpServletRequest;

import com.me.rentalme.model.entity.UserVo;

/**
* 로그인 서비스 인터페이스
* 
* @author 황인준
* @version ver1.0
* @see 
* 등록일자 : 2019.08.13
*/
public interface LoginService {
	
	int login(UserVo bean, HttpServletRequest req); //로그인;
}
