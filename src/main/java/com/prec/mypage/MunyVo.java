package com.prec.mypage;

public class MunyVo {
	int num;
	int sno;
	int rSno;
	String email;
	String uName;
	String manager;
	String mTitle;
	String mDoc;
	String nal;
	
	@Override
	public String toString() {
		return "MunyVo [num=" + num + ", sno=" + sno + ", rSno=" + rSno + ", email=" + email + ", uName=" + uName
				+ ", manager=" + manager + ", mTitle=" + mTitle + ", mDoc=" + mDoc + ", nal=" + nal + "]";
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getrSno() {
		return rSno;
	}
	public void setrSno(int rSno) {
		this.rSno = rSno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public String getmTitle() {
		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	public String getmDoc() {
		return mDoc;
	}
	public void setmDoc(String mDoc) {
		this.mDoc = mDoc;
	}
	public String getNal() {
		return nal;
	}
	public void setNal(String nal) {
		this.nal = nal;
	}
	
	
}
