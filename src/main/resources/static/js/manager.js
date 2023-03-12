/**
 * 22.07.11 안우성 작성 
 *
 */
//---------------------------영상/시리즈 관리
let mVideo = {};
mVideo.isDisable = false;

 
mVideo.insert = function(frm){
	frm.action = 'm_video_insert';
	frm.submit();
}
mVideo.insertR = function(frm){
	//중복 클릭 방지 로직
	if(mVideo.isDisable){
		return;
	}else{
		mVideo.isDisable = true;		
		
		let frmv = $('#frm_m_video_input')[0];
		let param = $(frmv).serialize();
		$.post('m_video_insertR',param,function(sno){
			if(sno==0) return;
			let poster = $('.poster')[0];
			let teaser = $('.teaser')[0];
			let frmAtt = new FormData();
			frmAtt.append("poster",poster.files[0]);
			frmAtt.append("teaser",teaser.files[0]);
			frmAtt.append("sno",sno);
			$.ajax({
				data : frmAtt,
				url : 'video_fileUpload',
				type : 'POST',
				enctype : 'multipart/form-data',
				cache : false,
				contentType : false,
				processData : false,
				success : function(){
					frm.action = 'seasonInfo_insert';
					frm.submit();
				}
			})
		})
		setTimeOut(function(){mVideo.isDisable = false;},500)
	}
}
mVideo.select = function(frm){
	frm.action='m_video';
	frm.submit();
} 
mVideo.find = function(){
	let frm = $('#frm_m_video_list')[0];
	frm.nowPage.value=1;
	mVideo.select(frm);
}
mVideo.view = function(serial){
	let frm = $('#frm_m_video_list')[0];
	frm.serial.value = serial;
	frm.action = 'm_video_view';
	frm.submit();
}
mVideo.modify =function(frm){
	frm.action ='m_video_modify';
	frm.submit();
}
mVideo.modifyR = function(frm){
	if(mVideo.isDisable){
		return;
	}else{
		mVideo.isDisable = true;
		
		let vfrm = $('#frm_m_video_input')[0];
		let param = $(vfrm).serialize();
		$.post('m_video_modifyR',param,function(serial){
			if(serial == 0) return;
			
			let poster = $('.poster')[0];
			let teaser = $('.teaser')[0];
			let frmAtt = new FormData();
			frmAtt.append("poster",poster.files[0]);
			frmAtt.append("teaser",teaser.files[0]);
			frmAtt.append("sno",serial);
			$.ajax({
				data : frmAtt,
				url : 'video_fileUpload_mo',
				type : 'POST',
				enctype : 'multipart/form-data',
				cache : false,
				contentType : false,
				processData : false,
				success : function(){
					frm.action = 'seasonInfo_modifyR';
					frm.submit();
				}
			})
		})
		setTimeOut(function(){mVideo.isDisable = false;},500);
	}
}
//단일 수정 
mVideo.seasonInfoModifyOne = function(btn){
	let sno = $(btn).parent().prev().children('.sno').val();
	let season = $(btn).parent().prev().children('.season').val();
	let epCnt = $(btn).parent().prev().children('.epCnt').val();
	let frmAtt = new FormData();
	frmAtt.append("season",season);
	frmAtt.append("epCnt",epCnt);
	frmAtt.append("sno",sno);
	$.ajax({
		data : frmAtt,
		url : 'seasonInfo_modify_one',
		type : 'POST',
		cache : false,
		contentType : false,
		processData : false,
		success : function(){
		}
	})
}
// 단일 저장
mVideo.seasonInfoInsertOne = function(btn){
	let frm = $('#frm_m_seasonInfo')[0];
	let serial = frm.serial.value;
	let season = $(btn).parent().prev().children('.season').val();
	let epCnt = $(btn).parent().prev().children('.epCnt').val();
	let frmAtt = new FormData();
	frmAtt.append("season",season);
	frmAtt.append("epCnt",epCnt);
	frmAtt.append("serial",serial);
	$.ajax({
		data : frmAtt,
		url : 'seasonInfo_insert_one',
		type : 'POST',
		cache : false,
		contentType : false,
		processData : false,
		success : function(){
		}
	})	
}
//포스터 추가
mVideo.addPoster = function(){
	let btnPoster = $('.poster');
	btnPoster.click();
}
//티져 추가
mVideo.addTeaser = function(){
	let btnTeaser = $('.teaser');
	btnTeaser.click();
}
//이미지 미리보기
mVideo.loadImg = function(img){
	// 파일이 있는경우
	if(img.files && img.files[0]) {
		let reader = new FileReader();
		reader.onload = function(e){
			$('.loadImg').attr('src', e.target.result);
		}
		reader.readAsDataURL(img.files[0]);
	}
}
mVideo.loadImg2 = function(img){
	// 파일이 있는경우
	if(img.files && img.files[0]) {
		let reader = new FileReader();
		reader.onload = function(e){
			$('.loadImg').attr('src', e.target.result);
			$('.pSysFile').val(img.files[0]);
		}
		reader.readAsDataURL(img.files[0]);
	}
}
//티저 파일 

