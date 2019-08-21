package com.me.rentalme.mp.user.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.mp.user.model.MpUserDao;

@Service
public class MpUserServiceImpl implements MpUserService{
	
	Logger log = LoggerFactory.getLogger(getClass());

	@Inject
	MpUserDao mpUserDao;
	
	@Override
	public List<CallVo> list() throws SQLException {
		log.debug("마이페이지(찜한상품) 서비스");
		
		return mpUserDao.selectAll();
	}


}
