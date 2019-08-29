package com.me.rentalme.used.service;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.UsedCmtVo;
import com.me.rentalme.model.entity.UsedStoreVo;
import com.me.rentalme.model.entity.UsedVo;

public interface UsedService {
	List<UsedVo> list(UsedVo bean) throws SQLException; 
	List<UsedVo> oneList(UsedVo bean) throws SQLException;
	int seqUp() throws SQLException; //½ÃÄö½º Áõ°¡
	int addUsed(UsedVo bean) throws SQLException;
	UsedVo detail(String usedGdsNo) throws SQLException;
	List<UsedCmtVo> cmtList(String usedGdsNo) throws SQLException;
	int addCmt(UsedCmtVo bean) throws SQLException;
	List<UsedVo> myUsedAll(String mbNo) throws SQLException;
	int addMyStoreCmt(UsedStoreVo bean) throws SQLException;
	List<UsedStoreVo> listMyStoreCmt(String storeNo) throws SQLException;
	int usedcount(UsedVo bean) throws SQLException;
}
