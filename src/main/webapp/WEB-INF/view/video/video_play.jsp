<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${dEpTitle }</title>
		<link href="https://vjs.zencdn.net/7.19.2/video-js.css" rel="stylesheet" />
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<link rel='stylesheet' href='css/video_play.css'>
		<script src="https://cdn.jsdelivr.net/npm/silvermine-videojs-quality-selector@1.1.2/src/js/index.min.js"></script>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='video_play' >
			<form class='frm_video_play' name='frm_video_play' method='post'>
				<input type='hidden' name='findStr' value='${findStr }'>
				<input type='hidden' name='pCat'>
				<input type='hidden' name='pActor'>
				<input type='hidden' name='vSno' value='${vSno }'>
				<div class='video_contain' onmousemove='video_play.mousemove()'>
					<div class='adbuttons'>
						<div>
							<button type='button' onclick='video_play.back(this.form)'>
								<i class="fa-solid fa-arrow-left-long"></i>
							</button>
						</div>
						<div>
							<button type='button' onclick='video_play.ad_toggle("의류")'>
								<i class="fa-solid fa-shirt"></i>
							</button>
						</div>
						<div>
							<button type='button' onclick='video_play.ad_toggle("장소")'>
								<i class="fa-solid fa-map-location-dot"></i>
							</button>
						</div>
						<div class='video_flag' >
							<button type='button' onclick=''><i class="fa-regular fa-flag"></i></button>
						</div>
					</div>
					
					<video id="video2" class="video-js vjs-default-skin vjs-control-bar 
						vjs-big-play-centered vjs-quality-selector vjs-current-time" data-setup='{}'>
						<source src='https://d2b78kq3u9htod.cloudfront.net/${vDAtt.vSysFile }' type='video/mp4'>
						
					</video>
					
				</div>
				<div id='ads'>
					 
				</div>
			</form>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/5.15.0/videojs-contrib-hls.min.js"></script>
		<script src="https://vjs.zencdn.net/7.19.2/video.min.js"></script>
		<script src='js/video_play.js'></script>
	</body>
</html>