package com.me.rentalme.mp.user.model;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.UserVo;

/**
	* 마이페이지_유저 Dao 인터페이스
	* 
	* @author 신지영
	* @version ver1.0
	* @see 
	*/
public interface MpUserDao {
	
	//주문내역 리스트 출력
	List<CallVo> selectOrd(String mbNo) throws SQLException;
	
	//후기 등록
	int InsertReview(String gdsCd, String userId, String content,String grade, String mbNo) throws SQLException;
	
	//장바구니 리스트 출력
	List<CallVo> selectCart(String mbNo) throws SQLException;
	
	//장바구니 선택삭제
	public void deleteCart(String gdsCd,String mbNo,String cartSeq) throws SQLException;
	
	//찜한상품 리스트 출력
	List<CallVo> selectWish(String mbNo) throws SQLException;
	
	//찜한상품 삭제(CALL_STS_CD=2 로 업데이트)
	public void deleteWish(String usedGdsNo,String mbNo) throws SQLException;

	//예치금 리스트 출력
	List<CallVo> selectDeposit(String mbNo) throws SQLException;

	//예치금 충전
	int insertCharge(String userId, String depositGbCd, String chargeDeposit,String mbNo) throws SQLException;

	//현재 예치금 업데이트
	public void updateDeposit(String chargeDeposit, String mbNo) throws SQLException;

	//현재 예치금 출력
	public CallVo selectUserInfo(String mbNo) throws SQLException;

	//내 정보 출력
	public UserVo selectMyInfo(String mbNo) throws SQLException;

	//내 정보 업데이트
	public UserVo updateMyInfo(String mbNo,String userNm, String addr, String addrDetail) throws SQLException;
	
	//이름 가져오기
	public UserVo getName(String mbNo) throws SQLException;

	//경매내역 리스트 출력
	List<CallVo> selectAuct(String mbNo) throws SQLException;

	//1:1문의내역리스트
	List<CsVo> myQuestList(CsVo csVo,HttpSession session) throws SQLException;
	
	CsVo myQuestDetail(CsVo csVo) throws SQLException;
	
	int myQuestDel(CsVo csVo) throws SQLException;

	
}
