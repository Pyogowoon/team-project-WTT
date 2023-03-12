package com.prec.video;

public class AdVo {
	int sno;
	int dSno;
	int dSeason;
	int dEp;
	String title;
	String pCat;
	String pInfo;
	String pName;
	String pImg;
	String pUrl;
	String pTime;
	String pActor;
	String sysFile;
	
	
	
	
	public String getSysFile() {
		return sysFile;
	}
	public void setSysFile(String sysFile) {
		this.sysFile = sysFile;
	}
	@Override
	public String toString() {
		return "AdVo [sno=" + sno + ", dSno=" + dSno + ", dSeason=" + dSeason + ", dEp=" + dEp + ", title=" + title
				+ ", pCat=" + pCat + ", pInfo=" + pInfo + ", pName=" + pName + ", pImg=" + pImg + ", pUrl=" + pUrl
				+ ", pTime=" + pTime + ", pActor=" + pActor + "]";
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getdSno() {
		return dSno;
	}
	public void setdSno(int dSno) {
		this.dSno = dSno;
	}
	public int getdSeason() {
		return dSeason;
	}
	public void setdSeason(int dSeason) {
		this.dSeason = dSeason;
	}
	public int getdEp() {
		return dEp;
	}
	public void setdEp(int dEp) {
		this.dEp = dEp;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getpCat() {
		return pCat;
	}
	public void setpCat(String pCat) {
		this.pCat = pCat;
	}
	public String getpInfo() {
		return pInfo;
	}
	public void setpInfo(String pInfo) {
		this.pInfo = pInfo;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpUrl() {
		return pUrl;
	}
	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	public String getpTime() {
		return pTime;
	}
	public void setpTime(String pTime) {
		this.pTime = pTime;
	}
	public String getpActor() {
		return pActor;
	}
	public void setpActor(String pActor) {
		this.pActor = pActor;
	}
	
	
}
