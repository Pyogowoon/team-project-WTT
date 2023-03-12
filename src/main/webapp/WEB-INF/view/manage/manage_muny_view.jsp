<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>manage_muny_view</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/manage.js'></script>
		<link rel='stylesheet' href='css/manage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='manage_muny_view'>
			<form name='frm_manage_muny_view' class='frm_manage_muny_view' method='post'>
				<div class='manage_muny_view_frame'>
					<input type='hidden' name='num' value='${num }'>
					<input type='hidden' name='email' value='${email }'/>
					<h1>문의 내용</h1>
					<label>작성자</label>
					<input type='text' name='uName' readonly/><br/>
					<label>작성일</label>
					<input type='date' name='nal' readonly/><br/>
					<label>제 목</label>
					<input type='text' name='subject' size='40' readonly/><br/>
					
					<textarea name='mDoc' class='muny_doc' readonly></textarea>
					
					<button type='button' class='btnMunyConfirm' onclick='manage.muny_cancel(this.form)'>확인</button>
					<button type='button' onclick='manage.muny_deleteR(this.form)'>삭제</button>
				</div>
			</form>
		</div>
	</body>
</html>