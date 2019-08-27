package com.me.rentalme.cs.entity;

import java.sql.Date;

public class CsVo {

	private String faqNo;  //faq 게시판 번호
	private String csGbCd; // 게시판 분류 번호
	private String csClassGbCd;  //faq유형 번호
	private String sub;    //제목
	private String content;//내용
	private String chgId;  //
	private Date cghDt;
	private String regId;  //작성아이디
	private Date regDt;	
	private String noticNo; //notic 게시판 번호
	
	
	
	public String getNoticNo() {
		return noticNo;
	}
	public void setNoticNo(String noticNo) {
		this.noticNo = noticNo;
	}
	public String getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(String faqNo) {
		this.faqNo = faqNo;
	}
	public String getCsGbCd() {
		return csGbCd;
	}
	public void setCsGbCd(String csGbCd) {
		this.csGbCd = csGbCd;
	}
	public String getCsClassGbCd() {
		return csClassGbCd;
	}
	public void setCsClassGbCd(String csClassGbCd) {
		this.csClassGbCd = csClassGbCd;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getChgId() {
		return chgId;
	}
	public void setChgId(String chgId) {
		this.chgId = chgId;
	}
	public Date getCghDt() {
		return cghDt;
	}
	public void setCghDt(Date cghDt) {
		this.cghDt = cghDt;
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cghDt == null) ? 0 : cghDt.hashCode());
		result = prime * result + ((chgId == null) ? 0 : chgId.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((csClassGbCd == null) ? 0 : csClassGbCd.hashCode());
		result = prime * result + ((csGbCd == null) ? 0 : csGbCd.hashCode());
		result = prime * result + ((faqNo == null) ? 0 : faqNo.hashCode());
		result = prime * result + ((noticNo == null) ? 0 : noticNo.hashCode());
		result = prime * result + ((regDt == null) ? 0 : regDt.hashCode());
		result = prime * result + ((regId == null) ? 0 : regId.hashCode());
		result = prime * result + ((sub == null) ? 0 : sub.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CsVo other = (CsVo) obj;
		if (cghDt == null) {
			if (other.cghDt != null)
				return false;
		} else if (!cghDt.equals(other.cghDt))
			return false;
		if (chgId == null) {
			if (other.chgId != null)
				return false;
		} else if (!chgId.equals(other.chgId))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (csClassGbCd == null) {
			if (other.csClassGbCd != null)
				return false;
		} else if (!csClassGbCd.equals(other.csClassGbCd))
			return false;
		if (csGbCd == null) {
			if (other.csGbCd != null)
				return false;
		} else if (!csGbCd.equals(other.csGbCd))
			return false;
		if (faqNo == null) {
			if (other.faqNo != null)
				return false;
		} else if (!faqNo.equals(other.faqNo))
			return false;
		if (noticNo == null) {
			if (other.noticNo != null)
				return false;
		} else if (!noticNo.equals(other.noticNo))
			return false;
		if (regDt == null) {
			if (other.regDt != null)
				return false;
		} else if (!regDt.equals(other.regDt))
			return false;
		if (regId == null) {
			if (other.regId != null)
				return false;
		} else if (!regId.equals(other.regId))
			return false;
		if (sub == null) {
			if (other.sub != null)
				return false;
		} else if (!sub.equals(other.sub))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "CsVo [faqNo=" + faqNo + ", csGbCd=" + csGbCd + ", csClassGbCd=" + csClassGbCd + ", sub=" + sub
				+ ", content=" + content + ", chgId=" + chgId + ", cghDt=" + cghDt + ", regId=" + regId + ", regDt="
				+ regDt + ", noticNo=" + noticNo + "]";
	}
	
	
}
