<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mantoman.css">
<style type="text/css">
h3.title {margin-bottom: 0px; font-size: 24px; font-weight: 700;}

.input_modify {
	outline: none; 
	border: 0px; 
	width: 70%;
}

#modColor {background-color: #f9f4f4;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>


function mantomanPaging_A(pg2){
	$('#pg').val(pg2);
	onPageLoad();
}
</script>

<script type="text/javascript">

$('.my_shop > ul:eq(2) > li:eq(0) > a').css('font-weight', '800');

$(document).ready(function(){
	$('.adminMenu > ul > li:eq(9) > a').css('color','black').css('font-weight','800');
	
	onPageLoad();
	
	//생겼다,사라졌다
	$('body').on('click','.mm_title',function(){
		if($(this).parent().next().css('display')=='none'){
			$(this).parent().children().last().children().eq(0).text('답글'); //버튼 변경
			$(this).parent().next().children(1).children(1).children(0).prop('id','modColor').prop('readonly',true);
			$(this).parent().next().slideDown(); //내용 열기
		}else {
			$(this).parent().children().last().children().eq(0).text('답글');
			$(this).parent().next().children(1).children(1).children(0).prop('id','modColor').prop('readonly',true);
			$(this).parent().next().slideUp(); //내용 닫기
		}
	});
	
});

function onPageLoad(){
	$('div#mantomanTable div.info').siblings().remove();
	var imgCnt=0;
	
	$.ajax({
		type : 'POST',
		url : '/finalProject/admin/getMantomanList.do',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			
			$.each(data.list,function(index,mantomanDTO){
				imgCnt=0;
				var img=mantomanDTO.img;
				if(img!=null){
					imgCnt = 1;
					if(img.indexOf(",")!= -1) {
						imgCnt= 2;
						var imgs=img.split(",");
					}
				}
				
				$('<div/>',{
					class : 'info2'
				}).append($('<p/>',{
					text : mantomanDTO.type
					}).css({
						'padding-left':'25px', 
						width: '150px'
				})).append($('<p/>',{
					text : mantomanDTO.title,
					class : 'mm_title'
					}).css({
						'text-align':'left',
						padding: '2% 3% 2% 0'
				})).append($('<p/>',{
					text : mantomanDTO.logtime
					}).css({
						width:'105px'
				})).append($('<p/>',{
					text : "상태"
					}).css({
						width:'60px'
				})).append($('<p/>')
					.css({
						width:'50px'	
				}).append($('<button/>',{
					type : 'button',
					class : "m_d_btn",
					text : "답글",
					value : mantomanDTO.seq
					}))).appendTo($('#mantomanTable'));
				
				$('<div/>',{
					class : 'wrap_info34'
				}).append($('<div/>',{
					class : 'info3'
				}).append($('<span/>',{
					text : 'Q.',
					class : 'styleQA'
				})).append($('<img/>',{
					class : 'firstImg',
					src : imgCnt== 0 ? '' : (imgCnt == 1? "../image/mantoman/"+mantomanDTO.img : "../image/mantoman/"+imgs[0]),
					style : "width:150px; margin-left: 20px;"				
				})).append($('<img/>',{
					class : 'secondImg',
					src : imgCnt == 2? "../image/mantoman/"+imgs[1] : '',
					style : "width:150px; margin-left: 20px;"							
				})).append($('<p/>',{
					id : 'p_conetent',
					text : mantomanDTO.content
				}))).append($('<div/>',{
					class : 'info4'
				}).append($('<span/>',{
					text : 'A.',
					class : 'styleQA'
				})).append($('<div/>').append($('<textarea/>',{
					class : 'input_modify',
					readonly : 'readonly',
					id : 'modColor',
					text : mantomanDTO.reply
				})))).appendTo($('#mantomanTable'));
				
				if(imgCnt==0)
					$('.firstImg:eq('+index+')').remove();
			
				$('.secondImg[src=""]').remove();
				
			});
			
			$('#mantomanPagingDiv').html(data.paging.pagingHTML);
			
		}
	});
	
	
	
	//수정버튼 클릭시
	$('body').on('click','.m_d_btn',function(){
		
		//$(this).text('수정');
		
		if($(this).text()=='답글'){
			$(this).text('수정');
			$(this).parent().parent().next().children(1).children(1).children(0).prop('id','').prop('readonly',false);
			if($(this).parent().parent().next().css('display')=='none')
				$(this).parent().parent().next().slideDown();
		}else if($(this).text()=='수정') {
			$(this).text('답글');
			$(this).parent().parent().next().children(1).children(1).children(0).prop('id','modColor').prop('readonly',true);
			if($(this).parent().parent().next().css('display')!='none')
				$(this).parent().parent().next().slideUp();
			
			$.ajax({
				type : 'POST',
				url : '/finalProject/admin/modifyMtm.do',
				data : "seq="+$(this).val()+"&reply="+$(this).parent().parent().next().children(1).children(1).children(0).val(),
				dataType : 'text',
				success : function(response){
					if(response=="success"){
						$('#deleteMtm_frame').show();
					}
				}
			});
		}
	});
	
	$('#dialog_closeBtn').click(function(){
		$('#deleteMtm_frame').hide();
	});
	
}

</script>
</head>
<body>


<div class="wrap" style="padding: 0 0px 100px; width:95%;">

<h3 class="title">1:1 문의내역 목록</h3>

<br/>
	<div id="mantomanTable">
		<div class="info">
			<p class="type" style="padding-left:30px; width: 150px;">상담구분</p>
			<p class="tit" style="text-align:left; padding: 15px 3% 15px 0;">상담제목</p>
			<p class="date" style="text-align:right; padding-right:40px;">작성일</p>
			<p class="state" style="width: 120px; padding-right: 50px">답변유무</p>
		</div>
	</div>
	
	<div id="mantomanPagingDiv" style="float: left; width: 100%;" align="center"></div>
	
	<div id="mantomanDelete_frame" style="display: none;">
		<div id="mantomanDelete">
			<i class="material-icons" id="mantomanDelete_closeBtn">clear</i>
			문의글을 삭제하시겠습니까?
			<button id="mantomanDelete_okBtn">확인</button>
			<button id="mantomanDelete_cancelBtn">취소</button>
		</div>
	</div>
	
	<div id="deleteMtm_frame">
		<div id="dialog">
			<i class="material-icons" id="dialog_closeBtn">clear</i>
			답변이 작성되었습니다.
		</div>		
	</div>	
	
</div>
</body>
<input type="hidden" value="1" id="pg">

</html>