package com.prec.managersub;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.prec.bean.ManagerPage;
import com.prec.mybatis.ManagersubMapper;
import com.prec.user.UserVo;

@Service
public class ManagersubService {
	
	
	@Autowired
	ManagersubMapper Mapper;
	ManagerPage page;
	
	@Autowired
	DataSourceTransactionManager transaction;
	TransactionStatus status;
	
	public ManagersubService() {}
	
	public List<UserVo> mUserList(ManagerPage page){
		List<UserVo> list = null;
		try {
			int totSize = Mapper.totSize(page);
			
			page.setTotSize(totSize);
			page.compute();
			
			list = Mapper.mUserList(page);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		this.page = page;
		return list;
	}
	
	public UserVo mUserView(String email){
		UserVo vo = null;
		try {
			
			vo = Mapper.mUserView(email);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	public UserVo mUserModify(String email) {
		UserVo vo = null;
		try {
			vo = Mapper.mUserModify(email);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	public boolean mUserModifyR(UserVo vo, ManagerPage page) {
		boolean b = false;
		try {
			status = transaction.getTransaction(new DefaultTransactionDefinition());
			transaction.commit(status);
			
			Mapper.mUserModifyR(vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		this.page = page;
		return b;
	}
	
	public boolean mUserInputR(UserVo vo) {
		boolean b = false;
		try {
			status = transaction.getTransaction(new DefaultTransactionDefinition());
			transaction.commit(status);
			
			int cnt = Mapper.mUserInputR(vo);
			if(cnt >0) {
				transaction.commit(status);
			}else {
				transaction.rollback(status);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}
	
	public ManagerPage getPage() {
		return page;
	}
	
}
