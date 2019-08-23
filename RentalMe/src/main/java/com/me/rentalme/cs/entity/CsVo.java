package com.me.rentalme.cs.entity;

import java.sql.Date;

public class CsVo {

	private String FAQ_NO;
	private String CS_GB_CD;
	private String CS_CLASS_GB_CD;
	private String SUB;
	private String CONTENT;
	private String CHG_ID;
	private Date CGH_DT;
	private String REG_ID;
	private Date REG_DT;
	
	public CsVo() {
		
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((CGH_DT == null) ? 0 : CGH_DT.hashCode());
		result = prime * result + ((CHG_ID == null) ? 0 : CHG_ID.hashCode());
		result = prime * result + ((CONTENT == null) ? 0 : CONTENT.hashCode());
		result = prime * result + ((CS_CLASS_GB_CD == null) ? 0 : CS_CLASS_GB_CD.hashCode());
		result = prime * result + ((CS_GB_CD == null) ? 0 : CS_GB_CD.hashCode());
		result = prime * result + ((FAQ_NO == null) ? 0 : FAQ_NO.hashCode());
		result = prime * result + ((REG_DT == null) ? 0 : REG_DT.hashCode());
		result = prime * result + ((REG_ID == null) ? 0 : REG_ID.hashCode());
		result = prime * result + ((SUB == null) ? 0 : SUB.hashCode());
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
		if (CGH_DT == null) {
			if (other.CGH_DT != null)
				return false;
		} else if (!CGH_DT.equals(other.CGH_DT))
			return false;
		if (CHG_ID == null) {
			if (other.CHG_ID != null)
				return false;
		} else if (!CHG_ID.equals(other.CHG_ID))
			return false;
		if (CONTENT == null) {
			if (other.CONTENT != null)
				return false;
		} else if (!CONTENT.equals(other.CONTENT))
			return false;
		if (CS_CLASS_GB_CD == null) {
			if (other.CS_CLASS_GB_CD != null)
				return false;
		} else if (!CS_CLASS_GB_CD.equals(other.CS_CLASS_GB_CD))
			return false;
		if (CS_GB_CD == null) {
			if (other.CS_GB_CD != null)
				return false;
		} else if (!CS_GB_CD.equals(other.CS_GB_CD))
			return false;
		if (FAQ_NO == null) {
			if (other.FAQ_NO != null)
				return false;
		} else if (!FAQ_NO.equals(other.FAQ_NO))
			return false;
		if (REG_DT == null) {
			if (other.REG_DT != null)
				return false;
		} else if (!REG_DT.equals(other.REG_DT))
			return false;
		if (REG_ID == null) {
			if (other.REG_ID != null)
				return false;
		} else if (!REG_ID.equals(other.REG_ID))
			return false;
		if (SUB == null) {
			if (other.SUB != null)
				return false;
		} else if (!SUB.equals(other.SUB))
			return false;
		return true;
	}





	@Override
	public String toString() {
		return "CsVo [FAQ_NO=" + FAQ_NO + ", CS_GB_CD=" + CS_GB_CD + ", CS_CLASS_GB_CD=" + CS_CLASS_GB_CD + ", SUB="
				+ SUB + ", CONTENT=" + CONTENT + ", CHG_ID=" + CHG_ID + ", CGH_DT=" + CGH_DT + ", REG_ID=" + REG_ID
				+ ", REG_DT=" + REG_DT + "]";
	}



	public String getFAQ_NO() {
		return FAQ_NO;
	}
	public void setFAQ_NO(String fAQ_NO) {
		FAQ_NO = fAQ_NO;
	}
	public String getCS_GB_CD() {
		return CS_GB_CD;
	}
	public void setCS_GB_CD(String cS_GB_CD) {
		CS_GB_CD = cS_GB_CD;
	}
	public String getCS_CLASS_GB_CD() {
		return CS_CLASS_GB_CD;
	}
	public void setCS_CLASS_GB_CD(String cS_CLASS_GB_CD) {
		CS_CLASS_GB_CD = cS_CLASS_GB_CD;
	}
	public String getSUB() {
		return SUB;
	}
	public void setSUB(String sUB) {
		SUB = sUB;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getCHG_ID() {
		return CHG_ID;
	}
	public void setCHG_ID(String cHG_ID) {
		CHG_ID = cHG_ID;
	}
	public Date getCGH_DT() {
		return CGH_DT;
	}
	public void setCGH_DT(Date cGH_DT) {
		CGH_DT = cGH_DT;
	}
	public String getREG_ID() {
		return REG_ID;
	}
	public void setREG_ID(String rEG_ID) {
		REG_ID = rEG_ID;
	}
	public Date getREG_DT() {
		return REG_DT;
	}
	public void setREG_DT(Date rEG_DT) {
		REG_DT = rEG_DT;
	}
	
	
	
	
}
