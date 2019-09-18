package com.me.rentalme.used.model;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.UsedCmtVo;
import com.me.rentalme.model.entity.UsedStoreVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.model.entity.UserVo;

public interface UsedDao {
	UserVo userInfo(UserVo bean) throws SQLException; //사용자 정보
	String userId(String mbNo) throws SQLException;
	List<UsedVo> selectAll(UsedVo bean) throws SQLException;
	List<UsedVo> selectOne(UsedVo bean) throws SQLException; //중고거래 선택
	
	int seqInsert() throws SQLException;	//시퀀스증가
	int InsertOne(UsedVo bean) throws SQLException; //중고상품 입력
	
	UsedVo DetailOne(String usedGdsNo) throws SQLException; // 중고 디테일
	
	List<UsedCmtVo> selectCmtAll(String usedGdsNo) throws SQLException;
	int cmtInsert(UsedCmtVo bean) throws SQLException;
	int usedComtDecl(DeclVo bean) throws SQLException;			//댓글신고기능
	
	List<UsedVo> mySelectAll(String mbNo) throws SQLException; //내 상점 물품들
	List<UsedVo> mySelectAllAlign(UsedVo bean) throws SQLException; //내 상점 물품 정렬
	
	int myStoreCmtInsert(UsedStoreVo bean) throws SQLException; //내 상점 후기올리기
	List<UsedStoreVo> myStoreCmtSelect(String storeNo) throws SQLException; // 내 상점 후기보기
	int usedStoreDecl(DeclVo bean) throws SQLException;						// 상점 신고기능
	
	int usedcount(UsedVo bean) throws SQLException;
	int delMyStoreListOne(String usedGdsNo) throws SQLException; // 내가 올린 목록 중 한개 지우기
	

}
