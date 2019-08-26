package com.me.rentalme.cs.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.cs.dao.CsDao;
import com.me.rentalme.cs.entity.CsVo;


@Service
public class CsServiceImpl implements CsService {

	@Inject
	CsDao csDao;
	
	@Override
	public List<CsVo> csList() throws SQLException {
		
		return csDao.selectAll();
	}

	@Override
	public CsVo csDetail(String faqNo) throws SQLException {
		
		return csDao.csDetail(faqNo);
	}


}
