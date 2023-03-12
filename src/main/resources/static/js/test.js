/**
 * 
 */

let timer=0;
test1 =function(){
	let yap = $('#yap');
	$(yap).fadeIn("fast");
	timer=0;
	console.log("test");
}
function doMove(){
} //마우스가 움직일때마다 타이버를 초기화
function checkmove(){ //1초마다 이함수를 호출하여 타이머를 증가
	timer++;
	if(timer==3){//초단위로 값을 셋팅하고 timer가 해당 값이 될 경우 함수호출
		let yap = $('#yap');
		$(yap).fadeOut("fast");
		timer = 0;//함수를 호출하고 타이머 초기화
	}
}
setInterval(checkmove,1000);
