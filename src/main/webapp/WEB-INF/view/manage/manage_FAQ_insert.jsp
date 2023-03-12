<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
		
		<link rel='stylesheet' href='css/manage.css'>
		<script src='js/manage.js'></script>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='FAQ_insert'>
			<form name='frm_FAQ_insert' class='frm_FAQ_insert' method='post'>
				<div class='FAQ_insert_frame'>
					<h1>FAQ 추가</h1>
					<label>작성일</label>
					<input type='date' name='nal'/><br/>
					<label>제 목</label>
					<input type='text' name='subject' size='40'/><br/>
					
					<textarea name='mDoc' id='summernote'></textarea>
					
					<button type='button' class='btnFAQ_insertR' onclick='manage.FAQ_insertR(this.form)'>추가</button>
					<button type='button' onclick='manage.FAQ_cancel(this.form)'>취소</button>
				</div>
			</form>
		</div>
		
		<script>
			manage.init();
			let frm = $('.frm_FAQ_insert')[0];
			frm.nal.valueAsDate = new Date();
		</script>
	</body>
</html>