package com.prec.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.prec.bean.ManagerPage;
import com.prec.vDetail.MvDetailVo;
import com.prec.vDetail.VDetailAtt;

@Mapper
public interface MvDetailMapper {
	//조회
	public int totSize(ManagerPage page);
	public List<MvDetailVo> vDetailSelect(ManagerPage page);
	public List<MvDetailVo> detailView(int serial);
	//저장
	public int vDetailInsert(MvDetailVo vo);
	public int getSno();
	public int detailAttInsert(List<VDetailAtt> att);
	public int detailAttInsertgong(int vSno);
	public int detailFileNameModify(VDetailAtt att);
	
	//수정
	public int detailModify(MvDetailVo vo);
	public int detailAttModify(VDetailAtt att);
	
	//삭제
	public VDetailAtt detailAttView(int vSno);
	public int detailDelete(List<Integer> chklist);
	public int detailAttDelete(List<Integer> chklist);
	public int detailDeleteAll(List<Integer> chklist);
	public int detailAttDeleteAll(List<Integer> chklist);
	// 하부조회
	public List<MvDetailVo> detailFind(ManagerPage page);
	public MvDetailVo detailViewOne(int sno);
}
