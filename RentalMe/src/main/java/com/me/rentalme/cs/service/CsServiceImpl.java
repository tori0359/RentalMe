package com.me.rentalme.cs.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.me.rentalme.cs.dao.CsDao;
import com.me.rentalme.cs.entity.CsVo;


@Service
public class CsServiceImpl implements CsService {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void getList(Model model) throws SQLException {
		System.out.println("service...");
		model.addAttribute("alist", sqlSession.getMapper(CsDao.class).selectAll());
	}

	@Override
	public void add(CsVo bean) throws SQLException {

	}

	@Override
	public void edit(CsVo bean) throws SQLException {

	}

	@Override
	public void delete(int num) throws SQLException {

	}

}
