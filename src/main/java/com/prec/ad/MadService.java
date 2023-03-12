package com.prec.ad;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.prec.bean.ManagerPage;
import com.prec.mybatis.MadMapper;
import com.prec.vDetail.MvDetailVo;
import com.prec.vDetail.VDetailAtt;

@Service
public class MadService {
	
	@Autowired
	MadMapper aMapper;
	@Autowired
	DataSourceTransactionManager transaction;
	TransactionStatus status;
	ManagerPage page;
	
	//영상 광고 조회
	public List<MadVo> adSelect(ManagerPage page){
		List<MadVo> list = null;
		int totSize = aMapper.totSize(page);
		page.setTotSize(totSize);
		page.compute();
		this.page = page;
		list = aMapper.adSelect(page);
		return list;
	}
	// 저장
	public List<Integer> adInsert(List<MadVo> adList){
		List<Integer> list = new ArrayList<Integer>();
		int cnt = 0;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		for(MadVo vo : adList) {
			cnt = aMapper.adInsert(vo);
			int sno = aMapper.getSno();
			list.add(sno);
		}
		if(cnt>0) {
			transaction.commit(status);
		}else {
			transaction.rollback(status);
		}
		return list;
	}
	public boolean adAttInsert(List<AdAtt> attList) {
		boolean b = false;
		int cnt=0;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		if(attList.size()>0) {
			cnt = aMapper.adAttInsert(attList);
			for(AdAtt att : attList) {
				cnt = aMapper.adFileNameModify(att);
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
	public List<MadVo> adView(int dSno){
		List<MadVo> adList = null;
		adList = aMapper.adView(dSno); 
		return adList;
	}
	//수정
	public boolean adModify(List<MadVo> adModifyList){
		boolean b=false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = 0;
		for(MadVo vo : adModifyList) {
			cnt = aMapper.adModify(vo);
		}
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean adModifyFileName(List<AdAtt> mAttList) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = 0;
		for(AdAtt att : mAttList) {
			cnt = aMapper.adAttModify(att);
			cnt = aMapper.adFileNameModify(att); 
		}
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	//삭제
	public AdAtt adAttView(int aSno) {
		AdAtt att= aMapper.adAttView(aSno); 
		return att;
	}
	public boolean adDelete(List<Integer> chklist) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = 0;
		cnt = aMapper.adAttDelete(chklist);
		cnt = aMapper.adDelete(chklist);
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean adDeleteAll(List<Integer> chklist) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = 0;
		cnt = aMapper.adAttDeleteAll(chklist);
		cnt = aMapper.adDeleteAll(chklist);
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}		
		return b;
	}

	//------------------------------------
	public ManagerPage getPage() {
		return page;
	}
	
	
	
}
