<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>managersub_ask_list</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script defer src="./js/managersub.js"></script>
<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
<link rel='stylesheet' type='text/css' href='css/managersub.css'>
</head>
<body>
<div id='m_ask_list'><!--ㅇ 이름 가시성 있게 바꾸는게 좋음 -->
	<h1>영상 신청관리</h1>
	<form name='frm_m_ask' id='frm_m_ask' method='post'>
		<div class='zone'>
			<div class='chk_complete'>
				<label><input type='checkbox' name='테이블 컬럼명 입력' >미처리</label>
				<label><input type='checkbox' >처리중</label>
				<label><input type='checkbox' >처리완료</label>
			</div>
			<div class='search_zone'>
				<select class='sort'>
					<option>이름(▲)</option>
					<option>이름(▼)</option>
					<option>개봉년도(▲)</option>
					<option>개봉년도(▼)</option>
				</select>
				<span class='findStr'>
					<input type='search' id='findStr' style="border: none;"value='${page.findStr }' />
					<button type='button' onclick='ask.find(this.form)'><i class="fa-solid fa-magnifying-glass"></i></button>
				</span>
				<input type='hidden' name='nowPage' value='${page.nowPage }'/>
				<input type='hidden' name='sno'/>
			</div>
		</div>
	</form>
	<form name='frm_m_ask_list' id='frm_m_ask_list'>
		<div class='m_ask_list'><!-- 여기에 걸어주는게 아님 -->
			<div class='title'> <!-- flex는 여기 -->
				<span class='choice'>선택</span>
				<span class='sno'>No.</span>
				<span class='cTitle'>제목</span>
				<span class='cYear'>개봉년도</span>
				<span class='cGenre'>장르</span>
				<span class='con'>국가</span>
				<span class='complete'>처리결과</span>
			</div>
			<div class='items'><!-- 인라인블럭이 걸리면 행표시가 애매함 -->
				<c:forEach var='vo' begin='1' end='20'>
					<div class='item'>
						<span class='choice'>
							<input type='checkbox' class='ask_chk'/>
						</span>
						<span class='sno'>sno</span>
						<span class='cTitle'>cTitle</span>
						<span class='cYear'>cYear</span>
						<span class='cGenre'>cGenre</span>
						<span class='con'>con</span>
						<span class='complete'>처리결과</span>
					</div>
				</c:forEach>
			</div>
		</div>	
		<div class='btns'>
			<button type='button' onclick='ask.complete(this.form)'>처리완료</button>
			<button type='button' onclick='ask.delete(this.form)'>선택삭제</button>
		</div>
	</form>
</div>
</body>
</html>