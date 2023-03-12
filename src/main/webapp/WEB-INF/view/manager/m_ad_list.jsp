<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_ad_list</title>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div>
		<div id='m_ad'>
			<h1> 영상 광고정보 목록 </h1>
			<form name='frm_m_ad' id='frm_m_ad' method='post'>
				<div id='btnZone'>
					<button type='button' onclick='ad.insert(this.form)'> 광고 추가 </button>
					<button type='button' onclick='ad.deleteR()'> 선택 삭제 </button>
				</div>
				<div class='searchTop'>
					<div class='filter' style='display:none'>
						<label> 광고 종류 선택 </label>
						<label><input type="checkbox" name='fO' value='의류' ${page.fO == "의류" ? "checked" : ""} onclick="ad.select(this.form)"> 의류 </label>
						<label><input type="checkbox" name='fW' value='장소' ${page.fW == "장소" ? "checked" : ""} onclick="ad.select(this.form)"> 장소 </label>
					</div>
					<div style='flex:1'></div>
					<div class='align'>
						<select id='listAlign' name='listAlign' size='1' onchange="ad.select(this.form)">
							<option value='sno desc' ${page.listAlign == "sno desc" ? "selected" : "" }>최근등록순</option>
							<option value='dSno asc' ${page.listAlign == "dSno asc" ? "selected" : "" }>영상 serial(▲)</option>
							<option value='dSno desc' ${page.listAlign == "dSno desc" ? "selected" : "" }>영상 serial(▼)</option>
							<option value='pName asc' ${page.listAlign == "pName asc" ? "selected" : "" }>상품이름(▲)</option>
							<option value='pName desc' ${page.listAlign == "pName desc" ? "selected" : "" }>상품이름(▼)</option>
							<option value='sno asc' ${page.listAlign == "sno asc" ? "selected" : "" }> 등록 순 </option>
						</select>
					</div>
					<div class='searchZone'>
						<input type='hidden' name='dSno'/>
						<input type='hidden' name='nowPage' value='${page.nowPage }'/>
						<input type='text' class='findStr' name='findStr' value='${page.findStr }'/>
						<span onclick="ad.find()"><i class="fa-solid fa-magnifying-glass"></i></span>
					</div>
				</div>
			</form>
			<form name='frm_m_ad_list' id='frm_m_ad_list' method='post'>
				<div id='m_list'>
					<div id='title'>
						<span class='chk'></span>
						<span class='dSno'> dSno </span>
						<span class='title'> title </span>
						<span class='dSeason'> 시즌 </span>
						<span class='dEp'> 에피소드 </span>
						<span class='pCat'> 분류 </span>
						<span class='pName'> 상품명 </span>
						<span class='pInfo'> Info </span>
						<span class='pImg'> 상품 사진 </span>
						<span class='url'> url </span>
					</div>
					<div id='items'>
						<c:forEach var='vo' items='${list }'>
							<div class='item'>
								<span class='chk'>
									<input type="checkbox" name="chklist" value='${vo.sno }'/>
								</span>
								<span class='clickhere' onclick='ad.view(${vo.dSno})'>
									<span class='dSno'> ${vo.dSno } </span>
									<span class='title'> ${vo.title } </span>
									<span class='dSeason'> ${vo.dSeason } </span>
									<span class='dEp'> ${vo.dEp } </span>
									<span class='pCat'> ${vo.pCat } </span>
									<span class='pName'> ${vo.pName } </span>
									<span class='pInfo'> ${vo.pInfo } </span>
									<span class='pImg'> ${vo.pImg } </span>
									<span class='url'> ${vo.pUrl } </span>
								</span>
							</div>
						</c:forEach>
					</div>
					<div id='btns'>
						<c:if test="${page.startPage>1}">
							<button type='button' class='btnLtlt' onclick='ad.movePage(1)'>&lt&lt</button>
							<button type='button' onclick='ad.movePage(${page.startPage-1})'>&lt</button>
						</c:if>
						<c:forEach var='i' begin="${page.startPage }" end="${page.endPage }">
							<button type='button' onclick='ad.movePage(${i})'>${i }</button>
						</c:forEach>
						<c:if test="${page.totPage>page.endPage }">
							<button type='button' onclick='ad.movePage(${page.endPage+1})'>&gt</button>
							<button type='button' class='btnGtgt' onclick='ad.movePage(${page.totPage})'>&gt&gt</button>
						</c:if>
					</div>
				</div>
			</form>
		</div>
		</div>
	</body>
</html>