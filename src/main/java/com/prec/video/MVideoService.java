package com.prec.video;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.prec.bean.ManagerPage;
import com.prec.fileupload.FileUploadController;
import com.prec.mybatis.MVideoMapper;

@Service
public class MVideoService {
	
	@Autowired
	MVideoMapper vMapper;
	@Autowired
	DataSourceTransactionManager transaction;
	TransactionStatus status;
	ManagerPage page;
	VideoAtt vAtt;
	List<SeasonInfoVo> infoList;
	
	//-------------------------manager 영상/시리즈 관리
	//--------------영상 시리즈 입력---------
	public int videoInsert(MVideoVo vo) {
		int sno=0;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = vMapper.videoInsert(vo);
		if(cnt>0) {
			transaction.commit(status);
			sno = vMapper.lastSerial();
		}else {
			transaction.rollback(status);
		}
		return sno;
	}
	public boolean videoAttInsert(List<VideoAtt> attList, int sno) {
		boolean b=false;
		int cnt=0;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		if(attList.size()>0) {
			cnt = vMapper.videoAttInsert(attList);
		}else {
			cnt = vMapper.videoAttInsertgong(sno);
		}
		if(cnt>0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public int lastSerial() {
		int serial=0;
		serial = vMapper.lastSerial();
		return serial;
	}
	public boolean seasonInfoInsert(List<SeasonInfoVo> infoList) {
		boolean b= false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = vMapper.seasonInfoInsert(infoList);
		if(cnt>0) {
			transaction.commit(status);
			b=true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	//----------------영상 시리즈 조회----------
	public List<MVideoVo> videoSelect(ManagerPage page){
		List<MVideoVo> list = null;
		int totSize = vMapper.videoTotSize(page);
		page.setTotSize(totSize);
		page.compute();
		this.page = page;
		list = vMapper.videoSelect(page);
		
		return list;
	}
	public MVideoVo videoView(int serial) {
		MVideoVo rVo = null;
		rVo = vMapper.videoView(serial);
		this.vAtt = vMapper.videoAttView(serial);
		this.infoList = vMapper.seasonInfoView(serial);
		return rVo;
	}
	//------------------영상 시리즈 수정------------------------
	public boolean videoModify(MVideoVo vo) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		
		int cnt = vMapper.videoModify(vo);
		if(cnt >0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean videoAttDelete(int sno) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = vMapper.videoAttDelete(sno);
		if(cnt >0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean videoAttModify(List<VideoAtt> attList) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt=0;
		for(VideoAtt vo : attList) {
			cnt = vMapper.videoAttModify(vo);
		}
		if(cnt >0) {
			transaction.commit(status);
			b = true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean seasonInfoModify(List<SeasonInfoVo> seasonModifyList) {
		boolean b = false;
		int cnt=0;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		for(SeasonInfoVo vo : seasonModifyList) {
			cnt = vMapper.seasonInfoModify(vo);
		}
		if(cnt>0) {
			transaction.commit(status);
			b= true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean seasonInfoModifyOne(SeasonInfoVo vo) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = vMapper.seasonInfoModify(vo);
		if(cnt>0) {
			transaction.commit(status);
			b= true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean seasonInfoInsertOne(SeasonInfoVo vo) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = vMapper.seasonInfoInsertOne(vo);
		if(cnt>0) {
			transaction.commit(status);
			b= true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	// 영상 시리즈 관리 삭제 부분-----------------------------
	public boolean seasonInfoDeleteOne(int sno) {
		boolean b = false;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		int cnt = vMapper.seasonInfoDeleteOne(sno);
		if(cnt>0) {
			transaction.commit(status);
			b= true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean mVideoDeleteOne(int serial) {
		boolean b = false;
		int cnt=0;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		VideoAtt att = vMapper.videoAttView(serial);
		if(att != null) {
			if(att.getpSysFile() !=null && !att.getpSysFile().equals("")) {
				File pf = new File(FileUploadController.posterUploadPath+att.getpSysFile());
				if(pf.exists()) pf.delete();
			}
			if(att.gettSysFile() !=null && !att.gettSysFile().equals("")) {
				File tf = new File(FileUploadController.teaserUploadPath+att.gettSysFile());
				if(tf.exists()) tf.delete();
			}
		}
		cnt = vMapper.seasonInfoDelete(serial);
		cnt = vMapper.videoAttDelete(serial);
		cnt = vMapper.videoDelete(serial);
		if(cnt>0) {
			transaction.commit(status);
			b= true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
	public boolean mVideoDeleteAll(List<Integer> chklist) {
		boolean b = false;
		int cnt = 0;
		status = transaction.getTransaction(new DefaultTransactionDefinition());
		for(int serial : chklist) {
			VideoAtt att = vMapper.videoAttView(serial);
			if(att != null) {
				if(att.getpSysFile() !=null && !att.getpSysFile().equals("")) {
					File pf = new File(FileUploadController.posterUploadPath+att.getpSysFile());
					if(pf.exists()) pf.delete();
				}
				if(att.gettSysFile() !=null && !att.gettSysFile().equals("")) {
					File tf = new File(FileUploadController.teaserUploadPath+att.gettSysFile());
					if(tf.exists()) tf.delete();
				}
			}
		}
		cnt = vMapper.seasonInfoDeleteList(chklist);
		cnt = vMapper.videoAttDeleteList(chklist);
		cnt = vMapper.videoDeleteList(chklist);
		if(cnt>0) {
			transaction.commit(status);
			b= true;
		}else {
			transaction.rollback(status);
		}
		return b;
	}
    //-------------findVideo
	public List<MVideoVo> findVideo(ManagerPage page){
		List<MVideoVo> list = null;
		list = vMapper.findVideo(page);
		return list;
	}
	public String findVideoAtt(int serial) {
		String pSysFile="";
		VideoAtt vo = vMapper.videoAttView(serial);
		if(vo !=null) {
			pSysFile = vo.getpSysFile();
			
		}
		return pSysFile;
	}
 	//-----------------------------------------------------
	public ManagerPage getPage() {
		return page;
	}
	public VideoAtt getvAtt() {
		return vAtt;
	}
	public List<SeasonInfoVo> getInfoList() {
		return infoList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
