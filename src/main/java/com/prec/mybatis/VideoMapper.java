package com.prec.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.prec.vDetail.MvDetailVo;
import com.prec.vDetail.VDetailAtt;
import com.prec.video.AdVo;
import com.prec.video.MVideoVo;
import com.prec.video.TagVo;
import com.prec.video.VideoVo;
import com.prec.video.rFindVo;

@Mapper
@Repository
public interface VideoMapper {


	/*상세보기 페이지 간단정보*/
	public List<VideoVo> videolist();
	
	/*상세보기 페이지 상세정보*/
	public List<VideoVo> vDetail();
	
	/*시즌 나눈거*/
	public List<VideoVo> Season(int serial);
	
	/*---------------주원--------------------*/
	public VideoVo video_view(int serial);
	public List<VideoVo> video_list(VideoVo vo);
	public int video_rFind_delete(int sno);
	public int keyword(rFindVo vo);
	public List<rFindVo> recent_keyword_select(rFindVo vo);
	public List<VideoVo> video_search(rFindVo findStr);
	public String before_keyword_insert(rFindVo vo); 
	public List<TagVo> tagSelect(TagVo vo);
	public List<VideoVo> tagCheck(rFindVo vo);
	/*---------------주원--------------------*/
	
	//================================================
	
	public VideoVo selectVideo(int sno);
	//<!-- ========================== 근 07-26 ============================ -->
	public List<AdVo> videoAd(AdVo aVo);
	public List<String> adActor();
	
	public VideoVo viewVideo(int serial);
	public List<VideoVo> mainVideo();
	public List<MvDetailVo> detailAtt(VideoVo vo);
	public MvDetailVo detailAttOne(int sno);
	
	//<!-- ========================== 근 07-27 ============================ -->
	public VDetailAtt videoPlay(int sno);
}
