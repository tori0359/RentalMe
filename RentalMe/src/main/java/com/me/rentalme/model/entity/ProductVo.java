package com.me.rentalme.model.entity;

public class ProductVo {
	
	private String prdCode;			// 상품코드
	private String prdName;			// 상품명
	private String prdCat;			// 대분류
	private String prdDiv;			// 중분류
	private String prdSec;			// 소분류
	private String prdPrice;		// 상풍단가
	private String prdBrandName;	// 상품명
	private String prdModelName;	// 모델명 
	private String prdContDate;		// 계약기간
	private String prdDeliveryCost;	// 배송비
	private String prdInstCost;		// 설치비
	private String prdAsContent;	// AS내용
	private String delStat;			// 삭제여부 
	
	public ProductVo() {

	}

	public ProductVo(String prdCode, String prdName, String prdCat, String prdDiv, String prdSec, String prdPrice,
			String prdBrandName, String prdModelName, String prdContDate, String prdDeliveryCost, String prdInstCost,
			String prdAsContent, String delStat) {
		super();
		this.prdCode = prdCode;
		this.prdName = prdName;
		this.prdCat = prdCat;
		this.prdDiv = prdDiv;
		this.prdSec = prdSec;
		this.prdPrice = prdPrice;
		this.prdBrandName = prdBrandName;
		this.prdModelName = prdModelName;
		this.prdContDate = prdContDate;
		this.prdDeliveryCost = prdDeliveryCost;
		this.prdInstCost = prdInstCost;
		this.prdAsContent = prdAsContent;
		this.delStat = delStat;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public String getPrdCat() {
		return prdCat;
	}

	public void setPrdCat(String prdCat) {
		this.prdCat = prdCat;
	}

	public String getPrdDiv() {
		return prdDiv;
	}

	public void setPrdDiv(String prdDiv) {
		this.prdDiv = prdDiv;
	}

	public String getPrdSec() {
		return prdSec;
	}

	public void setPrdSec(String prdSec) {
		this.prdSec = prdSec;
	}

	public String getPrdPrice() {
		return prdPrice;
	}

	public void setPrdPrice(String prdPrice) {
		this.prdPrice = prdPrice;
	}

	public String getPrdBrandName() {
		return prdBrandName;
	}

	public void setPrdBrandName(String prdBrandName) {
		this.prdBrandName = prdBrandName;
	}

	public String getPrdModelName() {
		return prdModelName;
	}

	public void setPrdModelName(String prdModelName) {
		this.prdModelName = prdModelName;
	}

	public String getPrdContDate() {
		return prdContDate;
	}

	public void setPrdContDate(String prdContDate) {
		this.prdContDate = prdContDate;
	}

	public String getPrdDeliveryCost() {
		return prdDeliveryCost;
	}

	public void setPrdDeliveryCost(String prdDeliveryCost) {
		this.prdDeliveryCost = prdDeliveryCost;
	}

	public String getPrdInstCost() {
		return prdInstCost;
	}

	public void setPrdInstCost(String prdInstCost) {
		this.prdInstCost = prdInstCost;
	}

	public String getPrdAsContent() {
		return prdAsContent;
	}

	public void setPrdAsContent(String prdAsContent) {
		this.prdAsContent = prdAsContent;
	}

	public String getDelStat() {
		return delStat;
	}

	public void setDelStat(String delStat) {
		this.delStat = delStat;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((delStat == null) ? 0 : delStat.hashCode());
		result = prime * result + ((prdAsContent == null) ? 0 : prdAsContent.hashCode());
		result = prime * result + ((prdBrandName == null) ? 0 : prdBrandName.hashCode());
		result = prime * result + ((prdCat == null) ? 0 : prdCat.hashCode());
		result = prime * result + ((prdCode == null) ? 0 : prdCode.hashCode());
		result = prime * result + ((prdContDate == null) ? 0 : prdContDate.hashCode());
		result = prime * result + ((prdDeliveryCost == null) ? 0 : prdDeliveryCost.hashCode());
		result = prime * result + ((prdDiv == null) ? 0 : prdDiv.hashCode());
		result = prime * result + ((prdInstCost == null) ? 0 : prdInstCost.hashCode());
		result = prime * result + ((prdModelName == null) ? 0 : prdModelName.hashCode());
		result = prime * result + ((prdName == null) ? 0 : prdName.hashCode());
		result = prime * result + ((prdPrice == null) ? 0 : prdPrice.hashCode());
		result = prime * result + ((prdSec == null) ? 0 : prdSec.hashCode());
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
		ProductVo other = (ProductVo) obj;
		if (delStat == null) {
			if (other.delStat != null)
				return false;
		} else if (!delStat.equals(other.delStat))
			return false;
		if (prdAsContent == null) {
			if (other.prdAsContent != null)
				return false;
		} else if (!prdAsContent.equals(other.prdAsContent))
			return false;
		if (prdBrandName == null) {
			if (other.prdBrandName != null)
				return false;
		} else if (!prdBrandName.equals(other.prdBrandName))
			return false;
		if (prdCat == null) {
			if (other.prdCat != null)
				return false;
		} else if (!prdCat.equals(other.prdCat))
			return false;
		if (prdCode == null) {
			if (other.prdCode != null)
				return false;
		} else if (!prdCode.equals(other.prdCode))
			return false;
		if (prdContDate == null) {
			if (other.prdContDate != null)
				return false;
		} else if (!prdContDate.equals(other.prdContDate))
			return false;
		if (prdDeliveryCost == null) {
			if (other.prdDeliveryCost != null)
				return false;
		} else if (!prdDeliveryCost.equals(other.prdDeliveryCost))
			return false;
		if (prdDiv == null) {
			if (other.prdDiv != null)
				return false;
		} else if (!prdDiv.equals(other.prdDiv))
			return false;
		if (prdInstCost == null) {
			if (other.prdInstCost != null)
				return false;
		} else if (!prdInstCost.equals(other.prdInstCost))
			return false;
		if (prdModelName == null) {
			if (other.prdModelName != null)
				return false;
		} else if (!prdModelName.equals(other.prdModelName))
			return false;
		if (prdName == null) {
			if (other.prdName != null)
				return false;
		} else if (!prdName.equals(other.prdName))
			return false;
		if (prdPrice == null) {
			if (other.prdPrice != null)
				return false;
		} else if (!prdPrice.equals(other.prdPrice))
			return false;
		if (prdSec == null) {
			if (other.prdSec != null)
				return false;
		} else if (!prdSec.equals(other.prdSec))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ProductVo [prdCode=" + prdCode + ", prdName=" + prdName + ", prdCat=" + prdCat + ", prdDiv=" + prdDiv
				+ ", prdSec=" + prdSec + ", prdPrice=" + prdPrice + ", prdBrandName=" + prdBrandName + ", prdModelName="
				+ prdModelName + ", prdContDate=" + prdContDate + ", prdDeliveryCost=" + prdDeliveryCost
				+ ", prdInstCost=" + prdInstCost + ", prdAsContent=" + prdAsContent + ", delStat=" + delStat + "]";
	}
	
	
	
	

}
