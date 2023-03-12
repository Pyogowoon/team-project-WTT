package com.prec.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Repository;

import com.prec.user.UserVo;

@Mapper
@Repository
//@Alias("mMapper")
public interface UserMapper { 
	
	
	public String findPwd(UserVo vo);
	public UserVo login(UserVo vo);
	public UserVo selectOne(String id);
	public void insert(UserVo vo);
	public int idCheck(String email);
	
	

}
