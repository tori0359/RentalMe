package com.me.rentalme.act.dao;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.ActVo;
import com.me.rentalme.model.entity.RentalAppliVo;

public interface ActDao {
	List<ActVo> selectActList() throws SQLException;
	int insertAct300(ActVo actVo) throws SQLException;
	int insertAct100(ActVo actVo) throws SQLException;
	List<ActVo> selectGoodsList(String goodsNum) throws SQLException;
	
	
	/////지영
	
	//경매 진행중 리스트
	   List<RentalAppliVo> selectActRun() throws SQLException;

	   //경매 종료된 리스트
	   List<RentalAppliVo> selectActEnd() throws SQLException;
}
