<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix='spring' uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
  <html>
<head>
<!-- 부트스트랩 아이콘 링크입니다. -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<!--  얘는 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <link rel="stylesheet" href="./css/video_movie_detail.css">
 <!--  부트스트랩 버튼 -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
 <script defer src="https://use.fontawesome.com/releases/v5.1.0/js/all.js" integrity="sha384-3LK/3kTpDE/Pkp8gTNp2gR/2gOiwQ6QaO7Td0zV76UFJVhqLl4Vl3KL1We6q6wR9" crossorigin="anonymous"></script>
<body class="onmouse_container">
<body class="onmouse_container">


<form name='frm' method='post'>
 <div id="mainContainer">

<div style="text-align:center">
<div id="previous">
<a href="javascript:history.back()">
<img src="./img/previous2.png" style="width:70px; height:60px; padding:10px; margin-right:80px">
</a>
</div>
 <c:forEach items="${list }" var="vo" begin='1' end='1'>
  <video id="video1" width="700" height="500" controls autoplay muted loop>
    <source src=${vo.teaser } type="video/mp4" />
    
    이 영상은 HTML5 이상 브라우저에서 지원합니다.
    
  </video>
</c:forEach>
 </div>
 
 
 <form name='frm_movie_view' class='frm_movie_view' method='post'>
<div id="btnContainer">
<button class='img_button' type='button' onclick='video.view(this.form)'><i class="fas fa-play ic"></i></button>


<form name="frm_like" class="frm_like" method='post'>
<!-- 좋아요 버튼입니다. -->
<input type='hidden' name='likeSno'>   <!--  유기상태 -->
<c:forEach items="${list }" var="vo" begin='1' end='1'> <!-- 유기상태 -->
<button type='button' class="like-btn-svg" onclick='video.vLike(this.value)' value='${vo.serial }'></button>
</c:forEach>
</form>
<!--  마이 리스트 -->
<div class="btn-group" role="group" aria-label="Third group">
<button type="button" class="btn y mr-3 bt"><i class="fas fa-plus ic"></i> 마이리스트</button>
  </div>

</button>
</div>
</form>
<div id="container">


	<div id='detail1'>
	
	<c:forEach items="${list }" var='vo'  begin='1' end='1'>
	<input type='hidden' name='serial' value='${vo}'>
		<span class='vLike' name='vLike'>좋아요 : ${vo.vLike }</span>
		<span class='vYear' name='vYear'>${vo.vYear }</span>
		<span class='age' name='age'>${vo.age }</span>
		<span class='eCnt' name='eCnt'>${vo.eCnt }</span>
		<span class='hsd' name='hsd'>${vo.hsd }</span>
		<span class='title' name='title'>${vo.title }	</span>
			</c:forEach>
		<br/>  <!--  여기까진 video 테이블 영역 -->
	
				<!-- dEptitle, -->
	</div>
	
	<c:forEach items="${list }" var='vo' begin='1' end='1'>
	<div id='detail2'>
		<span class='actor' name="actor">출연 : ${vo.actor }</span>
		<br/>
	
		<span class='genre' name='genre'>장르 : ${vo.genre }</span>
		<br/>
		<span class='tag' name='tag'>${vo.tag }</span>
		<br/>
		<span class='pd' name='pd'>감독 : ${vo.pd }</span>
		
	
</c:forEach>



</div>  <!-- container -->
</div> <!--  maincontainer -->




<select id="seasonSel" onchagne="this.form.submit()">  <!--frm.submit도 된다고함 -->
   <option value="">시즌선택</option>
     <c:forEach var="vo" items="${Season}">
     	<option value="${vo.dSeason}"
     	<c:if test="${vo.dSeason == vo.dSeason}">selected</c:if>>시즌 ${vo.dSeason }</option>
    </c:forEach>
 </select>

 
 <div class='hide_info'>
 <H1>회차</H1>
<c:forEach items="${vDetail }" var='vo'>
 <c:choose>
 <c:when test="${vo.dSeason==1 }">

<span name='sno' style="visibility: hidden" value=${vo.sno }>${vo.sno }</span>
<div class='dEp'>
	<div class='item'>
<span name='ep' style='display:inline-block;height:60px;'>${vo.dEp}</span> <!-- dep로 대체 하기 sno하면 골치아픔 순서안맞아서 -->
	</div>
<span name='dPoster'>
<img src=${vo.dPoster } style="width:100px;height:60px; margin-top:15px; margin:10px;">
</span>
<span name="playTime">${vo.playTime }</span>
<span name="dEpTitle">${vo.dEpTitle }</span>
</div>
</c:when>
</c:choose>
</c:forEach>

</div>  <!-- hide_info 의 div -->


<div class='hide_info2'>
 <H1>회차</H1>
<c:forEach items="${vDetail }" var='vo'>
 <c:choose>
 <c:when test="${vo.dSeason==2 }">
<span name='sno' style="visibility: hidden" value=${vo.sno }>${vo.sno }</span>
<div class='dEp'>
	<div class='item'>
