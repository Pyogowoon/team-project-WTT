<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>m_ad_modify</title>
	</head>
	<body>
		<div id='m_ad_input'>
			<h1> 영상 광고 추가 </h1>
			<form name='frm_m_ad_input' id='frm_m_ad_input' method='post'>
				<input type='hidden' name='findStr' />
				
				<div id='insert'>
					<div id='poster'>
						<video src='videos/videoplayback.mp4' id='loadvideo' width="500" height="300" controls muted ></video>
					</div>
					<div id='vDetailZone'>
						<div id='vDetailInfo'>
							<h3>영상 제목</h3><hr/>
							<label> 영상 sno : </label>
							<input type='text' name='dSno' class='dSno'/>
							<button type='button' id='searchV'> 검색 </button><br/>
							<label> 시즌 : </label>
							<input type='text' name='dSeason'><br/>
							
							<label> 회차 : </label>
							<input type='text' name='dEp'><br/>
							<label> 회차 제목 : </label>
							<input type='text' name='dEptitle'><br/>
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
					<c:forEach var='vo' begin='1' end='4'>
						<div class='adZone' >
							<div class='ePoster'>
								<img class='epImg' width="120" height="80">
							</div>
							<div class='adInfo'>
								<label>사진 변경 : </label>
								<input type='file' name='pImg'/>
								<label class='pName'> 상품명 : </label>
								<input type='text' name='pName'/>
								<br/>
								<label>상품 분류 : </label>
								<select class='pCat' name='pCat' size='1'>
									<option> 의류 </option>
									<option> 장소 </option>
								</select>
								<span> 시간 : </span>
								<input type='text' class='pTime' name='pTime'>
								<button type='button' onclick='ad.play(this)'>입력</button>
								<label> 배우 : </label>
								<input type='text' class='pActor' name='pActor'><br/>
								<label> 상품 설명 : </label>
								<input type='text' class='pInfo' name='pInfo'>
								<label> 상품 설명 : </label>
								<input type='text' class='pUrl' name='pUrl'>
							</div>
							<div class='chkHeng'>
								<div></div>
								<input type="checkbox" class='hengNo' value=''/>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id='inbtns'>
					<button type='button'> 수정 </button>
					<button type='button' onclick='ad.select(this.form)'> 취소 </button>
					
				</div>
			</form>
		</div>
	</body>
</html>