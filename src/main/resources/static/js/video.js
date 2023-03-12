/**
 * 
 */
 let video = {};

// 영상 검색, 최근 검색어 입력
video.text = function(frm){
	frm.findStr.value = "";
} 
// 검색
video.search = function(){
	let frm = $('#frm_video')[0];
	frm.action = "video_search";
	frm.submit();
}

// 최근 검색어 결과로 이동
video.keyword = function(findStr){
	let frm = $('#frm_video')[0];
	frm.findStr.value= findStr;
	frm.action = "video_search";
	frm.submit();
	
}
// 최근 검색어 삭제
/*video.rFind_delete = function(s){
	let sno = $(s).next().val();
	let param={"sno":sno};
	$.post('video_rFind_delete', param, function(b){
		if(b){
			$(s).parent().remove();
		}
	})
}*/
// 최근 검색어 삭제
video.rFind_delete = function(btn){
	let sno = $(btn).next().val();
	let param={"sno":sno};
	$.post('video_rFind_delete', param, function(b){
		console.log(b);
		if(b){
			$(btn).parent().remove();
		}
	})
}

// 라디오 정보 전달
video.checkbox = function(frm){
	frm.action = "tagCheck";
	frm.submit();	
}
// 토글 버튼변경
video.toggle = function(){
	$('.video_search_chk').slideToggle('fast');
	let up = $('.tag_up').css('display');
	let down = $('.tag_down').css('display');
	if(down == 'inline' && up == 'none'){
		$('.tag_down').css('display','none');
		$('.tag_up').css('display','inline');
	}else {
		$('.tag_down').css('display','inline');
		$('.tag_up').css('display','none');
	}
}	


// 썸네일 클릭
video.play = function(){
	let frm = $('.frm_video_list')[0];
	//frm.action = 'video_play;
	//frm.submit();
}
	





