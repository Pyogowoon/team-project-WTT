<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix='spring' uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WTT</title>
<!-- MAIN이 사용하던 영역들 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet' href='css/main.css'>
<!-- MAIN이 사용하던 영역들 -->

<!-- Popup Overlay 하기위해 가져온 영역 -->
<link rel='stylesheet' href='css/video_movie_detail.css'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"
	integrity="sha384-3LK/3kTpDE/Pkp8gTNp2gR/2gOiwQ6QaO7Td0zV76UFJVhqLl4Vl3KL1We6q6wR9"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/32ac011196.js"
	crossorigin="anonymous"></script>
<!-- Popup Overlay 하기 위해 가져온 영역 -->


</head>
<body>
	<div id='main'>
		<form name='frm_main' class='frm_main' method='post'>
			<div class='user-main'>
				<img src="<spring:url value='/upload/compose.jpg'/>" />
			</div>
			<h2>오늘의 오마카세 추천</h2>
			<div class='user-hot'>

				<div class='today'>
					<button type="button" id="moveLeft" class="btn-nav">◀</button>


	<c:forEach items="${VideoVo }" var='vo'>
					<div class='item' onmouseover="playPause(this)"
						onmouseout="playPause(this)">


						<input type='hidden' name='serial' value="${vo.serial }">
						<video  class='video1' muted style='display: none'>

							<source src="./teaser/${vo.tSysFile }" type="video/mp4">
						</video>

						<span class='poster'><img src='poster/${vo.pSysFile }'></span> <span
							class='item_title'>${vo.title }</span>

						<div class="description" role="alert">


							<div class="description__buttons-container">
								<div class="description__button" onclick='main.video(this.form)'>
									<i class="fas fa-play"></i></a>
								</div>
								<div class="description__button">
									<i class="fas fa-plus"></i>
								</div>
								<button type='button' class="description__button" id="sangse"
									onclick="main.on('${vo.serial }')">
									<i class="fas fa-chevron-down"></i>
								</button>

							</div>

							<!-- 텍스트 영역 -->
							<div class="description__text-container">
								<span class="description__match">97% 좋아요!</span> <span
									class="description__rating">14</span> <span
									class="description__length">02:11:17</span> <br>
								<br>
								<!--  그 태그같은거고 middot 가운데에 점 쓰는거  -->
								<span>#울고싶어요</span> <span>&middot;</span> <span>#비오는날엔</span> <span>&middot;</span>
								<span>#가족</span>
							</div>
							<!-- 호버 시 예고편을 불러와야 할것 같음, 작업 해봐야 함  -->
						</div>

					</div>
					</c:forEach>
					
					<button type="button" id="moveRight" class="btn-nav">▶</button>
				</div>



			</div>

			<!-- 2번째 카테고리 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<h2>오늘의 오마카세 추천</h2>
			<div class='user-hot2'>

				<div class='today2'>
					<button type="button" id="moveLeft2" class="btn-nav">◀</button>
					<div class='item2'>
						<img src="<spring:url value='/upload/브로커.jpg'/>" /> <span
							class='item_title2'>브로커</span>
						<div class="description" role="alert">
							<div class="description__buttons-container">
								<div class="description__button">
									<i class="fas fa-play" onclick='main.video()'></i>
								</div>
								<div class="description__button">
									<i class="fas fa-plus"></i>
								</div>


							</div>

							<!-- 텍스트 영역 -->
							<div class="description__text-container">
								<span class="description__match">97% 좋아요!</span> <span
									class="description__rating">14</span> <span
									class="description__length">02:11:17</span> <br>
								<br>
								<!--  그 태그같은거고 middot 가운데에 점 쓰는거  -->
								<span>#울고싶어요</span> <span>&middot;</span> <span>#비오는날엔</span> <span>&middot;</span>
								<span>#가족</span>
							</div>
							<!-- 호버 시 예고편을 불러와야 할것 같음, 작업 해봐야 함  -->
						</div>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/탑건 매버릭.jpg'/>" /> <span
							class='item_title'>탑건 매버릭</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/범죄도시2.jpg'/>" /> <span
							class='item_title'>범죄도시2</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/더 배트맨.jpg'/>" /> <span
							class='item_title'>더 배트맨</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/스파이더맨 노웨이홈.jpg'/>" /> <span
							class='item_title'>스파이더맨 노웨이홈ㅁㅁㅁ</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/닥터스트레인지.jpg'/>" /> <span
							class='item_title'>닥터스트레인지</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/듄.jpg'/>" /> <span
							class='item_title'>듄</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/언차티드.jpg'/>" /> <span
							class='item_title'>언차티드</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/탑건 매버릭.jpg'/>" /> <span
							class='item_title'>탑건 매버릭</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/범죄도시2.jpg'/>" /> <span
							class='item_title'>범죄도시2</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/더 배트맨.jpg'/>" /> <span
							class='item_title'>더 배트맨</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/스파이더맨 노웨이홈.jpg'/>" /> <span
							class='item_title'>스파이더맨 노웨이홈ㅁㅁㅁ</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/닥터스트레인지.jpg'/>" /> <span
							class='item_title'>닥터스트레인지</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/듄.jpg'/>" /> <span
							class='item_title'>듄</span>
					</div>
					<div class='item2'>
						<img src="<spring:url value='/upload/언차티드.jpg'/>" /> <span
							class='item_title'>언차티드</span>
					</div>
					<button type="button" id="moveRight2" class="btn-nav">▶</button>
				</div>

				<div id='popup'></div>
			</div>

		</form>
	</div>
	<script src='js/main.js'></script>

</body>
</html>