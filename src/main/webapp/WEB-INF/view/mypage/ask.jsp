<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>컨텐츠 신청</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/mypage.js'></script>
		<link rel='stylesheet' href='css/mypage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='ask'>
			<form name='frm_ask' class='frm_ask' method='post'>
				<input type='hidden' name='findStr' value='${findStr }'>
				<button type='button' class='back' onclick='mypage.ask_back(this.form)'>
					<i class="fa-solid fa-reply"></i>
				</button>
				<div class='ask_frame'>
					<h1>컨텐츠 신청</h1>
					<label>제목</label>
					<input type='text' name='cTitle' class='title' value='닥터스트레인지 대혼돈의 멀티버스'><br/>
					<label>개봉(방영) 연도</label>
					<input type='month' name='cYear' onclick=''><br/>
					<label>장르</label>
					<input type='text' name='cGenre'><br/>
					<label>국가</label>
					<input type='text' name='con'><br/>
					<input type='hidden' name='cId' value='${id }'>
					<button type='button' onclick='mypage.askR(this.form)' class='btnAskR'>신 청</button>
					<button type='button' onclick='mypage.cancel(this.form)'>취 소</button>
				</div>
				
			</form>
		</div>
		<script>
			let frm = $('.frm_ask')[0];
			frm.cYear.value = new Date().toISOString().slice(0, 7);
		</script>
		
	</body>
</html>