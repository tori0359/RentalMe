package com.me.rentalme.mp.user.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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

	

	


}
