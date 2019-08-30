package com.me.rentalme.mp.user.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.model.entity.UserVo;
import com.me.rentalme.mp.user.model.MpUserDao;

@Service
public class MpUserServiceImpl implements MpUserService{
	
	Logger log = LoggerFactory.getLogger(getClass());

	@Inject
	MpUserDao mpUserDao;
	
	
	//주문내역 리스트
	@Override
	public List<CallVo> ordList(String mbNo) throws SQLException {
		//log.debug("주문내역 서비스");
		
		return mpUserDao.selectOrd(mbNo);
	}
	
	//후기 등록
		@Override
		public int addReview(CallVo callVo) throws SQLException {
			log.debug("후기 등록 서비스...");
			
			
			return mpUserDao.InsertReview(callVo.getGdsCd(), callVo.getUserId(), callVo.getContent(), callVo.getGrade());
		}
	
	
	//장바구니 리스트
	@Override
	public List<CallVo> cartList(String mbNo) throws SQLException {
		// TODO Auto-generated method stub
		return mpUserDao.selectCart(mbNo);
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
		log.debug("예치금 리스트 서비스...");
		return mpUserDao.selectDeposit();
	}
	
	//예치금 충전
	@Override
	public int insertCharge(CallVo callVo) throws SQLException {

		return mpUserDao.insertCharge(callVo.getUserId(), callVo.getDepositGbCd(), callVo.getChargeDeposit());
	}

	//현재 예치금 update
	@Override
	public void updateDeposit() throws SQLException {
		
		mpUserDao.updateDeposit();
		
	}

	@Override
	public CallVo userInfoList() throws SQLException {
		log.debug("현재예치금 서비스...");
		return mpUserDao.selectUserInfo();
	}

	@Override
	public UserVo userInfo(String mbNo) throws SQLException {
		log.debug("내 정보 출력 서비스");
		return mpUserDao.selectMyInfo(mbNo);
	}

	@Override
	public UserVo myinfo(String mbNo,UserVo userVo) throws SQLException {
		log.debug("내 정보 수정 서비스...");
		return mpUserDao.updateMyInfo(mbNo, userVo.getUserNM(), userVo.getAddr(), userVo.getAddrDetail());
		
	}

	@Override
	public UserVo getName(String mbNo) throws SQLException {
		return mpUserDao.getName(mbNo);
	}

	@Override
	public List<CallVo> AuctList(String mbNo) throws SQLException {
		return mpUserDao.selectAuct(mbNo);
	}



	


}
