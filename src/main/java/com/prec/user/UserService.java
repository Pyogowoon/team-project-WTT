package com.prec.user;



 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;

import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.prec.mybatis.UserMapper;

@Service
//@Transactional
public class UserService{
	

	AES aes;
	
	@Autowired
	UserMapper Mapper;
	
	@Autowired
	DataSourceTransactionManager transaction;
	TransactionStatus status;
	
	
	public UserService(){
		aes = new AES(); 
	
	}
	
	public UserVo login(UserVo vo, HttpServletRequest req) {
		UserVo rVo = null;   //rvo = 리턴될 vo
		
		HttpSession session = req.getSession();

	try {
		String mPwd = aes.enc(vo.getPwd());
		
		vo.setPwd(mPwd);
		rVo = Mapper.login(vo);
		
		if(rVo != null) {
			session.setAttribute("email", rVo.getEmail());
			System.out.println("serv's rVo: "+ rVo);
			session.setAttribute("gwan", 1);
		}else {
			session.setAttribute("email", null);
		}
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	
	return rVo;
	}
	
	
	
	public String findPwd(UserVo vo) {
		String pwd="";
		try {
		String temp=Mapper.findPwd(vo);
		 pwd= aes.dec(temp);
		
	
		}catch(Exception ex) {
			ex.printStackTrace();
		}
			return pwd;
		}
			
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String msg = "";
		session.setAttribute("email", null );
		
		return msg;	
}

	public boolean insert(UserVo vo) {
	 boolean b = true;
		try {
		
			String pwd = aes.enc(vo.getPwd());
			vo.setPwd(pwd);
			status =transaction.getTransaction(new DefaultTransactionDefinition());
			Mapper.insert(vo);
			transaction.commit(status);
		
		}catch(Exception ex) {
			ex.printStackTrace();
			b=false;
		}
		return b;
	}  
	
	public int idCheck(String email) throws Exception{
		return Mapper.idCheck(email);
	}
	
		
	
	


	public UserVo selectOne(String id) {

	UserVo vo= null;
		try {
			
			vo=Mapper.selectOne(id);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	

}