mVideo.loadTeaser =function(teaser){
	if(teaser.files && teaser.files[0]){
		let reader = new FileReader();
		reader.onload = function(e){
			$('.teaserName').val(teaser.files[0].name);
			$('.tSysFile').val(teaser.files[0].name);
		}
		reader.readAsDataURL(teaser.files[0]);
	}
}
mVideo.loadTeaser2 =function(teaser){
	if(teaser.files && teaser.files[0]){
		let reader = new FileReader();
		reader.onload = function(e){
			$('.teaserName').val(teaser.files[0].name);
		}
		reader.readAsDataURL(teaser.files[0]);
	}
}

//행 추가
mVideo.hengNo=1;
mVideo.lastSelect = -1;
mVideo.str;

//행추가ㅌ
mVideo.addHeng = function(){
	let h = $('#line').children().length;
	str = `<div class='seCnt'>
				<div class='chk'>
					<input type="checkbox" class='hengNo'/>
				</div>
				<div class='cntInfo'>
					<label>시즌 : </label>
					<input type='text' name='seasonInfoList[${h}].season' class='season'>
					<label> / </label>
					<label></label>
					<label>해당 시즌 회차 : </label>
					<input type='text' name='seasonInfoList[${h}].epCnt' class='epCnt'>
				</div>
			</div>`
	$('#line').append(str);
}
// 수정에서 사용
mVideo.addHeng2 = function(){
	let h = $('#line').children().length;
	let modifyInfoArray = $('.modifyInfo').get();
	let sh= h-modifyInfoArray.length;
	str = `<div class='seCnt saveInfo'>
				<div class='chk'>
					<input type="checkbox" class='hengNo'/>
				</div>
				<div class='cntInfo'>
					<label>시즌 : </label>
					<input type='text' name='seasonInfoList[${sh}].season' class='season saveSeason'>
					<label> / </label>
					<label></label>
					<label>해당 시즌 회차 : </label>
					<input type='text' name='seasonInfoList[${sh}].epCnt' class='epCnt saveEpCnt'>
				</div>
				<div class='mbtn'>
					<button type='button' class='saveOne' onclick='mVideo.seasonInfoInsertOne(this)'> 단일<br/> 저장 </button>
				</div>
			</div>`
	$('#line').append(str);
}
//행 제거
mVideo.deleteHeng = function(){
	let h = $('#line').children().length;

	let chk = $('.hengNo');
	for(i=0 ; i< h ; i++){
		if($(chk[i]).is(':checked')){
			let removeH = $(chk[i]).parent().parent();
			$(removeH).remove();
		}
	}
	let seasonArray = $('.season').get();
	let epCntArray = $('.epCnt').get();
	for(let i=0 ; i<seasonArray.length ; i++){
		$(seasonArray[i]).attr("name",`seasonInfoList[${i}].season`)
	}
	for(let i=0 ; i<epCntArray.length ; i++){
		$(epCntArray[i]).attr("name",`seasonInfoList[${i}].epCnt`)
	}
}
// 수정에서 사용 행제거
mVideo.deleteHeng2 = function(){
	let h = $('#line').children().length;

	let chk = $('.hengNo');
	for(i=0 ; i< h ; i++){
		if($(chk[i]).is(':checked')){
			let removeH = $(chk[i]).parent().parent();
			let chkStatus = $(removeH).find('button').attr('class');
			if(chkStatus == 'modifyOne'){
				let sno = $(removeH).find('.sno').val();
				let param = {"sno" : sno};
				$.post('seasonInfo_delete_one',param);
			}
			$(removeH).remove();
		}
	}
	let snoArray = $('.sno').get()
	let modifySeasonArray = $('.modifySeason').get();
	let modifyEpCntArray = $('.modifyEpCnt').get();
	let saveSeasonArray = $('.saveSeason').get();
	let saveEpCntArray = $('.saveEpCnt').get();
	for(let i=0 ; i<snoArray.length ; i++){
		$(snoArray[i]).attr("name",`seasonModifyList[${i}].sno`)
	}
	for(let i=0 ; i<modifySeasonArray.length ; i++){
		$(modifySeasonArray[i]).attr("name",`seasonModifyList[${i}].season`)
	}
	for(let i=0 ; i<modifyEpCntArray.length ; i++){
		$(modifyEpCntArray[i]).attr("name",`seasonModifyList[${i}].epCnt`)
	}
	for(let i=0 ; i<saveSeasonArray.length ; i++){
		$(saveSeasonArray[i]).attr("name",`seasonInfoList[${i}].season`)
	}
	for(let i=0 ; i<saveEpCntArray.length ; i++){
		$(saveEpCntArray[i]).attr("name",`seasonInfoList[${i}].epCnt`)
	}
	
}
//단일 삭제
mVideo.deleteOneR = function(frm){
	let param = $(frm).serialize();
	$.post('m_video_deleteOne',param,function(b){
		if(b){
			mVideo.select(frm);
		}
	})
}
//선택 삭제
mVideo.deleteR =function(frm){
	let param=$(frm).serialize();
	$.post('m_video_deleteAll',param,function(b){
		if(b){
			mVideo.select(frm);
		}
	})
}
// 페이징 처리
mVideo.movePage = function(page){
	let frm = $('#frm_m_video_list')[0];
	frm.nowPage.value=page;
	frm.action = 'm_video';
	frm.submit();
}
mVideo.dView = function(){
	let frm = $('#frm_m_video_input')[0];
	frm.action = 'm_detail_view'
	frm.submit();
}
/*
*/
//----------------------------------------
//--------------------영상세부정보 관리 ------------------
let mDetail = {};
mDetail.postercon = -1;
mDetail.vidcon=-1;

