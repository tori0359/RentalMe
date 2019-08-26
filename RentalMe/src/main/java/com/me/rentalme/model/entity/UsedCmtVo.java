package com.me.rentalme.model.entity;

import java.sql.Date;

public class UsedCmtVo {
	private String usedGdsNo;		// 중고상품번호
	private String usedGdsComtNo;	// 중고상품댓글번호
	private String usedGdsContDt;	// 중고상품댓글일자
	private String mbNo;			// 회원번호
	private String content;			// 내용
	private String secretYn;		// 비밀여부
	private String usedReGbCd;		// 중고리플구분코드
	private String delYn;			// 삭제여부
	private String chgId;			// 변경아이디
	private Date chgDt;				// 변경일자
	private String regId;			// 등록아이디
	private Date regDt;				// 등록일자
	
	public UsedCmtVo() {
		// TODO Auto-generated constructor stub
	}

	public UsedCmtVo(String usedGdsNo, String usedGdsComtNo, String usedGdsContDt, String mbNo, String content,
			String secretYn, String usedReGbCd, String delYn, String chgId, Date chgDt, String regId, Date regDt) {
		super();
		this.usedGdsNo = usedGdsNo;
		this.usedGdsComtNo = usedGdsComtNo;
		this.usedGdsContDt = usedGdsContDt;
		this.mbNo = mbNo;
		this.content = content;
		this.secretYn = secretYn;
		this.usedReGbCd = usedReGbCd;
		this.delYn = delYn;
		this.chgId = chgId;
		this.chgDt = chgDt;
		this.regId = regId;
		this.regDt = regDt;
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

	public String getUsedGdsContDt() {
		return usedGdsContDt;
	}

	public void setUsedGdsContDt(String usedGdsContDt) {
		this.usedGdsContDt = usedGdsContDt;
	}

	public String getMbNo() {
		return mbNo;
	}

	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSecretYn() {
		return secretYn;
	}

	public void setSecretYn(String secretYn) {
		this.secretYn = secretYn;
	}

	public String getUsedReGbCd() {
		return usedReGbCd;
	}

	public void setUsedReGbCd(String usedReGbCd) {
		this.usedReGbCd = usedReGbCd;
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

	@Override
	public String toString() {
		return "UsedCmtVo [usedGdsNo=" + usedGdsNo + ", usedGdsComtNo=" + usedGdsComtNo + ", usedGdsContDt="
				+ usedGdsContDt + ", mbNo=" + mbNo + ", content=" + content + ", secretYn=" + secretYn + ", usedReGbCd="
				+ usedReGbCd + ", delYn=" + delYn + ", chgId=" + chgId + ", chgDt=" + chgDt + ", regId=" + regId
				+ ", regDt=" + regDt + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((chgId == null) ? 0 : chgId.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((delYn == null) ? 0 : delYn.hashCode());
		result = prime * result + ((mbNo == null) ? 0 : mbNo.hashCode());
		result = prime * result + ((regId == null) ? 0 : regId.hashCode());
		result = prime * result + ((secretYn == null) ? 0 : secretYn.hashCode());
		result = prime * result + ((usedGdsComtNo == null) ? 0 : usedGdsComtNo.hashCode());
		result = prime * result + ((usedGdsContDt == null) ? 0 : usedGdsContDt.hashCode());
		result = prime * result + ((usedGdsNo == null) ? 0 : usedGdsNo.hashCode());
		result = prime * result + ((usedReGbCd == null) ? 0 : usedReGbCd.hashCode());
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
		UsedCmtVo other = (UsedCmtVo) obj;
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
		if (delYn == null) {
			if (other.delYn != null)
				return false;
		} else if (!delYn.equals(other.delYn))
			return false;
		if (mbNo == null) {
			if (other.mbNo != null)
				return false;
		} else if (!mbNo.equals(other.mbNo))
			return false;
		if (regId == null) {
			if (other.regId != null)
				return false;
		} else if (!regId.equals(other.regId))
			return false;
		if (secretYn == null) {
			if (other.secretYn != null)
				return false;
		} else if (!secretYn.equals(other.secretYn))
			return false;
		if (usedGdsComtNo == null) {
			if (other.usedGdsComtNo != null)
				return false;
		} else if (!usedGdsComtNo.equals(other.usedGdsComtNo))
			return false;
		if (usedGdsContDt == null) {
			if (other.usedGdsContDt != null)
				return false;
		} else if (!usedGdsContDt.equals(other.usedGdsContDt))
			return false;
		if (usedGdsNo == null) {
			if (other.usedGdsNo != null)
				return false;
		} else if (!usedGdsNo.equals(other.usedGdsNo))
			return false;
		if (usedReGbCd == null) {
			if (other.usedReGbCd != null)
				return false;
		} else if (!usedReGbCd.equals(other.usedReGbCd))
			return false;
		return true;
	}
	
	
	
}
