package com.me.rentalme.mp.user.service;

import java.sql.SQLException;
import java.util.List;


import com.me.rentalme.model.entity.CallVo;


public interface MpUserService {
	
	List<CallVo> list() throws SQLException;
}
