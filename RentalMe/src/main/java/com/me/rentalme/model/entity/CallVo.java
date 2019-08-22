package com.me.rentalme.model.entity;

import java.util.Date;

public class CallVo {
	private String usedGdsNo;
	private String mbNo;
	private String callStsCd;
	private String chgId;
	private String chgDt;
	private String regId;
	private String regDt;
	
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
				+ ", chgDt=" + chgDt + ", regId=" + regId + ", regDt=" + regDt + "]";
	}
	
}
