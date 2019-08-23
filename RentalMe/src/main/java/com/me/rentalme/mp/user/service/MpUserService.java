package com.me.rentalme.mp.user.service;

import java.sql.SQLException;
import java.util.List;


import com.me.rentalme.model.entity.CallVo;


public interface MpUserService {
	
	//주문내역 리스트 출력
	List<CallVo> ordList() throws SQLException;
	
	//찜한상품 리스트 출력
	List<CallVo> wishList() throws SQLException;
	
	//찜한상품 삭제(CALL_STS_CD=2 로 업데이트)
	public void deleteWish(CallVo callVo) throws SQLException;

}
