/**
 * 
 */

let mypage = {};
let loadInterval = [];
let isDisable = false;
let pwdCon = 0;
let phoneCon = 1;
let emailCon = 0;

mypage.user_modify_back = mypage.mylist_back = mypage.friendlist_back
 = mypage.FAQ_back = mypage.ask_back = mypage.signout_back 
 = mypage.cancel = function(frm){
	frm.action = 'mypage';
	frm.submit();
}

mypage.user_edit = function(){
	$('.user_edit').slideToggle(300);
}

mypage.user_modify = function(frm){
	frm.action = 'user_modify';
	frm.submit();
}

mypage.mylist = function(frm){
	frm.action = 'mylist';
	frm.submit();
}

mypage.friendlist = function(frm){
	frm.action = 'friendlist';
	frm.submit();
}

mypage.FAQ = function(frm){
	frm.action = 'FAQ';
	frm.submit();
}

mypage.ask = function(frm){
	frm.action = 'ask';
	frm.submit();
}

mypage.user_setting = function(){
	$('.user_setting').slideToggle(300);
}

mypage.alarm = function(){
	$('.alarm_bell').toggle(300);
}

mypage.signout = function(frm){
	frm.action = 'signout';
	frm.submit();
}

/*--------------------------- user_modify --------------------------------*/

mypage.user_modify_pwdC = function(frm){
	let pwd = frm.pwd.value;
	let pwdC = frm.pwd_conf.value;
	
	if( (pwd == "") && (pwdC == "") ){
		$('#pwdC').attr('style','color:#f00;display:inline-block');
		$('#pwdC').text("비밀번호를 입력해주세요.");
		pwdCon = 0;
	}else if((pwd != "") && (pwdC != "") && (pwd == pwdC)){
		$('#pwdC').attr('style','color:#33f;display:inline-block');
		$('#pwdC').text("비밀번호가 일치합니다.");
		pwdCon = 1;
	}else if( (pwd != pwdC) && pwdC != ""){
		$('#pwdC').attr('style','color:#f00;display:inline-block');
		$('#pwdC').text("비밀번호가 일치하지 않습니다");
		pwdCon = 0;
	}else{
		$('#pwdC').attr('style','display:none');
		pwdCon = 0;
	}
}

mypage.user_modify_phoneC = function(frm){
	let phone = frm.phone.value;
	var phone1 = /^\d{3}-\d{4}-\d{4}$/;
	let phoneTemp = phone.replace(/[^0-9]/g,"");
	
	if((phone1.test(phone)) || (phoneTemp.length == 11)){
		$('#phoneC').attr('style','display:none');
		phoneCon = 1;
	}else{
		$('#phoneC').attr('style','color:#f00;display:inline-block');
		$('#phoneC').text("연락처를 확인해주세요.");
		phoneCon = 0;
	}
}

mypage.user_modifyR = function(frm){
	if(isDisable){
		return;
	}else{
		isDisable = true;
		
		if(pwdCon && phoneCon){
			frm.action = 'user_modifyR';
			frm.submit();
		}else if(!pwdCon){
			$('#pwdC').attr('style','color:#f00;display:inline-block');
			$('#pwdC').text("비밀번호를 입력해주세요.");
			pwdCon = 0;
		}else if(!phoneCon){
			$('#phoneC').attr('style','color:#f00;display:inline-block');
			$('#phoneC').text("연락처를 확인해주세요.");
			phoneCon = 0;
		}
		
		setTimeout(function(){isDisable=false;},501);
	}
}

/*-------------------------- mylist ----------------------------------*/

mypage.mylist_delete = function(btn){
	if(isDisable){
		return;
	}else{
		isDisable = true;
		
		let p = $(btn).parent();
		$(p).fadeOut(500);
		setTimeout(function(){
			$(p).remove();
			let frm = $('.frm_mylist')[0];
			frm.sno.value = btn.value;
			frm.action = 'mylist_delete';
			frm.submit();
			isDisable=false;
		},501);
		
	}
}

/*-------------------------- friendlist ----------------------------------*/

mypage.maxlength = function(e){
	if(e.value.length > e.maxLength){
		e.value = e.value.slice(0, e.maxLength);
	}
}

mypage.friend_add = function(){
	$('.btnFriendAdd').toggle(0);
	$('.friend_add').toggle(300);
}

