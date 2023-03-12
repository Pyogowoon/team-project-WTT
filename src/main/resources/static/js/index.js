/**
 * 
 */

let wtt = {};

wtt.textSearch = function(frm){
	if(frm.findStr.value == "제목,배우"){
		frm.findStr.value = "";
	}
}

wtt.login = function(frm){
	frm.action = 'login';
	frm.submit();
}

wtt.account = function(){
	$('.account').slideToggle(300);
}

wtt.gwan = function(){
	$('.gwan').slideToggle(300);
}

wtt.logout = function(){
	location.href = 'logout';
}

wtt.openCategory = function(){
	$('.categories').slideToggle(300);
}
//카테고리 페이지로 이동
wtt.category = function(cat){
	let frm = $('.frm_header')[0];
	frm.vCat.value=cat;
	frm.action='video_list';
	frm.submit();
	
}
//검색페이지로 이동
wtt.search = function(frm){
	frm.action ='video_search';
	frm.submit();
}

wtt.mypage = function(frm){
	frm.action = 'mypage';
	frm.submit();
}

wtt.manage = function(){
	location.href = 'manage';
}
