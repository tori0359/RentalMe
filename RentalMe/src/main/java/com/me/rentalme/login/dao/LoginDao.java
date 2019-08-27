package com.me.rentalme.login.dao;

import com.me.rentalme.model.entity.UserVo;

public interface LoginDao {

	UserVo getId(String userId); 						//로그인 아이디 체크

	int addPwFailCnt(int pwFailCnt, String userId);		//비밀번호 입력 오류 카운트 1 추가

	void setUserBann(String userId);					//정지사용자로 변경

	void initPwFailCnt(String userId);					//비밀번호 오류횟수 초기화

}
