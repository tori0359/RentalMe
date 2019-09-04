package com.me.rentalme.act.service;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.ActVo;

public interface ActService {
	List<ActVo> listAct() throws SQLException;
	int addAct100(ActVo actVo) throws SQLException;
	int addAct300(ActVo actVo) throws SQLException;

}
