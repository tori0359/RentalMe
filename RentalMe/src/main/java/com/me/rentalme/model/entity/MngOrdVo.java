package com.me.rentalme.model.entity;

import java.sql.Date;

public class MngOrdVo {

	private String odrNo;				//주문번호
	private String mbNo;				//회원번호
	private String odrDt;				//주문일자
	private int totOdrAmt;				//전체주문금액
	private String odrGbCd;				//주문구분코드
	private String payGbCd;				//결제구분코드
	private String odrStsGbCd;			//주문상태구분코드
	private String chgId;				//변경아이디
	private Date chgDt;					//변경일자
	private String regId;				//등록아이디
	private Date regDt;					//등록일자
	
	private String userNm;				// 사용자명
	
	public String getOdrNo() {
		return odrNo;
	}
	public void setOdrNo(String odrNo) {
		this.odrNo = odrNo;
	}
	public String getMbNo() {
		return mbNo;
	}
	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}
	public String getOdrDt() {
		return odrDt;
	}
	public void setOderDt(String odrDt) {
		this.odrDt = odrDt;
	}
	public int getTotOdrAmt() {
		return totOdrAmt;
	}
	public void setTotOdrAmt(int totOdrAmt) {
		this.totOdrAmt = totOdrAmt;
	}
	public String getOdrGbCd() {
		return odrGbCd;
	}
	public void setOdrGbCd(String odrGbCd) {
		this.odrGbCd = odrGbCd;
	}
	public String getPayGbCd() {
		return payGbCd;
	}
	public void setPayGbCd(String payGbCd) {
		this.payGbCd = payGbCd;
	}
	public String getOdrStsGbCd() {
		return odrStsGbCd;
	}
	public void setOdrStsGbCd(String odrStsGbCd) {
		this.odrStsGbCd = odrStsGbCd;
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
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	
	
	
}
