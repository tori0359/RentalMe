package com.me.rentalme.act.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.act.dao.ActDao;
import com.me.rentalme.model.entity.ActVo;

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

}
