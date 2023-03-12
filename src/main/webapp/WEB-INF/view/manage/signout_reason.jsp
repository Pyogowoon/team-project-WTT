<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴 사유 관리</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/manage.js'></script>
		<link rel='stylesheet' href='css/manage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='signout_reason'>
			<form name='frm_signout_reason' class='frm_signout_reason' method='post'>
				<h1>회원탈퇴 사유 관리</h1>
				<div class='signout_reason_list'>
					<c:forEach var='sout' items='${soutlist }'>
						<div class='signout_reason_item'>
							<span class='ema'>이메일 : ${sout.email }</span>
							<span class='reason'>탈퇴 사유 : ${sout.reason }</span>
							<button type='button' class='btnFriendDelete' value='${sout.sno }' 
								onclick='manage.signout_delete(this)'>
								<i class="fa-solid fa-xmark"></i>
							</button>
						</div>
					</c:forEach>
				</div>
			</form>
		</div>
		<script src='js/manage.js'></script>
	</body>
</html>