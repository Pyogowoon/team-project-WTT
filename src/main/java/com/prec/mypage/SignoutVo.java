package com.prec.mypage;

public class SignoutVo {
	int sno;
	String email;
	String reason;
	
	@Override
	public String toString() {
		return "SignoutVo [sno=" + sno + ", email=" + email + ", reason=" + reason + "]";
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
