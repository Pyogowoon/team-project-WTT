<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 문의 목록</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/mypage.js'></script>
		<link rel='stylesheet' href='css/mypage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='munylist'>
			<form name='frm_munylist' class='frm_munylist' method='post'>
				<input type='hidden' name='findStr' value='${MypagePage.findStr }'>
				<input type='hidden' name='nowPage' value='${MypagePage.nowPage }'>
				<input type='hidden' name='fCat' value='${MypagePage.fCat }'>
				<input type='hidden' name='num'>
				<button type='button' class='back' onclick='mypage.munylist_back(this.form)'>
					<i class="fa-solid fa-reply"></i>
				</button>
				<h1>내 문의 목록</h1>
				<div class='munylist_frame'>
					<div class='munylist_title'>
						<span class='uName'>작성자</span>
						<span class='mTitle'>제목</span>
						<span class='nal'>작성일</span>
						<span class='rSno'>답변</span>
					</div>
					<c:forEach var='mun' items='${munylist }' >
						<div class='munylist_item' onclick='mypage.munylist_detail(${mun.num})'>
							<c:if test='${not empty mun.manager }'>
								<span class='uName'>${mun.manager }</span>
							</c:if>
							<c:if test='${empty mun.manager }'>
								<span class='uName'>${mun.uName }</span>
							</c:if>
							<span class='mTitle'>${mun.mTitle }</span>
							<span class='nal'>${mun.nal }</span>
							<c:if test='${mun.rSno == 1 }'>
								<span class='rSno'>O</span>
							</c:if>
							<c:if test='${mun.rSno == 0 }'>
								<span class='rSno'>X</span>
							</c:if>
						</div>
					</c:forEach>
					<div class='munylist_paging'>
						<c:if test='${MypagePage.startPage>1 }'>
							<button type='button' class='btnFirst' onclick='mypage.muny_move(1)'>
								<i class="fa-solid fa-backward"></i>
							</button>
							<button type='button' class='btnPrev' onclick='mypage.muny_move(${MypagePage.startPage-1})'>
								<i class="fa-solid fa-caret-left"></i>
							</button>
						</c:if>
						
						<c:forEach var='mbtn' begin='${MypagePage.startPage }' end='${MypagePage.endPage }'>
								<button type='button' class='btnNum' onclick='mypage.muny_move(${mbtn})'>
									<i class="fa-brands fa-opera"></i>
								</button>
							</c:forEach>
						
						<c:if test='${MypagePage.endPage < MypagePage.totPage }'>
							<button type='button' class='btnNext' onclick='mypage.muny_move(${MypagePage.endPage+1})'>
								<i class="fa-solid fa-caret-right"></i>
							</button>
							<button type='button' class='btnLast' onclick='mypage.muny_move(${MypagePage.totPage})'>
								<i class="fa-solid fa-forward"></i>
							</button>
						</c:if>
					</div>
				</div>
				<div class='gomuny'>
					<button type='button' onclick='mypage.muny(this.form)'>
						1:1 문의하러 가기
					</button>
				</div>
			</form>
		</div>
	</body>
</html>