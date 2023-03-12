<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>manager_main</title>
		<link rel='stylesheet' type='text/css' href='css/manager.css'/>
	
		<script src="js/manager.js"></script>
	</head>
	<body>
		<div id='manager'>
			<div id='left'>
				<h1> 관리자 </h1>
				<div class='manager_menu'>
					<div><a href='m_video'>영상 / 시리즈 관리</a></div>
					<div><a href='m_detail'>영상 세부 정보 관리</a></div>
					<div><a href='m_ad'>영상 광고 관리</a></div>
					<div><a href='m_user'>회원관리</a></div>
					<div><a href='m_ask_list'>영상 신청 관리</a></div>
					<div><a href='manage_FAQ'>FAQ관리</a></div>
					<div><a href='manage_muny'>1:1 문의 관리</a></div>
					<div><a href='signoutR'>탈퇴 관리</a></div>
				</div>
			</div>
			<div id='right'>
				<c:if test='${not empty mInc }'>
					<jsp:include page="${mInc }"></jsp:include>
				</c:if>
			</div>
		</div>
	</body>
</html>