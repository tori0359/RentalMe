package com.me.rentalme.cs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.cs.dao.CsDao;
import com.me.rentalme.cs.entity.CsVo;


@Service
public class CsServiceImpl implements CsService {

	@Inject
	CsDao csDao;
	
	HashMap<String, Object> map;
	
	@Override
	public List<CsVo> csFaqList() throws SQLException {
		
		return csDao.faqSelectAll();
	}
	@Override
	public List<CsVo> csNoticeList() throws SQLException {
		return csDao.noticeSelectAll();
	}

	/*
	 * @Override public CsVo csDetail(String faqNo) throws SQLException {
	 * 
	 * return csDao.csDetail(faqNo); }
	 */

	@Override
	public CsVo csFaqDetail(String csGbCd, String faqNo, String csClassGbCd) throws SQLException {
		map=new HashMap<>();
		map.put("csGbCd",csGbCd);
		map.put("faqNo", faqNo);
		map.put("csClassGbCd", csClassGbCd);

		
		return csDao.csFaqDetail(map);
	}
	
	@Override
	public CsVo csNoticeDetail(String noticNo, String csGbCd) throws SQLException {
		System.out.println("notice 상세 mapping");
		map=new HashMap<>();
		map.put("noticNo", noticNo);
		map.put("csGbCd",csGbCd);
		
		System.out.println("notice 상세 mapping end");
		return csDao.csNoticeDetail(map);
	}



	


}
