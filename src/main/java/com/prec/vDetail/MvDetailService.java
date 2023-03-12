package com.prec.vDetail;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.prec.bean.ManagerPage;
import com.prec.mybatis.MvDetailMapper;

@Service
public class MvDetailService {
	
	@Autowired
	MvDetailMapper dMapper;
	@Autowired
	DataSourceTransactionManager transaction;
	TransactionStatus status;
	ManagerPage page;
	
	//------manager 영상 세부정보 관리
	public List<MvDetailVo> vDetailSelect(ManagerPage page){
		List<MvDetailVo> list =null;
		int totSize = dMapper.totSize(page);
		page.setTotSize(totSize);
		page.compute();
		this.page = page;
		list = dMapper.vDetailSelect(page);
		return list;
	}
	//--영상 세부정보 저장
	public List<Integer> vDetailInsert(List<MvDetailVo> detailList){
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		List<Integer> list = new ArrayList<Integer>();
		int cnt = 0;
		for(MvDetailVo vo : detailList) {
			cnt = dMapper.vDetailInsert(vo);
			int sno = dMapper.getSno();
			list.add(sno);
		}
		if(cnt>0) {
			transaction.commit(status);
		}else {
			transaction.rollback(status);
		}
		return list;
	}
	public boolean detailAttInsert(List<VDetailAtt> attList) {
		boolean b = false;
		int cnt=0;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		if(attList.size()>0) {
			cnt = dMapper.detailAttInsert(attList);
			for(VDetailAtt att : attList) {
				cnt = dMapper.detailFileNameModify(att);
			}
		}
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	
	public List<MvDetailVo> detailView(int serial){
		List<MvDetailVo> detailList = null;
		detailList = dMapper.detailView(serial);
		return detailList;
	}
	public boolean vDetailModify(List<MvDetailVo> detailModifyList){
		boolean b=false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = 0;
		for(MvDetailVo vo : detailModifyList) {
			cnt = dMapper.detailModify(vo);
		}
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean vDetailModifyFileName(List<VDetailAtt> mAttList) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = 0;
		for(VDetailAtt att : mAttList) {
			cnt = dMapper.detailAttModify(att);
			cnt = dMapper.detailFileNameModify(att);
		}
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	//삭제관련
	public VDetailAtt vDetailAttView(int vSno) {
		VDetailAtt att= dMapper.detailAttView(vSno);
		return att;
	}
	public boolean detailDelete(List<Integer> chklist) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = 0;
		cnt = dMapper.detailAttDelete(chklist);
		cnt = dMapper.detailDelete(chklist);
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean detailDeleteAll(List<Integer> chklist) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = 0;
		cnt = dMapper.detailAttDeleteAll(chklist);
		cnt = dMapper.detailDeleteAll(chklist);
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}		
		return b;
	}
	public List<MvDetailVo> detailFind(ManagerPage page){
		List<MvDetailVo> list = null;
		list = dMapper.detailFind(page);
		return list;
	}
	public MvDetailVo detailViewOne(int sno){
		MvDetailVo vo = null;
		vo = dMapper.detailViewOne(sno);
		return vo;
	}
	//----------------------------------
	
	public ManagerPage getPage() {
		return page;
	}
}
