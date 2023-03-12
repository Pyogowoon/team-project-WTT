<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FAQ</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/mypage.js'></script>
		<link rel='stylesheet' href='css/mypage.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id='FAQ'>
			<form name='frm_FAQ' class='frm_FAQ' method='post'>
				<input type='hidden' name='findStr' class='findStr' value='${MypagePage.findStr }'>
				<input type='hidden' name='fCat' value='${MypagePage.fCat }'>
				<input type='hidden' name='nowPage' value='${MypagePage.nowPage }'>
				<input type='hidden' name='subject'>
				<button type='button' class='back' onclick='mypage.FAQ_back(this.form)'>
					<i class="fa-solid fa-reply"></i>
				</button>
				<h1>고객센터</h1>
				<h2>FAQ</h2>
				<div class='FAQ_frame'>
					<div class='FAQ_category'>
						<h2>카테고리</h2>
						<span class='FAQ_categories'>
							<button type='button' class='btnFAQCategory' value='전체' onclick='mypage.FAQ_category(this.value)'>전 체</button>
						</span>
						<c:forEach var='cat' items='${fCatlist }'>
							<span class='FAQ_categories'>
								<button type='button' class='btnFAQCategory' value='${cat.fCat }' onclick='mypage.FAQ_category(this.value)'>${cat.fCat }</button>
							</span>
						</c:forEach>
					</div>
					<c:if test='${not empty FAQinc }'>
					<div class='FAQ_list'>
						<h2>${MypagePage.fCat }</h2><hr/>
						<c:forEach var='sub' items='${fSublist }'>
							<span class='FAQ_title'>
								<button type='button' class='btnFAQSelect' onclick='mypage.FAQ_view("${sub.subject}")'>
									${sub.subject }
								</button>
							</span>
						</c:forEach>
						<div class='FAQ_paging'>
							<c:if test='${MypagePage.startPage>1 }'>
								<button type='button' class='btnFirst' onclick='mypage.FAQ_move(1)'>
									<i class="fa-solid fa-backward"></i>
								</button>
								<button type='button' class='btnPrev' onclick='mypage.FAQ_move(${MypagePage.startPage-1})'>
									<i class="fa-solid fa-caret-left"></i>
								</button>
							</c:if>
							
							<c:forEach var='mbtn' begin='${MypagePage.startPage }' end='${MypagePage.endPage }'>
								<button type='button' class='btnNum' onclick='mypage.FAQ_move(${mbtn})'>
									<i class="fa-brands fa-opera"></i>
								</button>
							</c:forEach>
							
							<c:if test='${MypagePage.endPage < MypagePage.totPage }'>
								<button type='button' class='btnNext' onclick='mypage.FAQ_move(${MypagePage.endPage+1})'>
									<i class="fa-solid fa-caret-right"></i>
								</button>
								<button type='button' class='btnLast' onclick='mypage.FAQ_move(${MypagePage.totPage})'>
									<i class="fa-solid fa-forward"></i>
								</button>
							</c:if>
						</div>
					</div>
					</c:if>
					
					<c:if test='${empty FAQinc }'>
						<div class='FAQ_view'>
							<button type='button' class='back' onclick='mypage.FAQ_view_back(this.form)'>
								<i class="fa-solid fa-reply"></i>
							</button>
							<label>제 목</label>
							<input type='text' value='${FAQVo.subject }'><br/>
							<textarea class='fDoc' readonly="readonly">${FAQVo.doc }</textarea>
						</div>
					</c:if>
				</div>
				<div class='gomunylist'>
					<button type='button' onclick='mypage.munylist(this.form)'>
						찾으시는 답변이 없으신가요?
					</button>
				</div>
			</form>
		</div>
	</body>
</html>