package com.me.rentalme.used.model;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.UsedCmtVo;
import com.me.rentalme.model.entity.UsedVo;

public interface UsedDao {
	List<UsedVo> selectAll() throws SQLException;
	List<UsedVo> selectOne(UsedVo bean) throws SQLException; //중고거래 선택
	int seqInsert() throws SQLException;	//시퀀스증가
	int InsertOne(UsedVo bean) throws SQLException; //중고상품 입력
	UsedVo DetailOne(String usedGdsNo) throws SQLException; // 중고 디테일
	List<UsedCmtVo> selectCmtAll(String usedGdsNo) throws SQLException;
	int cmtInsert(UsedCmtVo bean) throws SQLException;
}
