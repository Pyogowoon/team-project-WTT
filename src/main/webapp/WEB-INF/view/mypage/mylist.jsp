<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix='spring' uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이리스트</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/mypage.js'></script>
		<link rel='stylesheet' href='css/mypage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='mylist'>
			<form name='frm_mylist' class='frm_mylist' method='post'>
				<input type='hidden' name='findStr' value='${findStr }'>
				<input type='hidden' name='sno'>
				<button type='button' class='back' onclick='mypage.mylist_back(this.form)'>
					<i class="fa-solid fa-reply"></i>
				</button>
				<h1 class='h1first'>찜한 목록</h1>
				<div class='wishlist'>
					<c:if test='${empty wishlist }'>
					<h3 class='wishlist_empty_box'><i class="fa-solid fa-box-open"></i></h3>
					<h1 class='wishlist_empty'>찜목록이 비었어요. <i class="fa-regular fa-face-sad-tear"></i></h1>
					</c:if>
					
					<c:forEach var='a' items='${wishlist }' end='7'>
						<div class='item'>
							<button type='button' value='${a.sno }' onclick='mypage.mylist_delete(this)'>
								<i class="fa-solid fa-xmark"></i>
							</button>
							<img src="${a.poster }"/>
							<span class='item_title'>${a.title }</span>
						</div>
					</c:forEach>
				</div>
				
				<h1>마이리스트</h1>
				<div class='wishlist'>
					<c:forEach var='b' items='${vaclist }' end='7'>
							<div class='item'>
								<img src="${b.poster }"/>
								<span class='item_title'>${b.title }</span>
							</div>
					</c:forEach>
				</div>
			</form>
		</div>
	</body>
</html>