<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_video_input</title>
	</head>
	<body>
		<div>
			<div id='m_video_input'>
				<h1> 영화 / 시리즈 추가 </h1>
				<form name='frm_m_video_input' id='frm_m_video_input' method='post'>
					<div id='insert'>
						<div id='poster'>
							<img class='loadImg' width="400" height="300">
						</div>
						<div id='videoInput1'>
							<div class='btnPoster'>
								<button type='button' onclick='mVideo.addPoster()'> 포스터 추가 </button><br/>
							</div>
							<label>분류 : </label>
							<label><input type="radio" name='genre' value='영화' checked="checked"> 영화 </label>
							<label><input type="radio" name='genre' value='시리즈'> 시리즈 </label><br/>
							<label>국가 : </label>
							<label><input type="radio" name='country' value='국내' checked="checked"> 국내 </label>
							<label class='set1'><input type="radio" name='country' value='해외' > 해외 </label><br/>
							<label>타이틀 : </label>
							<input type='text' name='title' value='wtt : 반격의 서막'><br/>
							<label>카테고리 : </label>
							<input type='text' name='vCat' value='액션'><br/>
							<label>관련태그 : </label>
							<input type='text' name='tag' value='액션,긴장감,긴박함'><br/>
							<label>총 시즌 : </label>
							<input type='text' name='sCnt' value='20'><br/>
							<label>총 회차 : </label>
							<input type='text' name='eCnt' value='20'><br/>
							<button type='button' class='addHeng' onclick='mVideo.addHeng()'> 행 추가 </button>
							<input type='file' style='display : none' name='poster' class='poster' onchange='mVideo.loadImg(this) ' accept="image/*">
						</div>
						<div id='videoInput2'>
							<label>날씨 정보 : </label>
							<input type='text' name='weather' value='비,흐림'><br/>
							<label>개봉 시기 : </label>
							<input type='month' name='vYear'><br/>
							<label>해상도 : </label>
							<input type='text' name='hsd' value='FHD,UHD'><br/>
							<label>관람등급 : </label>
							<input type='text' name='age' value='19+'><br/>
							<label>감독 : </label>
							<input type='text' name='pd' value='안우성'><br/>
							<label>출연진 : </label>
							<input type='text' name='actor' value='안우성,표성현,배근영,정주원'><br/>
							<label>예고편 : </label>
							<input type='text' name='teaserName' class='teaserName'>
							<div class='btnTeaser'>
								<button type='button' onclick='mVideo.addTeaser()'> 첨부 </button><br/>
							</div>
							<input type='file' style='display:none' name='teaser' class='teaser' onchange='mVideo.loadTeaser(this)' accept="video/*">
							<button type='button' class='deleteHeng' onclick='mVideo.deleteHeng()'> 선택 행 제거 </button>
						</div>
					</div>
					<hr/>
				</form>
				<form name='frm_m_seasonInfo' id='frm_m_seasonInfo' method='post'>
					<input type='hidden' name='findStr' value = '${page.findStr }'>
					<input type='hidden' name='nowPage' value = ${page.nowPage }>
					<div id='line'>
					
					</div>
					<div id='inbtns'>
						<button type='button' onclick='mVideo.insertR(this.form)'> 저장 </button>
						<button type='button' onclick='mVideo.select(this.form)'> 취소 </button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>