package com.me.rentalme.mp.mng.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.DeclVo;
import com.me.rentalme.model.entity.MngOrdDetailVo;
import com.me.rentalme.model.entity.MngOrdVo;
import com.me.rentalme.model.entity.ProductVo;
import com.me.rentalme.model.entity.QuestVo;
import com.me.rentalme.model.entity.RefundVo;
import com.me.rentalme.model.entity.RentalAppliVo;
import com.me.rentalme.model.entity.UsedVo;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.mp.mng.dao.MngDao;
import com.thoughtworks.qdox.parser.ParseException;

@Service
public class MngServiceImpl implements MngService {

	@Inject
	MngDao mngDao;
	
	
	@Override
	public List<MngOrdVo> selectOrd() throws SQLException {
		return mngDao.selectOrd();								//전체 주문 보기
	}

	@Override
	public List<MngOrdDetailVo> selectOrdOne(String ordNo) throws SQLException {
		return mngDao.selectOrdOne(ordNo);						//주문 상세 보기
	}

	@Override
	public UserVo selectOrdOneInfo(String ordNo) throws SQLException {
		return mngDao.selectOrdOneInfo(ordNo);					//주문자 정보보기
	}

	@Override
	public int updateStsPC(String ordNo) throws SQLException {
		return mngDao.updateStsPC(ordNo);						//상품상태 구매확정으로 바꾸기
	}

	@Override
	public List<CallVo> selectDep() throws SQLException {
		return mngDao.selectDep();								//예치금 리스트
	}

	@Override
	public List<CallVo> selectDepOne(String mbNo) throws SQLException {
		return mngDao.selectDepOne(mbNo);						//회원 예치금 상세
	}
	
	

	@Override
	public List<UsedVo> selectUsed() throws SQLException {
		return mngDao.selectUsed();								//전체 중고 리스트
	}

	@Override
	public List<MngOrdVo> selectReturn() throws SQLException {
		return mngDao.selectReturn();							//전체 반품 리스트
	}

	@Override
	public int updateStsRtn(String ordNo) throws SQLException {
		return mngDao.updateStsRtn(ordNo);						//상품상태 반품확정으로 바꾸기
	}

	@Override
	public List<UsedVo> selectUsedSearch(String usedGdsNo) throws SQLException {
		return mngDao.selectUsedSearch(usedGdsNo);				//중고 하나 선택
	}

	@Override
	public List<DeclVo> selectDecl() throws SQLException {
		return mngDao.selectDecl();								//전체 신고 리스트
	}

	@Override
	public int changeDeclSts(List<String> declList) throws SQLException {
		
		String declNo = "";
		for(String strDeclNo : declList){
			if(strDeclNo ==null) {
				declNo = strDeclNo;
			}else {
				declNo = strDeclNo+","+ declNo;
				
			}
		}
		
		declNo = declNo.substring(0, declNo.length()-1);
		
		return mngDao.changeDeclSts(declNo);					//신고상태 처리완료로 바꾸기
	}
	
	@Override
	public int getUsedListCnt(UsedVo bean) {
		return mngDao.selectusedListCnt(bean);
	}
	
	/**
	* 사용자 리스트 service
	* 
	* @param  None
	* @return List - 사용자정보 
	* @author 황인준
	* 등록일자 : 2019.09.11
	*/	
	@Override
	public List<UserVo> getUserInfo() {
		List<UserVo> userInfo = mngDao.selectUserList();
		
		for(UserVo userVo : userInfo) {
			//성별(1:남 2:여)
			if(userVo.getGenderGbCd().equals("1")) {
				userVo.setGenderGbCd("남");
			}else if(userVo.getGenderGbCd().equals("2")) {
				userVo.setGenderGbCd("여");
			}else {
				userVo.setGenderGbCd("x");
			}
			
			//사용자상태코드(1:정상, 2:정지[비밀번호오류횟수 5회 초과], 3:삭제(탈퇴))
			if(userVo.getUserStsCd().equals("1")) {
				userVo.setUserStsCd("정상");
			}else if(userVo.getUserStsCd().equals("2")){
				userVo.setUserStsCd("정지");
			}else if(userVo.getUserStsCd().equals("3")){
				userVo.setUserStsCd("삭제");
			}else {
				userVo.setUserStsCd("x");
			}
			
		}

		return userInfo;
	}
	
	/**
	* 사용자 탈퇴하기 service
	* 
	* @param  String mbNo - 회원번호
	* @return void 
	* @author 황인준
	* 등록일자 : 2019.09.15
	*/	
	@Override
	public String delUserInfo(String mbNo) {
		
		int result = mngDao.updUserinfo(mbNo);
		String msg = "";
		
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		
		return msg;
	}

	/**
	* 사용자 상세정보 service
	* 
	* @param  String mbNo - 회원번호
	* @return UserVo - 사용자정보 
	* @author 황인준
	* 등록일자 : 2019.09.15
	*/
	@Override
	public UserVo getUserDetail(String mbNo) {
		
		return mngDao.selectUserDetail(mbNo);
	}

