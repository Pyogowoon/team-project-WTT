<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_video_modify</title>
	</head>
	<body>
		<div>
			<div id='m_video_input'>
				<h1> 영화 / 시리즈 수정 </h1>
				<form name='frm_m_video_input' id='frm_m_video_input' method='post'>
					<input type='hidden' name='serial' value='${vo.serial }'/> 
					<div id='insert'>
						<div id='poster'>
							<img class='loadImg' src='./poster/${vAtt.pSysFile }' width="400" height="300">
						</div>
						<div id='videoInput1'>
							<div class='btnPoster'>
								<button type='button' onclick='mVideo.addPoster()'> 포스터 변경 </button><br/>
							</div>
							<label>분류 : </label>
							<label><input type="radio" name='genre' value='영화'> 영화 </label>
							<label><input type="radio" name='genre' value='시리즈'> 시리즈 </label><br/>
							<label>국가 : </label>
							<label><input type="radio" name='country' value='국내'> 국내 </label>
							<label class='set1'><input type="radio" name='country' value='해외' > 해외 </label><br/>
							<label>타이틀 : </label>
							<input type='text' name='title' value='${vo.title }'><br/>
							<label>카테고리 : </label>
							<input type='text' name='vCat' value='${vo.vCat }'><br/>
							<label>관련태그 : </label>
							<input type='text' name='tag' value='${vo.tag }'><br/>
							<label>총 시즌 : </label>
							<input type='text' name='sCnt' value='${vo.sCnt }'><br/>
							<label>총 회차 : </label>
							<input type='text' name='eCnt' value='${vo.eCnt }'><br/>
							<button type='button' class='addHeng' onclick='mVideo.addHeng2()'> 행 추가 </button>
							<input type='file' style='display : none' class='poster' onchange='mVideo.loadImg2(this) ' accept="image/*">
							<input type='hidden' name='pSysFile' class='pSysFile' value='${vAtt.pSysFile }'/>
							<input type='hidden' name='posterDelete' value='${vAtt.pSysFile }'/>
						</div>
						<div id='videoInput2'>
							<label>날씨 정보 : </label>
							<input type='text' name='weather' value='${vo.weather }'><br/>
							<label>개봉 시기 : </label>
							<input type='month' name='vYear' value='${vo.vYear }'><br/>
							<label>해상도 : </label>
							<input type='text' name='hsd' value='${vo.hsd }'><br/>
							<label>관람등급 : </label>
							<input type='text' name='age' value='${vo.age }'><br/>
							<label>감독 : </label>
							<input type='text' name='pd' value='${vo.pd }'><br/>
							<label>출연진 : </label>
							<input type='text' name='actor' value='${vo.actor }'><br/>
							<label>예고편 : </label>
							<input type='text' name='teaser' class='teaserName' value='${vAtt.tOriFile }'>
							<div class='btnTeaser'>
								<button type='button' onclick='mVideo.addTeaser()'> 첨부 </button><br/>
							</div>
							<input type='hidden' name='tSysFile' class='tSysFile' value='${vAtt.tSysFile }'>
							<input type='hidden' name='teaserDelete' value='${vAtt.tSysFile }'/>
							<input type='file' style='display:none'  class='teaser' onchange='mVideo.loadTeaser2(this)' accept="video/*">
							<button type='button' class='deleteHeng' onclick='mVideo.deleteHeng2()'> 선택 행 제거 </button>
						</div>
					</div>
					<hr/>
					</form>
					<form name='frm_m_seasonInfo' id='frm_m_seasonInfo' method='post'>
						<input type='hidden' name='findStr' value = '${page.findStr }'>
						<input type='hidden' name='nowPage' value = '${page.nowPage }'>
						<input type='hidden' name='serial' value='${vo.serial }'/> 
						<div id='line'>
							<c:set var='p' value='0'/>
							<c:forEach var='vo' items='${infoList }'>
								<div class='seCnt modifyInfo' >
									<div class='chk'>
										<input type="checkbox" class='hengNo' value=''/>
									</div>
									<div class='cntInfo'>
										<input type='hidden' name='seasonModifyList[${p }].sno' class='sno' value='${vo.sno }'>
										<label>시즌 : </label>
										<input type='text' name='seasonModifyList[${p}].season' class='season modifySeason' value='${vo.season }'>
										<label> / </label>
										<label></label>
										<label>해당 시즌 회차 : </label>
										<input type='text' name='seasonModifyList[${p}].epCnt' class='epCnt modifyEpCnt' value='${vo.epCnt }'>
									</div>
									<div class='mbtn'>
										<button type='button' class='modifyOne' onclick='mVideo.seasonInfoModifyOne(this)'> 단일<br/> 수정 </button>
									</div>
								</div>
								<c:set var='p' value='${p=p+1 }'/>
							</c:forEach>
						</div>
					<div id='inbtns'>
						<button type='button' onclick='mVideo.modifyR(this.form)'> 수정 </button>
						<button type='button' onclick='mVideo.deleteOneR(this.form)'> 삭제 </button>
						<button type='button' onclick='mVideo.select(this.form)'> 취소 </button>
						
					</div>
				</form>
			</div>
		</div>
		<script>
			$('#frm_m_video_input')[0].genre.value=`${vo.genre}`;	
			$('#frm_m_video_input')[0].country.value=`${vo.country}`;
		</script>
	</body>
</html>