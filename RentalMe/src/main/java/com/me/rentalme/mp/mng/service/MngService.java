package com.me.rentalme.mp.mng.service;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.MngOrdDetailVo;
import com.me.rentalme.model.entity.MngOrdVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.model.entity.UserVo;

public interface MngService {
	List<MngOrdVo> selectOrd() throws SQLException;							//전체 주문 리스트
	List<MngOrdDetailVo> selectOrdOne(String ordNo) throws SQLException;	//주문 상세보기
	UserVo selectOrdOneInfo(String ordNo) throws SQLException;				//주문자 정보보기
	int updateStsPC(String ordNo) throws SQLException;						//상품상태 구매확정으로 바꾸기
	
	List<CallVo> selectDep() throws SQLException;							//예치금 리스트
	List<CallVo> selectDepOne(String mbNo) throws SQLException;				//회원 예치금 상세
	
	List<UsedVo> selectUsed(Paging usedPage) throws SQLException;							//전체 중고 리스트
	List<UsedVo> selectUsedSearch(String usedGdsNo) throws SQLException;	//중고 하나 선택
	
	List<MngOrdVo> selectReturn() throws SQLException;						//전체 반품 리스트
	int updateStsRtn(String ordNo) throws SQLException;						//상품상태 반품확정으로 바꾸기
	
	List<DeclVo> selectDecl() throws SQLException;							//전체 신고 리스트
	int changeDeclSts(String declNo) throws SQLException;					//신고상태 처리완료로 바꾸기
	
	int getUsedListCnt();													//전체 중고리스트 게시물 총갯수
}
