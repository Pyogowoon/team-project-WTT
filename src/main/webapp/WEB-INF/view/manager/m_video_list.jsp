<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_video_list</title>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='m_video'>
			<h1> 영상 / 시리즈 관리 </h1>
			<form name='frm_m_video_list' id='frm_m_video_list' method='post'>
				<div class='searchTop'>
					<div class='addButton'>
						<button type='button' class='addContent' onclick='mVideo.insert(this.form)'> 컨텐츠 추가 </button>
						<button type='button' onclick='mVideo.deleteR(this.form)'> 선택 삭제 </button>
					</div>
					<div class='searchZone'>
						<input type='hidden' name='serial' />
						<input type='hidden' name='nowPage' value=${page.nowPage }>
						<input type='text' class='findStr' name='findStr' value='${page.findStr }'/>
						<span onclick='mVideo.find()'><i class="fa-solid fa-magnifying-glass"></i></span>
					</div>
				</div>
				<div id='m_list'>
					<div id='title'>
						<span class='chk'></span>
						<span class='serial'> serial </span>
						<span class='genre'> 장르 </span>
						<span class='vTitle'> 타이틀 </span>
						<span class='cat'> 카테고리 </span>
						<span class='pd'> 감독 </span>
						<span class='country'> 국가 </span>
						<span class='year'> 개봉시기 </span>
					</div>
					<div id='items'>
						<c:forEach var='vo' items="${list }">
							<div class='item'>
								<span class='chk'>
									<input type="checkbox" name="chklist" value='${vo.serial }'/>
								</span>
								<span class='clickhere' onclick='mVideo.view(${vo.serial })'>
									<span class='serial'> ${vo.serial } </span>
									<span class='genre'> ${vo.genre } </span>
									<span class='vTitle'> ${vo.title } </span>
									<span class='cat'> ${vo.vCat } </span>
									<span class='pd'> ${vo.pd } </span>
									<span class='country'> ${vo.country } </span>
									<span class='year'> ${vo.vYear } </span>
								</span>
							</div>
						</c:forEach>
					</div>
					<div id='btns'>
						<c:if test="${page.startPage>1}">
							<button type='button' class='btnLtlt' onclick='mVideo.movePage(1)'>&lt&lt</button>
							<button type='button' onclick='mVideo.movePage(${page.startPage-1})'>&lt</button>
						</c:if>
						<c:forEach var='i' begin="${page.startPage }" end="${page.endPage }">
							<button type='button' onclick='mVideo.movePage(${i})'>${i }</button>
						</c:forEach>
						<c:if test="${page.totPage>page.endPage }">
							<button type='button' onclick='mVideo.movePage(${page.endPage+1})'>&gt</button>
							<button type='button' class='btnGtgt' onclick='mVideo.movePage(${page.totPage})'>&gt&gt</button>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>