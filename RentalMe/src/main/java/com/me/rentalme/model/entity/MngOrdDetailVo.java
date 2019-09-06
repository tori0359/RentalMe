package com.me.rentalme.model.entity;

import java.sql.Date;

public class MngOrdDetailVo {
	private String odrNo;				//주문번호
	private String odrSeq;				//주문일련번호
	private String odrDt;				//주문일자
	private String gdsCd;				//상품코드
	private int gdsPrice;				//상품가격
	private int gdsDisPrice;			//상품할인가격
	private String gdsDisStsCd;			//상품할인구분코드
	private int odrQty;					//주문수량
	private int odrAmt;					//주문금액
	private String agreeTem;			//계약기간
	private String chgId;				//변경아이디
	private Date chgDt;					//변경일자
	private String regId;				//등록아이디
	private Date regDt;					//등록일자
	private String gdsNm;				//상품이름
	
	public String getOdrNo() {
		return odrNo;
	}
	public void setOdrNo(String odrNo) {
		this.odrNo = odrNo;
	}
	public String getOdrSeq() {
		return odrSeq;
	}
	public void setOdrSeq(String odrSeq) {
		this.odrSeq = odrSeq;
	}
	public String getOdrDt() {
		return odrDt;
	}
	public void setOdrDt(String odrDt) {
		this.odrDt = odrDt;
	}
	public String getGdsCd() {
		return gdsCd;
	}
	public void setGdsCd(String gdsCd) {
		this.gdsCd = gdsCd;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public int getGdsDisPrice() {
		return gdsDisPrice;
	}
	public void setGdsDisPrice(int gdsDisPrice) {
		this.gdsDisPrice = gdsDisPrice;
	}
	public String getGdsDisStsCd() {
		return gdsDisStsCd;
	}
	public void setGdsDisStsCd(String gdsDisStsCd) {
		this.gdsDisStsCd = gdsDisStsCd;
	}
	public int getOdrQty() {
		return odrQty;
	}
	public void setOdrQty(int odrQty) {
		this.odrQty = odrQty;
	}
	public int getOdrAmt() {
		return odrAmt;
	}
	public void setOdrAmt(int odrAmt) {
		this.odrAmt = odrAmt;
	}
	public String getAgreeTem() {
		return agreeTem;
	}
	public void setAgreeTem(String agreeTem) {
		this.agreeTem = agreeTem;
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
	public String getGdsNm() {
		return gdsNm;
	}
	public void setGdsNm(String gdsNm) {
		this.gdsNm = gdsNm;
	}
	
	
}
