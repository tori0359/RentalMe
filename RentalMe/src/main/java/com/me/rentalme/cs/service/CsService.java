package com.me.rentalme.cs.service;


import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import com.me.rentalme.common.Paging;
import com.me.rentalme.cs.dao.CsDao;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.cs.paging.Search;
import com.me.rentalme.model.entity.UserVo;

public interface CsService {

	
	List<CsVo> csFaqList(Search search) throws SQLException;    //faq리스트페이지
	List<CsVo> csNoticeList(Paging paging) throws SQLException;	//공지 리스트페이지
	List<CsVo> csInqList(Paging paging) throws SQLException;	//문의 리스트페이지
	
	CsVo csFaqDetail(CsVo csVo) throws SQLException;  //faq 상세페이지
	CsVo csNoticeDetail(CsVo csVo) throws SQLException;	//공지 상세페이지

	int csUpdateOne(CsVo csVo) throws SQLException;
	int noticDel(String num) throws SQLException;
	int faqDel(String num) throws SQLException;
	
	//공지,Faq,문의게시판 시퀀스
	int seqNocUp() throws SQLException;
	int seqFaqUp() throws SQLException;
	int seqInqUp() throws SQLException;
	
	//1대1문의
	int addfaq(CsVo csVo) throws SQLException;
	
	int inqAnswer(String num) throws SQLException;
	
	//게시글 총 갯수
	int faqListCnt1(Search search) throws SQLException;
	int noticListCnt() throws SQLException;
	int inquiryListCnt() throws SQLException;
}
