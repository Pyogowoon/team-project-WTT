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

  <script src="js/input.js"></script>
 
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



</body>
</html>