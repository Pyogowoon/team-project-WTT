package com.prec.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.prec.bean.ManagerPage;
import com.prec.video.SeasonInfoVo;
import com.prec.video.VideoAtt;
import com.prec.video.MVideoVo;

@Mapper
public interface MVideoMapper {
	// 영상 시리즈 추가
	public int videoInsert(MVideoVo vo);
	public int videoAttInsert(List<VideoAtt> attList);
	public int seasonInfoInsert(List<SeasonInfoVo> infoList);
	
	public int lastSerial();
	//영상 시리즈 조회 (권한자)
	public int videoTotSize(ManagerPage page);
	public List<MVideoVo> videoSelect(ManagerPage page);
	public MVideoVo videoView(int serial);
	public VideoAtt videoAttView(int serial);
	public List<SeasonInfoVo> seasonInfoView(int serial);
	//영상 시리즈 수정 (권한자)
	public int videoModify(MVideoVo vo);
	public int videoAttDelete(int serial);
	public int seasonInfoModify(SeasonInfoVo vo);
	public int videoAttModify(VideoAtt att);
	public int videoAttInsertgong(int serial);
	public int seasonInfoInsertOne(SeasonInfoVo vo);
	//영상 시리즈 삭제 ( 권한자)
	public int seasonInfoDeleteOne(int sno);
	public int videoDelete(int serial);
	public int seasonInfoDelete(int serial);
	public int videoDeleteList(List<Integer> serialList);
	public int seasonInfoDeleteList(List<Integer> serialList);
	public int videoAttDeleteList(List<Integer> serialList);
	//
	public List<MVideoVo> findVideo(ManagerPage page);
}
