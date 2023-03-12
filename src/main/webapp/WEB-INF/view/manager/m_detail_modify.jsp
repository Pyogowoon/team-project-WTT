<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_detail_modify</title>
	</head>
	<body>
		<div id='m_detail_input'>
			<h1> 영화 / 시리즈 수정 </h1>
			<form name='frm_m_detail_input' id='frm_m_detail_input' method='post'>
				<input type='hidden' name='findStr' />
				
				<div id='insert'>
					<div id='poster'>
						<img class='loadImg' width="400" height="300">
					</div>
					<div id='videoInput'>
						<div id='videoInfo'>
							<label>serial : </label>
							<input type='text' name='serial'/>
							<button type='button' id='searchV'> 검색 </button><br/>
							<label>영상 제목 : </label>
							<input type='text' name='title'><br/>
							<label>시즌 : </label>
							<input type='text' name='sCnt'><br/>
							
							<label>회차 : </label>
							<input type='text' name='eCnt'><br/>
						</div>
						<div id='blank'></div>
						<div id='hengGwan'>
							<button type='button' class='addHeng' > 행 추가 </button>
							<button type='button' class='deleteHeng'> 선택 행 제거 </button>
						</div>
					</div>
				</div>
				<hr/>
				<div id='line'>
					<div class='vDetail' >
						<div class='ePoster'>
							<img class='epImg' width="120" height="80">
						</div>
						<div class='vDetailInfo'>
							<label> 포스터 변경 : </label>
							<input type='file' name='dPoster'/>
							<label class='dVid'> 영상 변경 : </label>
							<input type='file' name='dVid'/>
							<br/>
							<label>시즌 : </label>
							<input type='text' name='dSeason'>
							<span> / </span>
							<span> 회차 : </span>
							<input type='text' name='dEp'>
							<label>플레이 타임 : </label>
							<input type='text' name='playTime'>
							<input type='hidden' name='sno'> 
						</div>
						<div class='chkHeng'>
							<div></div>
							<input type="checkbox" class='hengNo' value=''/>
						</div>
					</div>
					
				</div>
				<div id='inbtns'>
					<button type='button'> 수정 </button>
					<button type='button' onclick='mDetail.select(this.form)'> 취소 </button>
					
				</div>
			</form>
		</div>
	</body>
</html>