	/**
	* 사용자 총인원 조회 service
	* 
	* @param  
	* @return int - 총인원 수 
	* @author 황인준
	* 등록일자 : 2019.09.16
	*/
	@Override
	public int getMngUserListCnt() {
		return mngDao.selectMngUserListCnt();
	}
	
	/**
	* 사용자관리 - 계정초기화
	* 
	* @param  String mbNo : 회원번호
	* @return String : 결과값
	* @author 황인준
	* 등록일자 : 2019.09.24
	*/
	@Override
	public String initUserInfo(String mbNo) {
		
		//사용자계정 초기화
		int result = mngDao.updateUserInfoInit(mbNo);
		String msg = "";
		
		if(result > 0) {
			msg="success";
		}else {
			msg="fail";
		}
		
		return msg;
	}

	@Override
	public int selectDeclListCnt(DeclVo bean) {
		return mngDao.selectDeclListCnt(bean);
	}

	@Override
	public List<RentalAppliVo> selectGoodsList() throws SQLException{
		
		return mngDao.selectGoodsList();
	}
	@Override
	public List<RentalAppliVo> selectGoodsList(String gdsMclassCd) throws SQLException{
		
		return mngDao.selectGoodsList(gdsMclassCd);
	}

	@Override
	public int goodsListCnt() {
		
		return mngDao.goodsListCnt();
	}

	@Override
	public int lGoodsListCnt() {
		return mngDao.lGoodsListCnt();
	}

	@Override
	public List<RentalAppliVo> lGoodsList(Paging apliPaging) throws SQLException {
		return mngDao.lGoodsList(apliPaging);
	}

	@Override
	public List<RentalAppliVo> sGoodsList(Paging apliPaging) throws SQLException {
		return mngDao.sGoodsList(apliPaging);
	}

	@Override
	public List<RentalAppliVo> kGoodsList(Paging apliPaging) throws SQLException {
		return mngDao.kGoodsList(apliPaging);
	}

	@Override
	public List<RentalAppliVo> fGoodsList(Paging apliPaging) throws SQLException {
		return mngDao.fGoodsList(apliPaging);
	}

	@Override
	public List<RentalAppliVo> otherGoodsList(Paging apliPaging) throws SQLException {
		return mngDao.otherGoodsList(apliPaging);
	}

	@Override
	public List<RentalAppliVo> pacGoodsList(Paging apliPaging) throws SQLException {
		return mngDao.pacGoodsList(apliPaging);
	}

	@Override
	public int sGoodsListCnt() {
		return mngDao.sGoodsListCnt();
	}

	@Override
	public int kGoodsListCnt() {
		return mngDao.kGoodsListCnt();
	}

	@Override
	public int fGoodsListCnt() {
		return mngDao.fGoodsListCnt();
	}

	@Override
	public int otherGoodsListCnt() {
		return mngDao.otherGoodsListCnt();
	}

	@Override
	public int pacGoodsListCnt() {
		return mngDao.pacGoodsListCnt();
	}

	@Override
	public int getUsedListCnt() {
		// TODO Auto-generated method stub
		return mngDao.selectusedListCnt();
	}
	public int rentalGoodsAdd100(RentalAppliVo rentalAppliVo) {
		
		return mngDao.rentalGoodsAdd100(rentalAppliVo);
	}

	@Override
	public int rentalGoodsAdd200(ProductVo productVo) {
		return mngDao.rentalGoodsAdd300(productVo);
	}

	@Override
	public List<RentalAppliVo> searchScGoods(String goodsNum) throws SQLException {
		return mngDao.searchScGoods(goodsNum);
	}

	@Override
	public long selectNum(String mGoodsNum, String sGoodsNum) {
		return mngDao.selectNum(mGoodsNum,sGoodsNum);
	}

	@Override
	public void rentalseq() {
		mngDao.rentalSeq();
		
	}

	@Override
	public List<RefundVo> selectRefundList() throws SQLException {
		return mngDao.selectRefundList();
	}

	@Override
	public int updateRefundConfirm(String mbNo) throws SQLException {
		return mngDao.updateRefundConfirm(mbNo);
	}

	@Override
	public int updateRefundCancel(String mbNo) throws SQLException {
		return mngDao.updateRefundCancel(mbNo);
	}
	
	@Override
	public void deleteAppli(String gdsCd) throws SQLException {
		mngDao.deleteAppli(gdsCd);		
	}

	@Override
	public List<QuestVo> selectQuestList() throws SQLException {
		return mngDao.selectQuestList();
	}

	@Override
	public int updateQuest(String questNo) throws SQLException {
		return mngDao.updateQuest(questNo);
	}

	@Override
	public int updateDeclOne(String declNo) throws SQLException {
		return mngDao.updateDeclOne(declNo);
	}

}
