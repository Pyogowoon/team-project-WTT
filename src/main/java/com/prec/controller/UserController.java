package com.prec.controller;


import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.prec.user.UserService;
import com.prec.user.UserVo;
import com.prec.video.VideoService;
import com.prec.video.VideoVo;

@RestController
public class UserController {
   
   @Autowired
   private UserService dao;

   @Autowired
   JavaMailSenderImpl mailSender;
   
   @Autowired
   VideoService vdao;
  
   @RequestMapping("/login")
   public ModelAndView login() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("user/form_login");
      
      return mv;
   }
   
   @RequestMapping("/loginR")
   public ModelAndView loginR(UserVo vo, HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();
      UserVo Vo = dao.login(vo,req);
		List<VideoVo> vList= vdao.mainVideo();
		
		
		
      if(Vo !=null) {
    	  mv.addObject("VideoVo", vList);
    	 mv.addObject("inc","main");
         mv.setViewName("index");
       
      }else {
    	  mv.setViewName("user/form_login");
    	
      }
      return mv;
   }
   
   @RequestMapping("/logout")
   public ModelAndView logout(HttpServletRequest req) {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("index");
      dao.logout(req);
      
      return mv;
   }
 
   @RequestMapping("insert")
   public ModelAndView insert() {
      ModelAndView mv = new ModelAndView();
      
      mv.setViewName("user/user_input");
      return mv;
   }
   
   @RequestMapping("insertR")
   public ModelAndView insertR(UserVo vo) {
      ModelAndView mv = new ModelAndView();
    
      dao.insert(vo);
      mv.setViewName("user/form_login");
      
      return mv;
   }
   @RequestMapping("findPwd")
	public ModelAndView findPwd(UserVo vo) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("user/form_find_pwd");
		return mv;
	}
   
   @RequestMapping("findPwdR")
   public ModelAndView findPwdR(UserVo vo) {
	   ModelAndView mv = new ModelAndView();
		String pwd = dao.findPwd(vo);
		
		mv.addObject("msg", pwd);
	   mv.setViewName("user/find_pwd_result"); 
	   
	   return mv;
   }
  
   	//아이디 중복체크
   @RequestMapping(value ="/userIdChk" , method=RequestMethod.POST)
   @ResponseBody
   public String userIdChkPOST(String email) throws Exception{
	   
	   int result = dao.idCheck(email);
	    if(result != 0) {
	    	return "fail";
	    }else {
	    	return "success";
	    }
   }
   //이메일 인증
   @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
   @ResponseBody
   public String mailCheckGET(String email) throws Exception{
	   Random random = new Random();
	   int checkNum = random.nextInt(888888) + 111111;
	
	   /*이메일 보내기*/
	   String setFrom ="vytjdgus1234@naver.com";
	   String toMail = email;
       String title = "회원가입 인증 이메일 입니다.";
       String content = 
               "WTT를 이용해주셔서 정말 감사합니다." +
               "<br><br>" + 
               "인증 번호는 " + checkNum + "입니다." + 
               "<br>" + 
               "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
      
       try {
           
           MimeMessage message = mailSender.createMimeMessage();
           MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
           helper.setFrom(setFrom);
           helper.setTo(toMail);
           helper.setSubject(title);
           helper.setText(content,true);
           mailSender.send(message);
           
       }catch(Exception e) {
           e.printStackTrace();
       }
      
       String num = Integer.toString(checkNum);
       
       return num;
   }
  
   
   @RequestMapping(value = "/sendMail", method = RequestMethod.GET)
   public void sendMailTest() throws Exception{
       
       String subject = "test 메일";
       String content = "메일 테스트 내용";
       String from = "vytjdgus1234@naver.com";
       String to = "vytjdgu1234@naver.com";
       
       try {
           MimeMessage mail = mailSender.createMimeMessage();
           MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
           // true는 멀티파트 메세지를 사용하겠다는 의미
           
           /*
            * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
            * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
            */
           
           mailHelper.setFrom(from);
           // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
           // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
           //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
           mailHelper.setTo(to);
           mailHelper.setSubject(subject);
           mailHelper.setText(content, true);
           // true는 html을 사용하겠다는 의미입니다.
           
           /*
            * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됨. mailHelper.setText(content);
            */
           
           mailSender.send(mail);
           
       } catch(Exception e) {
           e.printStackTrace();
       }
       
   }
}