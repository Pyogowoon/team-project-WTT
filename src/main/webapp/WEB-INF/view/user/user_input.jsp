<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
<link rel='stylesheet' href='./css/signup.css'>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 
</head>
<body>
<header class="showcase">

	<div class="showcase-content">
	<a href="javascript:history.back()">
	<img src="./img/previous2.png" style="width:40px; height:30px;" >
	</a>
<div class ='formm'>
<h1>회원가입</h1>
<div class='account_form'>
	
	<form name='frm_member' method='post' id='frm_member' class='frm_member'>
		<label>이메일 *</label>
		<input type='email' class='email' name='email'  placeholder="email@Forexample.com">
		
		<span class="email_re">사용 가능한 이메일 입니다.</span>
		<span class='email_re2'>아이디가 이미 존재합니다.</span>
		<span class="final_email_ck">아이디를 입력해주세요.</span>
		<span class="mail_input_box_warn"></span>
		<br/>
		<label>인증 *</label>
		<div class="mail_check_input_box">
		<input type='text' name="email_check"  id="mail_check_input_box_false"
		class="mail_check_input" disabled="disabled" placeholder="이메일 인증 클릭시 활성화됩니다.">
	</div>
		<button type='button' id='btnCheck' class='btnCheck'> 이메일 인증</button>
		<span id="mail_check_input_box_warn"></span>
		<br/>
		<label>암호 *</label>
		<input type='password' name='pwd' class='pwd' autocomplete="none" placeholder="8-12자의 비밀번호"><br/>
		<span class="final_pw_ck">6-18자리의 비밀번호를 입력해주세요.</span>
		<label>암호확인*</label>
		<input type='password' name='pwdchk' class='pwdchk' autocomplete="none" placeholder="8-12자의 비밀번호"><br/>
		<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
		<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
    <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
		<label>성함 *</label>
		<input type='text'  name='uName' class='uName' placeholder="표성현" ><br/>
		<span class="final_name_ck">이름을 입력해주세요.</span>
		<label>H.P *</label>
		<input type='text'  name='phone' class='phone' placeholder="-를 제외하고 입력" ><br/>
		<span class="final_phone_ck">-을 제거해주세요.</span>
		<label>닉네임</label>
		<input type='text'  name='nick' placeholder="user"><br/>
		
	
		<input type ='button' class='btnSave' value="등록하기">
	
	</form>

  </div>
</div>
</header>



<script>
//인증번호 코드
var code="";


// 유효성 검사 통과유무 변수선언
var emailCheck = false;            // 아이디
 var emailckCheck = false;            // 아이디 중복 검사
 var pwCheck = false;            // 비번
 var pwckCheck = false;            // 비번 확인
 var pwckcorCheck = false;        // 비번 확인 일치 확인
 var nameCheck = false;            // 이름
 var phoneCheck = false; 					// 번호
 

 $(document).ready(function(){
 	//회원가입 버튼(회원가입 기능 작동)
 	$(".btnSave").click(function(){
 		
 	// 입력값에 대한 변수
var email = $('.email').val();                 // id 입력란
var pw = $('.pwd').val();                // 비밀번호 입력란
var pwck = $('.pwdchk').val();            // 비밀번호 확인 입력란
var name = $('.uName').val();            // 이름 입력란
var phone = $('.phone').val();        // 번호 입력란
var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;  //일단 아직 미구현임
var preg =/^[a-z0-9_-]{6,18}$/;
 		/* 아이디 유효성 검사 */
if(email == ""){
    $('.final_email_ck').css('display','block');
    emailCheck = false;
}else{
    $('.final_email_ck').css('display', 'none');
    emailCheck = true;
} //else문 종료
 		
 		/* 비밀번호 유효성 검사 */ 
 		
if(pw == "" ){
    $('.final_pw_ck').css('display','block');
    pwCheck = false;
}else{
    $('.final_pw_ck').css('display', 'none');
    pwCheck = true;
    
}  //else문 종료

/* 비밀번호 확인 유효성 검사 */
if(pwck == "" ){
    $('.final_pwck_ck').css('display','block');
    pwckCheck = false;
}else{
    $('.final_pwck_ck').css('display', 'none');
    pwckCheck = true;
    
} //else문 종료

 /* 이름 유효성 검사 */
if(name == ""){
    $('.final_name_ck').css('display','block');
    nameCheck = false;
}else{
    $('.final_name_ck').css('display', 'none');
    nameCheck = true;
    
}  //else문 종료

 /* 폰 유효성 검사 */
 
if(phone == ""){
    $('.final_phone_ck').css('display','block');
    phoneCheck = false;
}else{
    $('.final_phone_ck').css('display', 'none');
    phoneCheck = true;
    
} // else문 종료 
/* 최종 유효성 검사 */
if(emailCheck&&emailckCheck&&pwCheck&&pwckCheck&&nameCheck&&phoneCheck){
	 

$("#frm_member").attr("action", "insertR");
$("#frm_member").submit();

}

	return false;

 	});   //onclick 이벤트 종료
 });   //ready 펑션 종료
 
 
