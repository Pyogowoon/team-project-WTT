/**
 * 
 */

let cnt = 0;
let main = {};
var prev = document.getElementById("moveLeft");
var next = document.getElementById("moveRight");
var prev2 = document.getElementById("moveLeft2");
var next2 = document.getElementById("moveRight2");

main.video = function() {
	let sfrm=$(".frm_main")[0];
	
	sfrm.action ="video_detail";
	sfrm.submit();

}
main.video2 = function(sno){
	console.log(sno);
	let frm = $('#frm_vDetail_vo')[0];
	$(frm.sno).val(sno);
	frm.action="video_detail";
	frm.submit();
}
next.onclick = function() {
	if (cnt == -2400) {
		return;
	}
	cnt = cnt - 1450;
	$('.user-hot').animate({ marginLeft: cnt + "px" })

}

prev.onclick = function() {
	if (cnt == 0) {
		return;
	} else {
		cnt = cnt + 1450;
		$('.user-hot').animate({ marginLeft: cnt + "px" })
	}
}

next2.onclick = function() {
	if (cnt == -2400) {
		return;
	}
	cnt = cnt - 1200;
	$('.user-hot2').animate({ marginLeft: cnt + "px" })

}

prev2.onclick = function() {
	if (cnt == 0) {
		return;
	} else {
		cnt = cnt + 1200;
		$('.user-hot2').animate({ marginLeft: cnt + "px" })
	}
}
function playPause(selector) {
  
	var myVideo = $(selector).find('.video1')[0];
  var myPoster = $(selector).find('.poster')[0];
	if (myVideo.paused) {
		$(myVideo).attr('style', 'display:block');
		$(myPoster).attr('style', 'display:none');
		myVideo.play();

	}

	else {
		$(myVideo).attr('style', 'display:none');
		$(myPoster).attr('style', 'display:block');
		myVideo.pause();
	}

}

/*
$(document).ready(function( $ ){
$(".description__button").on("click", function(event){
	$("#popup").show();
	console.log("dasd")
	$("body").append('<div class="backon"></div>'); //뒷배경생성

});
});

*/

main.on = function(serial){
	//document.getElementById("popup").style.display = "block";
	let param = {"serial" : serial};
	//frm.serial.value = 1;
	//frm = $(frm).serialize();
	
	$('#popup').load('main_load',param);
	$('#popup').show();
	

}
main.seasonView = function(){
	let frm = $('#frm_vDetail_vo')[0];
	let param = $(frm).serialize();
	$('#popup').load('main_load',param);
	
	
}

$(document).mouseup(function(e) {
	var popup = $("#popup");
	if (popup.has(e.target).length === 0) {
		popup.hide();
	}
})

function off(e) {
	$("#previous").on("click")
	document.getElementById("popup").style.display = "none";

}


