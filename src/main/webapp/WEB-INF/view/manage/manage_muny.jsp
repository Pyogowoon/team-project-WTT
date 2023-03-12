<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>manage_muny</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/manage.js'></script>
		<link rel='stylesheet' href='css/manage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='manage_muny'>
			<form class='frm_manage_muny' name='frm_manage_muny' method='post'>
				<input type='hidden' name='num'>
				<h1>1:1문의 관리</h1>
				<div class='manage_muny_frame'>
					<div class='manage_muny_title'>
						<span class='chk'>체크</span>
						<span class='subject'>제목</span>
						<span class='uName'>작성자</span>
						<span class='rSno'>답변여부</span>
					</div>
					<div class='manage_muny_items'>
						<c:forEach var='a' begin='1' end='10'>
							<div class='manage_muny_item' onclick='manage.muny_view(${a})'>
								<span><input type='checkbox' name='muny_chkbox' class='chk' value='${num }'></span>
								<span class='subject'>제목</span>
								<span class='uName'>작성자</span>
								<span class='rSno'>X</span>
							</div>
						</c:forEach>
					</div>
					<div class='manage_muny_paging'>
						<button type='button' class='btnFirst'><i class="fa-solid fa-backward"></i></button>
						<button type='button' class='btnPrev'><i class="fa-solid fa-caret-left"></i></button>
						<button type='button' class='btnNext'><i class="fa-solid fa-caret-right"></i></button>
						<button type='button' class='btnLast'><i class="fa-solid fa-forward"></i></button>
					</div>
					<button type='button' onclick='manage.muny_delete(this.form)'>삭제</button>
				</div>
			</form>
		</div>
	</body>
</html>