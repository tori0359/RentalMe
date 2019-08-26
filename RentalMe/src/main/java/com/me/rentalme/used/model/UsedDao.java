package com.me.rentalme.used.model;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.UsedVo;

public interface UsedDao {
	List<UsedVo> selectAll() throws SQLException;
	List<UsedVo> selectOne(UsedVo bean) throws SQLException;
	int seqInsert() throws SQLException;
	int InsertOne(UsedVo bean) throws SQLException;
	UsedVo DetailOne(String usedGdsNo) throws SQLException;
}
