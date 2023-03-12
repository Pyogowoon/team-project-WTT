package com.prec.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.prec.mypage.MSignoutService;
import com.prec.mypage.SignoutVo;

@RestController
public class ManageController {
	
	ModelAndView mv;
	
	@Autowired
	MSignoutService mss;
	
	/*-----------------------------manage--------------------------------*/

	@RequestMapping("manage_muny")
	public ModelAndView manage_muny(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/manage_muny.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("manage_muny_view")
	public ModelAndView manage_muny_view(HttpServletRequest req,String findStr,int num) {
		mv = new ModelAndView();
		mv.addObject("num", num);
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/manage_muny_view.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("manage_muny_delete")
	public ModelAndView manage_muny_delete(HttpServletRequest req,String findStr,int num) {
		mv = new ModelAndView();
		mv.addObject("num", num);
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/manage_muny.jsp");
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("manage_FAQ")
	public ModelAndView manage_FAQ(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/manage_FAQ.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("manage_FAQ_view")
	public ModelAndView manage_FAQ_view(HttpServletRequest req,String findStr,int sno) {
		mv = new ModelAndView();
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/manage_FAQ_view.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("manage_FAQ_update")
	public ModelAndView manage_FAQ_update(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/manage_FAQ_update.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("manage_FAQ_insert")
	public ModelAndView manage_FAQ_insert(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/manage_FAQ_insert.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("manage_FAQ_delete")
	public ModelAndView manage_FAQ_delete(HttpServletRequest req,String findStr,int num) {
		mv = new ModelAndView();
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/manage_FAQ.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	/*==============================================================*/
	
	@RequestMapping("manage_signout")
	public ModelAndView manage_signout() {
		mv = new ModelAndView();
		
		List<SignoutVo> list = mss.manage_signout();
		
		mv.addObject("soutlist", list);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/signout_reason.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("signout_delete")
	public ModelAndView signout_delete(SignoutVo sVo) {
		mv = new ModelAndView();
		
		mss.signout_delete(sVo.getSno());
		List<SignoutVo> list = mss.manage_signout();
		
		mv.addObject("soutlist", list);
		mv.addObject("inc", "manager/manager_main");
		mv.addObject("mInc", "../manage/signout_reason.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	
	
}
