<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WTT</title>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link rel='stylesheet' href='./css/video.css'>
  <script defer src="./js/video.js" ></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script defer src="https://use.fontawesome.com/releases/v5.1.0/js/all.js" integrity="sha384-3LK/3kTpDE/Pkp8gTNp2gR/2gOiwQ6QaO7Td0zV76UFJVhqLl4Vl3KL1We6q6wR9" crossorigin="anonymous"></script>
</head>
<body>
  <div id="video_list">

    
    
    <!-- MAIN CONTAINER 22일수정 -->
    <h1>${vo.vCat }</h1>
     <div class="main_container">
      <c:forEach var='vo' items="${list }">
          <div class="item" onclick="video.view(${vo.serial })">
          	<img src="poster/${vo.pSysFile }" /><br/>
          	<span class='video_title'><b>${vo.title }</b></span>
      		</div>
      </c:forEach>
     </div>
    <!-- END OF MAIN CONTAINER -->

   
   
  </div>
</body>
</html>