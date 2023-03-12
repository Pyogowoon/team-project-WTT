<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix='spring' uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 아이콘 링크입니다. -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<!--  얘는 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="./css/video_movie_detail.css">
<!--  부트스트랩 버튼 -->

<script defer
	src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"
	integrity="sha384-3LK/3kTpDE/Pkp8gTNp2gR/2gOiwQ6QaO7Td0zV76UFJVhqLl4Vl3KL1We6q6wR9"
	crossorigin="anonymous"></script>


<body class="onmouse_container">


	<form name='frm' id='frm_vDetail_vo' method='post'>
		<div id="mainContainer">
			<div style="text-align: center">
				<div id="previous">
					<a href="/"> <img src="./img/previous2.png"
						style="width: 70px; height: 60px; padding: 10px; margin-right: 80px">
					</a>
				</div>
				<video id="video1" width="700" height="500" autoplay muted loop>
					<source src="./teaser/${vo.tSysFile }" type="video/mp4" />
				</video>
			</div>

			<div class="mutebtn">
				<div class='unmute'
					onclick="document.getElementById('video1').muted = !document.getElementById('video1').muted;$(this).toggleClass('mute')"></div>
			</div>

			<div id="btnContainer">
				<c:choose>
					<c:when test='${vo.genre=="영화"}'>
						<button class='img_button' type='button'
							onclick='video.view(this.form)'></button>
					</c:when>
					<c:otherwise>
						<button class='img_button' type='button'
							onclick='video.view(this.form)' style="display: none"></button>
					</c:otherwise>
				</c:choose>

				<!-- 좋아요 버튼입니다. -->
				<button type='button' class="like-btn-svg"
					onclick='video.vLike(this.value)'></button>

				<button class='mark_button' type='button'></button>

				<button class='home_button' type='button'
					onclick='video.home(this.form)'></button>


				<!--  마이 리스트 -->



			</div>
			<input type="hidden" name="sno"/>
	</form>
	<div id="container">


		<div id='detail1'>

			<input type='hidden' name='serial' value='${vo.serial}'> <span
				class='vLike' name='vLike'>좋아요 : ${vo.vLike }</span> <span
				class='vYear' name='vYear'>${vo.vYear }</span> <span class='age'
				name='age'>${vo.age }</span> <span class='eCnt' name='eCnt'>${vo.eCnt }</span>
			<span class='hsd' name='hsd'>${vo.hsd }</span> <span class='title'
				name='title'>${vo.title } </span> <br />
			<!--  여기까진 video 테이블 영역 -->

			<!-- dEptitle, -->
		</div>
		<div id='detail2'>


			<span class='actor' name="actor">출연 : ${vo.actor }</span> <br /> <span
				class='genre' name='genre'>장르 : ${vo.genre }</span> <br /> <span
				class='tag' name='tag'>${vo.tag }</span> <br /> <span class='pd'
				name='pd'>감독 : ${vo.pd }</span>


		</div>
		 <select id="seasonSel" name='season' onchange="main.seasonView()">
			<!--frm.submit도 된다고함 -->
			<option value="0" selected>시즌선택</option>
			<c:forEach var="sea" items="${sList }">
				<option value="${sea.dSeason}"
					<c:if test="${sea.dSeason == seasonNo}">selected</c:if>>시즌
					${sea.dSeason }
			</c:forEach>
			</option>

		</select>

	</div>
	<!-- container -->
	</div>
	<!--  maincontainer -->



	<div id="select"></div>
	
	<c:if test="${seasonNo != 0 }">
		<H1>회차</H1>
	</c:if>
	<c:forEach var="deInfo" items="${dList }">
		<div class='hide_info' onclick="main.video2('${deInfo.sno}')">
			<div class='dEp'>
				<div class='item'>
					<span style='display: inline-block; height: 60px;'>${deInfo.dEp}</span>
					<!-- dep로 대체 하기 sno하면 골치아픔 순서안맞아서 -->
				</div>
				<span name='dPoster'> <img src="poster/${deInfo.dpSysFile }"
					style="width: 100px; height: 60px; margin-top: 15px; margin: 10px;">
				</span> <span name="playTime"> ${deInfo.playTime } </span> <span>${deInfo.dEptitle }</span>
			</div>


		</div>
		<!-- hide_info 의 div -->
	</c:forEach>



	<div class="cardContainer">
		<H2>요즘 인기있는 컨텐츠</H2>
		<div class="hero-container">
			<div class="main-container">
				<div class="poster-container">
					<a href="#"><img
						src="https://i.ibb.co/ThPNnzM/blade-runner.jpg" class="poster" /></a>
				</div>
				<div class="ticket-container">
					<div class="ticket__content">
						<h4 class="ticket__movie-title">Blade Runner 2049</h4>
						<p class="ticket__movie-slogan">영화설명란</p>
						<p class="ticket__current-price" name="title">${vo.title }</p>
						<p class="ticket__old-price">내용</p>
						<button class="ticket__buy-btn" onclick='video.view(this.form)'>보러
							가기</button>
					</div>
				</div>
			</div>

			<div class="main-container">
				<div class="poster-container">
					<a href="#"><img src="./img/moonknight.jpg" class="poster" /></a>
				</div>
				<div class="ticket-container">
					<div class="ticket__content">
						<h4 class="ticket__movie-title">Blade Runner 2049</h4>
						<p class="ticket__movie-slogan">설명들어가는 란</p>
						<p class="ticket__current-price">${vo.title }</p>
						<p class="ticket__old-price">내용</p>
						<button class="ticket__buy-btn" onclick='video.view(this.form)'>보러
							가기</button>
					</div>
				</div>
			</div>

			<div class="main-container">
				<div class="poster-container">
					<a href="#"><img
						src="https://i.ibb.co/Zd51z5c/justice-league.jpg" class="poster" /></a>
				</div>
				<div class="ticket-container">
					<div class="ticket__content">
						<h4 class="ticket__movie-title">Justice League</h4>
						<p class="ticket__movie-slogan">You can't save the world
							alone.</p>
						<p class="ticket__current-price">${vo.title }</p>
						<p class="ticket__old-price">내용</p>
						<button class="ticket__buy-btn" onclick='video.view(this.form)'>보러
							가기</button>
					</div>
				</div>
			</div>

		</div>
		<div class="cardContainer">

			<div class="hero-container">
				<div class="main-container">
					<div class="poster-container">
						<a href="#"><img
							src="https://i.ibb.co/ThPNnzM/blade-runner.jpg" class="poster" /></a>
					</div>
					<div class="ticket-container">
						<div class="ticket__content">
							<h4 class="ticket__movie-title">Blade Runner 2049</h4>
							<p class="ticket__movie-slogan">영화설명란</p>
							<p class="ticket__current-price" name="title">${vo.title }</p>
							<p class="ticket__old-price">내용</p>
							<button class="ticket__buy-btn" onclick='video.view(this.form)'>보러
								가기</button>
						</div>
					</div>
				</div>

				<div class="main-container">
					<div class="poster-container">
						<a href="#"><img src="./img/moonknight.jpg" class="poster" /></a>
					</div>
					<div class="ticket-container">
						<div class="ticket__content">
							<h4 class="ticket__movie-title">Blade Runner 2049</h4>
							<p class="ticket__movie-slogan">설명들어가는 란</p>
							<p class="ticket__current-price">소제목</p>
							<p class="ticket__old-price">내용</p>
							<button class="ticket__buy-btn" onclick='video.view(this.form)'>보러
								가기</button>
						</div>
					</div>
				</div>

				<div class="main-container">
					<div class="poster-container">
						<a href="#"><img
							src="https://i.ibb.co/Zd51z5c/justice-league.jpg" class="poster" /></a>
					</div>
					<div class="ticket-container">
						<div class="ticket__content">
							<h4 class="ticket__movie-title">Justice League</h4>
							<p class="ticket__movie-slogan">You can't save the world
								alone.</p>
							<p class="ticket__current-price">소제목</p>
							<p class="ticket__old-price">내용</p>
							<button class="ticket__buy-btn" onclick='video.view(this.form)'>보러
								가기</button>
						</div>
					</div>
				</div>

			</div>

		</div>


		</form>
	</div>


	<script type="text/javascript">
	/*
		$(document).ready(function() {

		//	$('#seasonSel').change(function() {
				
				
				var result = 	$("#seasonSel option:selected").val();
					if (result == 1){
						
						$('.hide_info').css('display','block');
						$('.hide_info2').css('display','none');
						$('.hide_info3').css('display','none');
						
					}else if(result == 2){
					
						$('.hide_info').css('display','none');
						$('.hide_info2').css('display','block');
						$('.hide_info3').css('display','none');
						
					}else if(result == 3){
						$('.hide_info').css('display','none');
						$('.hide_info2').css('display','none');
						$('.hide_info3').css('display','block');
						
					}else{
						$('.hide_info').css('display','none');
						$('.hide_info2').css('display','none');
						$('.hide_info3').css('display','none');
						
				};
				 

			//});
		});


		video.view = function(frm) {
			frm.action = 'video_detail';
			frm.submit();
		}
		video.home = function(frm) {
			frm.action = '/';
			frm.submit();
		}
		*/
		$('.like-btn-svg').on('click', function() {
			$(this).toggleClass('animate');
		});

		function unmute() {
			const player = document.getElementById("video1");
			player.muted = false;

		}
		function mute() {
			const player = document.getElementById("video1");
			player.muted = true;

		}
		
	</script>




</body>
</html>