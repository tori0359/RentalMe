package com.me.rentalme.service;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.RentalMeVo;

public interface RentalMeService {
	
	List<RentalMeVo> list() throws SQLException;

	//실시간 접수 현황 리스트
	List<CallVo> ordList() throws SQLException;

	//베스트 아이템 리스트
	List<CallVo> bestList() throws SQLException;

}
