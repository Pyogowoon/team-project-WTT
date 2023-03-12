<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_detail_input</title>
	</head>
	<body>
		<div>
			<div id='m_detail_input'>
				<h1> 영상 세부정보 추가 & 수정 </h1>
				<form name='frm_m_detail_input' id='frm_m_detail_input' method='post'>
					<input type='hidden' name='findStr' value='${page.findStr }'/>
					<input type='hidden' name='nowPage' value='${page.nowPage }'/>
					<input type='hidden' name='dSno' />
					<div id='insert'>
						<div id='poster'>
							<img class='loadImg' src='poster/${mainP}' name='loadImg' width="400" height="300">
						</div>
						<div id='videoInput'>
							<div id='videoInfo'>
								<label>serial : </label>
								<input type='text' name='serial' class='serial' value='${vo.serial }'/>
								<button type='button' id='searchV' onclick='mDetail.findVideo()'> 검색 </button><br/>
								<label>영상 제목 : </label>
								<input type='text' name='title' value='${vo.title }'><br/>
								<label>총 시즌 : </label>
								<input type='text' name='sCnt' value='${vo.sCnt }'><br/>
								
								<label>총 회차 : </label>
								<input type='text' name='eCnt' value='${vo.eCnt }'><br/>
							</div>
							<div id='blank'></div>
							<div id='hengGwan'>
								<button type='button' class='addHeng' onclick='mDetail.addHeng()' > 행 추가 </button>
								<button type='button' class='deleteHeng' onclick='mDetail.deleteHeng()'> 선택 행 제거 </button>
							</div>
						</div>
					</div>
					<hr/>
					<div id='line'>
						<c:set var='cnt' value='0'/>
						<c:forEach var='rVo' items='${list }'>
							<div class='vDetail modifyData' >
								<div class='ePoster'>
									<img class='epImg' src='poster/${rVo.dpSysFile }' width="120" height="80">
								</div>
								<div class='vDetailInfo'>
									<input type='hidden' name='MvDetailModifyList[${cnt }].dpSysFile' class='dpSysFile' value='${rVo.dpSysFile }'/>
									<input type='hidden' name='MvDetailModifyList[${cnt }].dpOriFile' class='dpOriFile' value='${rVo.dpOriFile }'/>
									<input type='hidden' name='MvDetailModifyList[${cnt }].vSysFile' class='vSysFile' value='${rVo.vSysFile }'/>
									<input type='hidden' name='MvDetailModifyList[${cnt }].vOriFile' class='vOriFile' value='${rVo.vOriFile }'/>
									<input type='hidden' name='MvDetailModifyList[${cnt }].changePoster' class='changePoster' value='${rVo.dpOriFile }'/>
									<input type='hidden' name='MvDetailModifyList[${cnt }].sno' class='vSno' value='${rVo.sno }'/>
									<label> 포스터 변경 : </label>
									<input type='file' name='mdPoster' class='dPoster modifyP' onchange="mDetail.loadImg(this)" accept="image/*"/>
									<label class='dVidName'> 영상 변경 : </label>
									<input type='file' name='mdVid' class='dVid modifyV' accept="video/*" onchange='mDetail.loadVid(this)'/>
									<input type='text' name='MvDetailModifyList[${cnt }].changeVid' class='changeVid' value='${rVo.vOriFile }'/>
									<button type='button' onclick='ad.view2(this)'> 영상 광고 관리 </button>
									<br/>
									<label>시즌 : </label>
									<input type='text' name='MvDetailModifyList[${cnt }].dSeason' class='dSeason modSeason' value='${rVo.dSeason }'>
									<span> / </span>
									<span> 회차 : </span>
									<input type='text' name='MvDetailModifyList[${cnt }].dEp' class='dEp modEp' value='${rVo.dEp }'>
									<label>플레이 타임 : </label>
									<input type='text' name='MvDetailModifyList[${cnt }].playTime' class='playTime moplayTime' value='${rVo.playTime}'>
									<label> 회차 제목 : </label>
									<input type='text' name='MvDetailModifyList[${cnt }].dEptitle' class='dEptitle modEptitle' value='${rVo.dEptitle }'>
								</div>
								<div class='subBtn'>
									<div></div>
									<button type='button' class='modifyOne' onclick='mDetail.modifyOne(this)'> 단일 <br> 수정 </button>
								</div>
								<div class='chkHeng'>
									<div></div>
									<input type="checkbox" name='chklist' class='hengNo' value='${rVo.sno }'/>
								</div>
							</div>
							<c:set var='cnt' value='${cnt=cnt+1 }'/>
						</c:forEach>
						
					</div>
					<div id='inbtns'>
						<button type='button' onclick='mDetail.insertR(this.form)'> 저장&수정 </button>
						<button type='button' onclick='mDetail.select(this.form)'> 취소 </button>
						
					</div>
				</form>
				<form name='frm_temp' id='frm_temp' method='post' style='display : none;'></form>
			</div>
		</div>
	</body>
</html>