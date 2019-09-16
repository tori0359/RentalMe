package com.me.rentalme.login.dao;

import java.sql.Date;

import com.me.rentalme.model.entity.UserVo;

public interface LoginDao {
	
	void keepLogin(String userId, String sessionKey, Date sessionDt);	//로그인 유지 
	
	UserVo checkLoginSessionKey(String value);							//세션키값 체크

	UserVo getId(String userId); 										//로그인 아이디 체크

	int addPwFailCnt(int pwFailCnt, String userId);						//비밀번호 입력 오류 카운트 1 추가

	void setUserBann(String userId);									//정지사용자로 변경

	void initPwFailCnt(String userId);									//비밀번호 오류횟수 초기화

	void updLoginStsCd(String userId, String browserStsCd);				//로그인 상태 업데이트

	void updLogoutStsCd(String userId);									//로그아웃 상태 업데이트

}
