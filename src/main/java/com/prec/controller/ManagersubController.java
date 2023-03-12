package com.prec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.prec.bean.ManagerPage;
import com.prec.managersub.ManagersubService;
import com.prec.user.UserVo;

@RestController
public class ManagersubController {
	
	@Autowired
	ManagersubService dao;
	
	ModelAndView mv;
	
	@RequestMapping("/m_user")
	public ModelAndView mUserList(ManagerPage page) {
		mv = new ModelAndView();
		
		if(page.getFindStr() == null) {
			page = new ManagerPage();
			page.setNowPage(1);
			page.setFindStr("");
		}
		
		List<UserVo> list = dao.mUserList(page);
		page = dao.getPage();
		
		mv.addObject("list", list);
		mv.addObject("page", page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "../managersub/m_user_list.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_user_view") // 24일 수정
	public ModelAndView mUserView(UserVo vo) {
		mv = new ModelAndView();
		
		UserVo rVo = dao.mUserView(vo.getEmail());
		 
		mv.addObject("vo", rVo);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "../managersub/m_user_view.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_user_insert")
	public ModelAndView mUserInsert() {
		mv = new ModelAndView();
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "../managersub/m_user_input.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_user_modify") // 24일 수정
	public ModelAndView mUserModify(UserVo vo, ManagerPage page) {
		mv = new ModelAndView();
		UserVo mVo = dao.mUserModify(vo.getEmail());
		
		mv.addObject("vo", mVo);
		mv.addObject("page", page);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "../managersub/m_user_modify.jsp");
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping("/m_user_modifyR") //24일 추가
	public ModelAndView mUserModifyR(UserVo vo, ManagerPage page) {
		mv = new ModelAndView();
		dao.mUserModifyR(vo, page);
		List<UserVo> list = dao.mUserList(page);
		
		page = dao.getPage();
		mv.addObject("list", list);
		mv.addObject("vo", vo);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "../managersub/m_user_list.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("m_user_inputR")
	public ModelAndView mUserInputR(UserVo vo, ManagerPage page) {
		mv = new ModelAndView();
		
		List<UserVo> list = dao.mUserList(page);
		dao.mUserInputR(vo);
		
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.addObject("vo", vo);
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "../managersub/m_user_list.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	//------------------------삭제 요망
	@RequestMapping("/test")
	public ModelAndView test() {
		mv=new ModelAndView();
		mv.addObject("inc","managersub/test.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	//--------------------신청관리
	@RequestMapping("/m_ask_list")
	public ModelAndView mAskList() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "../managersub/m_ask_list.jsp");
		mv.setViewName("index");
		return mv;
	}
	// 플레이어? ㅇㅋ
	@RequestMapping("/player")
	public ModelAndView wPlayer() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("inc","manager/manager_main");
		mv.addObject("mInc", "../player/player.jsp");
		mv.setViewName("index");
		return mv;
	}

}
