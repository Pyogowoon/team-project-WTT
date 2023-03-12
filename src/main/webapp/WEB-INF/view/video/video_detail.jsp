<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- End Google Tag Manager -->
<meta charset="utf-8">
<title>Browse</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="A Netflix ui design  by mehul ">

<meta name="theme-color" content="#060404 " />
<link rel="icon" href="/img/utt_imsi.png">
<!--  작업표시줄 아이콘 -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script defer
	src="https://use.fontawesome.com/releases/v5.1.0/js/all.js"
	integrity="sha384-3LK/3kTpDE/Pkp8gTNp2gR/2gOiwQ6QaO7Td0zV76UFJVhqLl4Vl3KL1We6q6wR9"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="./css/video_detail.css">
</head>
<body class='body_body' data-smooth-scroll-offset="73">
	<div class="movie_detail_container">


		<!-- 메인 비디오  -->
		<form name='frm_detail' class='frm_detail' method='post'>
			<input type='hidden' name='sno' value='${vo.sno }'>
				<header class="header_head">
					<div class="overlay"></div>

					<video playsinline="playsinline" id="track" controls autoplay muted>
						<source src='../videos/${vo.vSysFile }' type="video/mp4">
					</video>


					<div class="container  w-100">
						<div class="d-flex  w-100">
							<div class="row">
								<div class="col-10">
									<a href="javascript:history.back()"> <img
										src="./img/previous2.png"
										style="width: 70px; height: 60px; padding: 10px; margin-right: 80px">
									</a> <img src="../poster/${vo.dpSysFile }"
										class="rounded float-left imt " alt="...">
									<p class="fonts title">
										시즌${vo.dSeason }
										<button type="button" class="btn ml-1 bt1 "></button>
										<span style="font-size: 2em;" data-toggle="tooltip"
											data-placement="top"
											title="Audio Description is available for some episodes"
											class="mt-3"> </span>
										</button>
									</p>
									<p class="fonts">${vo.dEptitle }
										<br /> <br /> <br />
									<div class="btn-toolbar" role="toolbar"
										aria-label="Toolbar with button groups">

										<div class="btn-group" role="group" aria-label="Third group">

											<button type="button" class="btn  mr-3 bt"
												onclick='video.play(this.form)'>
												<i class="fas fa-play ic"></i> 플레이
											</button>

										</div>
										<div class='heart'>
											<div class="like-btn-svg"></div>
										</div>
										<button class='home_button' type='button'
											onclick='video.home(this.form)'></button>
									</div>




									<div class="btn-group mt-2 " role="group"
										aria-label="Third group">


										<div class='unmute'
											onclick="document.getElementById('track').muted = !document.getElementById('track').muted;$(this).toggleClass('mute')">
											</div>
									</div>

								</div>

							</div>
	</div>

	</div>
	</header>

</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-2.2.4.min.js"
		type="text/javascript"></script>
	<script
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="https://kit.fontawesome.com/f50700485d.js"
		crossorigin="anonymous"></script>




	<script type="text/javascript">
		let video = {};
		function unmute() {
			const player = document.getElementById("player");
			player.muted = false;

		}
		function mute() {
			const player = document.getElementById("player");
			player.muted = true;

		}

		$('.like-btn-svg').on('click', function() {
			$(this).toggleClass('animate');
		});
		$('.btn-group').on('click', function() {
			$(this).toggleClass('animate');
		});

		video.home = function(frm) {
			frm.action = '/';
			frm.submit();
		}
		video.play = function(frm) {
			frm.action = 'video_play'
			frm.submit();
		}
	</script>

</body>

</html>
