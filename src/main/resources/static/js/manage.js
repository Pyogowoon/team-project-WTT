/**
 * 
 */

let manage = {};
let loadInterval = [];
let isDisable = false;

manage.init = function(){
	fonts = [
	"맑은고딕","돋음","궁서","굴림","굴림체",
	"궁서체","바탕","바탕체","HY엽서체M","휴먼옛체"
	];
	fonts.sort();

	$('#summernote').summernote({
			fontNames : fonts,
			height : 300,
			callbacks : {
				onImageUpload : function(files){
					loadInterval.length = files.length;
					$('#FAQ_insert').addClass('spinner');
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
		$('#FAQ_insert').removeClass('spinner');
		clearInterval(loadInterval[i]);
	}
	img.src = att;
}

manage.signout_delete = function(btn){
	let frm = new FormData();
	frm.append("sno",btn.value);
	
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
				url : 'signout_delete',
				type : 'post',
				contentType : false,
				cache : false,
				processData : false
			});
			
			isDisable = false;
		},501);
	}
	
}

manage.signoutR = function(){
	location.href = 'signoutR';
}

manage.muny = function(){
	location.href = 'manage_muny';
}

manage.FAQ = function(){
	location.href = 'manage_FAQ';
}

manage.FAQ_view = function(sno){
	let frm = $('.frm_manage_FAQ')[0];
	frm.sno.value = sno;
	frm.action = 'manage_FAQ_view';
	frm.submit();
}

manage.FAQ_update = function(frm){
	frm.action = 'manage_FAQ_update';
	frm.submit();
}

manage.FAQ_insert = function(){
	location.href = 'manage_FAQ_insert';
}

manage.FAQ_delete = function(frm){
	frm.action = 'manage_FAQ_delete';
	frm.submit();
}

manage.muny_view = function(num){
	let frm = $('.frm_manage_muny')[0];
	frm.num.value = num;
	frm.action = 'manage_muny_view';
	frm.submit();
}

manage.muny_delete = function(frm){
	frm.action = 'manage_muny_delete';
	frm.submit();
}