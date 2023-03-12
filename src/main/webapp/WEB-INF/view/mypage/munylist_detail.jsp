<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문의 내용</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/mypage.js'></script>
		<link rel='stylesheet' href='css/mypage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='munylist_detail'>
			<form name='frm_munylist_detail' class='frm_munylist_detail' method='post'>
				<button type='button' class='back' onclick='mypage.muny_detail_back(this.form)'>
					<i class="fa-solid fa-reply"></i>
				</button>
				<div class='munylist_detail_frame'>
					<input type='hidden' name='num' value='${MunyVo.num }'>
					<input type='hidden' name='findStr' value='${MypagePage.findStr }'>
					<input type='hidden' name='email' value='${sessionScope.email }'/>
					<h1>문의 내용</h1>
					<span class='t'>작성자</span>
					<c:if test='${empty MunyVo.manager }'>
						<span class='detail_uName'>${MunyVo.uName }</span><br/>
					</c:if>
					<c:if test='${not empty MunyVo.manager }'>
						<span class='detail_manager'>${MunyVo.manager }</span><br/>
					</c:if>
					<span class='t'>작성일</span>
					<span class='detail_nal'>${MunyVo.nal }</span><br/>
					<span class='t'>제 목</span>
					<span class='detail_mTitle'>${MunyVo.mTitle }</span><br/>
					
					<textarea name='mDoc' class='muny_doc' readonly>${MunyVo.mDoc }</textarea>
					
					<button type='button' class='btnMunyConfirm' onclick='mypage.muny_detail_back(this.form)'>확인</button>
					<button type='button' onclick='mypage.munylist_delete(this.form)'>삭제</button>
				</div>
			</form>
		</div>
	</body>
</html>