package com.prec.mypage;

public class FriendVo {
	int sno;
	String email;
	int lineNo;
	String fEmail;
	int flineNo;
	String fNick;
	String fName;
	
	@Override
	public String toString() {
		return "FriendVo [sno=" + sno + ", email=" + email + ", lineNo=" + lineNo + ", fEmail=" + fEmail + ", flineNo="
				+ flineNo + ", fNick=" + fNick + ", fName=" + fName + "]";
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
	public String getfEmail() {
		return fEmail;
	}
	public void setfEmail(String fEmail) {
		this.fEmail = fEmail;
	}
	public int getFlineNo() {
		return flineNo;
	}
	public void setFlineNo(int flineNo) {
		this.flineNo = flineNo;
	}
	public String getfNick() {
		return fNick;
	}
	public void setfNick(String fNick) {
		this.fNick = fNick;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	
	
}
