<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1 문의</title>
		
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		
		<link rel='stylesheet' href='css/mypage.css'>
		<script src='js/mypage.js'></script>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
		
	</head>
	<body>
		<div id='muny'>
			<form name='frm_muny' class='frm_muny' method='post' onchange='mypage.muny_change()'>
				<button type='button' class='back' onclick='mypage.muny_detail_back(this.form)'>
					<i class="fa-solid fa-reply"></i>
				</button>
				<div class='muny_frame'>
					<h1>1:1 문의하기</h1>
					<span class='muny_error'>제목과 내용을 입력해주세요.</span>
					<label>작성일</label>
					<input type='hidden' name='findStr' value='${MypagePage.findStr }'>
					<input type='date' name='nal' onclick='mypage.muny_change()'/><br/>
					<label>제 목</label>
					<input type='text' name='mTitle' size='40' onclick='mypage.muny_change()'/><br/>
					
					<textarea name='mDoc' id='summernote' ></textarea>
					
					<button type='button' class='btnMunyR' onclick='mypage.munyR(this.form)'>문의하기</button>
					<button type='button' class='btnMunyCan' onclick='mypage.muny_detail_back(this.form)'>취소</button>
				</div>
			</form>
		</div>
		
		<script>
			mypage.init();
			let frm = $('.frm_muny')[0];
			frm.nal.valueAsDate = new Date();
		</script>
		
	</body>
</html>