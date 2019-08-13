package com.me.rentalme.join.model;

import com.me.rentalme.model.entity.UserVo;

/**
* @brief 회원가입 Dao 인터페이스
* 
* @author 황인준
* @version ver1.0
* @see 
*/
public interface JoinDao {

	int insertJoin(UserVo bean);

}
