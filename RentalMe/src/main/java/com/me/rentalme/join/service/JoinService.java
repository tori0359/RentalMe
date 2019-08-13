package com.me.rentalme.join.service;

import com.me.rentalme.model.entity.UserVo;

/**
* @brief 회원가입 서비스 인터페이스
* 
* @author 황인준
* @version ver1.0
* @see 
*/
public interface JoinService {

	//회원정보 입력
	int addInfo(UserVo bean);

}
