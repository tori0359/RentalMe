package com.me.rentalme.cs.service;


import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.cs.dao.CsDao;
import com.me.rentalme.cs.entity.CsVo;

public interface CsService {
	
	List<CsVo> csFaqList() throws SQLException;    //faq리스트페이지
	List<CsVo> csNoticeList() throws SQLException;	//공지 리스트페이지

	CsVo csFaqDetail(String csGbCd, String faqNo, String csClassGbCd) throws SQLException;  //faq 상세페이지
	CsVo csNoticeDetail(String noticNo,String csGbCd) throws SQLException;					//공지 상세페이지

	int noticDel(int num) throws SQLException;
	
	int seqNocUp() throws SQLException;
	int seqFaqUp() throws SQLException;
	
	int addfaq(CsVo csVo) throws SQLException;
}
