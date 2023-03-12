<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_detail_view</title>
	</head>
	<body>
		<div id='m_detail_input'>
			<h1> 영상 세부정보 상세보기 </h1>
			<form name='frm_m_detail_input' id='frm_m_detail_input' method='post'>
				<input type='hidden' name='findStr' />
				
				<div id='insert'>
					<div id='poster'>
						<img class='loadImg' width="400" height="300">
					</div>
					<div id='videoInput'>
						<div id='videoInfo'>
							<div id='blank'></div>
							<label>serial : </label>
							<input type='text' name='serial' readonly/><br/>
							<label>영상 제목 : </label>
							<input type='text' name='title' readonly><br/>
							<label>총 시즌 : </label>
							<input type='text' name='sCnt' readonly><br/>
							
							<label>총 회차 : </label>
							<input type='text' name='eCnt' readonly><br/>
						</div>
					</div>
				</div>
				<hr/>
				<div id='line'>
					<c:forEach var='vo' begin='1' end='3'>
						<div class='vDetail' >
							<div class='ePoster'>
								<img class='epImg' width="120" height="80">
							</div>
							<div class='vDetailInfo'>
								<label> 포스터 파일 : </label>
								<input type='text' name='dPoster' readonly/>
								<label class='dVid'> 영상 파일 : </label>
								<input type='text' name='dVid' readonly/>
								<br/>
								<label> 시즌 : </label>
								<input type='text' name='dSeason' readonly>
								<span> / </span>
								<span> 회차 : </span>
								<input type='text' name='dEp' readonly>
								<label>플레이 타임 : </label>
								<input type='text' name='playTime' readonly>
							</div>
						</div>		
					</c:forEach>
					
				</div>
				<div id='inbtns'>
					<button type='button' onclick='mDetail.modify(this.form)'> 수정 </button>
					<button type='button'> 삭제 </button>
					<button type='button' onclick='mDetail.select(this.form)'> 취소 </button>
					
				</div>
			</form>
		</div>
	</body>
</html>