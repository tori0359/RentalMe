package com.me.rentalme.login.find.dao;

import java.util.List;

import com.me.rentalme.model.entity.UserVo;

public interface LoginFindDao {

	//이메일로 아이디 찾기일 경우 아이디를 찾는다
	List<UserVo> getEmailFindId(String email);
	
	//핸드폰으로 아이디 찾기일 경우 아이디를 찾는다.
	List<UserVo> getHpFindId(String hp);

	//입력한 이메일 유/무 체크
	int checkEmail(String email);

	//비밀번호찾기 - 이메일로 찾기 - 데이터 체크
	int checkPwEmail(String userId, String email);

	//비밀번호 변경
	int updPw(String userPw, String userId, String email);

	//입력한 핸드폰번호의 동의여부를 체크한다.
	int selectHpYn(String hp);

}
