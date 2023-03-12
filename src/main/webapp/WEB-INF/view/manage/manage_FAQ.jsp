<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/manage.js'></script>
		<link rel='stylesheet' href='css/manage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='manage_FAQ'>
			<form class='frm_manage_FAQ' name='frm_manage_FAQ' method='post'>
				<input type='hidden' name='sno'>
				<h1>FAQ 관리</h1>
				<div class='manage_FAQ_frame'>
					<div class='manage_FAQ_title'>
						<span class='chk'>체크</span>
						<span class='FAQ_category'>카테고리</span>
						<span class='subject'>제목</span>
						<span class='doc'>내용</span>
					</div>
					<div class='manage_FAQ_items'>
						<c:forEach var='a' begin='1' end='10'>
							<div class='manage_FAQ_item' onclick='manage.FAQ_view(${a})'>
								<span><input type='checkbox' name='muny_chkbox' class='chk' value='${sno }'></span>
								<span class='FAQ_category'>영상재생</span>
								<span class='subject'>제목</span>
								<span class='doc'>내용</span>
							</div>
						</c:forEach>
					</div>
					<div class='manage_FAQ_paging'>
						<button type='button' class='btnFirst'><i class="fa-solid fa-backward"></i></button>
						<button type='button' class='btnPrev'><i class="fa-solid fa-caret-left"></i></button>
						<button type='button' class='btnNext'><i class="fa-solid fa-caret-right"></i></button>
						<button type='button' class='btnLast'><i class="fa-solid fa-forward"></i></button>
					</div>
					<button type='button' class='btnManageFAQInsert' onclick='manage.FAQ_insert()'>추가</button>
					<button type='button' onclick='manage.FAQ_delete(this.form)'>삭제</button>
				</div>
			</form>
		</div>
	</body>
</html>