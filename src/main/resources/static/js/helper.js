/**
 * 
 */
 
 
let helper = {};
let loadInterval =[];

helper.init=function(){
	fonts=[ "맑은고딕", "돋움", "궁서", "굴림", "굴림체",
			  "궁서체", "바탕", "바탕체", "HY엽서체M", "휴먼옛체" ];
	fonts.sort();
	$('#summernote').summernote({
		fontNames : fonts,
		height : 400,
		callbacks : {
			onImageUpload : function(files){
				loadInterval.length = files.length;
				$('#helper_FAQ').addClass('spinner');
				for(var i=files.length-1; i>=0 ; i--){
					sendFile(i, files[i]);
				}
			},
			onMediaDelete : function(target){
				var file = decodeURI(target[0].src);
			
				$.ajax({
					data : {delFile : file},
					type : 'POST',
					url  : 'summernoteDelete',
					cache : false,
					success : function(resp){
					}
				})
			}
		}
	});
}

function sendFile(i, file){
	var frm = new FormData();
	frm.append('file', file);
	$.ajax({
		data : frm,
		type : 'POST',
		url  : 'summernote',
		enctype : 'multipart/form-data',
		cache : false,
		contentType : false,
		processData : false,
		success : function(att){
			loadInterval[i] = setInterval(loadCheck.bind(null, i, att), 1000)
		}
	});
}
function loadCheck(i, att){
	var img = new Image();
		
	img.onload = function(){
		
		$('#summernote').summernote('editor.insertImage', att);
		$('#helper_FAQ').removeClass('spinner');
		clearInterval(loadInterval[i]);
	}
	img.src = att;
	
}
//----------------------------------
helper.FAQinsert = function(){
	let frm = $('.frm_helper_FAQ')[0];
	frm.action = "helperFAQInsert";
	frm.submit();
}

helper.friendCho = function(){
	$('.friendChoContent').slideToggle('slow');
}

helper.settingOut = function(){
	$('.inSetting').slideToggle('slow');
}
helper.ThemaOut = function(){
	$('.settingThema').slideToggle('slow');
}
