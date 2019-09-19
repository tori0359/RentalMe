package com.me.rentalme.model;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.RentalMeVo;

public interface RentalMeDao {
	
	List<RentalMeVo> selectAll() throws SQLException;

	//실시간 접수 현황 리스트
	List<CallVo> selectOrdList() throws SQLException;

	//베스트 아이템 리스트
	List<CallVo> selectBestList() throws SQLException;

	//공지사항 리스트
	List<CsVo> selectCsList() throws SQLException;

	
}
