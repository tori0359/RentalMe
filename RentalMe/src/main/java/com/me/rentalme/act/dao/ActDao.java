package com.me.rentalme.act.dao;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.ActVo;

public interface ActDao {
	List<ActVo> selectActList() throws SQLException;
	int insertAct(ActVo actVo) throws SQLException;
}