mypage.friend_emailC = function(frm){
	let email = frm.fEmail.value;
	let emailC = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	console.log(emailC.test(email));
	if(emailC.test(email)){
		$('.input_emailC').attr('style','display:none');
		emailCon = 1;
	}else{
		$('.input_emailC').attr('style','display:inline-block');
		$('.input_emailC').text("이메일 주소를 확인해주세요.");
		emailCon = 0;
	}
}

mypage.friend_addR = function(frm){
	if(isDisable){
		return;
	}else{
		if(emailCon){
			isDisable = true;
			
			frm.action = 'friend_addR';
			frm.submit();
			
			setTimeout(function(){isDisable=false;},301);
		}else{
			return;
		}
	}
}

mypage.friend_cancel = function(){
	$('.btnFriendAdd').toggle(1000);
	$('.friend_add').toggle(300);
}
/*
mypage.friend_nick_edit = function(){
	$('.btnFriendNickEdit').toggle(300);
	$('.friend_nick').removeAttr('disabled');
	// 커서 맨 뒤로 오게하는 기능
	let temp = $('.friend_nick').val();
	$('.friend_nick').val('');
	$('.friend_nick').val(temp);
	$('.friend_nick').focus();
}
*/

mypage.friend_nick_edit = function(btn){
	let btnR = $(btn).next();
	let text = $(btn).prev().prev();
	$(btn).toggle(300);
	btnR.toggle(300);
	text.removeAttr('disabled');
	let temp = text.val();
	text.val('').val(temp);
	text.focus();
}

mypage.friend_nick_editR = function(btn){
	let btnR = $(btn).prev();
	let text = $(btn).prev().prev().prev();
	let sno = $(btn).next();
	let findStr = $('#findStr').val();
	let frm = new FormData();
	
	frm.append("findStr",findStr);
	frm.append("fNick",$(text).val());
	frm.append("sno",$(sno).val());
	
	if(isDisable){
		return;
	}else{
		isDisable = true;
		
		$.ajax({
			data : frm,
			url : 'friend_nickR',
			type : 'post',
			contentType : false,
			cache : false,
			processData : false,
			success : function(){
				
				$(btn).toggle(300);
				btnR.toggle(300);
				text.attr('disabled','true');
			}
		})
		setTimeout(function(){isDisable=false;},301);
	}
}

mypage.friend_delete = function(btn){
	let frm = new FormData();
	let findStr = $('#findStr').val();
	frm.append("sno",btn.value);
	frm.append("findStr",findStr);
	frm.action = 'friend_delete';
	
	if(isDisable){
		return;
	}else{
		isDisable = true;
		
		let p = $(btn).parent();
		$(p).fadeOut(500);
		setTimeout(function(){
			$(p).remove();
			
			$.ajax({
				data : frm,
				url : 'friend_delete',
				type : 'post',
				contentType : false,
				cache : false,
				processData : false,
			})
			
			isDisable=false;
		},501);
		
	}
}


/*-------------------------- FAQ ----------------------------------*/

mypage.FAQ_category = function(fCat){
	let frm = $('.frm_FAQ')[0];
	frm.fCat.value = fCat;
	frm.nowPage.value = 1;
	frm.action = 'FAQ_catclick';
	frm.submit();
}

mypage.FAQ_view = function(subject){
	let frm = $('.frm_FAQ')[0];
	frm.subject.value = subject;
	frm.action = 'FAQ_view';
	frm.submit();
}

mypage.FAQ_view_back = function(frm){
	frm.action = 'FAQ_view_back';
	frm.submit();
}

mypage.FAQ_cancel = function(frm){
	frm.action = 'FAQ_cancel';
	frm.submit();
}

mypage.FAQ_move = function(num){
	let frm = $('.frm_FAQ')[0];
	frm.nowPage.value = num;
	frm.action = 'FAQ_catclick';
	frm.submit();
}

mypage.munylist = function(frm){
	frm.action = 'munylist';
	frm.submit();
}

mypage.muny = function(frm){
	frm.action = 'muny';
	frm.submit();
}

/*-------------------------- munylist_detail ----------------------------------*/

mypage.munylist_delete = function(frm){
	if(isDisable){
		return;
	}else{
		isDisable=true;
		frm.action = 'munylist_delete';
		frm.submit();
		setTimeout(function(){isDisable=false},500);
	}
}

/*-------------------------- munylist ----------------------------------*/

mypage.munylist_back = function(frm){
	frm.action = 'FAQ';
	frm.submit();
}

mypage.munylist_detail = function(num){
	let frm = $('.frm_munylist')[0];
	frm.num.value = num;
	frm.action = 'munylist_detail';
	frm.submit();
}

