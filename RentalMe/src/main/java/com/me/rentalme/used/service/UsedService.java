package com.me.rentalme.used.service;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.UsedVo;

public interface UsedService {
	List<UsedVo> list() throws SQLException; 
	List<UsedVo> oneList(UsedVo bean) throws SQLException;
	int seqUp() throws SQLException; //시퀀스 증가
	int addUsed(UsedVo bean) throws SQLException;
	UsedVo detail(String usedGdsNo) throws SQLException;
}
