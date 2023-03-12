<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_detail_video_search</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<style>
			#vDetail{
				padding :10px;
				margin : 1px auto;
			}
			form{
				margin-bottom:5px;
			}
			form input[name=title]{
				width:255px;
			}
			form div{
			text-align : right;
			padding-right : 10px;	`
			}
			select{
				margin-top : 10px;
				width : 350px;
				height : 280px;
			}
		</style>
	</head>
	<body>
		<div id='vDetail'>
			<form name='frm_find_video' class='frm_find_video' method='post'
				action='m_detail_findVideoR'>
				<div>
					<input type='text' name='findStr' value='${title }'>
					<button>검색</button><br/>
					<select name='sel' size='20' ondblclick='choice()'>
						<c:forEach var='vo' items='${list }'>
							<option value='${vo.serial }/${vo.title}/${vo.sCnt}/${vo.eCnt}'>serial : ${vo.serial } | title : ${vo.title } |  PD: ${vo.pd }</option>
						</c:forEach>
					</select>
				</div>
			</form>
		</div>
		<script>
			let openFrm=opener.document.frm_m_detail_input;
			let localFrm=document.frm_find_video;
			choice = function(){
				let index = localFrm.sel.selectedIndex;
				let array = localFrm.sel[index].value.split('/');
				openFrm.serial.value = array[0];
				openFrm.action = 'find_videoAtt';
				openFrm.submit();
				self.close();
			}
			
		</script>
	</body>
</html>