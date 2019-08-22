package com.me.rentalme.join.service;

import com.me.rentalme.model.entity.UserVo;

/**
* 회원가입 서비스 인터페이스
* 
* @author 황인준
* @version ver1.0
* @see 
*/
public interface JoinService {

	int 	addInfo(UserVo bean);  	//회원등록
	String 	getId(String userId); 	//아이디 중복체크
	void 	addMemNoSeq();			//회원번호 시퀀스 추가
	String 	getMemNo();				//회원번호 가져오기
	
}
