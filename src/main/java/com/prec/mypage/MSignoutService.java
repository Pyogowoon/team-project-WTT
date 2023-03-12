package com.prec.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prec.mybatis.MSignoutMapper;

@Service
public class MSignoutService {
	
	@Autowired
	MSignoutMapper msm;
	
	public List<SignoutVo> manage_signout(){
		List<SignoutVo> list = msm.manageSignout();
				
		return list;
	}
	
	public void signout_delete(int sno) {
		msm.signoutDelete(sno);
	}
	
}
