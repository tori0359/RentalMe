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
	public CsVo csFaqDetail(CsVo csVo) throws SQLException {
		System.out.println("serviceImpl faq deta"+csVo.getFaqNo());
		return csDao.csFaqDetail(csVo);
	}
	
	@Override
	public CsVo csNoticeDetail(CsVo csVo) throws SQLException {
		System.out.println("notice 상세 mapping");

		System.out.println("notice 상세 mapping end");
		return csDao.csNoticeDetail(csVo);
	}
	@Override
	public int addfaq(CsVo csVo) throws SQLException {
		return csDao.insertOne(csVo);
		
	}
	@Override
	public int seqNocUp() throws SQLException {
		//공지사항 게시글 시퀀스
		return csDao.seqNocInsert();
	}
	@Override
	public int seqFaqUp() throws SQLException {
		//faq게시글 시퀀스
		return csDao.seqFaqInsert();
	}
	
	@Override
	public int noticDel(String num) throws SQLException {
		
		return csDao.noticDel(num);
	}
	@Override
	public int csUpdateOne(CsVo csVo) throws SQLException {
		
		System.out.println("service"+csVo.getCsGbCd());
		return csDao.updateOne(csVo);
	}
	@Override
	public int faqDel(String num) throws SQLException {
		// TODO Auto-generated method stub
		return csDao.faqDel(num);
	}



	


}
