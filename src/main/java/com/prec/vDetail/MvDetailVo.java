package com.prec.vDetail;

import java.util.List;

public class MvDetailVo {
	int sno;
	int serial;
	int dSeason;
	int dEp;
	String playTime;
	String dEptitle;
	String dVid; //영상 파일이름
	String dPoster;
	String dpSysFile;
	String dpOriFile;
	String vOriFile;
	String vSysFile;
	String changePoster;
	String changeVid;
	String title;
	
	List<MvDetailVo> MvDetailList;
	List<MvDetailVo> MvDetailModifyList;
	
	public MvDetailVo() {}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
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

	public String getPlayTime() {
		return playTime;
	}

	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}

	public String getdEptitle() {
		return dEptitle;
	}

	public void setdEptitle(String dEptitle) {
		this.dEptitle = dEptitle;
	}

	public List<MvDetailVo> getMvDetailList() {
		return MvDetailList;
	}

	public void setMvDetailList(List<MvDetailVo> mvDetailList) {
		MvDetailList = mvDetailList;
	}

	public List<MvDetailVo> getMvDetailModifyList() {
		return MvDetailModifyList;
	}

	public void setMvDetailModifyList(List<MvDetailVo> mvDetailModifyList) {
		MvDetailModifyList = mvDetailModifyList;
	}

	public String getdVid() {
		return dVid;
	}

	public void setdVid(String dVid) {
		this.dVid = dVid;
	}

	public String getdPoster() {
		return dPoster;
	}

	public void setdPoster(String dPoster) {
		this.dPoster = dPoster;
	}

	public String getDpSysFile() {
		return dpSysFile;
	}

	public void setDpSysFile(String dpSysFile) {
		this.dpSysFile = dpSysFile;
	}

	public String getvSysFile() {
		return vSysFile;
	}

	public void setvSysFile(String vSysFile) {
		this.vSysFile = vSysFile;
	}

	public String getDpOriFile() {
		return dpOriFile;
	}

	public void setDpOriFile(String dpOriFile) {
		this.dpOriFile = dpOriFile;
	}

	public String getvOriFile() {
		return vOriFile;
	}

	public void setvOriFile(String vOriFile) {
		this.vOriFile = vOriFile;
	}

	public String getChangePoster() {
		return changePoster;
	}

	public void setChangePoster(String changePoster) {
		this.changePoster = changePoster;
	}

	public String getChangeVid() {
		return changeVid;
	}

	public void setChangeVid(String changeVid) {
		this.changeVid = changeVid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
