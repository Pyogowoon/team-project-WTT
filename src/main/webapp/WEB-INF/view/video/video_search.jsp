<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>WTT</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link rel='stylesheet' href='./css/video.css'>
  <script defer src="./js/video.js" ></script>
  <script src="https://kit.fontawesome.com/32ac011196.js" crossorigin="anonymous"></script>
</head>
<body>
  <div id="video_search">

	<!-- SEARCH CONTAINER -->    
	<form name='frm_video' method='post' id='frm_video'>
		<div class='video_search_container'>
		    <div class='sub_search'>
		        <input type='text' class='findStr' name='findStr' placeholder="검색어 or 태그" onclick='video.text(this.form)' value='${vo.findStr }'/>
		        <span class='video_search' onclick="video.search()" style="background: #141414; border:none;"><i class="fa-solid fa-magnifying-glass" style="color: #fff;"></i></span> 
		    </div>
		</div>
		<!-- RECENT KEYWORD --> 
		<div class='frm_rFind' >
			<h3>최근 검색어</h3>
				<c:forEach var='rVo' items='${rklist }'>
					<span>
						<span class='keyword' onclick="video.keyword('${rVo.findStr }')">${rVo.findStr }</span>
						<span class='keyword_delete' onclick='video.rFind_delete(this)'><i class="fa-solid fa-xmark"></i></span>
						<input type="hidden" value='${rVo.sno }'>
					</span>
				</c:forEach>
		</div>
	<!-- TAG FILTER(필터 다중 선택 최대 2개) -->
	<div class='video_toggle' onclick='video.toggle()'>
		검색에 포함될 태그를 골라주세요
		<span class='tag_down'><i class="fa-solid fa-square-caret-down"></i></span>
		<span class='tag_up'><i class="fa-solid fa-square-caret-up"></i></span>
	</div>
		<div class='video_search_chk'>
			<div class='tags_filter'>
				<c:forEach var='tvo' items='${tlist }'>
					<div class='chkbox' >
						<input type='checkbox' class='tagNames' name="tagNames" value='${tvo.tagName }'/>
						${tvo.tagName }
					</div>
				</c:forEach>
			</div>
			필터를 선택해주세요.
		</div>
	</form>
    <!-- MAIN CONTAINER -->
    <div class="main_container">
      <c:forEach var='vo' items="${video_list }">
          <div class="item" onclick="video.view(${vo.serial })">
          	<img src="poster/${vo.pSysFile }" /><br/>
          	<span class='video_title'><b>${vo.title }</b></span>
      		</div>
      </c:forEach>
     </div>
  </div>
  
</body>
</html>