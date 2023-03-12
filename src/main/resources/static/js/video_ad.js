/**
 * 
 */

let ads = {};

ads.actor = function(btn){
	let item = $(".ads_item");
	for(var i=0;i< item.length; i++){
		if($(item[i]).attr("value") == btn){
			if($(item[i]).css("display") == 'none'){
				$(item[i]).fadeIn(500);
			}else{
				$(item[i]).fadeOut(300);
			}
		}
	}
}