<span name='ep' style='display:inline-block;height:60px;'>${vo.dEp}</span> <!-- dep로 대체 하기 sno하면 골치아픔 순서안맞아서 -->
	</div>
<span name='dPoster'>
<img src=${vo.dPoster } style="width:100px;height:60px; margin-top:15px; margin:10px;">
</span>
<span name="playTime">${vo.playTime }</span>
<span name="dEpTitle">${vo.dEpTitle }</span>
</div>
</c:when>
</c:choose>
</c:forEach>

</div>  <!-- hide_info 의 div -->

<div class='hide_info3'>
 <H1>회차</H1>
<c:forEach items="${vDetail }" var='vo'>
 <c:choose>
 <c:when test="${vo.dSeason==3 }">
 <span name='sno' style="visibility: hidden" value=${vo.sno }>${vo.sno }</span>
<!--  히든 해서 sno 해도됨 value ${sno} -->
<div class='dEp'>
	<div class='item'>
	
<span name='ep' style='display:inline-block;height:60px;'>${vo.dEp}</span> <!-- dep로 대체 하기 sno하면 골치아픔 순서안맞아서 -->
	</div>
<span name='dPoster'>
<img src=${vo.dPoster } style="width:100px;height:60px; margin-top:15px; margin:10px;">
</span>
<span name="playTime">${vo.playTime }</span>
<span name="dEpTitle">${vo.dEpTitle }</span>
</div>
</c:when>
</c:choose>
</c:forEach>

</div>  <!-- hide_info 의 div -->


			<c:forEach items="${list }" var='vo' begin='1' end='1'>
 <div class="cardContainer">
 <H2>요즘 인기있는 컨텐츠</H2>
<div class="hero-container">
		<div class="main-container">
			<div class="poster-container">
				<a href="#"><img src="https://i.ibb.co/ThPNnzM/blade-runner.jpg" class="poster" /></a>
			</div>
			<div class="ticket-container">
				<div class="ticket__content">
					<h4 class="ticket__movie-title">Blade Runner 2049</h4>
					<p class="ticket__movie-slogan">
						영화설명란
					</p>
					<p class="ticket__current-price" name="title">${vo.title }</p>
					<p class="ticket__old-price">내용</p>
					<button class="ticket__buy-btn" onclick='video.view(this.form)'>보러 가기</button>
				</div>
			</div>
		</div>
		
			<div class="main-container">
			<div class="poster-container">
				<a href="#"><img src="./img/moonknight.jpg" class="poster" /></a>
			</div>
			<div class="ticket-container">
				<div class="ticket__content">
					<h4 class="ticket__movie-title">Blade Runner 2049</h4>
					<p class="ticket__movie-slogan">
						설명들어가는 란
					</p>
					<p class="ticket__current-price">소제목</p>
					<p class="ticket__old-price">내용</p>
					<button class="ticket__buy-btn" onclick='video.view(this.form)'>보러 가기</button>
				</div>
			</div>
		</div>

		<div class="main-container">
			<div class="poster-container">
				<a href="#"><img src="https://i.ibb.co/Zd51z5c/justice-league.jpg" class="poster" /></a>
			</div>
			<div class="ticket-container">
				<div class="ticket__content">
					<h4 class="ticket__movie-title">Justice League</h4>
					<p class="ticket__movie-slogan">You can't save the world alone.</p>
					<p class="ticket__current-price">소제목</p>
					<p class="ticket__old-price">내용</p>
					<button class="ticket__buy-btn" onclick='video.view(this.form)'>보러 가기 </button>
				</div>
			</div>
		</div>
	</div>

  </div>
  </c:forEach>

</form>

<script type="text/javascript"> 
let vdetail={};
 let video={};

$(document).ready(function(){
	
	$('#seasonSel').change(function(){
	
	var result = 	$("#seasonSel option:selected").val();
		if (result == 1){
			
			$('.hide_info').css('display','block');
			$('.hide_info2').css('display','none');
			$('.hide_info3').css('display','none');
			
		}else if(result == 2){
		
			$('.hide_info').css('display','none');
			$('.hide_info2').css('display','block');
			$('.hide_info3').css('display','none');
			
		}else if(result == 3){
			$('.hide_info').css('display','none');
			$('.hide_info2').css('display','none');
			$('.hide_info3').css('display','block');
			
		}else{
			$('.hide_info').css('display','none');
			$('.hide_info2').css('display','none');
			$('.hide_info3').css('display','none');
		}
		
	});

});


video.view = function(frm){
	frm.action ='video_detail';
	frm.submit();
}
$('.like-btn-svg').on('click', function () {
	  $(this).toggleClass('animate');
	});
	 
	 /*
video.vLike = function vLike(sno){
	
	  let sno = document.getElementById('likeSno').value
		let frm = $('.frm_like');
		frm.sno.value = sno;
		frm.action='video_series_detail';
		console.log('콘솔테스트11')
		frm.submit();
	
	}
		*/
</script>


    

</body>
</html>