/**
 * 
 */
 
//-----------회원관리------------------
let user = {};

user.view = function(email){
	let frm = $('#frm_m_user')[0];
	frm.email.value = email;
	frm.action = 'm_user_view';
	frm.submit();
}

user.find = function(){
	let frm = $('#frm_m_user')[0];
	frm.nowPage.value = 1;
	user.select(frm);
}
	
user.select = function(frm){
	frm.action='m_user';
	frm.submit();
}

user.insert = function(frm){
	frm.action = 'm_user_insert';
	frm.submit();
}

user.input = function(frm){
	frm.action = 'm_user_inputR';
	frm.submit();
}

// 24일 추가 및 수정
user.modify = function(frm){
	frm.action = 'm_user_modify';
	frm.submit();
}
user.modifyR = function(frm){
	frm.action = 'm_user_modifyR';
	frm.submit();
}
user.movePage = function(page){
	let frm = $('#frm_m_user')[0];
	frm.nowPage.value = page;
	frm.action = 'm_user';
	frm.submit();
}
function modify(){
	
}
//----------------------------------
 let ask = {};
 
