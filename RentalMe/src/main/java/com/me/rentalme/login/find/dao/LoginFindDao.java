package com.me.rentalme.login.find.dao;

import java.util.List;

import com.me.rentalme.model.entity.UserVo;

public interface LoginFindDao {

	//입력한 아이디가 맞으면 아이디와 가입날짜를 가지고 온다.
	List<UserVo> getId(String email);

	//입력한 이메일 유/무 체크
	int checkEmail(String email);

	//비밀번호찾기 - 이메일로 찾기 - 데이터 체크
	int checkPwEmail(String userId, String email);

	//비밀번호 변경
	int updPw(String userPw, String userId, String email);

}