mDetail.insert = function(frm){
	frm.action = "m_detail_insert";
	frm.submit();
}
mDetail.insertR = function(frm){
	let param = $(frm).serialize();
		
	
	$.post("m_detail_insertR",param,function(e){

		let sfrm = $('#frm_m_detail_input')[0];
		let frmAtt = new FormData(sfrm);
		frmAtt.append("sSno" , e);
		$.ajax({
			data : frmAtt,
			url : 'm_detail_fileUpload',
			type : 'POST',
			enctype : 'multipart/form-data',
			cache : false,
			contentType : false,
			processData : false,
			success : function(){ 
				frm.action = "m_detail";
				frm.submit();
			}
		})
	})
}
mDetail.findVideo = function(frm){
	let title = $('#frm_m_detail_input')[0].title.value;
	let win = window.open('m_detail_findVideo?title='+title, 'win', 'width = 480, height=450');
}
mDetail.select = function(frm){
	frm.action ="m_detail";
	frm.submit();
}
mDetail.view = function(serial){
	let frm = $('#frm_m_detail_list')[0];
	frm.serial.value=serial;
	frm.action = "find_videoAtt";
	frm.submit();
}
mDetail.view2 = function(serial){
	let frm = $('#frm_m_video_input')[0];
	frm.serial.value=serial;
	frm.nowPage.value=1;
	frm.findStr.value='';
	frm.action = "find_videoAtt";
	frm.submit();
}
mDetail.modify = function(frm){
	frm.action = "m_detail_insert";
	frm.submit();
}
mDetail.movePage = function(page){
	let frm = $('#frm_m_detail_list')[0];
	frm.nowPage.value=page;
	frm.action = 'm_detail';
	frm.submit();
}
mDetail.modifyOne = function(btn){
	let parent = $(btn).parent().parent();
	let dpSysFile = $(parent).find('.dpSysFile').clone();
	$(dpSysFile).attr("name","MvDetailModifyList[0].dpSysFile");
	let dpSysFiletag = $(dpSysFile)[0];
	let dpOriFile =$(parent).find('.dpOriFile').clone();
	$(dpOriFile).attr("name","MvDetailModifyList[0].dpOriFile");
	let dpOriFiletag = $(dpOriFile)[0];
	let vSysFile =$(parent).find('.vSysFile').clone();
	$(vSysFile).attr("name","MvDetailModifyList[0].vSysFile");
	let vSysFiletag = $(vSysFile)[0];
	let vOriFile = $(parent).find('.vOriFile').clone();
	$(vOriFile).attr("name","MvDetailModifyList[0].vOriFile");
	let vOriFiletag = $(vOriFile)[0];
	let vSno = $(parent).find('.vSno').clone();
	$(vSno).attr("name","MvDetailModifyList[0].sno");
	let vSnotag = $(vSno)[0];
	let changePoster = $(parent).find('.changePoster').clone();
	$(changePoster).attr("name","MvDetailModifyList[0].changePoster");
	let changePostertag = $(changePoster)[0];
	let changeVid = $(parent).find('.changeVid').clone();
	$(changeVid).attr("name","MvDetailModifyList[0].changeVid");
	let changeVidtag = $(changeVid)[0];
	let dSeason = $(parent).find('.dSeason').clone();
	$(dSeason).attr("name","MvDetailModifyList[0].dSeason");
	let dSeasontag = $(dSeason)[0];
	let dEp = $(parent).find('.dEp').clone();
	$(dEp).attr("name","MvDetailModifyList[0].dEp");
	let dEptag = $(dEp)[0];
	let playTime = $(parent).find('.playTime').clone();
	$(playTime).attr("name","MvDetailModifyList[0].playTime");
	let playTimetag = $(playTime)[0];
	let dEptitle = $(parent).find('.dEptitle').clone();
	$(dEptitle).attr("name","MvDetailModifyList[0].dEptitle");
	let dEptitletag = $(dEptitle)[0];
	
	let dPoster = $(parent).find('.dPoster').clone()[0];
	let dVid = $(parent).find('.dVid').clone()[0];
	
	let frm = $('#frm_temp')[0];
	$(frm).empty();
	frm.append(dpSysFiletag);
	frm.append(dpOriFiletag);
	frm.append(vSysFiletag);
	frm.append(vOriFiletag);
	frm.append(changePostertag);
	frm.append(changeVidtag);
	frm.append(dSeasontag);
	frm.append(dEptag);
	frm.append(playTimetag);
	frm.append(dEptitletag);
	frm.append(vSnotag);
	frm.append(dPoster);
	frm.append(dVid);
	
	let frmAtt = new FormData(frm);
		$.ajax({
			data : frmAtt,
			url : 'm_detail_fileUpload',
			type : 'POST',
			enctype : 'multipart/form-data',
			cache : false,
			contentType : false,
			processData : false,
			success : function(){ 
				let sfrm = $('#frm_m_detail_input')[0];
				sfrm.action = "find_videoAtt";
				sfrm.submit();
			}
		})
	
}
mDetail.saveOne = function(btn){
	let serial = $('.serial').clone()[0];
	let parent = $(btn).parent().parent();
	let dSeason = $(parent).find('.dSeason').clone();
	$(dSeason).attr("name","MvDetailList[0].dSeason");
	let dSeasontag = $(dSeason)[0];
	let dEp = $(parent).find('.dEp').clone();
	$(dEp).attr("name","MvDetailList[0].dEp");
	let dEptag = $(dEp)[0];
	let playTime = $(parent).find('.playTime').clone();
	$(playTime).attr("name","MvDetailList[0].playTime");
	let playTimetag = $(playTime)[0];
	let dEptitle = $(parent).find('.dEptitle').clone();
	$(dEptitle).attr("name","MvDetailList[0].dEptitle");
	let dEptitletag = $(dEptitle)[0];
	
	let dPoster = $(parent).find('.dPoster').clone()[0];
	let dVid = $(parent).find('.dVid').clone()[0];
	
	let frm = $('#frm_temp')[0];
	$(frm).empty();
	frm.append(serial);
	frm.append(dSeasontag);
	frm.append(dEptag);
	frm.append(playTimetag);
	frm.append(dEptitletag);
	frm.append(dPoster);
	frm.append(dVid);
	
	let param = $(frm).serialize();
	$.post('m_detail_insertR',param,function(e){
		let frmAtt = new FormData(frm);
		frmAtt.append("sSno",e);
		$.ajax({
			data : frmAtt,
			url : 'm_detail_fileUpload',
			type : 'POST',
			enctype : 'multipart/form-data',
			cache : false,
			contentType : false,
			processData : false,
			success : function(){ 
				let sfrm = $('#frm_m_detail_input')[0];
				sfrm.action = "find_videoAtt";
				sfrm.submit();
			}
		})
	})
}
mDetail.addHeng = function(){
	let h = $('#line').children().length;
	let modifyDataArray = $('.modifyData').get();
	let sh = h-modifyDataArray.length;
	str = `<div class='vDetail'>
				<div class='ePoster'>
					<img class='epImg' width="120" height="80">
				</div>
				<div class='vDetailInfo'>
					<label> 포스터 첨부 : </label>
					<input type='file' name='sdPoster' class='dPoster saveP' onchange="mDetail.loadImg(this)" accept="image/*"/>
					<label class='dVidName'> 영상 첨부 : </label>
					<input type='file' name='sdVid' class='dVid saveV' accept="video/*"/>
					<br/>
					<label>시즌 : </label>
					<input type='text' name='MvDetailList[${sh}].dSeason' class='dSeason sdSeason'>
					<span> / </span>
					<span> 회차 : </span>
					<input type='text' name='MvDetailList[${sh}].dEp' class='dEp sdEp'>
					<label>플레이 타임 : </label>
					<input type='text' name='MvDetailList[${sh}].playTime' class='playTime splayTime'>
					<label> 회차 제목 : </label>
					<input type='text' name='MvDetailList[${sh}].dEptitle' class='dEptitle sdEptitle'>
				</div>
				<div class='subBtn'>
					<div></div>
					<button type='button' class='saveOne' onclick='mDetail.saveOne(this)'> 단일 <br> 저장 </button>
				</div>
				<div class='chkHeng'>
					<div></div>
					<input type="checkbox" class='hengNo' value=''/>
				</div>
			</div>`
	$('#line').append(str);
}
//행 제거
mDetail.deleteHeng = function(){
	let h = $('#line').children().length;
	let frm = $('#frm_m_detail_input')[0];
	let param = $(frm).serialize();
	let chk = $('.hengNo');
	$.post('m_detail_delete',param);
	for(i=0 ; i< h ; i++){
		if($(chk[i]).is(':checked')){
			let removeH = $(chk[i]).parent().parent();
			$(removeH).remove();
		}
	}
	let snoArray = $('.vSno').get()
	let dpSysFileArray = $('.dpSysFile').get()
	let dpOriFileArray = $('.dpOriFile').get()
	let vSysFileArray = $('.vSysFile').get()
	let vOriFileArray = $('.vOriFile').get()
	let changePosterArray = $('.changePoster').get()
	let changeVidArray = $('.changeVid').get()
	let modSeasonArray = $('.modSeason').get()
	let modEpArray = $('.modEp').get()
	let moplayTimeArray = $('.moplayTime').get()
	let modEptitleArray = $('.modEptitle').get()
	
	let sdSeasonArray = $('.sdSeason').get()
	let sdEpArray = $('.sdEp').get()
	let splayTimeArray = $('.splayTime').get()
	let sdEptitleArray = $('.sdEptitle').get()
	
	for(let i=0 ; i<snoArray.length ; i++){
		$(snoArray[i]).attr("name",`MvDetailModifyList[${i}].sno`)
		$(dpSysFileArray[i]).attr("name",`MvDetailModifyList[${i}].dpSysFile`)
		$(dpOriFileArray[i]).attr("name",`MvDetailModifyList[${i}].dpOriFile`)
		$(vSysFileArray[i]).attr("name",`MvDetailModifyList[${i}].vSysFile`)
		$(vOriFileArray[i]).attr("name",`MvDetailModifyList[${i}].vOriFile`)
		$(changePosterArray[i]).attr("name",`MvDetailModifyList[${i}].changePoster`)
		$(changeVidArray[i]).attr("name",`MvDetailModifyList[${i}].changeVid`)
		$(modSeasonArray[i]).attr("name",`MvDetailModifyList[${i}].dSeason`)
		$(modEpArray[i]).attr("name",`MvDetailModifyList[${i}].dEp`)
		$(moplayTimeArray[i]).attr("name",`MvDetailModifyList[${i}].playTime`)
		$(modEptitleArray[i]).attr("name",`MvDetailModifyList[${i}].dEptitle`)
	}
	for(let i=0 ; i<sdSeasonArray.length ; i++){
		$(sdSeasonArray[i]).attr("name",`MvDetailList[${i}].dSeason`)
		$(sdEpArray[i]).attr("name",`MvDetailList[${i}].dEp`)
		$(splayTimeArray[i]).attr("name",`MvDetailList[${i}].playTime`)
		$(sdEptitleArray[i]).attr("name",`MvDetailList[${i}].dEptitle`)
	}
}
//선택 삭제
mDetail.deleteR =function(frm){
	let param=$(frm).serialize();
	$.post('m_detail_deleteAll',param,function(b){
		if(b){
			mDetail.select(frm);
		}
	})
}
//저장포스터 미리보기
mDetail.loadImg = function(img){
	// 파일이 있는경우
	if(img.files && img.files[0]) {
		let reader = new FileReader();
		reader.onload = function(e){
			let imgtag = $(img).parent().parent().find('.epImg');
			let changePoster = $(img).parent().find('.changePoster');
			$(imgtag).attr('src', e.target.result);
			if(changePoster !=null){
				$(changePoster).val(img.files[0].name);
			}
		}
		reader.readAsDataURL(img.files[0]);
	}
}
mDetail.loadVid =function(vid){
	if(vid.files && vid.files[0]){
		let reader = new FileReader();
		reader.onload = function(e){
			let changeVid = $(vid).next();
			if(changeVid != null){
				$(changeVid).val(vid.files[0].name);
			}
		}
		reader.readAsDataURL(vid.files[0]);
	}
}
// ----------------광고정보관리----------------------
let ad = {};

