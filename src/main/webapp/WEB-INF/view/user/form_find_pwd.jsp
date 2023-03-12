<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form_find_pwd</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
<link rel='stylesheet' href='../css/findpwd.css'>
</head>
<body>
<header class="showcase">

<div class="showcase-content">
<a href="javascript:history.back()">
          <img src="./img/previous2.png" style="width:70px; height:60px; padding:10px; margin-right:80px">
          </a>
	<form name='frm_find' id="frm_find" method="post">
	<div id="pwd_title">
			<h1>비밀번호 찾기</h1>
			</div>
				<label>이메일</label>
				<input type='email' name='email' placeholder="등록된 이메일을 입력해주세요."></br>
				<label>전화번호</label>
				<input type='text' name='phone' placeholder="등록된 전화번호를 입력해주세요">
				<input type="button" id='btnFindPwd' value='비밀번호 찾기'/>
				
				<br/>
		</form>
		</div>
		</header>
		<script>
		/* 로그인 버튼 클릭 메서드 */
var btnFindPwd = document.getElementById('btnFindPwd');
if(btnFindPwd !=null){
	btnFindPwd.onclick = function(){
		let frm = document.frm_find;
		let url = 'findPwdR';
		frm.action = url;
		frm.submit();
	}
}

		
		
		</script>
</body>
</html>