package com.prec.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.prec.faq.FAQVo;
import com.prec.mypage.AskVo;
import com.prec.mypage.ConsumerVo;
import com.prec.mypage.FriendVo;
import com.prec.mypage.MunyVo;
import com.prec.mypage.MypagePage;
import com.prec.mypage.SignoutVo;

@Mapper
@Repository
@Qualifier("mypageMapper")
public interface MypageMapper {
	public int FAQTotSize(String fCat);
	public int MunyTotSize(String email);
	public int userModifyR(ConsumerVo cVo);
	public List<ConsumerVo> mylistWishlist(ConsumerVo cVo);
	public List<ConsumerVo> mylistVaclist(ConsumerVo cVo);
	public void mylistDelete(int sno);
	public List<FriendVo> friendlist(String email);
	public void friendInsertR(FriendVo fVo);
	public void friendNickR(FriendVo fVo);
	public void friendDelete(FriendVo fVo);
	public void askR(AskVo aVo);
	public List<String> FAQCat();
	public List<FAQVo> FAQSub(MypagePage page);
	public FAQVo FAQView(String subject);
	public List<MunyVo> munylist(MypagePage page);
	public MunyVo munylistDetail(int num);
	public void munylistDelete(int num);
	public String munyuName(String email);
	public void munyR(MunyVo mVo);
	public int pwdChk(ConsumerVo cVo);
	public void signoutReason(SignoutVo sVo);
	public void signoutR(String email);
}
