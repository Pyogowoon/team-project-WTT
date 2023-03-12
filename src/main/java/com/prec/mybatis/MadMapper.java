package com.prec.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.prec.ad.AdAtt;
import com.prec.ad.MadVo;
import com.prec.bean.ManagerPage;

@Mapper
public interface MadMapper {
	//조회
	public int totSize(ManagerPage page);
	public List<MadVo> adSelect(ManagerPage page);
	public List<MadVo> adView(int dSno);
	
	//저장
	public int adInsert(MadVo vo);
	public int getSno();
	public int adAttInsert(List<AdAtt> att);
	public int adFileNameModify(AdAtt att);
	
	//수정
	public int adModify(MadVo vo);
	public int adAttModify(AdAtt att);
	
	//삭제관련
	public AdAtt adAttView(int aSno);
	public int adDelete(List<Integer>  chklist);
	public int adAttDelete(List<Integer> chklist);
	public int adDeleteAll(List<Integer> chklist);
	public int adAttDeleteAll(List<Integer> chklist);
	
}
