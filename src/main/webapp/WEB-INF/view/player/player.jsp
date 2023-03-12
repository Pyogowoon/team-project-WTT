<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='./css/player.css'>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id='player'>
		<div id="start" class="flexbox">
			<span class='back' onclick='player.back()'><i class="fa-solid fa-chevron-left"></i></span>
			<span class='cloth' onclick='player.cloth()'><i class="fa-solid fa-shirt"></i></span>
			<span class='spot' onclick='player.spot()'><i class="fa-solid fa-location-pin"></i></span>
			<span class='chat' onclick='player.chat()'><i class="fa-solid fa-comment"></i></span>
			<span class='report' onclick='player.report()'><i class="fa-solid fa-flag"></i></span>
		</div>
		<div id="center" class="flexbox">
			웃어!
		</div>
		<div id="end" class="flexbox">
			아누성
		</div>
	</div>

</body>
</html>