package com.me.rentalme.cs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.cs.dao.CsDao;
import com.me.rentalme.cs.entity.CsVo;
import com.me.rentalme.model.entity.UserVo;


@Service
public class CsServiceImpl implements CsService {

	@Inject
	CsDao csDao;
	
	HashMap<String, Object> map;
	
	//faq게시글 리스트
	@Override
	public List<CsVo> csFaqList() throws SQLException {
		
		return csDao.faqSelectAll();
	}
	
	//공지게시글 리스트
	@Override
	public List<CsVo> csNoticeList() throws SQLException {
		return csDao.noticeSelectAll();
	}

	
	//faq게시글 상세
	@Override
	public CsVo csFaqDetail(CsVo csVo) throws SQLException {
		System.out.println("serviceImpl faq deta"+csVo.getFaqNo());
		return csDao.csFaqDetail(csVo);
	}
	//공지게시글 상세
	@Override
	public CsVo csNoticeDetail(CsVo csVo) throws SQLException {
		System.out.println("notice 상세 mapping");

		System.out.println("notice 상세 mapping end");
		return csDao.csNoticeDetail(csVo);
	}
	
	//게시글 등록
	@Override
	public int addfaq(CsVo csVo) throws SQLException {
		return csDao.insertOne(csVo);
		
	}
	
	
	//게시물 수정
	@Override
	public int csUpdateOne(CsVo csVo) throws SQLException {
		
		System.out.println("service"+csVo.getCsGbCd());
		return csDao.updateOne(csVo);
	}
	
	
	//공지게시물 삭제
	@Override
	public int noticDel(String num) throws SQLException {
		
		return csDao.noticDel(num);
	}
	
	//faq게시물 삭제
	@Override
	public int faqDel(String num) throws SQLException {
		// TODO Auto-generated method stub
		return csDao.faqDel(num);
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
	public int seqInqUp() throws SQLException {
		//Inquiry 게시글 시퀀스
		System.out.println("service inq 시퀀스...");
		return csDao.seqInqInsert();
	}

	//1:1질문
	@Override
	public int inquiryAdd() throws SQLException {
	
		return 1;
	}

	//문의
	@Override
	public List<CsVo> csInqList() throws SQLException {
		
		return csDao.inqSelectAll();
	}

	@Override
	public int inqAnswer(String num) throws SQLException {
		// TODO Auto-generated method stub
		return csDao.inqAnswer(num);
	}


}
