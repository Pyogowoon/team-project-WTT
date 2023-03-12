package com.prec.index;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class IndexService {
	
	@Autowired
	@Qualifier("indexMapper")
	IndexMapper im;
	IndexPage page;
	
	public boolean check(HttpServletRequest req) {
		boolean b = true;
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("email");
		if(email == null) {
			b = false;
		}
		
		return b;
	}
	
	public void login(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("gwan", 0);
		session.setAttribute("email", "aaa");
	}
	
	public void logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("email", null);
		session.setAttribute("gwan", null);
		session.setAttribute("pwd", null);
	}
	
}
