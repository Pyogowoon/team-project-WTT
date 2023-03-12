package com.prec.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;

import com.prec.faq.FAQVo;
import com.prec.mybatis.MypageMapper;
import com.prec.user.AES;

@Service
@Transactional
public class MypageService {
	
	@Autowired
	@Qualifier("mypageMapper")
	MypageMapper mp;
	MypagePage page;
	
	@Autowired
	DataSourceTransactionManager transaction;
	TransactionStatus status;
	
	AES aes;
	ConsumerVo cVo;
	
	public MypageService() {
		aes = new AES();
	}
	
	public MypagePage getPage() {
		return page;
	}
	
	public void user_modifyR(HttpServletRequest req,ConsumerVo vo) {
		cVo = new ConsumerVo();
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			String mPwd = aes.enc(vo.getPwd());
			
			cVo.setEmail(email);
			cVo.setPwd(mPwd);
			cVo.setPhone(vo.getPhone());
			
			mp.userModifyR(cVo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<ConsumerVo> mylist_wishlist(HttpServletRequest req){
		cVo = new ConsumerVo();
		List<ConsumerVo> list = null;
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			cVo.setEmail(email);
			list = mp.mylistWishlist(cVo);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public List<ConsumerVo> mylist_vaclist(HttpServletRequest req){
		cVo = new ConsumerVo();
		List<ConsumerVo> list = null;
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			cVo.setEmail(email);
			list = mp.mylistVaclist(cVo);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public void mylist_delete(int sno) {
		mp.mylistDelete(sno);
	}
	
	public List<FriendVo> friendlist(HttpServletRequest req) {
		List<FriendVo> list = null;
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			
			list = mp.friendlist(email);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public List<FriendVo> friend_insertR(HttpServletRequest req,FriendVo fVo){
		List<FriendVo> list = null;
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			fVo.setEmail(email);
			//String fName = mp.friendName(email);
			//fVo.setfName(fName);
			mp.friendInsertR(fVo);
			
			list = mp.friendlist(email);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public List<FriendVo> friend_nickR(HttpServletRequest req,FriendVo fVo) {
		List<FriendVo> list = null;
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			fVo.setEmail(email);
			mp.friendNickR(fVo);
			
			list = mp.friendlist(email);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public List<FriendVo> friend_delete(HttpServletRequest req,FriendVo fVo) {
		List<FriendVo> list = null;
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			fVo.setEmail(email);
			mp.friendDelete(fVo);
			
			list = mp.friendlist(email);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public List<String> FAQ_cat(){
		List<String> list = null;
		try {
			list = mp.FAQCat();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public List<FAQVo> FAQ_sub(MypagePage page){
		List<FAQVo> list = null;
		int totSize = 0;
		try {
			String fCat = page.getfCat();
			if(fCat.equals("전체")) {
				fCat = "";
			}
			totSize = mp.FAQTotSize(fCat);
			page.setTotSize(totSize);
			page.setfCat(fCat);
			page.compute();
			
			list = mp.FAQSub(page);
			if(fCat.equals("")) {
				page.setfCat("전체");
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		this.page = page;
		return list;
	}
	
	public FAQVo FAQ_view(String subject) {
		FAQVo vo = null;
		try {
			vo = mp.FAQView(subject);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
	}
	
	public List<MunyVo> munylist(HttpServletRequest req,MypagePage page){
		List<MunyVo> list = null;
		int totSize = 0;
		
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			page.setEmail(email);
			totSize = mp.MunyTotSize(email);
			page.setTotSize(totSize);
			page.compute();
			
			list = mp.munylist(page);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		this.page = page;
		return list;
	}
	
	public MunyVo munylist_detail(int num) {
		MunyVo vo = null;
		try {
			vo = mp.munylistDetail(num);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
	}
	
	public void munylist_delete(MunyVo mVo) {
		try {
			int num = mVo.getNum();
			mp.munylistDelete(num);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void munyR(HttpServletRequest req,MunyVo mVo) {
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			String uName = mp.munyuName(email);
			mVo.setEmail(email);
			mVo.setuName(uName);
			mp.munyR(mVo);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	public void askR(HttpServletRequest req,AskVo aVo) {
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			aVo.setcId(email);
			mp.askR(aVo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean pwdChk(HttpServletRequest req,String pwd) {
		int chk = 0;
		boolean pwdC = false;
		cVo = new ConsumerVo();
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			String mPwd = aes.enc(pwd);
			cVo.setEmail(email);
			cVo.setPwd(mPwd);
			chk = mp.pwdChk(cVo);
			
			if(chk>0) {
				pwdC = true;
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return pwdC;
	}
	
	public void signoutR(HttpServletRequest req,String reason) {
		SignoutVo sVo = new SignoutVo();
		try {
			HttpSession session = req.getSession();
			String email = (String)session.getAttribute("email");
			sVo.setEmail(email);
			sVo.setReason(reason);
			mp.signoutReason(sVo);
			mp.signoutR(email);
			session.setAttribute("email", null);
			session.setAttribute("pwd", null);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
}
