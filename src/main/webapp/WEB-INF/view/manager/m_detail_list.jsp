<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_detail_list</title>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='m_detail'>
			<h1> 영상 세부정보 목록 </h1>
			<form name='frm_m_detail_list' id='frm_m_detail_list' method='post'>
				<div class='searchTop'>
					<div class='addButton'>
						<button type='button' class='addContent' onclick='mDetail.insert(this.form)'> 영상 세부정보 추가 </button>
						<button type='button' onclick='mDetail.deleteR(this.form)'> 선택 삭제 </button>
					</div>
					<div class='searchZone'>
						<input type='hidden' class='sno' name='sno'/>
						<input type='hidden' class='serial' name='serial'/>
						<input type='hidden' class='nowPage' name='nowPage' value='${page.nowPage }'/>
						<input type='text' class='findStr' name='findStr' value='${page.findStr }'/>
						<span><i class="fa-solid fa-magnifying-glass"></i></span>
					</div>
				</div>
				<div id='m_list'>
					<div id='title'>
						<span class='chk'></span>
						<span class='serial'> serial </span>
						<span class='dSeason'> 시즌 </span>
						<span class='dEp'> 에피소드 </span>
						<span class='dPoster'> 소포스터 </span>
						<span class='dEptitle'> 소제목 </span>
						<span class='dVid'> 영상 </span>
						<span class='playTime'> 플레이타임 </span>
					</div>
					<div id='items'>
						<c:forEach var='vo' items="${list }">
							<div class='item'>
								<span class='chk'>
									<input type="checkbox" name="chklist" value='${vo.sno }'/>
								</span>
								<span class='clickhere' onclick='mDetail.view(${vo.serial})'>
									<span class='serial'> ${vo.serial } </span>
									<span class='dSeason'> ${vo.dSeason } </span>
									<span class='dEp'> ${vo.dEp } </span>
									<span class='dPoster'> ${vo.dPoster }</span>
									<span class='dEptitle'> ${vo.dEptitle } </span>
									<span class='dVid'> ${vo.dVid } </span>
									<span class='playTime'> ${vo.playTime } </span>
								</span>
							</div>
						</c:forEach>
					</div>
					<div id='btns'>
						<c:if test="${page.startPage>1}">
							<button type='button' class='btnLtlt' onclick='mDetail.movePage(1)'>&lt&lt</button>
							<button type='button' onclick='mDetail.movePage(${page.startPage-1})'>&lt</button>
						</c:if>
						<c:forEach var='i' begin="${page.startPage }" end="${page.endPage }">
							<button type='button' onclick='mDetail.movePage(${i})'>${i }</button>
						</c:forEach>
						<c:if test="${page.totPage>page.endPage }">
							<button type='button' onclick='mDetail.movePage(${page.endPage+1})'>&gt</button>
							<button type='button' class='btnGtgt' onclick='mDetail.movePage(${page.totPage})'>&gt&gt</button>
						</c:if>
					</div>
				</div>
			</form>
		</div>
</body>
</html>