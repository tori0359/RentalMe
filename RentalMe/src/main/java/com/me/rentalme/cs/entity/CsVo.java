package com.me.rentalme.cs.entity;

import java.sql.Date;

public class CsVo {

	private int num;
	private String name;
	private String content;
	private String sub;
	private Date nalja;
	private String category;

	public CsVo() {
	}
	
	
	public CsVo(int num, String name, String content, String sub, Date nalja, String category) {
		super();
		this.num = num;
		this.name = name;
		this.content = content;
		this.sub = sub;
		this.nalja = nalja;
		this.category = category;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + num;
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
		if (num != other.num)
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
		return "CsVo [num=" + num + ", name=" + name + ", content=" + content + ", sub=" + sub + ", nalja=" + nalja
				+ ", category=" + category + "]";
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public Date getNalja() {
		return nalja;
	}
	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}
	
	
	
	
	
	
	
	
	
	
	
}
