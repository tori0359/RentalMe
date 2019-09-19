package com.me.rentalme.act.dao;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.ActResultVo;
import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.ActVo;
import com.me.rentalme.model.entity.RentalAppliVo;

public interface ActDao {
	//경매 진행중 리스트
	List<RentalAppliVo> selectActRun() throws SQLException;

	//경매 종료된 리스트
	List<RentalAppliVo> selectActEnd() throws SQLException;
	
	//관리자 경매 리스트
	List<ActVo> selectMngActList(Paging actPaging) throws SQLException;
	int insertAct300(ActVo actVo) throws SQLException;
	int insertAct100(ActVo actVo) throws SQLException;
	List<ActVo> selectGoodsList(String goodsNum) throws SQLException;
	//ActVo selectGoodsInfo(String goodsNum) throws SQLException;

	//경매 상품 상세페이지
	RentalAppliVo selectActDetail(String gdsCdDetail) throws SQLException;

	//경매 상품 상세페이지2
	ActVo selectActDetail2(String gdsCdDetail);
	
	//경매 보증금
	int selectMyMb(String mbno) throws SQLException;
	
	//경매 응찰자 데이터에 삽입
	int insertActResult(ActResultVo bean) throws SQLException;
	
	//경매 입찰자 확인
	int updateBidWin(String gdsCd) throws SQLException;
	
	//관리자 경매 내역 확인
	List<ActResultVo> SelectMngActSpec() throws SQLException;
	
	//낙찰취소
	int updateMngBidCancel(String gdsCd) throws SQLException;
	
	//경매종료
	int updateActEnd(String gdsCd) throws SQLException;

	void deleteActList(String gdsCd) throws SQLException;
	int actListCnt() throws SQLException;
	int updateMngActStsCd(String gdsCd) throws SQLException;
}
