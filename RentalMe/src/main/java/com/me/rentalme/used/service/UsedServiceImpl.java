package com.me.rentalme.used.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import com.me.rentalme.model.entity.RentalMeVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.used.model.UsedDao;

public class UsedServiceImpl implements UsedService {

	@Inject
	UsedDao usedDao;
	
	@Override
	public List<UsedVo> list() throws SQLException {
		return usedDao.selectAll();
	}

}