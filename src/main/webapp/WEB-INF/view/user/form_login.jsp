<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<title>Login</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
<link rel="stylesheet" href="./css/login.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
  <header class="showcase">
 
  <div class="showcase-content">
   <a href="javascript:history.back()">
      <img src="./img/previous2.png" style="width:70px; height:60px; padding:10px; margin-right:80px">
    </a>
     <div class="formm">
       <form name='frm_login'  id="frm_login" method="post">
          <h1>로그인</h1>
          <div class="info">
          <input class="email" type="email" name="email" placeholder="Email"> <br>
          <input class="email" type="password" name="pwd" placeholder="Password">
          </div>
             	<c:if test = "${result == 0 }">
             <div class="login_warn"> 사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
                </c:if>
                 <div class="btn">
                 <button class="btn-primary" type="button" id="btnLogin">로그인</button>
                  </div>
                        
                  <div class="help">
                   <div class='social'>
                     <input value="true" type="checkbox"><label>로그인 정보 저장</label>
                        <a href="insert">회원가입</a>
                        
           
                 	
                                
                    </div>
                </div>
               </form>
             </div>
             </div>
              </header>

<script>

/* 로그인 버튼 클릭 메서드 */
$("#btnLogin").click(function(){
	 $("#frm_login").attr("action", "/loginR");
   $("#frm_login").submit();
 
    
});

</script>

</script>
        </body>

</html>