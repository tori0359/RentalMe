package com.me.rentalme.cs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.me.rentalme.cs.entity.CsVo;

public interface CsDao {

	List<CsVo> selectAll() throws SQLException;
	List<CsVo> selectAll(Map<String, Integer> map) throws SQLException;
	void insertOne(CsVo bean) throws SQLException;
	int updateOne(CsVo bean) throws SQLException;
	int deleteOne(int idx) throws SQLException;
}
