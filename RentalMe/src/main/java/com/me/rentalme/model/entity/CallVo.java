package com.me.rentalme.model.entity;


public class CallVo {
	private String usedGdsNo;
	private String mbNo;
	private String callStsCd;
	private String chgId;
	private String chgDt;
	private String regId;
	private String regDt;
	private String modelNm;
	private String usedGdsPrice;
	private String odrDt;
	private String gdsPrice;
	private int odrQty;
	private int odrAmt;
	private String agreeTem;
	private String odrStsGbCd;
	private String gdsNm;
	private String gdsCd;
	private String userId;
	private String content;
	private String grade;
	private String sumPrice;
	private String depositSeq;
	private String depositDt;
	private String chargeDeposit;
	private String useDeposit;
	private String refundDeposit;
	private String depositGbCd;
	private String remnDeposit;
	private String bidPrice;
	private String bidTime;
	private String userNm;
	

	public String getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(String bidPrice) {
		this.bidPrice = bidPrice;
	}

	public String getBidTime() {
		return bidTime;
	}

	public void setBidTime(String bidTime) {
		this.bidTime = bidTime;
	}

	public String getRemnDeposit() {
		return remnDeposit;
	}

	public void setRemnDeposit(String remnDeposit) {
		this.remnDeposit = remnDeposit;
	}

	public String getDepositSeq() {
		return depositSeq;
	}

	public void setDepositSeq(String depositSeq) {
		this.depositSeq = depositSeq;
	}

	public String getDepositDt() {
		return depositDt;
	}

	public void setDepositDt(String depositDt) {
		this.depositDt = depositDt;
	}

	public String getChargeDeposit() {
		return chargeDeposit;
	}

	public void setChargeDeposit(String chargeDeposit) {
		this.chargeDeposit = chargeDeposit;
	}

	public String getUseDeposit() {
		return useDeposit;
	}

	public void setUseDeposit(String useDeposit) {
		this.useDeposit = useDeposit;
	}

	public String getRefundDeposit() {
		return refundDeposit;
	}

	public void setRefundDeposit(String refundDeposit) {
		this.refundDeposit = refundDeposit;
	}

	public String getDepositGbCd() {
		return depositGbCd;
	}

	public void setDepositGbCd(String depositGbCd) {
		this.depositGbCd = depositGbCd;
	}

	public String getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(String sumPrice) {
		this.sumPrice = sumPrice;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}


	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGdsCd() {
		return gdsCd;
	}

	public void setGdsCd(String gdsCd) {
		this.gdsCd = gdsCd;
	}

	public String getGdsNm() {
		return gdsNm;
	}

	public void setGdsNm(String gdsNm) {
		this.gdsNm = gdsNm;
	}

	public String getOdrStsGbCd() {
		return odrStsGbCd;
	}

	public void setOdrStsGbCd(String odrStsGbCd) {
		this.odrStsGbCd = odrStsGbCd;
	}

	public String getOdrDt() {
		return odrDt;
	}

	public void setOdrDt(String odrDt) {
		this.odrDt = odrDt;
	}

	public String getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(String gdsPrice) {
		this.gdsPrice = gdsPrice;
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

	public String getModelNm() {
		return modelNm;
	}

	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}

	public String getUsedGdsPrice() {
		return usedGdsPrice;
	}

	public void setUsedGdsPrice(String usedGdsPrice) {
		this.usedGdsPrice = usedGdsPrice;
	}

	public CallVo() {
		
	}

	public String getUsedGdsNo() {
		return usedGdsNo;
	}

	public void setUsedGdsNo(String usedGdsNo) {
		this.usedGdsNo = usedGdsNo;
	}

	public String getMbNo() {
		return mbNo;
	}

	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}

	public String getCallStsCd() {
		return callStsCd;
	}

	public void setCallStsCd(String callStsCd) {
		this.callStsCd = callStsCd;
	}

	public String getChgId() {
		return chgId;
	}

	public void setChgId(String chgId) {
		this.chgId = chgId;
	}

	public String getChgDt() {
		return chgDt;
	}

	public void setChgDt(String chgDt) {
		this.chgDt = chgDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((callStsCd == null) ? 0 : callStsCd.hashCode());
		result = prime * result + ((chgId == null) ? 0 : chgId.hashCode());
		result = prime * result + ((mbNo == null) ? 0 : mbNo.hashCode());
		result = prime * result + ((regId == null) ? 0 : regId.hashCode());
		result = prime * result + ((usedGdsNo == null) ? 0 : usedGdsNo.hashCode());
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
		CallVo other = (CallVo) obj;
		if (callStsCd == null) {
			if (other.callStsCd != null)
				return false;
		} else if (!callStsCd.equals(other.callStsCd))
			return false;
		if (chgId == null) {
			if (other.chgId != null)
				return false;
		} else if (!chgId.equals(other.chgId))
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
		if (usedGdsNo == null) {
			if (other.usedGdsNo != null)
				return false;
		} else if (!usedGdsNo.equals(other.usedGdsNo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CallVo [usedGdsNo=" + usedGdsNo + ", mbNo=" + mbNo + ", callStsCd=" + callStsCd + ", chgId=" + chgId
				+ ", chgDt=" + chgDt + ", regId=" + regId + ", regDt=" + regDt + ", modelNm=" + modelNm
				+ ", usedGdsPrice=" + usedGdsPrice + ", odrDt=" + odrDt + ", gdsPrice=" + gdsPrice + ", odrQty="
				+ odrQty + ", odrAmt=" + odrAmt + ", agreeTem=" + agreeTem + ", odrStsGbCd=" + odrStsGbCd + "]";
	}
	
}
