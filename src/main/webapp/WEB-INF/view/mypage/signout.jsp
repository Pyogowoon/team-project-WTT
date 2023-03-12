<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/mypage.js'></script>
		<link rel='stylesheet' href='css/mypage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='signout'>
			<form name='frm_signout' class='frm_signout' method='post' onchange='mypage.click_change()'>
				<input type='hidden' name='findStr' value='${findStr }'>
				<button type='button' class='back' onclick='mypage.signout_back(this.form)'>
					<i class="fa-solid fa-reply"></i>
				</button>
				<div class='signout_frame'>
					<h1>회원 탈퇴</h1><hr/>
					<h2>그동안 감사드립니다.</h2>
					<h2>정말 떠나시는 건가요?</h2>
					<h4 class='h4first'>계정을 삭제하시려는 이유를 말씀해주세요.</h4>
					<h4 class='h4second'>제품 개선에 중요 자료로 활용하겠습니다.</h4>
					
					<label><input type='radio' name='signout_reason' value='기록 삭제 목적'> 기록 삭제 목적</label><br/>
					<label><input type='radio' name='signout_reason' value='사용이 불편해요'> 사용이 불편해요</label><br/>
					<label><input type='radio' name='signout_reason' value='사용 빈도가 낮아서'> 사용 빈도가 낮아서</label><br/>
					<label><input type='radio' name='signout_reason' value='컨텐츠 불만'> 컨텐츠 불만</label><br/>
					<label><input type='radio' name='signout_reason' value='가격이 적정하지 않아서'> 가격이 적정하지 않아서</label><br/>
					<label><input type='radio' name='signout_reason' value='기타'>
						<input type='text' name='signout_reasonText' value='기타' onfocus='mypage.click_other(this.form)'><br/>
					</label>
					<h4>계정 삭제시 회원님의 모든 컨텐츠와 활동기록, 충전내역이 삭제됩니다.</h4>
					<h4>해당 정보는 복구할 수 없으니 신중히 결정해주세요.</h4>
					
					<h4 class='h4third'>사용중인 비밀번호</h4>
					<span class='signout_error'></span>
					<input type='password' name='pwd' id='pwdChk' onclick='mypage.click_change()'>
					<button type='button' class='btnSignout' onclick='mypage.signoutR(this.form)'>회원탈퇴</button><br/>
					<button type='button' class='btnSignoutCancel' onclick='mypage.cancel()'>취소</button>
				</div>
			</form>
		</div>
	</body>
</html>