// 중복검사
$('.email').on("propertychange change keyup paste input", function(){
 //console.log("keyup 테스트");

var email = $('.email').val();
var data = {email:email}

 $.ajax({
	 type : "post",
	 url : "/userIdChk",
	 data : data,
	 success : function(result){
		 console.log("성공여부" + result);
		 if(result != 'fail'){
			 $('.email_re').css("display" ,"inline-block");
			 $('.email_re2').css("display","none");
			 emailckCheck = true;
		 } else {
				$('.email_re2').css("display","inline-block");
				$('.email_re').css("display", "none");
				emailckCheck = false;
				
	 } //else문 종료
	 
	 }// success 종료
	 }); //ajax종료
 }); //중복검사 function 종료
    /*  */    
        
    
  /* 인증번호 이메일 전송*/
  $(".btnCheck").click(function(){
	  
	  var emailc = $(".email").val();
	  var checkBox =$(".mail_check_input");
	  var boxWrap =$(".mail_check_input_box");
	  var warnMsg =$(".mail_input_box_warn");
	  
	  /* 이메일 형식 유효성 검사 */
	    if(mailFormCheck(emailc)){
	        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	        warnMsg.css("display", "inline-block");
	    } else {
	        warnMsg.html(" @를 포함한 이메일 주소를 입력해주세요.");
	        warnMsg.css("display", "inline-block","color","red");
	        return false;
	    }    
	  
	  $.ajax({
		  type:"GET",
		  url:"mailCheck?email=" +emailc,
			success:function(data){
				 console.log("data :" + data);
				 checkBox.attr("disabled",false);
				 boxWrap.attr("id","mail_check_input_box_true");
				 code = data;
			} //success 펑션 종료
		  
	  }); //ajax 코드 종료
	  
  }); //인증번호 이메일 전송 function 종료
  
  
  /*인증번호 비교*/
  $(".mail_check_input").blur(function(){
	  
	  var inputCode = $(".mail_check_input").val();
	  var checkResult = $("#mail_check_input_box_warn");
	  
	  if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");  
	        mailnumCheck = true; 
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        mailnumCheck = false;
	    }    
	  
	  
  });
  
  
   /* 비밀번호 확인 일치 유효성 검사 */
  $('.pwdchk').on("propertychange change keyup paste input", function(){
	  var pw = $('.pwd').val();
	    var pwck = $('.pwdchk').val();
	    $('.final_pwck_ck').css('display', 'none');
	    
	    
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    }        
	    
  });   
   
   /*입력 이메일 형식 유효성 검사*/
   function mailFormCheck(email){
	   var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	   return form.test(email);
	   
   }
  
</script>
</body>
</html>