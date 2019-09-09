package com.me.rentalme.act.service;

import java.sql.SQLException;
import java.util.List;


import com.me.rentalme.model.entity.ActVo;

import com.me.rentalme.model.entity.RentalAppliVo;

public interface ActService {

	List<ActVo> mngListAct() throws SQLException;
	int addAct100(ActVo actVo) throws SQLException;
	int addAct300(ActVo actVo) throws SQLException;
	List<ActVo> goodsList(String goodsNum) throws SQLException;
	
	List<RentalAppliVo> actList() throws SQLException;

	List<RentalAppliVo>  actEndList() throws SQLException;
}
