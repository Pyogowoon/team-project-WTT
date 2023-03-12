package com.prec.video;

import java.util.List;

public class SeasonInfoVo {
	int sno;
	int serial;
	int season;
	int epCnt;
	
	List<SeasonInfoVo> seasonInfoList;
	List<SeasonInfoVo> seasonModifyList;
	
	public SeasonInfoVo() {	}

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

	public int getSeason() {
		return season;
	}

	public void setSeason(int season) {
		this.season = season;
	}

	public int getEpCnt() {
		return epCnt;
	}

	public void setEpCnt(int epCnt) {
		this.epCnt = epCnt;
	}

	public List<SeasonInfoVo> getSeasonInfoList() {
		return seasonInfoList;
	}

	public void setSeasonInfoList(List<SeasonInfoVo> seasonInfoList) {
		this.seasonInfoList = seasonInfoList;
	}

	public List<SeasonInfoVo> getSeasonModifyList() {
		return seasonModifyList;
	}

	public void setSeasonModifyList(List<SeasonInfoVo> seasonModifyList) {
		this.seasonModifyList = seasonModifyList;
	}
	
	
}
