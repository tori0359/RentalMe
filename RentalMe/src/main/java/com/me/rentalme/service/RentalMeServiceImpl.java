package com.me.rentalme.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.model.RentalMeDao;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.RentalMeVo;

@Service
public class RentalMeServiceImpl implements RentalMeService {
	
	@Inject
	RentalMeDao rentalmeDao;

	@Override
	public List<RentalMeVo> list() throws SQLException {
		return rentalmeDao.selectAll();
	}
	
	//실시간 접수 현황 리스트
	@Override
	public List<CallVo> ordList() throws SQLException {
		return rentalmeDao.selectOrdList();
	}

	//베스트 아이템 리스트
	@Override
	public List<CallVo> bestList() throws SQLException {
		return rentalmeDao.selectBestList();
	}


}
