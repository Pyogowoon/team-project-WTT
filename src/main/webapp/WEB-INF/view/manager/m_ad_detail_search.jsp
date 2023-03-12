<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m_ad_detail_search</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<style>
			#vDetail{
				padding :10px;
				margin : 1px auto;
			}
			form{
				margin-bottom:5px;
			}
			form div{
			text-align : right;
			padding-right : 10px;	`
			}
			select{
				margin-top : 10px;
				width : 450px;
				height : 280px;
			}
		</style>
	</head>
	<body>
		<div id='vDetail'>
			<form name='frm_find_video' class='frm_find_video' method='post'
				action='m_ad_findDetailR'>
				<div>
					<input type='text' name='findStr' value='${dSno }'>
					<button>검색</button><br/>
					<select name='sel' size='20' ondblclick='choice()'>
						<c:forEach var='vo' items='${list }'>
							<option value='${vo.sno }'> sno : ${vo.sno } | title : ${vo.title } |  season : ${vo.dSeason } | ep : ${vo.dEp}</option>
						</c:forEach>
					</select>
				</div>
			</form>
		</div>
		<script>
			let openFrm=opener.document.frm_m_ad_input;
			let localFrm=document.frm_find_video;
			choice = function(){
				let index = localFrm.sel.selectedIndex;
				let dSno = localFrm.sel[index].value;
				console.log(dSno);
				openFrm.dSno.value = dSno;
				openFrm.action = 'find_detail';
				openFrm.submit();
				self.close();
			}
			
		</script>
	</body>
</html>