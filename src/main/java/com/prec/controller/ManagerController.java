package com.prec.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.prec.ad.AdAtt;
import com.prec.ad.MadService;
import com.prec.ad.MadVo;
import com.prec.bean.ManagerPage;
import com.prec.fileupload.FileUploadController;
import com.prec.vDetail.MvDetailService;
import com.prec.vDetail.MvDetailVo;
import com.prec.vDetail.VDetailAtt;
import com.prec.video.SeasonInfoVo;
import com.prec.video.VideoAtt;
import com.prec.video.MVideoService;
import com.prec.video.MVideoVo;

@RestController
public class ManagerController { 
	ModelAndView mv;
	
	@Autowired
	MVideoService videoDao;
	@Autowired
	MvDetailService detailDao;
	@Autowired
	MadService adDao;
	@Autowired
	FileUploadController fc;
	
	public ManagerController() {
		//mv = new ModelAndView();
	}
	
	//관리자 모드 들어가기
	@RequestMapping("/manage")
	public ModelAndView manager() {
		mv = new ModelAndView();
		mv.addObject("inc","manager/manager_main");
		mv.setViewName("index");
		return mv;
	}
	//상세보기 영상정보
	@RequestMapping("/m_video_view")
	public ModelAndView mVideoView(int serial,ManagerPage page) {
		mv = new ModelAndView();
		
		MVideoVo rVo = videoDao.videoView(serial);
		VideoAtt vAtt = videoDao.getvAtt();
		List<SeasonInfoVo> infoList = videoDao.getInfoList();
		mv.addObject("vo",rVo);
		mv.addObject("vAtt",vAtt);
		mv.addObject("infoList",infoList);
		mv.addObject("page",page);
		
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc","m_video_view.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_video_modify")
	public ModelAndView mVideoModify(int serial, ManagerPage page) {
		mv = new ModelAndView();
		
		MVideoVo rVo = videoDao.videoView(serial);
		VideoAtt vAtt = videoDao.getvAtt();
		List<SeasonInfoVo> infoList = videoDao.getInfoList();
		mv.addObject("vo",rVo);
		mv.addObject("vAtt",vAtt);
		mv.addObject("infoList",infoList);
		mv.addObject("page",page);
		
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc","m_video_modify.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_video_modifyR")
	public int mVideoModifyR(MVideoVo vo,VideoAtt vAtt,String posterDelete, String teaserDelete) {
		int serial=0;
		// 기존 등록 파일 삭제
		if(vAtt.getpSysFile() == null) vAtt.setpSysFile("");
		if(vAtt.gettSysFile() == null) vAtt.settSysFile("");
		if(!vAtt.getpSysFile().equals(posterDelete)) {
			File pf = new File(FileUploadController.posterUploadPath+posterDelete);
			if(pf.exists()) pf.delete();
		}
		if(!vAtt.gettSysFile().equals(teaserDelete)) {
			File tf = new File(FileUploadController.teaserUploadPath+teaserDelete);
			if(tf.exists()) tf.delete();
		}
		
		videoDao.videoModify(vo);
		serial = vo.getSerial();
		
		return serial;
	}
	@RequestMapping("/video_fileUpload_mo")
	public void videoFileUploadMo(@RequestParam(name="poster",required=false) List<MultipartFile> poster,
						@RequestParam(name="teaser",required=false) List<MultipartFile> teaser, int sno) {
		List<VideoAtt> attList = null;
		
		if(poster !=null && teaser == null) {
			attList = fc.posterModify(poster, sno);
			if(attList.size()>0) videoDao.videoAttModify(attList); 
		}else if(poster ==null && teaser != null) {
			attList = fc.teaserModify(teaser, sno);
			if(attList.size()>0) videoDao.videoAttModify(attList); 
		}else if(poster !=null && teaser != null){
			attList = fc.videoUpload(poster, teaser, sno);
			videoDao.videoAttDelete(sno);
			if(attList.size()>0) videoDao.videoAttInsert(attList,sno); 
		}
	}
	@RequestMapping("/seasonInfo_modifyR")
	public ModelAndView seasonInfoModifyR(ManagerPage page,SeasonInfoVo vo) {
		mv = new ModelAndView();
		int serial = vo.getSerial();
		if(vo.getSeasonInfoList() != null) {
			List<SeasonInfoVo> seasonInfoList = vo.getSeasonInfoList();
			if(seasonInfoList.size()>0) {
				for(SeasonInfoVo rVo : seasonInfoList) { 
					rVo.setSerial(serial);
				}
				videoDao.seasonInfoInsert(seasonInfoList); 
			}
		}
		List<SeasonInfoVo> seasonModifyList = vo.getSeasonModifyList();
		if(seasonModifyList != null) {
			if(seasonModifyList.size()>0) {
				videoDao.seasonInfoModify(seasonModifyList);
			}
		}
		List<MVideoVo> list = videoDao.videoSelect(page);
		page = videoDao.getPage();
		mv.addObject("list",list);
		mv.addObject("page",page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_video_list.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/seasonInfo_modify_one")
	public void seasonInfoModifyOne(SeasonInfoVo vo) {
		videoDao.seasonInfoModifyOne(vo);
	}
	@RequestMapping("/seasonInfo_insert_one")
	public void seasonInfoInsertOne(SeasonInfoVo vo) {
		videoDao.seasonInfoInsertOne(vo);
	}
	//영상정보 관리-----------------
	@RequestMapping("/m_video")
	public ModelAndView mVideoList(ManagerPage page) {
		mv = new ModelAndView();
		if(page.getFindStr() == null) {
			page = new ManagerPage();
			page.setFindStr("");
			page.setNowPage(1);
		}
		List<MVideoVo> list = videoDao.videoSelect(page);
		page = videoDao.getPage();
		mv.addObject("list",list);
		mv.addObject("page",page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_video_list.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_video_insert")
	public ModelAndView mVideoInsert(ManagerPage page) {
		mv = new ModelAndView();
		
		mv.addObject("page", page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_video_input.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_video_insertR")
	public int mVideoInsertR(MVideoVo vo) {
		
		int sno = videoDao.videoInsert(vo);
		return sno;
	}
	@RequestMapping("/video_fileUpload")
	public void videoFileUpload(@RequestParam(name="poster",required=false) List<MultipartFile> poster,
						@RequestParam(name="teaser",required=false) List<MultipartFile> teaser, int sno) {
		List<VideoAtt> attList = fc.videoUpload(poster, teaser, sno);
		videoDao.videoAttInsert(attList, sno); 
	}
	@RequestMapping("/seasonInfo_insert")
	public ModelAndView seasionInfoInsert(SeasonInfoVo vo, ManagerPage page) {
		mv = new ModelAndView();
		int serial = videoDao.lastSerial();
		if(vo.getSeasonInfoList() != null) {
			List<SeasonInfoVo> seasonInfoList = vo.getSeasonInfoList();
			if(seasonInfoList.size()>0) {
				for(SeasonInfoVo rVo : seasonInfoList) { 
					rVo.setSerial(serial);
				}
				videoDao.seasonInfoInsert(seasonInfoList); 
			}
		}
		List<MVideoVo> list = videoDao.videoSelect(page);
		page = videoDao.getPage();
		mv.addObject("list",list);
		mv.addObject("page",page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_video_list.jsp");
		mv.setViewName("index");
		return mv;
	}
	//영상 시리즈 정보 삭제 관련-----------------------
	@RequestMapping("seasonInfo_delete_one")
	public void seasonInfoDeleteOne(int sno) {
		videoDao.seasonInfoDeleteOne(sno);
	}
	//페이지 단일 삭제
	@RequestMapping("/m_video_deleteOne")
	public boolean mVideoDeleteOne(int serial) {
		boolean b = videoDao.mVideoDeleteOne(serial);
		return b;
	}
	@RequestMapping("/m_video_deleteAll")
	public boolean mVideoDeleteAll(@RequestParam(name="chklist") List<Integer> chklist) {
		boolean b = videoDao.mVideoDeleteAll(chklist);
		return b;
	}
	//영상 세부정보 관리--------------------------------------------
	@RequestMapping("/m_detail")
	public ModelAndView mDetailList(ManagerPage page) {
		mv = new ModelAndView();
		if(page.getFindStr() == null) {
			page = new ManagerPage();
			page.setFindStr("");
			page.setNowPage(1);
		}
		List<MvDetailVo> list = detailDao.vDetailSelect(page);
		page = detailDao.getPage();
		mv.addObject("list",list);
		mv.addObject("page",page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_detail_list.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_detail_findVideo")
	public ModelAndView mDetailFindVideo() {
		mv = new ModelAndView();
		
		mv.setViewName("manager/m_detail_video_search");
		return mv;
	}
	@RequestMapping("/m_detail_findVideoR")
	public ModelAndView mDetailFindVideoR(ManagerPage page) {
		mv= new ModelAndView();
		List<MVideoVo> list = videoDao.findVideo(page);
		
		mv.addObject("page", page);
		mv.addObject("list",list);
		mv.setViewName("manager/m_detail_video_search");
		return mv;
	}
	@RequestMapping("/find_videoAtt")
	public ModelAndView findVideoAtt(int serial,ManagerPage page) {
		mv = new ModelAndView();
		
		MVideoVo vo = videoDao.videoView(serial);
		String pSysFile = videoDao.findVideoAtt(serial);
		List<MvDetailVo> list = detailDao.detailView(serial);
		
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.addObject("mainP", pSysFile);
		mv.addObject("page",page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_detail_input.jsp");
		mv.setViewName("index");
		return mv;		
	}
	@RequestMapping("/m_detail_insert")
	public ModelAndView mDetailInsert(ManagerPage page) {
		mv = new ModelAndView();
		
		mv.addObject("page",page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_detail_input.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("m_detail_insertR")
	public List<Integer> mDetailInsertR(MvDetailVo vo){
		List<Integer> sList = null;
		
		int serial =vo.getSerial();
		List<MvDetailVo> detailList = vo.getMvDetailList();
		if(detailList != null) {
			for(MvDetailVo rvo : detailList) {
				rvo.setSerial(serial);
			}
			sList = detailDao.vDetailInsert(detailList);
		}
		
		
		return sList;
	}

	@RequestMapping("m_detail_fileUpload")
	public void mDetailFileUpload(@RequestParam(name="sdPoster",required=false) List<MultipartFile>[] poster,
			@RequestParam(name="sdVid",required=false) List<MultipartFile>[] vid, @RequestParam(name="sSno",required=false) Integer[] sno,
			@RequestParam(name="mdPoster", required=false) List<MultipartFile>[] mdPoster,	@RequestParam(name="mdVid", required=false) List<MultipartFile>[] mdVid,
			MvDetailVo vo) {
		List<VDetailAtt> attList = fc.detailUpload(poster, vid, sno); 
		if(attList != null) {
			detailDao.detailAttInsert(attList);
		}
		List<MvDetailVo> detailModifyList = vo.getMvDetailModifyList();
		if(detailModifyList != null) {
			detailDao.vDetailModify(detailModifyList);
			for(MvDetailVo mVo : detailModifyList) {
				if(!mVo.getChangePoster().equals(mVo.getDpOriFile())&& !mVo.getDpSysFile().equals("") ) {
					
					File pf = new File(FileUploadController.posterUploadPath+mVo.getDpSysFile());
					if(pf.exists()) pf.delete();
				}
				if(!mVo.getChangeVid().equals(mVo.getvOriFile()) && !mVo.getvSysFile().equals("")) {
					File vf = new File(FileUploadController.teaserUploadPath+mVo.getvSysFile());
					if(vf.exists()) vf.delete();
				}
			}
		}
		
		List<VDetailAtt> mAttList = fc.detailModify(mdPoster, mdVid, detailModifyList);	

		if(mAttList != null) {
			detailDao.vDetailModifyFileName(mAttList); 
		}

	}
	@RequestMapping("/m_detail_delete")
	public void mDetailDelete(@RequestParam(name="chklist") List<Integer> chklist) {
		
		for(int s : chklist) {
			VDetailAtt att = detailDao.vDetailAttView(s);
			if(att != null) {
				if( att.getDpSysFile()!=null&& !att.getDpSysFile().equals("") ) {
					File pf = new File(FileUploadController.posterUploadPath+att.getDpSysFile());
					if(pf.exists()) pf.delete();
				}
				if( att.getvSysFile()!=null&& !att.getvSysFile().equals("")) {
					File vf = new File(FileUploadController.teaserUploadPath+att.getvSysFile());
					if(vf.exists()) vf.delete();
				}
			}
		}
		detailDao.detailDelete(chklist);
	}
	@RequestMapping("/m_detail_deleteAll")
	public boolean mDetailDeleteAll(@RequestParam(name="chklist") List<Integer> chklist) {
		boolean b = false;
		for(int s : chklist) {
			VDetailAtt att = detailDao.vDetailAttView(s);
			if(att !=null) {
				if( att.getDpSysFile()!=null&& !att.getDpSysFile().equals("") ) {
					File pf = new File(FileUploadController.posterUploadPath+att.getDpSysFile());
					if(pf.exists()) pf.delete();
				}
				if( att.getvSysFile()!=null&& !att.getvSysFile().equals("")) {
					File vf = new File(FileUploadController.teaserUploadPath+att.getvSysFile());
					if(vf.exists()) vf.delete();
				}
			}
		}
		b = detailDao.detailDeleteAll(chklist);
		return b;
	}
	@RequestMapping("/m_detail_view")
	public ModelAndView mDetailView() {
		mv = new ModelAndView();
		
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_detail_view.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_detail_modify")
	public ModelAndView mDetailModify() {
		mv = new ModelAndView();
	
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_detail_modify.jsp");
		mv.setViewName("index");
		return mv;
	}
	//영상 광고 관리-------------------------------------------
	@RequestMapping("/m_ad")
	public ModelAndView mAdList(ManagerPage page) {
		mv = new ModelAndView();
		if(page.getFindStr() == null) {
			page = new ManagerPage();
			page.setFindStr("");
			page.setNowPage(1);
		}
		if(page.getListAlign()==null) page.setListAlign("sno asc");
		List<MadVo> list = adDao.adSelect(page);
		page = adDao.getPage();
		mv.addObject("list",list);
		mv.addObject("page",page);
		
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_ad_list.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_ad_findDetail")
	public ModelAndView mAdFindDetila() {
		mv = new ModelAndView();
		
		
		mv.setViewName("manager/m_ad_detail_search");
		return mv;
	}
	@RequestMapping("/m_ad_findDetailR")
	public ModelAndView mAdFindDetailR(ManagerPage page) {
		mv= new ModelAndView();
		List<MvDetailVo> list = detailDao.detailFind(page);
		
		mv.addObject("page", page);
		mv.addObject("list",list);
		mv.setViewName("manager/m_ad_detail_search");
		return mv;
	}
	@RequestMapping("/find_detail")
	public ModelAndView findDetail(int dSno,ManagerPage page) {
		mv = new ModelAndView();
		if(page.getFindStr() == null) {
			page = new ManagerPage();
			page.setFindStr("");
			page.setNowPage(1);
		}
		MvDetailVo vo = detailDao.detailViewOne(dSno);
		List<MadVo> list = adDao.adView(dSno);
		
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.addObject("page",page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_ad_input.jsp");
		mv.setViewName("index");
		return mv;		
	}
	@RequestMapping("/m_ad_insert")
	public ModelAndView mAdInsert(ManagerPage page) {
		mv = new ModelAndView();
		mv.addObject("page",page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_ad_input.jsp");
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("m_ad_insertR")
	public List<Integer> mAdInsertR(MadVo vo){
		List<Integer> sList = null;
		
		int dSno =vo.getdSno();
		int dSeason = vo.getdSeason();
		int dEp = vo.getdEp();
		String title = vo.getTitle();
		List<MadVo> adList = vo.getMadList();
		if(adList != null) {
			for(MadVo rvo : adList) {
				rvo.setdSno(dSno);
				rvo.setdSeason(dSeason);
				rvo.setdEp(dEp); 
				rvo.setTitle(title);
			}
			sList = adDao.adInsert(adList);
		}
		
		return sList;
	}
	
	@RequestMapping("m_ad_fileUpload")
	public String mAdFileUpload(@RequestParam(name="spImg",required=false) List<MultipartFile>[] spImg,
			@RequestParam(name="aSno",required=false) Integer[] aSno,@RequestParam(name="mopImg",required=false) List<MultipartFile>[] moImg, 
			MadVo vo) {
		String msg ="chk";
		List<AdAtt> attList = fc.adUpload(spImg, aSno);  
		if(attList != null) {
			adDao.adAttInsert(attList);
		}
		List<AdAtt> mAttList = null;
		List<MadVo> adModifyList = vo.getMadModifyList();
		if(adModifyList != null) {
			adDao.adModify(adModifyList);
			for(MadVo mVo : adModifyList) {
				if(!mVo.getChangeImg().equals(mVo.getOriFile())) {
					if(!mVo.getSysFile().equals("")) {
						File pf = new File(FileUploadController.pImgUploadPath+mVo.getSysFile());
						if(pf.exists()) pf.delete();
					}
					mAttList = fc.adModify(moImg,adModifyList);	
				}
			}
		}
		if(mAttList != null) {
			adDao.adModifyFileName(mAttList); 
		}
		return msg;
	}
	
	@RequestMapping("/m_ad_view")
	public ModelAndView mAdView() {
		mv = new ModelAndView();
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_ad_view.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_ad_modify")
	public ModelAndView mAdModify() {
		mv = new ModelAndView();
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "m_ad_modify.jsp");
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("/m_ad_delete")
	public void madDelete(@RequestParam(name="hengNo")  List<Integer> chklist) {
		
		for(int s : chklist) {
			AdAtt att = adDao.adAttView(s);
			if(att!=null) {
				if( att.getSysFile()!=null&& !att.getSysFile().equals("") ) {
					File pf = new File(FileUploadController.pImgUploadPath+att.getSysFile());
					if(pf.exists()) pf.delete();
				}
			}
		}
		adDao.adDelete(chklist);
		
	}
	@RequestMapping("/m_ad_deleteAll")
	public boolean mAdDeleteAll(@RequestParam(name="chklist") List<Integer> chklist) {
		boolean b = false;
		for(int s : chklist) {
			AdAtt att = adDao.adAttView(s);
			if(att !=null) {
				if( att.getSysFile()!=null&& !att.getSysFile().equals("") ) {
					File pf = new File(FileUploadController.pImgUploadPath+att.getSysFile());
					if(pf.exists()) pf.delete();
				}
			}
		}
		b = adDao.adDeleteAll(chklist); 
		return b;
	}
	
}
