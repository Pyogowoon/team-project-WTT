<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>view title here</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/manage.js'></script>
		<link rel='stylesheet' href='css/manage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='FAQ_view'>
			<form name='frm_FAQ_view' class='frm_FAQ_view' method='post'>
				<input type='hidden' name='sno' value='${sno }'>
				<div class='FAQ_view_frame'>
					<h1>FAQ 상세보기</h1>
					<label>작성일</label>
					<input type='date' name='nal'/><br/>
					<label>제 목</label>
					<input type='text' name='subject' size='40'/><br/>
					
					<textarea name='mDoc' class='FAQ_view_doc'></textarea>
					
					<button type='button' class='btnFAQ_update' onclick='manage.FAQ_update(this.form)'>수정</button>
					<button type='button' onclick='manage.FAQ_cancel(this.form)'>취소</button>
				</div>
			</form>
		</div>
	</body>
</html>