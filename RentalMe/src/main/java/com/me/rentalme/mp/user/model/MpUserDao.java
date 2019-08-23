package com.me.rentalme.mp.user.model;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.CallVo;

/**
	* 마이페이지_유저 Dao 인터페이스
	* 
	* @author 신지영
	* @version ver1.0
	* @see 
	*/
public interface MpUserDao {
	
	//주문내역 리스트 출력
	List<CallVo> selectOrd() throws SQLException;
	
	//찜한상품 리스트 출력
	List<CallVo> selectWish() throws SQLException;
	
	//찜한상품 삭제(CALL_STS_CD=2 로 업데이트)
	public void deleteWish(CallVo callVo) throws SQLException;
	
	
}
