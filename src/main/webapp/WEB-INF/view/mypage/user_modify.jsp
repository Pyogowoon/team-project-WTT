<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/mypage.js'></script>
		<link rel='stylesheet' href='css/mypage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='user_modify'>
			<form name='frm_user_modify' class='frm_user_modify' method='post'>
			<button type='button' class='back' onclick='mypage.user_modify_back(this.form)'>
					<i class="fa-solid fa-reply"></i>
			</button>
				<div class='user_modify_frame'>
					<input type='hidden' name='findStr' value='${findStr }'>
					<h1>회원정보 수정</h1>
					<h2>개인정보 수정</h2>
					<label>변경할 비밀번호</label>
					<input type='password' name='pwd' onkeyup='mypage.user_modify_pwdC(this.form)'><br/>
					<label>비밀번호 확인</label>
					<input type='password' name='pwd_conf' onkeyup='mypage.user_modify_pwdC(this.form)'><br/>
					<span id='pwdC'></span><br/>
					<label>휴대전화</label>
					<input type='text' name='phone' value='010-1234-5678' onkeyup='mypage.user_modify_phoneC(this.form)'><br/>
					<span id='phoneC'></span><br/>
					<button type='button' class='btnModify' onclick='mypage.user_modifyR(this.form)'>저장</button>
					<button type='button' class='btnCancel' onclick='mypage.cancel(this.form)'>취소</button>
					
					<h2>회선 정보</h2>
					<label>안우성</label><br/>
					<label>정주원</label><br/>
					<label>표성현</label><br/>
					
					<h2>결제 정보</h2>
					<label>카드사</label>
					<input type='text' name='card' value='카카오뱅크' readonly><br/>
					<label>카드번호</label>
					<input type='text' name='cardNo' value='1234-5678-9123-4567' readonly><br/>
					<label>정기 결제일</label>
					<input type='text' name='payday' value='14일' readonly>
				</div>
			</form>
		</div>
	</body>
</html>