<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_ad_input</title>
		
	</head>
	<body>
		<div>
		<div id='m_ad_input'>
			<h1> 영상 광고 추가 & 수정 </h1>
			<form name='frm_m_ad_input' id='frm_m_ad_input' method='post'>
				<input type='hidden' name='findStr' value='${page.findStr }'/>
				<input type='hidden' name='nowPage' value='${page.nowPage }'/>
				
				<div id='insert'>
					<div id='poster'>
						<video src='videos/${vo.vSysFile }' id='loadvideo' width="500" height="300" controls muted ></video>
					</div>
					<div id='vDetailZone'>
						<div id='vDetailInfo'>
							<h3>
								<c:if test='${empty vo}'>
									영상 / 시리즈 제목
								</c:if>
								<c:if test='${not empty vo}'>
									${vo.title }
								</c:if>
							</h3><hr/>
							<input type='hidden' name='title' class='title' value='${vo.title }'/>
							<label> 영상 sno : </label>
							<input type='text' name='dSno' class='dSno' value='${vo.sno}'/>
							<button type='button' id='searchV' onclick='ad.findDetail(this.form)'> 검색 </button><br/>
							<label> 시즌 : </label>
							<input type='text' name='dSeason' class='dSeason'  value='${vo.dSeason }'><br/>
							
							<label> 회차 : </label>
							<input type='text' name='dEp' class='dEp' value='${vo.dEp }'><br/>
							<label> 회차 제목 : </label>
							<input type='text' name='dEptitle' value='${vo.dEptitle }'><br/>
						</div>
						  <div id='blank'></div>
						<div id='hengGwan'>
							<button type='button' class='addHeng' onclick='ad.addHeng()' > 행 추가 </button>
							<button type='button' class='deleteHeng' onclick='ad.deleteHeng()'> 선택 행 제거 </button>
						</div>
					</div>
				</div>
				<hr/>
				<div id='line'>
					<c:set var='cnt' value='0'/>
					<c:forEach var='rVo' items='${list }'>
						<div class='adZone modifyData'>
							<div class='ePoster'>
								<img class='epImg' src='pImg/${rVo.sysFile }' width="120" height="110" >
							</div>
							<div class='adInfo'>
								<input type='hidden' name='MadModifyList[${cnt }].sysFile' class='sysFile' value='${rVo.sysFile }'/>
								<input type='hidden' name='MadModifyList[${cnt }].oriFile' class='oriFile' value='${rVo.oriFile }'/>
								<input type='hidden' name='MadModifyList[${cnt }].changeImg' class='changeImg' value='${rVo.oriFile }'/>
								<input type='hidden' name='MadModifyList[${cnt }].sno' class='aSno' value='${rVo.sno }'/>
								<label>상품 사진 : </label>
								<input type='file' name='mopImg' accept="image/*" class='pImg saveP' onchange='ad.loadImg(this)' />
								<label class='pNameN'> 상품명 : </label>
								<input type='text' name='MadModifyList[${cnt }].pName' class='pName mopName' value='${rVo.pName }'/>
								<br/>
								<label>상품 분류 : </label>
								<select name='MadModifyList[${cnt }].pCat' size='1' class='pCat mopCat' >
									<option value='의류' ${rVo.pCat == '의류' ? 'selected' : '' }> 의류 </option>
									<option value='장소' ${rVo.pCat == '장소' ? 'selected' : '' }> 장소 </option>
								</select>
								<span> 시간 : </span>
								<input type='text' name='MadModifyList[${cnt }].pTime' class='pTime mopTime' value='${rVo.pTime }' >
								<button type='button' onclick='ad.play(this)'>입력</button>
								<label> 배우 : </label>
								<input type='text' name='MadModifyList[${cnt }].pActor' class='pActor mopActor' value='${rVo.pActor }' ><br/>
								<label> 상품 설명 : </label>
								<input type='text' name='MadModifyList[${cnt }].pInfo' class='pInfo mopInfo' value='${rVo.pInfo }'>
								<label> URL : </label>
								<input type='text' name='MadModifyList[${cnt }].pUrl' class='pUrl mopUrl' value='${rVo.pUrl }' >
							</div>
							<div class='subBtn'>
								<div></div>
								<button type='button' class='modifyOne' onclick='ad.modifyOne(this)'> 단일 <br> 수정 </button>
							</div>
							<div class='chkHeng'>
								<div></div>
								<input type="checkbox" name='hengNo' class='hengNo' value='${rVo.sno }'/>
							</div>
						</div>
						<c:set var='cnt' value='${cnt=cnt+1 }'/>
					</c:forEach>
				</div>
				<div id='inbtns'>
					<button type='button' onclick='ad.insertR(this.form)'> 저장 & 수정 </button>
					<button type='button' onclick='ad.select(this.form)'> 취소 </button>
					
				</div>
			</form>
			<form name='frm_temp' id='frm_temp' method='post' style='display:none'></form>
		</div>
		</div>
	</body>
</html>