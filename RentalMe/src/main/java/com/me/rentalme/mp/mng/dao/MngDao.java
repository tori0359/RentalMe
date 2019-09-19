package com.me.rentalme.mp.mng.dao;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.MngOrdDetailVo;
import com.me.rentalme.model.entity.MngOrdVo;
import com.me.rentalme.model.entity.ProductVo;
import com.me.rentalme.model.entity.RentalAppliVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.model.entity.UserVo;

public interface MngDao {
	List<MngOrdVo> selectOrd() throws SQLException;							//전체 주문 리스트
	List<MngOrdDetailVo> selectOrdOne(String ordNo) throws SQLException;	//주문 상세보기
	UserVo selectOrdOneInfo(String ordNo) throws SQLException;				//주문자 정보보기
	int updateStsPC(String ordNo) throws SQLException;						//상품상태 구매확정으로 바꾸기
	
	List<CallVo> selectDep() throws SQLException;							//예치금 리스트
	List<CallVo> selectDepOne(String mbNo) throws SQLException;				//회원 예치금 상세
	
	List<UsedVo> selectUsed(Paging usedPage) throws SQLException;			//전체 중고 리스트
	List<UsedVo> selectUsedSearch(String usedGdsNo) throws SQLException;	//중고 하나 선택
	
	List<MngOrdVo> selectReturn() throws SQLException;						//전체 반품 리스트
	int updateStsRtn(String ordNo) throws SQLException;						//상품상태 반품확정으로 바꾸기
	
	List<DeclVo> selectDecl(Paging usedPage) throws SQLException;							//전체 신고 리스트
	int changeDeclSts(String declNo) throws SQLException;					//신고상태 처리완료로 바꾸기
	
	int selectusedListCnt();												//전체 중고 리스트 총갯수		
	
	
	
	
	//추가--------------
	//렌탈 전체 상품 리스트(카운트)
	List<RentalAppliVo> searchScGoods(String goodsNum) throws SQLException;
	List<RentalAppliVo> selectGoodsList(Paging apliPaging) throws SQLException;
	List<RentalAppliVo> lGoodsList(Paging apliPaging) throws SQLException;
	List<RentalAppliVo> sGoodsList(Paging apliPaging) throws SQLException;
	List<RentalAppliVo> kGoodsList(Paging apliPaging) throws SQLException;
	List<RentalAppliVo> fGoodsList(Paging apliPaging) throws SQLException;
	List<RentalAppliVo> otherGoodsList(Paging apliPaging) throws SQLException;
	List<RentalAppliVo> pacGoodsList(Paging apliPaging) throws SQLException;
	int goodsListCnt();
	int lGoodsListCnt();
	int sGoodsListCnt();
	int kGoodsListCnt();
	int fGoodsListCnt();
	int otherGoodsListCnt();
	int pacGoodsListCnt();
	
	//렌탈 상품 등록
	int rentalGoodsAdd100(RentalAppliVo rentalAppliVo);
	int rentalGoodsAdd300(ProductVo productVo);
	
	long selectNum(String mGoodsNum,String sGoodsNum);
	
	//시퀀스 증가
	void rentalSeq();
	
}
