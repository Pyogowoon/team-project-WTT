package com.prec.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.prec.mypage.SignoutVo;

@Mapper
public interface MSignoutMapper {
	public List<SignoutVo> manageSignout();
	public void signoutDelete(int sno);
}
