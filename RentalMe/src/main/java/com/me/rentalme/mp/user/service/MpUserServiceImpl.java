package com.me.rentalme.mp.user.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.mp.user.model.MpUserDao;

@Service
public class MpUserServiceImpl implements MpUserService{
	
	Logger log = LoggerFactory.getLogger(getClass());

	@Inject
	MpUserDao mpUserDao;
	
	
	//주문내역 리스트
	@Override
	public List<CallVo> ordList() throws SQLException {
		//log.debug("주문내역 서비스");
		
		return mpUserDao.selectOrd();
	}
	
	//후기 등록
		@Override
		public int addReview(CallVo callVo) throws SQLException {
			log.debug("후기 등록 서비스...");
			
			
			return mpUserDao.InsertReview(callVo.getGdsCd(), callVo.getUserId(), callVo.getContent(), callVo.getGrade());
		}
	
	
	//장바구니 리스트
	@Override
	public List<CallVo> cartList() throws SQLException {
		// TODO Auto-generated method stub
		return mpUserDao.selectCart();
	}
	
	//찜한상품 리스트
	@Override
	public List<CallVo> wishList() throws SQLException {
		//log.debug("마이페이지(찜한상품) 서비스");
		
		return mpUserDao.selectWish();
	}
	
	//찜한상품 삭제
	@Override
	public void deleteWish(CallVo callVo) throws SQLException {
		
		mpUserDao.deleteWish(callVo);
	}

	//예치금 리스트
	@Override
	public List<CallVo> depositList() throws SQLException {
		
		return mpUserDao.selectDeposit();
	}

	@Override
	public int insertCharge(CallVo callVo) throws SQLException {

		return mpUserDao.insertCharge(callVo.getUserId(), callVo.getDepositGbCd(), callVo.getChargeDeposit());
	}
	
	//개인 1:1문의보기
	@Override
	public List<CsVo> myList(CsVo csVo,HttpSession session) throws SQLException {
		System.out.println("dao로...");
		return  mpUserDao.myQuestList(csVo,session);
	}
 
	//개인 1:1문의 상세
	@Override
	public CsVo myInqDetail(CsVo csVo) throws SQLException {
		System.out.println("1대1 상세 service");
		return mpUserDao.myQuestDetail(csVo);
	}

	//내 문의 삭제
	@Override
	public int myQuestDel(CsVo csVo) throws SQLException {
		
			return mpUserDao.myQuestDel(csVo);	
	}

	
	

	

	

	

	


}
