package com.me.rentalme.mp.user.service;

import java.sql.SQLException;
import java.util.List;


import com.me.rentalme.model.entity.CallVo;


public interface MpUserService {
	
	//주문내역 리스트 출력
	List<CallVo> ordList() throws SQLException;
	
	//후기 등록
	int addReview(CallVo callVo) throws SQLException;
	
	//장바구니 리스트 출력
	List<CallVo> cartList() throws SQLException;
	
	//찜한상품 리스트 출력
	List<CallVo> wishList() throws SQLException;
	
	//찜한상품 삭제(CALL_STS_CD=2 로 업데이트)
	public void deleteWish(CallVo callVo) throws SQLException;

	//예치금 사용내역 리스트 출력
	List<CallVo> depositList() throws SQLException;

	//예치금 충전
	int insertCharge(CallVo callVo) throws SQLException;

	//현재 예치금 update
	public void updateDeposit() throws SQLException;

	public CallVo userInfoList() throws SQLException;
}
