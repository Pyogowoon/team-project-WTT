<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>친구 목록</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/mypage.js'></script>
		<link rel='stylesheet' href='css/mypage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='friendlist'>
			<form name='frm_friendlist' class='frm_friendlist' method='post'>
				<input type='hidden' id='findStr' name='findStr' value='${findStr }'>
				<button type='button' class='back' onclick='mypage.friendlist_back(this.form)'>
					<i class="fa-solid fa-reply"></i>
				</button>
				<h1>친구 목록</h1>
				<button type='button' onclick='mypage.friend_add()' class='btnFriendAdd'>
					<i class="fa-solid fa-notes-medical"></i>
				</button>
				<div class='friend_add' style='display:none'>
					<span class='input_emailC'></span><br/>
					<label>친구 이메일</label>
					<input type='email' name='fEmail' onkeyup='mypage.friend_emailC(this.form)'><br/>
					<label>친구 별명 설정</label>
					<input type='text' name='fNick'><br/>
					<button type='button' class='btnFriendAddR' onclick='mypage.friend_addR(this.form)'>추가</button>
					<button type='button' onclick='mypage.friend_cancel()'>취소</button>
				</div>
				<div class='friend_info_list' name='friend_info_list'>
					<c:forEach var='f' items='${flist }'>
						<div class='friend_info'>
							<span class='friend_name'>${f.fName }</span>
							<span class='friend_email'>${f.fEmail }</span>
							<span>(</span>
							<input type='text' name='fNick' class='friend_nick' value='${f.fNick }' 
								disabled="true" maxlength='7' oninput='mypage.maxlength(this)'>
							<span>)</span>
							<button type='button' class='btnFriendNickEdit'
								onclick='mypage.friend_nick_edit(this)'>
								<i class="fa-solid fa-pen-to-square"></i>
							</button>
							<button type='button' class='btnFriendNickEdit'
								onclick='mypage.friend_nick_editR(this)' style='display:none'>
								<i class="fa-solid fa-check"></i>
							</button>
							<input type='hidden' name='sno' value='${f.sno }'>
							<button type='button' class='btnFriendDelete' value='${f.sno }' 
								onclick='mypage.friend_delete(this)'>
								<i class="fa-solid fa-xmark"></i>
							</button>
						</div>
					</c:forEach>
				</div>
			</form>
		</div>
	</body>
</html>