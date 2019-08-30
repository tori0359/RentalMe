package com.me.rentalme.login.find.service;

import java.util.List;

import com.me.rentalme.model.entity.UserVo;

public interface LoginFindService {
	
	//입력한 이메일로 아이디와 가입일자 찾기
	List<UserVo> getId(String email);
	
}
