package com.me.rentalme.login.service;

import java.sql.Date;

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
	
	//로그인 유지
	void keepLogin(String userId, String sessionKey, Date sessionDt);
	
	//세션쿠키값 체크
	UserVo checkLoginSessionKey(String value);

	//입력한 로그인 아이디 체크
	UserVo getId(String userId);

	//비밀번호 오류횟수 카운트 +1
	int addPwFailCnt(int pwFailCnt, String userId);

	//사용자를 정지사용자로 변경
	void setUserBann(String userId);

	//비밀번호 오류횟수 초기화
	void initPwFailCnt(String userId);
	
	
}
