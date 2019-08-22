package com.me.rentalme.mp.user.model;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.CallVo;

/**
	* 마이페이지_유저 Dao 인터페이스
	* 
	* @author 신지영
	* @version ver1.0
	* @see 
	*/
public interface MpUserDao {
	
	List<CallVo> selectAll() throws SQLException;
	
}
