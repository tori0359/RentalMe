package com.me.rentalme.login.dao;

import com.me.rentalme.model.entity.UserVo;

public interface LoginDao {

	UserVo getId(String userId); //로그인 아이디 체크

}
