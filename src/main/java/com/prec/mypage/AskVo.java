package com.prec.mypage;

public class AskVo {
	int sno;
	String cTitle;
	String cYear;
	String cGenre;
	String con;
	String cId;
	int complete;
	
	@Override
	public String toString() {
		return "AskVo [sno=" + sno + ", cTitle=" + cTitle + ", cYear=" + cYear + ", cGenre=" + cGenre + ", con=" + con
				+ ", cId=" + cId + ", complete=" + complete + "]";
	}
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getcTitle() {
		return cTitle;
	}
	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}
	public String getcYear() {
		return cYear;
	}
	public void setcYear(String cYear) {
		this.cYear = cYear;
	}
	public String getcGenre() {
		return cGenre;
	}
	public void setcGenre(String cGenre) {
		this.cGenre = cGenre;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String coun) {
		this.con = coun;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	
	
}
