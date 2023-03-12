<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/mypage.js'></script>
		<link rel='stylesheet' href='css/mypage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='mypage'>
			<form name='frm_mypage' class='frm_mypage' method='post'>
				<h1>마이페이지</h1>
				<input type='hidden' name='findStr' value='${findStr }'>
				<button type='button' class='btnUserEdit' onclick='mypage.user_edit()'>회원정보 설정</button><br/>
					<div class='user_edit' style='display:none'>
						<button type='button' onclick='mypage.user_modify(this.form)'>회원정보 수정</button><br/>
						<button type='button'>결제정보 수정</button><br/>
					</div>
				<button type='button' class='btnMylist' onclick='mypage.mylist(this.form)'>마이리스트</button><br/>
				<button type='button' class='btnFriendlist' onclick='mypage.friendlist(this.form)'>친구목록</button><br/>
				<button type='button' class='btnHelp' onclick='mypage.FAQ(this.form)'>고객센터</button><br/>
				<button type='button' class='btnContents' onclick='mypage.ask(this.form)'>컨텐츠신청</button><br/>
				<button type='button' class='btnUserSetting' onclick='mypage.user_setting()'>설정</button><br/>
					<div class='user_setting' style='display:none'>
						<label for='ala' class='alarm_setting' onclick='mypage.alarm()'>알람설정</label>
							<input type="checkbox" id='ala' name='alarm' value='on' checked='true'>
						<label for='ala' class='alarm_bell' onclick='mypage.alarm()'>
							<i class="fa-solid fa-bell"></i>
						</label>
						<label for='ala' class='alarm_bell' onclick='mypage.alarm()' style='display:none'>
							<i class="fa-solid fa-bell-slash"></i>
						</label><br/>
						<button type='button' onclick='mypage.signout(this.form)'>회원탈퇴</button><br/>
					</div>
			</form>
		</div>
	</body>
</html>