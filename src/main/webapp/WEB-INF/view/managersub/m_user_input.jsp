<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>m_user_input</title>
		<link rel='stylesheet' type='text/css' href='css/managersub.css'>
		<script src='js/managersub.js'></script>
	</head>
	<body>
		<div id='m_user_input'>
			<div id='ucontent'>
				<h1>관리자 계정 생성</h1>
				<form name='frm_m_user_input' id='frm_m_user_input' method='post'>
					<div class='userInfo'>
						<div class='userInfoD'>
							<h3> 회원 정보 </h3>
							<label> 이메일(ID) </label>
							<input type='text' name='email' value=''/><br/>
							<label> 이름 </label>
							<input type='text' name='uName' value=''/><br/>
							<label> 전화번호 </label>
							<input type='text' name='phone' value=''/><br/>
							<label> 닉네임 </label>
							<input type='text' name='nick' value=''/><br/>
							<label></label>
							<div id='btns'>
								<button type='button' onclick='user.input(this.form)'> 저장 </button>
								<button type='button' onclick='user.select(this.form)'> 취소 </button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>