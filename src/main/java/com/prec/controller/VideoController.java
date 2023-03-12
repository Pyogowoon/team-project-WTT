package com.prec.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.prec.video.VideoService;
import com.prec.video.VideoVo;
import com.prec.video.rFindVo;
import com.prec.vDetail.VDetailAtt;
import com.prec.video.AdVo;
import com.prec.video.MVideoVo;
import com.prec.video.TagVo;


@RestController
public class VideoController {
	
	@Autowired
	VideoService dao;
	
	ModelAndView mv;
 
	/*------------------상세보기-------------------*/
	@RequestMapping("video_view")
	public ModelAndView video_view(int serial) {
		mv = new ModelAndView();
		VideoVo vo = dao.video_selectOne(serial); 
		
		mv.addObject("serial", serial);
		mv.addObject("vo", vo);
		mv.addObject("inc","video/video_view");
		mv.setViewName("index");
		return mv;
	}
	
	/*-----------------해당 카테고리 리스트22일 추가-주원----------------*/
	@RequestMapping("video_list")
	public ModelAndView video_list(VideoVo vo) {
		mv = new ModelAndView();
		
		List<VideoVo> list = dao.video_list(vo);
		mv.addObject("list", list);
		mv.addObject("vo", vo);
		mv.addObject("inc","video/video_list");
		mv.setViewName("index");
		return mv;
	}
	/*-------------영상 검색 및 최근검색어 입력-25일 수정------------*/
	@RequestMapping("video_search")
	public ModelAndView video_search(HttpServletRequest req, rFindVo vo, TagVo tvo) {
		mv = new ModelAndView();
		HttpSession session = req.getSession();
		
		String email = (String)session.getAttribute("email");
		vo.setEmail(email);
		String beforeInsert = dao.before_keyword_insert(vo);
		if(beforeInsert == null) {
			beforeInsert = "";
		}
		if( !beforeInsert.equals(vo.getFindStr()) && !vo.getFindStr().equals("")) {
			dao.keyword(vo);
		}
		
		String[] tag = vo.getTagNames();
		if(tag == null) {
			tag = new String[0];
			vo.setTagNames(tag);
		}
		List<rFindVo> rklist = dao.recent_keyword_select(vo);
		List<VideoVo> list = dao.video_search(vo);
		List<TagVo> tlist = dao.tagSelect(tvo);
		mv.addObject("tlist", tlist);
		mv.addObject("rklist", rklist);
		mv.addObject("video_list", list);
		mv.addObject("vo", vo);
		mv.addObject("inc","video/video_search");
		mv.setViewName("index");
		return mv;
	}
	/*-----------------태그 체크-주원-25일 수정---------------*/	
	@RequestMapping("tagCheck")
	public ModelAndView tagCheck(rFindVo vo, TagVo tvo) {
		mv = new ModelAndView();
		
		List<rFindVo> rklist = dao.recent_keyword_select(vo);
		List<VideoVo> list = dao.tagCheck(vo);
		List<TagVo> tlist = dao.tagSelect(tvo);
		List<VideoVo> rlist = dao.tagCheck(vo);
		
		mv.addObject("rklist", rklist);
		mv.addObject("video_list", list);
		mv.addObject("tlist", tlist);
		mv.addObject("rlist", rlist);
		mv.addObject("vo", vo);
		mv.addObject("inc","video/video_search");
		mv.setViewName("index");
		return mv;
	}

	/*------------------해당 검색어 결과로 이동-------------------*/
	@RequestMapping("keyword")
	public ModelAndView keyword(HttpServletRequest req, rFindVo vo) {
		mv = new ModelAndView();
		
		
		mv.addObject("vo", vo);
		mv.addObject("inc", "video/video_search");
		mv.setViewName("index");
		return mv;
	}
	/*------------------최근 검색어 삭제-------------------*/
	@RequestMapping("video_rFind_delete")
	public boolean video_rFind_delete(int sno) {
		boolean b = dao.video_rFind_delete(sno); 
		return b;
	}
	
	/*-----------------------main-재생페이지-----------------------------*/
	
	@RequestMapping("video_play")
	public ModelAndView video_play(HttpServletRequest req,int sno) {
		mv = new ModelAndView();
		
		VDetailAtt vDAtt = dao.video_play(sno);
		
		System.out.println("vd : "+vDAtt.getvSysFile());
		
		mv.addObject("vSno", sno);
		mv.addObject("vDAtt", vDAtt);
		mv.setViewName("video/video_play");
		return mv;
	}
	/*------------------------------------------------------------*/

	   @RequestMapping("video_ad")
	   public ModelAndView vide_ad(AdVo aVo){
	      mv = new ModelAndView();
	      
	      //<!-- ========================== 근 07-26 ============================ -->
	      List<String> actlist = dao.ad_actor();
	      List<AdVo> vlist = dao.video_ad(aVo);
	      
	      mv.addObject("pCat",aVo.getpCat());
	      mv.addObject("actlist", actlist);
	      mv.addObject("vadlist", vlist);
	      mv.setViewName("video/video_ad");
	      return mv;
	   }




}
