package com.me.rentalme.login.find.service;

import java.util.List;

import com.me.rentalme.model.entity.UserVo;

public interface LoginFindService {
	
	//입력한 이메일로 아이디와 가입일자 찾기
	List<UserVo> getId(String email);

	//비밀번호 찾기 - 데이터 검증
	String checkData(UserVo userVo);

	//비밀번호 변경
	void modifyPw(UserVo userVo);

	//입력한 핸드폰으로 아이디 찾기.
	List<UserVo> checkHpYn(String hp);
	
}
