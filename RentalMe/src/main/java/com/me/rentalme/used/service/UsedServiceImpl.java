package com.me.rentalme.used.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.model.entity.RentalMeVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.used.model.UsedDao;

@Service
public class UsedServiceImpl implements UsedService {

	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	UsedDao usedDao;
	
	@Override
	public List<UsedVo> list() throws SQLException {
		log.debug("중고거래 서비스...");
		return usedDao.selectAll();
	}

}