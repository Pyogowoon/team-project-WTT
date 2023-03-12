/**
 * 
 */


/*
var videojs = require('videojs');
 
require('@silvermine/videojs-quality-selector')(videojs);
require('@silvermine/videojs-quality-selector/dist/css/quality-selector.css');

player.src([
   {
      src: 'video/video2_720.mp4',
      type: 'video/mp4',
      label: '720P',
      selected : true,
   },
   {
      src: 'video/video2_360.mp4',
      type: 'video/mp4',
      label: '360P',
   },
]);

player.controlBar.addChild('QualitySelector');

let options = {
                sources: [
                    {src: "/video", type: "video/mp4"}
                ],
                playbackRates: [.5, .75, 1, 1.25, 1.5],
                controls: true,
                preload: "auto",
                width: 540,
                height: 320,
                controlBar: {
                    children: [
			         'playToggle',
			         'progressControl',
			         'volumePanel',
			         'qualitySelector',
			         'fullscreenToggle',
			      ],
                },
            };

var player = videojs("video2", options);
*/
window.HELP_IMPROVE_VIDEOJS = false;
let player = videojs("video2", {
            //poster : "test-poster.png",
            controls : true,
            playbackRates : [0.5,0.75,1,1.25,1.5],
            playsinline : true,
            autoplay : true,
            muted : true,
            preload : "auto",
            controlBar : {
				playbackRates : true,
				pictureInPictureToggle : true,
				qualitySelector : true,
				remainingTimeDisplay : false,
				currentTimeDisplay : true,
				timeDivider: false,
				durationDisplay : true,
			}
        }
);

let video_play = {};
let timer = 0;

video_play.mousemove = function(){
	let ad = $('.adbuttons');
	ad.attr("style","display : flex");
	if($('#video2').css('min-width') == '100%'){
		$('.adbuttons').css('min-width','100%');
	}else{
		$('.adbuttons').css('min-width','75%');
	}
	$(ad).fadeIn('fast');
	timer = 0;
}

function checkmove(){
	timer++;
	if(timer >= 3){
		$('.adbuttons').fadeOut('fast');
		timer = 0;
	}
}

setInterval(checkmove,1000);

video_play.back = function(frm){
	frm.action = '/'
	frm.submit();
}

video_play.ad_toggle = function(cat){
	
	let frm = $('.frm_video_play')[0];
	frm.pCat.value = cat;
	frm = $(frm).serialize();
	
	$('#video_ad').attr('style','display : none');
	$('#ads').load('video_ad',frm);
	
	if($('#video2').css('min-width') == '100%'){
		$('#video2').attr('style','min-width : 75%');
		$('.adbuttons').css('min-width','75%');
		$('#ads').toggle('slow');
		$('#ads').attr('style','display:block;');
	}else if($('#video2').css('min-width') == '75%'){
		$('#ads').toggle('fast');
		$('#video_ad').attr('style','display:inherit;');
		setTimeout(function(){
			$('#video2').attr('style','min-width : 100%');
			$('.adbuttons').css('min-width','100%');
		},250);
	}
	
	if($('#video2').css('min-width') == '100%'){
		$('.adbuttons').css('width','100%');
	}else{
		$('.adbuttons').css('width','75%');
	}
}








































