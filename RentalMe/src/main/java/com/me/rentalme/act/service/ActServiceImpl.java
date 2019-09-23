package com.me.rentalme.act.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.me.rentalme.act.dao.ActDao;
import com.me.rentalme.model.entity.ActResultVo;
import com.me.rentalme.common.Paging;
import com.me.rentalme.model.entity.ActVo;
import com.me.rentalme.model.entity.CallVo;
import com.me.rentalme.model.entity.RentalAppliVo;

@Service
public class ActServiceImpl implements ActService{
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Inject
	ActDao actDao;
	

	@Override
	public int addAct300(ActVo actVo) throws SQLException {
		System.out.println("insertAct dao로 ㄱㄱ");
	
		return actDao.insertAct300(actVo);
	}

	@Override
	public int addAct100(ActVo actVo) throws SQLException {
		
		return 0;
	}
	
	//지영
	  //경매 진행중 리스트
	   @Override
	   public List<RentalAppliVo> actList() throws SQLException {
	      return actDao.selectActRun();
	   }

	   //경매 종료된 리스트
	   @Override
	   public List<RentalAppliVo> actEndList() throws SQLException {
	      return actDao.selectActEnd();
	   }

	   //상품 번호에 해당하는 굿즈
	@Override
	public List<ActVo> goodsList(String goodsNum) throws SQLException {
		
		return actDao.selectGoodsList(goodsNum);
	}

	@Override
	public List<ActVo> mngListAct(Paging actPaging) throws SQLException {
      System.out.println("actlistdao로 ㄱㄱ");
      return actDao.selectMngActList(actPaging);		
	}

	/*
	 * @Override public ActVo goodsInfo(String goodsNum) throws SQLException {
	 * 
	 * return actDao.selectGoodsInfo(goodsNum); }
	 */


	//경매 상품 상세페이지 (RentalAppliVo에서 가져옴)
	@Override
	public RentalAppliVo actDetail(String gdsCdDetail) throws SQLException {
		return actDao.selectActDetail(gdsCdDetail);
	}

	//경매 상품 상세페이지2 (ActVo에서 가져옴)
	@Override
	public ActVo actDetailAuction(String gdsCdDetail) {
		return actDao.selectActDetail2(gdsCdDetail);
	}

	@Override
	public int insertActResult(ActResultVo bean) throws SQLException {
		return actDao.insertActResult(bean);
	}

	@Override
	public int updateBidWin(String gdsCd) throws SQLException {
		return actDao.updateBidWin(gdsCd);
	}

	@Override
	public List<ActResultVo> SelectMngActSpec() throws SQLException {
		return actDao.SelectMngActSpec();
	}

	@Override
	public int updateMngBidCancel(String gdsCd) throws SQLException {
		return actDao.updateMngBidCancel(gdsCd);
	}

	@Override
	public int updateActEnd(String gdsCd) throws SQLException {
		return actDao.updateActEnd(gdsCd);
	}

	@Override
	public int selectMyMb(String mbno) throws SQLException {
		return actDao.selectMyMb(mbno);
	}
	//경매 상품 삭제
	@Override
	public void deleteAct(String gdsCd) throws SQLException {
		System.out.println("경매상품 삭제 service");
		actDao.deleteActList(gdsCd);
	}

	@Override
	public int actListCnt() throws SQLException {
		
		return actDao.actListCnt();
	}

	@Override
	public int updateMngActStsCd(String gdsCd) throws SQLException {
		return actDao.updateMngActStsCd(gdsCd);
	}

	@Override
	public int insertUserActMoney(CallVo bean) throws SQLException {
		return actDao.insertUserActMoney(bean);
	}

	@Override
	public int updateUserActMoney(CallVo bean) throws SQLException {
		return actDao.updateUserActMoney(bean);
	}

}
