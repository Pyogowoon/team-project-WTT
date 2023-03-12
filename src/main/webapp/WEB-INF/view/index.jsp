<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix='spring' uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WTT</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src='js/index.js'></script>
		<link rel='stylesheet' href='css/index.css'>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
	</head>
	<body>
	<%
		session.setAttribute("email","root");
		session.setAttribute("gwan",1);
	
	%>
		<div id='header'>
			<form class='frm_header' name='frm_header' method='post'>
				<a href='/' class='logo'><img src="<spring:url value='/upload/wlogo.jpg'/>"/></a>
				<input type='hidden' name='vCat'>
				<c:if test='${not empty sessionScope.email }'>
					<ul class='first-header'>
						<li><a href='/'>HOME</a></li>
						<li><a>Hot&New</a></li>
						<li><a>Event</a></li>
						<li><button type='button' onclick='wtt.openCategory()'>Categories</button></li>
					</ul>
					
					<button type='button' class='toggle-categories' onclick='wtt.openCategory()'>
						<i class="fa-solid fa-caret-down"></i>
					</button>
					
					<div class='categories' style='display:none'>
						<h1>Categories</h1>
						<button type='button' onclick='wtt.category("한국")'>한국</button><br/>
						<button type='button' onclick='wtt.category("해외")'>해외</button><br/>
						<button type='button' onclick='wtt.category("액션")'>액션</button><br/>
						<button type='button' onclick='wtt.category("어드벤쳐")'>어드벤쳐</button><br/>
						<button type='button' onclick='wtt.category("코미디")'>코미디</button><br/>
						<button type='button' onclick='wtt.category("로맨스")'>로맨스</button><br/>
						<button type='button' onclick='wtt.category("애니메이션")'>애니메이션</button><br/>
						<button type='button' onclick='wtt.category("스릴러")'>스릴러</button><br/>
						<button type='button' onclick='wtt.category("호러")'>호러</button><br/>
						<button type='button' onclick='wtt.category("SF")'>SF</button><br/>
						<button type='button' onclick='wtt.category("판타지")'>판타지</button><br/>
						<button type='button' onclick='wtt.category("드라마")'>드라마</button><br/>
						<button type='button' onclick='wtt.category("범죄")'>범죄</button><br/>
					</div>
				</c:if>
				<div class='second-header'>
					<c:if test='${not empty sessionScope.email }'>
						<!-- <input type='text' name='findStr' class='textSearch' value='제목,배우' onclick='wtt.textSearch(this.form)'> -->
						<input type='search' name='findStr' class='textSearch' placeholder="제목,배우" 
							onfocus='this.placeholder=""' onblur='this.placeholder="제목,배우"'>
						
						<button type='button' id='btnSearch' onclick='wtt.search(this.form)'>
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</c:if>
					
					<c:choose>
						<c:when test='${empty sessionScope.email }'>
							<button type='button' id='btnLogin' onclick='wtt.login(this.form)'>로그인</button>
						</c:when>
						
						<c:when test='${not empty sessionScope.email && (sessionScope.gwan == 0) }'>
							<button type='button' id='btnAccount' onclick='wtt.account()'>
								<i class="fa-solid fa-user"></i>
							</button>
						</c:when>
						
						<c:when test='${not empty sessionScope.email && (sessionScope.gwan == 1) }'>
							<button type='button' id='btnGwan' onclick='wtt.gwan()'>
								<i class="fa-solid fa-gear"></i>
							</button>
						</c:when>
					</c:choose>
					
					<div class='account' style='display:none'>
						<button type='button' onclick='wtt.mypage(this.form)'>마이페이지</button><br/>
						<button type='button'>알람</button><br/>
						<button type='button' onclick='wtt.logout()'>로그아웃</button><br/>
					</div>
					
					<div class='gwan' style='display:none'>
						<button type='button' onclick='wtt.manage()'>관리자 모드</button>
						<button type='button' onclick='wtt.logout()'>로그아웃</button>
					</div>
				</div>
			</form>
		</div>
		
		<div id='section'>
			<c:if test='${empty sessionScope.email }'>
				<c:if test='${inc == null }'>
					<div class='section-index'>
						<div class='index-main'>
							<img src="<spring:url value='/upload/compose.jpg'/>"/>
						</div>
						
						<div class='index-hot'>
							<h2>인기 영상 TOP10</h2>
							
						</div>
					</div>
				</c:if>
			</c:if>
			
			<c:if test='${not empty sessionScope.email }'>
				<jsp:include page='${inc }.jsp'/>
			</c:if>
			
		</div>
		
		<div id='footer'>
			<a href='/' class='logo'><img src="<spring:url value='/upload/wlogo.jpg'/>"/></a>
			<div class='informs'>
				<button type='button'>WTT 이용약관</button>
				<button type='button'>취소 및 환불 정책</button>
				<button type='button'>개인정보 수집 및 이용</button>
				<button type='button'>개인정보 처리방침</button>
				<button type='button'>관심 기반 광고</button>
				<!-- <button type='button'>고객센터</button> -->
				<button type='button'>WTT 소개</button>
			</div>
			<div class='about'>
				<div>OTT서비스 WTT조</div>
				<div>
					<span> | </span>
					<span>조장: 안우성</span>
				</div>
				<div>
					<span> | </span>
					<span>서울 관악구 남부순환로 1820 에그옐로우 14층 08787</span>
				</div>
				<div>
					<span> | </span>
					<span>전화번호: 010-1234-5678</span>
				</div>
				<div>
					<span> | </span>
					<span>Email: help@wtt.kr</span>
				</div>
			</div>
		</div>
		
	</body>
</html>