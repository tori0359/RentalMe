package com.me.rentalme.mp.user.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.me.rentalme.common.Paging;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.UserVo;


public interface MpUserService {

	
	//주문내역 리스트 출력
	List<CallVo> ordList(String mbNo) throws SQLException;
	
	//후기 등록
	int addReview(CallVo callVo, String mbNo) throws SQLException;
	
	//장바구니 리스트 출력
	List<CallVo> cartList(String mbNo) throws SQLException;
	
	//장바구니 선택 삭제
	public void deleteCart(String gdsCd,String mbNo,String cartSeq) throws SQLException;
	
	//찜한상품 리스트 출력
	List<CallVo> wishList(String mbNo) throws SQLException;
	
	//찜한상품 삭제(CALL_STS_CD=2 로 업데이트)
	public void deleteWish(String usedGdsNo,String mbNo) throws SQLException;

	//예치금 사용내역 리스트 출력
	List<CallVo> depositList(String mbNo) throws SQLException;

	//예치금 충전
	int insertCharge(CallVo callVo,String mbNo) throws SQLException;
	
	//예치금 환불요청
	int refundCharge(String refund,String mbNo) throws SQLException;

	//현재 예치금 업데이트
	public void updateDeposit(String chargeDeposit, String mbNo) throws SQLException;

	//현재 예치금 출력
	public CallVo userInfoList(String mbNo) throws SQLException;

	//내 정보 출력
	public UserVo userInfo(String mbNo) throws SQLException;

	//내 정보 수정
	public UserVo myinfo(String mbNo,UserVo userVo) throws SQLException;

	//이름 저장하기
	public UserVo getName(String mbNo) throws SQLException;

	List<CallVo> AuctList(String mbNo) throws SQLException;

	
	//개인 1:1문의 리스트 출력
	List<CsVo> myList(CsVo csVo,HttpSession session,int startListNum, int listSize) throws SQLException;
	
	//내 문의 리스트 갯수
	int inquiryListCnt(HttpSession session) throws SQLException;
	
	//내 문의 상세 페이지
	CsVo myInqDetail(CsVo csVo) throws SQLException;
	
	//내 문의 삭제
	int myQuestDel(CsVo csVo) throws SQLException;

	//유저아이디의 비밀번호를 DB에서 가져오기 
	UserVo getInfo(String userId) throws SQLException;

	//입력한 비밀번호 체크
	String checkPw(String userId, String userPw) throws SQLException;

	//비밀번호 변경
	int changePw(String userId, String userPw);

	
	
	

}
