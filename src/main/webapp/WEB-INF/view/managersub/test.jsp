<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test</title>
		
		<style>
			#yap {
				width : 200px;
				height : 200px;
				border:2px outset #000;
				display : none;
			}
			#mouse{
				width : 1200px;
				height : 900px;
				border:2px outset #000;
			}
		</style>
	</head>
	<body>
		<h1>테스트다용</h1>
		<div id='yap'> 이영역은 테스트 영역입니다. 주원이 잘생김</div>
		<div id='mouse' onmousemove="test1()">이 영역에 마우스를 움직여보세요 슈발</div>
		
		<script src='js/test.js'></script>
	</body>
</html>