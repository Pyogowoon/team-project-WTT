package com.prec.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.prec.bean.ManagerPage;
import com.prec.user.UserVo;

@Mapper
@Repository
public interface ManagersubMapper {
	
	/*---------------주원-23일 추가-------------*/
	public List<UserVo> mUserList(ManagerPage page);
	public UserVo mUserView(String email);
	public UserVo mUserModify(String email);
	public int mUserModifyR(UserVo vo);
	public int mUserInputR(UserVo vo);
	public int totSize(ManagerPage page);
}
