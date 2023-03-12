<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>광고</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<link rel='stylesheet' href='css/video_ad.css'>
	</head>
	<body>
		<div id='video_ad'>
			<form name='frm_video_ad' class='frm_video_ad' method='post'>
				<h1>${pCat }</h1>
				<div class='ads_items'>
				<c:forEach var='act' items='${actlist }'>
					<button type='button' value='${act.pActor }' onclick='ads.actor(this.value)'>
						${act.pActor }
					</button>
					<c:forEach var='ad' items='${vadlist }'>
						<c:if test='${ad.pActor == act.pActor }'>
							<div class='ads_item' value='${act.pActor }'>
								<a target='_blank' href='${ad.pUrl }'>
									<span class='ads_img'>
										<img src='pImg/${ad.pImg }'>
									</span>
									<span class='ads_title'>${ad.pName }</span>
								</a>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
				</div>
			</form>
		</div>
		<script src='js/video_ad.js'></script>
	</body>
</html>