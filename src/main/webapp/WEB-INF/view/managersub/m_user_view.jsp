<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_user_view</title>
		<link rel='stylesheet' type='text/css' href='css/managersub.css'>
		<script src='js/managersub.js'></script>
	</head>
	<body>
		<div id='m_user_view'>
			<div id='ucontent'>
				<h1>회원 정보 조회</h1>
				<form name='frm_m_user_view' id='frm_m_user_view' method='post'>
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
							<input type='text' name='card' value=''/><br/>
							<label> 카드번호 </label>
							<input type='text' name='cardNo' value=''/><br/>
							<label> 결제일 </label>
							<input type='text' name='payday' value='${vo.payday }'/><br/>
						</div>
						<div class='lineInfo'>
							<div id='blank'></div>
							<h3> 회선 정보 </h3>
							<c:forEach var='li' begin='1' end='4'>
								<div>
									- ${li } 번 우영우
								</div>
							</c:forEach> 
						</div>
					</div>
					<div id='btns'>
						<button type='button' onclick='user.modify(this.form)'> 수정 </button>
						<button type='button' > 삭제 </button>
						<button type='button' onclick='user.select(this.form)'> 취소 </button>
						<input type='hidden' value='${vo.email }'>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>