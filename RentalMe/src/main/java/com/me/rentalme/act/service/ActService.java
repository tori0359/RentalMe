package com.me.rentalme.act.service;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.ActResultVo;
import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.ActVo;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.RentalAppliVo;

public interface ActService {

	//관리자 경매관리 리스트
	List<ActVo> mngListAct(Paging actPaging) throws SQLException;
	
	int addAct100(ActVo actVo) throws SQLException;
	int addAct300(ActVo actVo) throws SQLException;
	List<ActVo> goodsList(String goodsNum) throws SQLException;
	//ActVo goodsInfo(String goodsNum) throws SQLException;
	
	
	
	List<RentalAppliVo> actList() throws SQLException;


	List<RentalAppliVo>  actEndList() throws SQLException;

	RentalAppliVo actDetail(String gdsCdDetail) throws SQLException;

	ActVo actDetailAuction(String gdsCdDetail);
	
	//경매 보증금
	int selectMyMb(String mbno) throws SQLException;
	
	//경매 응찰자 데이터에 삽입
	int insertActResult(ActResultVo bean) throws SQLException;
	
	int updateBidWin(String gdsCd) throws SQLException;
	
	//관리자 경매 내역 확인
	List<ActResultVo> SelectMngActSpec() throws SQLException;
	
	int updateMngBidCancel(String gdsCd) throws SQLException;
	
	//경매종료
	int updateActEnd(String gdsCd) throws SQLException;
	
	//경매상품 리스트 삭제
	void deleteAct(String gdsCd) throws SQLException;
	
	//경매상품리스트 갯수
	int actListCnt() throws SQLException;
	int updateMngActStsCd(String gdsCd) throws SQLException;
	int insertUserActMoney(CallVo bean) throws SQLException;
	int updateUserActMoney(CallVo bean) throws SQLException;
}
