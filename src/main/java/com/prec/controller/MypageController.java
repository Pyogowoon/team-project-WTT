package com.prec.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.prec.faq.FAQVo;
import com.prec.mypage.AskVo;
import com.prec.mypage.ConsumerVo;
import com.prec.mypage.FriendVo;
import com.prec.mypage.MunyVo;
import com.prec.mypage.MypagePage;
import com.prec.mypage.MypageService;

@RestController
public class MypageController {
	
	@Autowired
	MypageService ms;
	ModelAndView mv;
	

	@RequestMapping("user_modify")
	public ModelAndView user_modify(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/user_modify");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("user_modifyR")
	public ModelAndView user_modifyR(HttpServletRequest req,String findStr,
			ConsumerVo vo) {
		mv = new ModelAndView();
		
		ms.user_modifyR(req,vo);
		mv.addObject("findStr",findStr);
		mv.addObject("inc","mypage/mypage");
		mv.setViewName("index");
		return mv;
	}
	
	/*============================= mylist =============================*/
	
	@RequestMapping("mylist")
	public ModelAndView mylist(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		List<ConsumerVo> wlist = null;
		List<ConsumerVo> vlist = null;
		try {
			wlist = ms.mylist_wishlist(req);
			vlist = ms.mylist_vaclist(req);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		mv.addObject("wishlist", wlist);
		mv.addObject("vaclist", vlist);
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/mylist");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("mylist_delete")
	public ModelAndView mylist_delete(HttpServletRequest req,String findStr,int sno) {
		mv = new ModelAndView();
		List<ConsumerVo> wlist = null;
		List<ConsumerVo> vlist = null;
		try {
			ms.mylist_delete(sno);
			wlist = ms.mylist_wishlist(req);
			vlist = ms.mylist_vaclist(req);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		mv.addObject("wishlist", wlist);
		mv.addObject("vaclist", vlist);
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/mylist");
		mv.setViewName("index");
		return mv;
	}
	
	/*============================= friendlist =============================*/
	
	@RequestMapping("friendlist")
	public ModelAndView friendlist(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		List<FriendVo> list = null;
		
		list = ms.friendlist(req);
		mv.addObject("flist", list);
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/friendlist");
		mv.setViewName("index");
		return mv;
	}
	
	
	@RequestMapping("friend_addR")
	public ModelAndView friend_addR(HttpServletRequest req,String findStr,FriendVo fVo) {
		mv = new ModelAndView();
		List<FriendVo> list = null;
		
		ms.friend_insertR(req,fVo);
		list = ms.friendlist(req);
		mv.addObject("flist", list);
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/friendlist");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("friend_nickR")
	public ModelAndView friend_nickR(HttpServletRequest req,String findStr,FriendVo fVo) {
		mv = new ModelAndView();
		List<FriendVo> list = null;
		
		ms.friend_nickR(req,fVo);
		list = ms.friendlist(req);
		mv.addObject("flist", list);
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/friendlist");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("friend_delete")
	public ModelAndView friend_delete(HttpServletRequest req,String findStr,FriendVo fVo) {
		mv = new ModelAndView();
		List<FriendVo> list = null;
		
		ms.friend_delete(req,fVo);
		list = ms.friendlist(req);
		mv.addObject("flist", list);
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/friendlist");
		mv.setViewName("index");
		return mv;
	}
	
	/*============================= FAQ =============================*/
	
	@RequestMapping("FAQ")
	public ModelAndView FAQ(MypagePage page) {
		mv = new ModelAndView();
		
		if(page == null) {
			page = new MypagePage();
		}
		page.setNowPage(1);
		
		List<String> fCatlist = ms.FAQ_cat();
		page.setfCat("");
		List<FAQVo> fSublist = ms.FAQ_sub(page);
		page = ms.getPage();
		
		mv.addObject("fCatlist", fCatlist);
		mv.addObject("fSublist", fSublist);
		mv.addObject("MypagePage", page);
		mv.addObject("FAQinc",1);
		mv.addObject("inc", "mypage/FAQ");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("FAQ_catclick")
	public ModelAndView FAQ_catclick(MypagePage page) {
		mv = new ModelAndView();
		
		List<String> fCatlist = ms.FAQ_cat();
		List<FAQVo> fSublist = ms.FAQ_sub(page);
		page = ms.getPage();
		
		mv.addObject("fCatlist", fCatlist);
		mv.addObject("fSublist", fSublist);
		mv.addObject("MypagePage", page);
		mv.addObject("FAQinc",1);
		mv.addObject("inc", "mypage/FAQ");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("FAQ_view")
	public ModelAndView FAQ_view(MypagePage page,FAQVo fVo) {
		mv = new ModelAndView();
		
		List<String> fCatlist = ms.FAQ_cat();
		List<FAQVo> fSublist = ms.FAQ_sub(page);
		page = ms.getPage();

		String subject = fVo.getSubject();
		fVo = ms.FAQ_view(subject);
		
		mv.addObject("FAQVo", fVo);
		mv.addObject("fCatlist", fCatlist);
		mv.addObject("fSublist", fSublist);
		mv.addObject("MypagePage", page);
		mv.addObject("FAQinc",null);
		mv.addObject("inc", "mypage/FAQ");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("FAQ_view_back")
	public ModelAndView FAQ_view_back(MypagePage page,FAQVo fVo) {
		mv = new ModelAndView();
		
		List<String> fCatlist = ms.FAQ_cat();
		List<FAQVo> fSublist = ms.FAQ_sub(page);
		page = ms.getPage();
		
		mv.addObject("fCatlist", fCatlist);
		mv.addObject("fSublist", fSublist);
		mv.addObject("MypagePage", page);
		mv.addObject("FAQinc",1);
		mv.addObject("inc", "mypage/FAQ");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("FAQ_cancel")
	public ModelAndView FAQ_cancel(HttpServletRequest req,MypagePage page) {
		mv = new ModelAndView();
		
		mv.addObject("MypagePage", page);
		mv.addObject("inc", "mypage/FAQ");
		mv.setViewName("index");
		return mv;
	}
	
	/*============================= muny =============================*/
	
	
	@RequestMapping("munylist")
	public ModelAndView munylist(HttpServletRequest req,MypagePage page) {
		mv = new ModelAndView();
		
		page.setNowPage(1);
		
		List<MunyVo> list = ms.munylist(req, page);
		page = ms.getPage();
		
		mv.addObject("munylist", list);
		mv.addObject("MypagePage",page);
		mv.addObject("inc", "mypage/munylist");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("munylist_move")
	public ModelAndView munylist_move(HttpServletRequest req,MypagePage page) {
		mv = new ModelAndView();
		
		page.setNowPage(page.getNowPage());
		
		List<MunyVo> list = ms.munylist(req, page);
		page = ms.getPage();
		
		mv.addObject("munylist", list);
		mv.addObject("MypagePage",page);
		mv.addObject("inc", "mypage/munylist");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("munylist_detail")
	public ModelAndView munylist_detail(MypagePage page,int num) {
		mv = new ModelAndView();
		
		MunyVo mVo = ms.munylist_detail(num);
		
		mv.addObject("MunyVo", mVo);
		mv.addObject("MypagePage",page);
		mv.addObject("inc", "mypage/munylist_detail");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("munylist_delete")
	public ModelAndView muny_delete(HttpServletRequest req,MypagePage page,MunyVo mVo) {
		mv = new ModelAndView();
		
		ms.munylist_delete(mVo);
		page.setNowPage(1);
		
		List<MunyVo> list = ms.munylist(req, page);
		page = ms.getPage();
		
		mv.addObject("munylist", list);
		mv.addObject("MypagePage", page);
		mv.addObject("inc", "mypage/munylist");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("muny")
	public ModelAndView muny(HttpServletRequest req,MypagePage page) {
		mv = new ModelAndView();
		
		mv.addObject("MypagePage", page);
		mv.addObject("inc", "mypage/muny");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("munyR")
	public ModelAndView munyR(HttpServletRequest req,MypagePage page,MunyVo mVo) {
		mv = new ModelAndView();
		
		ms.munyR(req, mVo);
		
		page.setNowPage(1);
		
		List<MunyVo> list = ms.munylist(req, page);
		page = ms.getPage();
		
		mv.addObject("munylist", list);
		mv.addObject("MypagePage", page);
		mv.addObject("inc", "mypage/munylist");
		mv.setViewName("index");
		return mv;
	}
	
	/*============================= ask =============================*/
	
	@RequestMapping("ask")
	public ModelAndView ask(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/ask");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("askR")
	public ModelAndView askR(HttpServletRequest req,String findStr,AskVo aVo) {
		mv = new ModelAndView();
		
		ms.askR(req, aVo);
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/mypage");
		mv.setViewName("index");
		return mv;
	}
	
	/*============================= signout =============================*/
	
	@RequestMapping("signout")
	public ModelAndView signout(HttpServletRequest req,String findStr) {
		mv = new ModelAndView();
		
		mv.addObject("findStr", findStr);
		mv.addObject("inc", "mypage/signout");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("pwdChk")
	public boolean pwdChk(HttpServletRequest req,String pwd) {
		boolean pwdC = false;
		pwdC = ms.pwdChk(req,pwd);
		
		return pwdC;
	}
	
	@RequestMapping("signoutR")
	public ModelAndView signoutR(HttpServletRequest req,
			String signout_reason,String signout_reasonText) {
		mv = new ModelAndView();
		
		if(signout_reason.equals("기타")) {
			ms.signoutR(req, signout_reasonText);
		}else {
			ms.signoutR(req, signout_reason);
		}
		mv.addObject("inc", null);
		mv.setViewName("index");
		return mv;
	}
	
}