mypage.muny_move = function(num){
	let frm = $('.frm_munylist')[0];
	frm.nowPage.value = num;
	frm.action = 'munylist_move';
	frm.submit();
}

/*-------------------------- muny ----------------------------------*/

mypage.muny_detail_back = function(frm){
	frm.action = 'munylist';
	frm.submit();
}

mypage.muny_change = function(){
	$('.muny_error').attr('style','display:none');
}

mypage.munyR = function(frm){
	let tit = frm.mTitle.value;
	let doc = frm.mDoc.value;
	frm.mDoc.value = doc.replaceAll(/[<p>,</p>,\s,&nbs;]/g,"");
	
	if(isDisable){
		return;
	}else{
		isDisable=true;
		
		if( (tit.replaceAll(/\s/g,"") != "") && (doc.replaceAll(/[<p>,</p>,\s,&nbs;]/g,"") != "" ) ){
			frm.action = 'munyR';
			frm.submit();
		}else{
			$('.muny_error').attr('style','display:block');
		}
		
		
		setTimeout(function(){isDisable=false},500);
	}
	
}

mypage.init = function(){
	fonts = [
	"맑은고딕","돋음","궁서","굴림","굴림체",
	"궁서체","바탕","바탕체","HY엽서체M","휴먼옛체"
	];
	fonts.sort();

	$('#summernote').summernote({
			fontNames : fonts,
			height : 300,
			callbacks : {
				
				onInit : function(){
					$('.note-editable').on('click',function(){
						mypage.muny_change();
					});
				},
				
				onImageUpload : function(files){
					loadInterval.length = files.length;
					$('#muny').addClass('spinner');
					for(var i=files.length-1; i>=0; i--){
						sendFile(i, files[i]);
					}
				},
				
				onMediaDelete : function(target){
					var file = decodeURI(target[0].src);
					
					$.ajax({
						data : {delFile : file}, // <-- Parameter(req.getParameter('delFile'))
						type : 'POST',
						//url : 'summernoteDelete',
						cache : false,
						success : function(resp){
							console.log('delete ok....');
						}
					})
				}
			}
	});
}

// board.sendFile = function(a,b,c){} // hoisting 되지 않기 때문에 호출 부분보다 상위에 정의해야 됨.
function sendFile(i, file){
	var frm = new FormData();  // enctype이 있는 form tag를 생성
	frm.append('file',file);
	$.ajax({
		data : frm,
		type : 'POST',
		//url : 'summernote',
		enctype : 'multipart/form-data',
		cache : false,
		contentType : false,
		processData : false,
		success : function(att){
			// interval 된 객체를 loadInterval의 i 번째에 저장
			loadInterval[i] = setInterval(loadCheck.bind(null, i, att), 1500);
		}
		
	});
}

function loadCheck(i, att){
	var img = new Image();
	img.onload = function(){
		$('#summernote').summernote('editor.insertImage',att);
		$('#muny').removeClass('spinner');
		clearInterval(loadInterval[i]);
	}
	img.src = att;
}

/*-------------------------- ask ----------------------------------*/

mypage.askR = function(frm){
	frm.action = 'askR';
	frm.submit();
	
}


/*-------------------------- signout ----------------------------------*/

mypage.click_other = function(frm){
	$('input:radio[name="signout_reason"]:radio[value="기타"]').prop('checked',true);
	
	if(frm.signout_reasonText.value == "기타"){
		frm.signout_reasonText.value = "";
	}
}

mypage.click_change = function(){
	$('.signout_error').attr('style','display:none');
}

mypage.signoutR = function(frm){
	if(isDisable){
		return;
	}else{
		isDisable = true;
		let pwd = {"pwd" : $('#pwdChk').val()};
		$.post('pwdChk',pwd,function(chk){
			if(!chk){
				$('.signout_error').attr('style','display:inline-block');
				$('.signout_error').text('비밀번호를 확인해주세요.');
			}else{
				let radio = $('input:radio[name="signout_reason"]:checked').val();
				let temp = frm.signout_reasonText.value.replaceAll(/\s/g,"");
				
				if(radio == null || (radio == '기타' && temp == "")){
					$('.signout_error').attr('style','display:inline-block');
					$('.signout_error').text('사유를 선택해주세요.');
				}else{
					frm.action = 'signoutR';
					frm.submit();
				}
			}
			setTimeout(function(){isDisable=false},500);
		});
	}
}
