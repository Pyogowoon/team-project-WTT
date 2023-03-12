package com.prec.video;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.prec.mybatis.VideoMapper;
import com.prec.vDetail.MvDetailVo;
import com.prec.vDetail.VDetailAtt;

@Service
public class VideoService{
	

	@Autowired
	VideoMapper Mapper;
	@Autowired
	DataSourceTransactionManager transaction;
	TransactionStatus status; 
	
	public VideoService() {}
	/*비디오 관련 DB*/
	public MvDetailVo videolist(int sno) {
		
		MvDetailVo vo= Mapper.detailAttOne(sno); 
		return vo;
	}
	/*비디오 상세부분 */
	public List<VideoVo> vDetail() {
		List<VideoVo> list = null;
		try {
			list = Mapper.vDetail();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	/*시즌 나눈부분*/
	public List<VideoVo> Season(int serial) {
		 List<VideoVo> sList = null;
		 try {
			sList = Mapper.Season(serial);
		 }catch(Exception ex) {
			 ex.printStackTrace();
		 }
		 
		return sList;
	}

	/*---------------영상목록 중 한개를 선택--------------*/
	public VideoVo video_view(int serial) {
		VideoVo vo = null;
		try {
			status = transaction.getTransaction(new DefaultTransactionDefinition());
			transaction.commit(status);
			
			vo = Mapper.video_view(serial);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	public VideoVo video_selectOne(int serial) {
		VideoVo vo = null;
		try {
			vo = Mapper.video_view(serial);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
/*-------------------------주원----------------------------------*/	
	/*---------------카테고리-주원----------------*/
	public List<VideoVo> video_list(VideoVo vo){
		List<VideoVo> list = Mapper.video_list(vo);
		return list;
	}
	/*---------------영상 검색-주원----------------*/
	public List<VideoVo> video_search(rFindVo vo){
		List<VideoVo> list = null;
		try {
			list = Mapper.video_search(vo);
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	/*---------------최근 검색어 삭제-주원-----------------*/
	public boolean video_rFind_delete(int sno) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		try {
			int cnt = Mapper.video_rFind_delete(sno);
			if(cnt>0) {
				transaction.commit(status);
				b=true;
			}else {
				transaction.rollback(status);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}
	/*---------------최근 검색어 추가-주원-----------------*/
	public int keyword(rFindVo vo) {
		int sno = 0;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		try {
			int cnt = Mapper.keyword(vo);
			if(cnt>0) {
				transaction.commit(status);
			}else {
				transaction.rollback(status);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return sno;
	}
	
	
	/*---------------최근 검색어 삭제-주원-----------------*/
	public List<rFindVo> recent_keyword_select(rFindVo vo){
		List<rFindVo> list = null;
		try {
			list = Mapper.recent_keyword_select(vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	/*---------------검색어 추가 전-주원-----------------*/
	public String before_keyword_insert(rFindVo vo) {
		String findStr = "";
		try {
			findStr = Mapper.before_keyword_insert(vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return findStr;
	}
	/*---------------태그 리스트-주원-----------------*/
	public List<TagVo> tagSelect(TagVo vo){
		List<TagVo> list = null;
		try {
			list = Mapper.tagSelect(vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	/*---------------라디오 버튼 태그 체크 -주원-----------------*/
	public List<VideoVo> tagCheck(rFindVo vo){
		List<VideoVo> list = null;
		
		try {
			list = Mapper.tagCheck(vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

/*-------------------------------------------------------------*/	
	
	//         7월 25일 성현
/*-------------------------------------------------------------*/	
	public VideoVo select_video(int serial) {
		VideoVo vo = Mapper.selectVideo(serial);
		
		return vo;
	}


	public List<AdVo> video_ad(AdVo aVo){
	      List<AdVo> list = Mapper.videoAd(aVo);
	      
	      return list;
    }
	   //<!-- ========================== 근 07-26 ============================ -->
	   
   public List<String> ad_actor(){
	   List<String> list = Mapper.adActor();
	   
	   return list;
   }

	public VideoVo viewVideo(int serial) {
		VideoVo vo = null;
		try {
			vo = Mapper.viewVideo(serial);
			 
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		return vo;
	
	}
	public List<VideoVo> mainVideo() {
		List<VideoVo> list = null;
		try {
			list = Mapper.mainVideo();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		return list;
		
	}
	public List<MvDetailVo> detailAtt(VideoVo vo){
		List<MvDetailVo> list = null;
		try {
			list = Mapper.detailAtt(vo);
					}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public VDetailAtt video_play(int sno) {
		VDetailAtt vDAtt = Mapper.videoPlay(sno);
				
		return vDAtt;
	}

}
