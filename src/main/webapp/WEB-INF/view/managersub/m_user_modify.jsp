<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_user_modify</title>
		<link rel='stylesheet' type='text/css' href='css/managersub.css'>
		<script src='js/managersub.js'></script>
	</head>
	<body>
		<div id='m_user_input'>
			<div id='ucontent'>
				<h1>회원 정보 수정</h1>
				<form name='frm_m_user_input' id='frm_m_user_input' method='post'>
					<div class='userInfo'>
						<div class='userInfoD'>
							<h3> 회원 정보 </h3>
							<label> 이메일(ID) </label>
							<input type='text' name='email' value='${vo.email }'/><br/>
							<label> 이름 </label>
							<input type='text' name='uName' value='${vo.uName }'/><br/>
							<label> 전화번호 </label>
							<input type='text' name='phone' value='${vo.phone }'/><br/>
							<label> 닉네임 </label>
							<input type='text' name='nick' value='${vo.nick }'/><br/>
							<label></label>
	 						<hr/>
	 						<h3> 결제 정보 </h3>
							<label> 카드사 </label>
							<input type='text' name='card'/><br/>
							<label> 카드번호 </label>
							<input type='text' name='cardNo'/><br/>
							<label> 결제일 </label>
							<input type='text' name='payday' value='${vo.payday }'/><br/>
							<hr/>
							<div id='btns'>
								<button type='button' onclick='user.modifyR(this.form)'> 수정 </button>
								<button type='button' onclick='user.select(this.form)'> 취소 </button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>