ad.select = function(frm){
	frm.action = 'm_ad';
	frm.submit();
}
ad.findDetail = function(frm){
	let dSno = frm.dSno.value;
	let win = window.open('m_ad_findDetail?title='+dSno, 'win', 'width = 600, height=450');
}
// jquery로는 호출이 안됨.
ad.play = function(btn){
	
	let x = document.getElementById('loadvideo').currentTime;
	let pTime = btn.previousElementSibling;
	let hour = Math.floor(x/3600);
	let min  = Math.floor(x/60);
	let sec  = Math.floor(x)-min*60;
	let time;
	if(min >= 60) min = min-60;
	if(sec == 60) sec = 0;
	if(min < 10){
		min = '0'+min;
		if(sec <10){
			sec = '0'+sec;
		}
	}
	if(hour ==0){
		time = min+':'+sec;
	}else{
		time = hour + ':'+min+':'+sec; 
	}
	pTime.value = time;
}

ad.view = function(dSno){
	let frm = $('#frm_m_ad')[0];
	frm.dSno.value=dSno;
	frm.action = 'find_detail';
	frm.submit();
} 
ad.view2 = function(btn){
	let frm = $('#frm_m_detail_input')[0];
	let dSno = $(btn).parent().find('.vSno').val();
	frm.dSno.value=dSno;
	frm.nowPage.value=1;
	frm.findStr.value='';
	frm.action = 'find_detail';
	frm.submit();
} 
ad.insert = function(frm){
	frm.action = 'm_ad_insert';
	frm.submit();
}
ad.insertR = function(frm){
	let param = $(frm).serialize();
	$.post("m_ad_insertR",param,function(e){
		let sfrm = $('#frm_m_ad_input')[0];
		let frmAtt = new FormData(sfrm);
		frmAtt.append("aSno" , e);
		$.ajax({
			data : frmAtt,
			url : 'm_ad_fileUpload',
			type : 'POST',
			enctype : 'multipart/form-data',
			cache : false,
			contentType : false,
			processData : false,
			success : function(){ 
				frm.action = "m_ad";
				frm.submit();
			}
		})	
	})
	
}
ad.modify = function(frm){
	frm.action = 'm_ad_modify';
	frm.submit();
}
ad.movePage = function(page){
	let frm = $('#frm_m_ad')[0];
	frm.nowPage.value=page;
	frm.action = 'm_ad';
	frm.submit();
}
ad.modifyOne = function(btn){
	let parent = $(btn).parent().parent();
	let sysFile = $(parent).find('.sysFile').clone();
	$(sysFile).attr("name","MadModifyList[0].sysFile");
	let sysFiletag = $(sysFile)[0];
	let oriFile =$(parent).find('.oriFile').clone();
	$(oriFile).attr("name","MadModifyList[0].oriFile");
	let oriFiletag = $(oriFile)[0];
	let aSno = $(parent).find('.aSno').clone();
	$(aSno).attr("name","MadModifyList[0].sno");
	let aSnotag = $(aSno)[0];
	let changeImg = $(parent).find('.changeImg').clone();
	$(changeImg).attr("name","MadModifyList[0].changeImg");
	let changeImgtag = $(changeImg)[0];
	let pName = $(parent).find('.pName').clone();
	$(pName).attr("name","MadModifyList[0].pName");
	let pNametag = $(pName)[0];
	let pCat = $(parent).find('.pCat').clone();
	let pCatv = $(parent).find('.pCat option:selected').val();
	$(pCat).val(pCatv).prop("selected",true);
	$(pCat).attr("name","MadModifyList[0].pCat");
	let pCattag = $(pCat)[0];
	let pTime = $(parent).find('.pTime').clone();
	$(pTime).attr("name","MadModifyList[0].pTime");
	let pTimetag = $(pTime)[0];
	let pActor = $(parent).find('.pActor').clone();
	$(pActor).attr("name","MadModifyList[0].pActor");
	let pActortag = $(pActor)[0];
	let pInfo = $(parent).find('.pInfo').clone();
	$(pInfo).attr("name","MadModifyList[0].pInfo");
	let pInfotag = $(pInfo)[0];
	let pUrl = $(parent).find('.pUrl').clone();
	$(pUrl).attr("name","MadModifyList[0].pUrl");
	let pUrltag = $(pUrl)[0];
	
	let pImg = $(parent).find('.pImg').clone()[0];
	
	let frm = $('#frm_temp')[0];
	$(frm).empty();
	frm.append(sysFiletag);
	frm.append(oriFiletag);
	frm.append(aSnotag);
	frm.append(changeImgtag);
	frm.append(pNametag);
	frm.append(pCattag);
	frm.append(pTimetag);
	frm.append(pActortag);
	frm.append(pInfotag);
	frm.append(pUrltag);
	frm.append(pImg);
	
	let frmAtt = new FormData(frm);
		$.ajax({
			data : frmAtt,
			url : 'm_ad_fileUpload',
			type : 'POST',
			enctype : 'multipart/form-data',
			cache : false,
			contentType : false,
			processData : false,
			success : function(s){ 
				let sfrm = $('#frm_m_ad_input')[0];
				sfrm.action = "find_detail";
				sfrm.submit();
			}
		})
	
}
ad.saveOne = function(btn){
	let title = $('.title').clone()[0];
	let dSno = $('.dSno').clone()[0];
	let dSeason = $('.dSeason').clone()[0];
	let dEp = $('.dEp').clone()[0];
	
	let parent = $(btn).parent().parent();
	let pName = $(parent).find('.pName').clone();
	$(pName).attr("name","MadList[0].pName");
	let pNametag = $(pName)[0];
	let pCat = $(parent).find('.pCat').clone();
	let pCatv = $(parent).find('.pCat option:selected').val();
	$(pCat).val(pCatv).prop("selected",true);
	$(pCat).attr("name","MadList[0].pCat");
	let pCattag = $(pCat)[0];
	let pTime = $(parent).find('.pTime').clone();
	$(pTime).attr("name","MadList[0].pTime");
	let pTimetag = $(pTime)[0];
	let pActor = $(parent).find('.pActor').clone();
	$(pActor).attr("name","MadList[0].pActor");
	let pActortag = $(pActor)[0];
	let pInfo = $(parent).find('.pInfo').clone();
	$(pInfo).attr("name","MadList[0].pInfo");
	let pInfotag = $(pInfo)[0];
	let pUrl = $(parent).find('.pUrl').clone();
	$(pUrl).attr("name","MadList[0].pUrl");
	let pUrltag = $(pUrl)[0];
	
	let pImg = $(parent).find('.spImg').clone()[0];
	
	let frm = $('#frm_temp')[0];
	$(frm).empty();
	frm.append(title);
	frm.append(dSno);
	frm.append(dSeason);
	frm.append(dEp);
	frm.append(pNametag);
	frm.append(pCattag);
	frm.append(pTimetag);
	frm.append(pActortag);
	frm.append(pInfotag);
	frm.append(pUrltag);
	frm.append(pImg);
	
	let param = $(frm).serialize();
	$.post('m_ad_insertR',param,function(e){
		let frmAtt = new FormData(frm);
		frmAtt.append("aSno",e);
		$.ajax({
			data : frmAtt,
			url : 'm_ad_fileUpload',
			type : 'POST',
			enctype : 'multipart/form-data',
			cache : false,
			contentType : false,
			processData : false,
			success : function(s){ 
				let sfrm = $('#frm_m_ad_input')[0];
				sfrm.action = "find_detail";
				sfrm.submit();
			}
		})
	})
}
ad.addHeng = function(){
	let h = $('#line').children().length;
	let modifyDataArray = $('.modifyData').get();
	let sh = h-modifyDataArray.length;
	str = `<div class='adZone saveData'>
						<div class='ePoster'>
							<img class='epImg' width="120" height="110">
						</div>
						<div class='adInfo'>
							<label>상품 사진 : </label>
							<input type='file' name='spImg' class='spImg saveP' accept="image/*" onchange='ad.loadImg(this)'/>
							<label class='pNameN'> 상품명 : </label>
							<input type='text' name='MadList[${sh}].pName' class='pName spName'/>
							<br/>
							<label>상품 분류 : </label>
							<select name='MadList[${sh}].pCat' size='1' class='pCat spCat' >
								<option value='의류'> 의류 </option>
								<option value='장소'> 장소 </option>
							</select>
							<span> 시간 : </span>
							<input type='text' name='MadList[${sh}].pTime' class='pTime spTime' >
							<button type='button' onclick='ad.play(this)'>입력</button>
							<label> 배우 : </label>
							<input type='text' name='MadList[${sh}].pActor' class='pActor spActor' ><br/>
							<label> 상품 설명 : </label>
							<input type='text' name='MadList[${sh}].pInfo' class='pInfo spInfo' >
							<label> URL : </label>
							<input type='text' name='MadList[${sh}].pUrl' class='pUrl spUrl' >
						</div>
						<div class='subBtn'>
							<div></div>
							<button type='button' class='saveOne' onclick='ad.saveOne(this)'> 단일 <br> 저장 </button>
						</div>
						<div class='chkHeng'>
							<div></div>
							<input type="checkbox" class='hengNo' value=''/>
						</div>
					</div>`
	$('#line').append(str);
}
//행 제거
ad.deleteHeng = function(){
	let h = $('#line').children().length;
	let frm=$('#frm_m_ad_input')[0];
	let param = $(frm).serialize();
	let chk = $('.hengNo');
	$.post('m_ad_delete',param);
	for(i=0 ; i< h ; i++){
		if($(chk[i]).is(':checked')){
			let removeH = $(chk[i]).parent().prev();
			$(removeH).parent().remove();
		}
	}
	let snoArray = $('.aSno').get()
	let sysFileArray = $('.sysFile').get()
	let oriFileArray = $('.oriFile').get()
	let changeImgArray = $('.changeImg').get()
	let mopNameArray = $('.mopName').get()
	let mopCatArray = $('.mopCat').get()
	let mopTimeArray = $('.mopTime').get()
	let mopActorArray = $('.mopActor').get()
	let mopInfoArray = $('.mopInfo').get()
	let mopUrlArray = $('.moUrl').get()
	
	let spNameArray = $('.spName').get()
	let spCatArray = $('.spCat').get()
	let spTimeArray = $('.spTime').get()
	let spActorArray = $('.spActor').get()
	let spInfoArray = $('.spInfo').get()
	let spUrlArray = $('.spUrl').get()
	
	for(let i=0 ; i<snoArray.length ; i++){
		$(snoArray[i]).attr("name",`MadModifyList[${i}].sno`)
		$(sysFileArray[i]).attr("name",`MadModifyList[${i}].sysFile`)
		$(oriFileArray[i]).attr("name",`MadModifyList[${i}].oriFile`)
		$(changeImgArray[i]).attr("name",`MadModifyList[${i}].changeImg`)
		$(mopNameArray[i]).attr("name",`MadModifyList[${i}].pName`)
		$(mopCatArray [i]).attr("name",`MadModifyList[${i}].pCat`)
		$(mopTimeArray[i]).attr("name",`MadModifyList[${i}].pTime`)
		$(mopActorArray[i]).attr("name",`MadModifyList[${i}].pActor`)
		$(mopInfoArray[i]).attr("name",`MadModifyList[${i}].pInfo`)
		$(mopUrlArray[i]).attr("name",`MadModifyList[${i}].pUrl`)
	}
	for(let i=0 ; i<spNameArray.length ; i++){
		$(spNameArray[i]).attr("name",`MadList[${i}].pName`)
		$(spCatArray[i]).attr("name",`MadList[${i}].pCat`)
		$(spTimeArray[i]).attr("name",`MadList[${i}].pTime`)
		$(spActorArray[i]).attr("name",`MadList[${i}].pActor`)
		$(spInfoArray[i]).attr("name",`MadList[${i}].pInfo`)
		$(spUrlArray[i]).attr("name",`MadList[${i}].pUrl`)
	}
}
//저장포스터 미리보기
ad.loadImg = function(img){
	// 파일이 있는경우
	if(img.files && img.files[0]) {
		let reader = new FileReader();
		reader.onload = function(e){
			let imgtag = $(img).parent().parent().find('.epImg');
			let changeImg = $(img).parent().find('.changeImg');
			$(imgtag).attr('src', e.target.result);
			if(changeImg !=null){
				$(changeImg).val(img.files[0].name);
			}
		}
		reader.readAsDataURL(img.files[0]);
	}
}
ad.deleteR =function(){
	let sfrm=$('#frm_m_ad_list')[0];
	let param=$(sfrm).serialize();
	$.post('m_ad_deleteAll',param,function(b){
		if(b){
			let frm = $('#frm_m_ad')[0];
			ad.select(frm);
		}
	})
}
ad.find = function(){
	let frm = $('#frm_m_ad')[0];
	ad.select(frm);
}
//--------------------------------------------------








 