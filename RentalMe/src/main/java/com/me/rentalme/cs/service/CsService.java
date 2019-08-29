package com.me.rentalme.cs.service;


import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.cs.dao.CsDao;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.UserVo;

public interface CsService {
	
	List<CsVo> csFaqList() throws SQLException;    //faq리스트페이지
	List<CsVo> csNoticeList() throws SQLException;	//공지 리스트페이지

	CsVo csFaqDetail(CsVo csVo) throws SQLException;  //faq 상세페이지
	CsVo csNoticeDetail(CsVo csVo) throws SQLException;	//공지 상세페이지

	int csUpdateOne(CsVo csVo) throws SQLException;
	int noticDel(String num) throws SQLException;
	int faqDel(String num) throws SQLException;
	
	int seqNocUp() throws SQLException;
	int seqFaqUp() throws SQLException;
	int seqInqUp() throws SQLException;
	
	int addfaq(CsVo csVo) throws SQLException;
	
	int inquiryAdd() throws SQLException;
}
