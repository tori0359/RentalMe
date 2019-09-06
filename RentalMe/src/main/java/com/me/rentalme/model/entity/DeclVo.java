package com.me.rentalme.model.entity;

import java.sql.Date;

public class DeclVo {
	private String declNo;				//신고번호
	private String usedReGbCd;			//중고리플구분코드
	private String usedGdsNo;			//중고상품번호
	private String usedGdsComtNo;		//중고상품댓글번호
	private String usedGdsComtDt;		//중고상품댓글일자
	private String usedGdsReplyNo;		//중고상품답글번호
	private String usedGdsReplyDt;		//중고상품답글일자
	private String storeNo;				//상점번호
	private String storeReviewNo;		//상점후기번호
	private String storeReviewDt;		//상점후기일자
	private String declResStsCd;		//신고결과상태코드
	private String delYn;				//삭제여부
	private String chgId;				//변경아이디
	private Date chgDt;					//변경일자
	private String regId;				//등록아이디
	private Date regDt;					//등록일자
	private String mbNo;				//대상번호
	
	public DeclVo() {
	}
	
	public String getDeclNo() {
		return declNo;
	}
	public void setDeclNo(String declNo) {
		this.declNo = declNo;
	}
	public String getUsedReGbCd() {
		return usedReGbCd;
	}
	public void setUsedReGbCd(String usedReGbCd) {
		this.usedReGbCd = usedReGbCd;
	}
	public String getUsedGdsNo() {
		return usedGdsNo;
	}
	public void setUsedGdsNo(String usedGdsNo) {
		this.usedGdsNo = usedGdsNo;
	}
	public String getUsedGdsComtNo() {
		return usedGdsComtNo;
	}
	public void setUsedGdsComtNo(String usedGdsComtNo) {
		this.usedGdsComtNo = usedGdsComtNo;
	}
	public String getUsedGdsComtDt() {
		return usedGdsComtDt;
	}
	public void setUsedGdsComtDt(String usedGdsComtDt) {
		this.usedGdsComtDt = usedGdsComtDt;
	}
	public String getUsedGdsReplyNo() {
		return usedGdsReplyNo;
	}
	public void setUsedGdsReplyNo(String usedGdsReplyNo) {
		this.usedGdsReplyNo = usedGdsReplyNo;
	}
	public String getUsedGdsReplyDt() {
		return usedGdsReplyDt;
	}
	public void setUsedGdsReplyDt(String usedGdsReplyDt) {
		this.usedGdsReplyDt = usedGdsReplyDt;
	}
	public String getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(String storeNo) {
		this.storeNo = storeNo;
	}
	public String getStoreReviewNo() {
		return storeReviewNo;
	}
	public void setStoreReviewNo(String storeReviewNo) {
		this.storeReviewNo = storeReviewNo;
	}
	public String getStoreReviewDt() {
		return storeReviewDt;
	}
	public void setStoreReviewDt(String storeReviewDt) {
		this.storeReviewDt = storeReviewDt;
	}
	public String getDeclResStsCd() {
		return declResStsCd;
	}
	public void setDeclResStsCd(String declResStsCd) {
		this.declResStsCd = declResStsCd;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getChgId() {
		return chgId;
	}
	public void setChgId(String chgId) {
		this.chgId = chgId;
	}
	public Date getChgDt() {
		return chgDt;
	}
	public void setChgDt(Date chgDt) {
		this.chgDt = chgDt;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public String getMbNo() {
		return mbNo;
	}

	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}
	
	
}
