package com.prec.video;

public class rFindVo {
	int sno;
	String email;
	int lineNo;
	String findStr;
	String[] tagNames;
	String tagName;
	
	
	

	public String[] getTagNames() {
		return tagNames;
	}
	public void setTagNames(String[] tagNames) {
		this.tagNames = tagNames;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLineNo() {
		return lineNo;
	}
	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	
}
