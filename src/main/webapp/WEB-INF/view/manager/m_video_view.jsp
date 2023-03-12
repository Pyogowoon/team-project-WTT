<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_video_view</title>
	</head>
	<body>
		<div id='m_video_input'>
			<h1> 영화 / 시리즈 상세보기 </h1>
			<form name='frm_m_video_input' id='frm_m_video_input' method='post'>
				<input type='hidden' name='findStr' value = '${page.findStr }'>
				<input type='hidden' name='nowPage' value = ${page.nowPage }>
				<input type='hidden' name='serial' value='${vo.serial }'/>
				<div id='insert'>
					<div id='poster'>
						<img class='loadImg' src='./poster/${vAtt.pSysFile }' width="400" height="300">
					</div>
					<div id='videoInput1'>
						<label>분류 : </label>
						<input type='text' name='genre' value='${vo.genre }' readonly>
						<label>국가 : </label>
						<input type='text' name='country' value='${vo.country }' readonly>
						<label>타이틀 : </label>
						<input type='text' name='title' value='${vo.title }' readonly><br/>
						<label>카테고리 : </label>
						<input type='text' name='vCat' value='${vo.vCat }' readonly><br/>
						<label>관련태그 : </label>
						<input type='text' name='tag' value='${vo.tag }' readonly><br/>
						<label>총 시즌 : </label>
						<input type='text' name='sCnt' value='${vo.sCnt }' readonly><br/>
						<label>총 회차 : </label>
						<input type='text' name='eCnt' value='${vo.eCnt }' readonly><br/>
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
						<input type='text' name='teaser' value='${vAtt.tOriFile }'>
						<div class='btnDetailView'>
							<button type='button' onclick='mDetail.view2(${vo.serial})'> 세부정보 조회 </button>
						</div>
					</div>
				</div>
				<hr/>
				<div id='line'>
					<c:forEach var='vo' items='${infoList }'>
						<div class='seCnt' >
							<div class='chk'>
							</div>
							<div class='cntInfo'>
								<label>시즌 : </label>
								<input type='text' name='season' value='${vo.season }' readonly>
								<label> / </label>
								<label></label>
								<label>해당 시즌 회차 : </label>
								<input type='text' name='epCnt' value='${vo.epCnt }' readonly>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id='inbtns'>
					<button type='button' onclick='mVideo.modify(this.form)'> 수정 </button>
					<button type='button' onclick='mVideo.deleteOneR(this.form)'> 삭제 </button>
					<button type='button' onclick='mVideo.select(this.form)'> 취소 </button>
					
				</div>
			</form>
		</div>
	</body>
</html>