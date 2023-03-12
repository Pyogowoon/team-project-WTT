<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_user_list</title>
		<script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
		<script src="js/managersub.js"></script>
		<link rel='stylesheet' type='text/css' href='css/managersub.css'>
	</head>
	<body>
		<div id='m_user'>
			<h1> 회원 목록 </h1>
			<form name='frm_m_user' id='frm_m_user' method='post'>
				<div id='btnZone'>
					<button type='button'> 선택 삭제 </button>
					<button type='button' onclick='user.insert(this.form)'> 권한 계정 추가 </button>
				</div>
				<div class='searchTop'>
					<div class='filter'>
						<label> 결제 구분 </label>
						<label><input type="checkbox" name='pCat' value='1'> Y </label>
						<label><input type="checkbox" name='pCat' value='0'> N </label>
					</div>
					<div class='align'>
						<select id='listAlign' name='listAlign' size='1'>
							<option value='desc.date'>최근등록순</option>
							<option value='asc.email'>email(▲)</option>
							<option value='desc.email'>email(▼)</option>
							<option value='asc.name'>name(▲)</option>
							<option value='desc.name'>name(▼)</option>
							<option value='asc.phone'>phone(▲)</option>
							<option value='desc.phone'>phone(▼)</option>
							<option value='asc.payday'>결제일(▲)</option>
							<option value='desc.payday'>결제일(▼)</option>
						</select>
					</div>
					<div class='searchZone'>
						<input type='text' class='findStr' name='findStr' value='${page.findStr }'/>
						<span onclick='user.find()'><i class="fa-solid fa-magnifying-glass"></i></span>
					</div>
				</div>
				<input type='hidden' name='nowPage' value='${page.nowPage }'/>
				<input type='hidden' name='email'/>
			</form>
			<form name='frm_m_user_list' id='frm_m_user_list' method='post'>
				<div id='m_list'>
					<div id='title'>
						<span class='chk'></span>
						<span class='email'> <Strong>Email(ID)</Strong> </span>
						<span class='uName'> <Strong>Name</Strong> </span>
						<span class='phone'> <Strong>Phone</Strong> </span>
						<span class='nick'> <Strong>닉네임</Strong> </span>
						<span class='paychk'> <Strong>결제구분</Strong> </span>
						<span class='payday'> <Strong>결제일</Strong> </span>
						<span class='pwd'> <Strong>암호</Strong> </span>
					</div>
					<div id='items'>
						<c:forEach var='vo' items='${list }'>
							<div class='item'>
								<span class='chk'>
									<input type="checkbox" name="chklist" value='${vo }'/>
								</span>
								<span class='clickhere' onclick="user.view('${vo.email}')">
									<span class='email'>${vo.email } </span>
									<span class='uName'>${vo.uName } </span>
									<span class='phone'>${vo.phone } </span>
									<span class='nick'>${vo.nick } </span>
									<span class='paychk'>${vo.paychk } </span>
									<span class='payday'>${vo.payday } </span>
									<span class='pwd'>${vo.pwd } </span>
								</span>
							</div>
						</c:forEach>
					</div>
					<div id='btns'>
						<c:if test="${page.startPage>1 }">
							<button type='button' class='btnLtlt' onclick='user.movePage(1)'>&lt&lt</button>
							<button type='button' onclick='user.movePage(${page.startPage-1})'>&lt</button>
						</c:if>	
						
						<c:forEach var='i' begin="${page.startPage }" end="${page.endPage }">
							<button type='button' onclick='user.movePage(${i })'>${i }</button>
						</c:forEach>
						
						<c:if test="${page.endPage<page.totPage }">
							<button type='button' onclick='user.movePage(${page.endPage+1})'>&gt</button>
							<button type='button' class='btnGtgt' onclick='user.movePage(${page.totPage})'>&gt&gt</button>
						</c:if>	
					</div>
				</div>
			</form>
		</div>
	</body>
</html>