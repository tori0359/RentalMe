package com.me.rentalme.used.service;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.UsedCmtVo;
import com.me.rentalme.model.entity.UsedStoreVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.model.entity.UserVo;

public interface UsedService {
	UserVo userInfo(UserVo bean) throws SQLException;
	String userId(String mbNo) throws SQLException;
	List<UsedVo> list(UsedVo bean) throws SQLException; 
	List<UsedVo> oneList(UsedVo bean) throws SQLException;
	
	int seqUp() throws SQLException; //시퀀스 증가
	int addUsed(UsedVo bean) throws SQLException;
	
	UsedVo detail(String usedGdsNo) throws SQLException;
	
	List<UsedCmtVo> cmtList(String usedGdsNo) throws SQLException;
	int addCmt(UsedCmtVo bean) throws SQLException;
	int usedComtDecl(DeclVo bean) throws SQLException;			//댓글신고기능
	
	List<UsedVo> myUsedAll(String mbNo) throws SQLException;
	List<UsedVo> mySelectAllAlign(UsedVo bean) throws SQLException; //내 상점 물품 정렬
	
	int addMyStoreCmt(UsedStoreVo bean) throws SQLException;
	List<UsedStoreVo> listMyStoreCmt(String storeNo) throws SQLException;
	int usedStoreDecl(DeclVo bean) throws SQLException;						// 상점 신고기능
	
	int usedcount(UsedVo bean) throws SQLException;
	int delMyStoreListOne(String usedGdsNo) throws SQLException; // 내가 올린 목록 중 한개 지우기
	int updateStoreSts(String usedGdsNo) throws SQLException; // 중고상품 판매완료
}
