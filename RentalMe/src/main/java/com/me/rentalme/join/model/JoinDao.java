package com.me.rentalme.join.model;

import com.me.rentalme.model.entity.UserVo;

/**
* 회원가입 Dao 인터페이스
* 
* @author 황인준
* @version ver1.0
* @see 
*/
public interface JoinDao {

	int insertJoin(UserVo bean); 						//회원등록 

	int getKey(String userId, String key);				//유저 인증키 생성 메서드

	int updEmailKey(String userId, String emailKey); 	//유저 인증키 Y로 바꿔주는 메서드

	int selectId(String userId); 						//회원 아이디 중복 체크

	void insertMemnoSeq(); 								//회원번호 시퀀스 추가

	String getMemNo();									//회원번호 조회
	
	int insertMb(String mbNo);							//회원예치금 0원

}
