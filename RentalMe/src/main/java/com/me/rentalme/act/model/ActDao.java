package com.me.rentalme.act.model;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.RentalAppliVo;

public interface ActDao {

	//경매 진행중 리스트
	List<RentalAppliVo> selectActRun() throws SQLException;

	//경매 종료된 리스트
	List<RentalAppliVo> selectActEnd() throws SQLException;

}
