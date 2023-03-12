package com.prec.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.prec.index.IndexService;
import com.prec.vDetail.MvDetailVo;
import com.prec.video.VideoService;
import com.prec.video.VideoVo;

import ch.qos.logback.core.net.SyslogOutputStream;

@RestController
public class IndexController {
	
	@Autowired
	IndexService is;
	ModelAndView mv;
	
	@Autowired
	VideoService dao;
	
	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest req) {
		boolean b = false;
		List<VideoVo> vList= dao.mainVideo();

		mv = new ModelAndView();
		b = is.check(req);
		if(b) {
			
			mv.addObject("VideoVo", vList);
			mv.addObject("inc", "main");
		}else {
			mv.addObject("inc", null);
		}
		mv.setViewName("index");
		return mv;
	}
	
	
	@RequestMapping("mypage")
	public ModelAndView mypage(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/mypage");
		mv.setViewName("index");
		return mv;
	}


	/* ------------------포스터나 재생하기 누르면 나오는 상세 ------------------*/
	@RequestMapping("/video_detail")
	public ModelAndView video_detail(Integer sno) {
		ModelAndView mv = new ModelAndView();
			System.out.println(sno);
			MvDetailVo vo = dao.videolist(sno); 
			mv.addObject("vo", vo);
			mv.setViewName("video/video_detail");
			
		return mv;
		
		}
		
		//7월 25일
		@RequestMapping("/main_load")
		public ModelAndView main_load(@RequestParam(name="serial") Integer serial, Integer season) {
			ModelAndView mv = new ModelAndView();
			if(season == null) {
				season = 0;
			}
		
			VideoVo vo= dao.viewVideo(serial);
			VideoVo sVo = new VideoVo();
			
			sVo.setSerial(serial);
			sVo.setdSeason(season);
			List<MvDetailVo> dList= dao.detailAtt(sVo);
			mv.addObject("vo" ,vo);
			mv.addObject("dList" ,dList);
		
			
			//VideoVo vo = dao.select_video(serial);
			List<VideoVo> sList= dao.Season(serial);
			mv.addObject("seasonNo",season);
			mv.addObject("sList", sList);
			mv.addObject("dList",dList);
			//mv.addObject("VideoVo", vo);
			mv.setViewName("video/video_gt");
			return mv;
			
		}
		// 7월 27일
		@RequestMapping("main")
		public ModelAndView main(VideoVo Vo) {
			ModelAndView mv = new ModelAndView();
			List<VideoVo> vList= dao.mainVideo();
		
		
		
			mv.addObject("VideoVo", vList);
			mv.addObject("inc", "main");
		
			
			mv.setViewName("index");
			
			return mv;
			
		}


	

	

}
