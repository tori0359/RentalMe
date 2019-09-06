package com.me.rentalme.act.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.act.dao.ActDao;
import com.me.rentalme.model.entity.ActVo;
import com.me.rentalme.model.entity.RentalAppliVo;

@Service
public class ActServiceImpl implements ActService {

	@Inject
	ActDao actDao;
	
	@Override
	public List<ActVo> listAct() throws SQLException {
		System.out.println("actlistdao로 ㄱㄱ");
		return actDao.selectActList();
	}

	@Override
	public int addAct300(ActVo actVo) throws SQLException {
		System.out.println("insertAct dao로 ㄱㄱ");
		System.out.println("시작시간"+actVo.getActStTime());
		System.out.println("종료시간"+actVo.getActEdTime());
		System.out.println("content"+actVo.getContent());
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

}
