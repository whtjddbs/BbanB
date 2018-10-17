<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/paging.css">
<style type="text/css">
h3.title {padding: 10px 0px; border-bottom: 4px solid black; margin-bottom: 0px; font-size: 24px; font-weight: 700;}

.itemControll {overflow: visible; width: 95%; min-width:800px; height: auto;}
.itemControll > ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%; min-width: 400px;}
.itemControll > ul > li {display: table-cell; float: left; width: 100%; padding : 10px 0px 10px 2%;}
.itemControll > ul > li:first-child {border-bottom: 2px solid black;}
.itemControll > ul > li > div {width: 100%; overflow: visible; height: auto;}
.itemControll > ul > li > div > div {float: left; text-align: center;}
.itemControll > ul > li > div > div:nth-child(1) {width: 3%;} /* 상품번호 */
.itemControll > ul > li > div > div:nth-child(2) {width: 10%;} /* 상품번호 */
.itemControll > ul > li > div > div:nth-child(3) {width: 7%;} /* 아이디 */
.itemControll > ul > li > div > div:nth-child(4) {width: 10%;} /* 상품분류 */
.itemControll > ul > li > div > div:nth-child(5) {width: 18%;} /* 상품명 */
.itemControll > ul > li > div > div:nth-child(6) {width: 25%;} /* 내용 */
.itemControll > ul > li > div > div:nth-child(7) {width: 10%;} /* 이미지 */
.itemControll > ul > li > div > div:nth-child(8) {width: 10%;} /* 등록일 */
.itemControll > ul > li > div > div:nth-child(9) {width: 7%;} /* 삭제버튼 */
.itemControll > ul > li:nth-child(1) {border-bottom: 1px solid black;}
.itemControll > ul > li:nth-child(1)~li {border-bottom: 1px solid #d4d4d4;}


.btn_black {width: 150px;padding: .6em .5em;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 20px;}
.btn_black[disabled] {background: lightgray; border: 1px solid lightgray;}

.item_title > div {float: left; border-right: 1px solid #d4d4d4; text-align: center; font-weight: 700;}
.item_title > div:last-child {float: left; /* border-right: 0px solid #d4d4d4; */}

.my_btnbox {margin-top: 10px; text-align: right;}

.item_review{
	cursor : pointer;
}

.item_comments{
	text-overflow: ellipsis;
	overflow : hidden;
	white-space: nowrap;
}

.item_comments_view {
    height: auto;
    white-space: normal;
    text-overflow: clip;
}
</style>

<form id="reviewListDelete" method="post">
<section class="itemControll">
	<h3 class="title">상품후기 목록</h3>
	<ul>
		<li>
			<div class="item_title">
				<div><input type="checkbox" name="checkAll" id="checkAll"></div>
				<div>상품번호</div>
				<div>아이디</div>
				<div>상품분류</div>
				<div>상품명</div>
				<div>내용</div>
				<div>이미지</div>
				<div>등록일</div>
			</div>
		</li>
	</ul>
	<div class="my_btnbox">
		<button type="button" class="btn_black" id="reviewListDeleteBtn">선택삭제</button>
	</div>
	<div class="reviewList_container">
		<div class="reviewList"></div>
		<div id="paging" align="center" style="padding: 5px 30%;"></div>
	</div>
</section>
</form>

<!-- 기본 다이얼로그 -->
<div id="dialog_frame" style="z-index: 10000;">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
		<div></div>
	</div>
</div>

<!-- confirm 다이얼로그 -->
<div id="myConfirmDialog_frame" style="display: none;">
	<div id="myConfirmDialog">
		<i class="material-icons" id="myConfirmDialog_closeBtn">clear</i>
			선택한 아이템을 정말 삭제하시겠습니까?
		<button id="myConfirmDialog_okBtn">확인</button>
		<button id="myConfirmDialog_cancelBtn">취소</button>
	</div>
</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.adminMenu > ul > li:eq(7) > a').css('color','black').css('font-weight','800');
	
	//리스트 불러오기
	itemReview('${param.pg}');
	
	function itemReview(pg) {
		$.ajax({
			type : "POST",
			url : "/finalProject/admin/itemReviewListShow.do",
			data : {'pg':pg},
			dataType : "json",
			success : function(data){
				$('.itemControll > ul > li:gt(0)').remove();
				
				$.each(data.list,function(index,item){
					$('<li/>').append($('<div/>',{
						class : 'item_review'
					}).append($('<div/>').append($('<input/>',{
						type : 'checkbox',
						name : 'seqSerial',
						class : 'check',
						id : 'seqSerial',
						value : item.SEQ+","+item.SERIAL
					}))).append($('<div/>',{
						text : item.SERIAL
					})).append($('<div/>',{
						text : item.ID
					})).append($('<div/>',{
						text : item.MAIN_CODENAME
					})).append($('<div/>',{
						text : item.NAME
					})).append($('<div/>',{
						class : 'item_comments',
						text : item.COMMENTS
					})).append($('<div/>',{
						text : item.ITEM_IMAGE==null ? '-':item.ITEM_IMAGE
					})).append($('<div/>',{
						id : 'sysdate',
						text : jsonDateFormat(new Date(item.LOGTIME))
					}))).append($('<div/>').append($('<input/>',{
						type : 'button',
						class : 'btn_black',
						id : 'reviewOneDeleteBtn',
						style : 'margin-left : 15px; width : 60px;',
						value : '삭제'
					}))).appendTo($('.itemControll ul'));
				});
				
				$('#paging').html(data.paging.pagingHTML);
			}
		});
	}
	
	//체크 박스 
	$('#checkAll').click(function(){
		var chk = document.getElementsByName("seqSerial"); 
		if(document.getElementById("checkAll").checked){
			for(var i=0; i<chk.length;i++) 
				chk[i].checked = true; //모두체크
		}else{
			for(var i=0; i<chk.length;i++)
				chk[i].checked = false; //모두 해제
		}
	});
	 
	
	//리뷰 자세히보기
	$('body').on('click','.item_review > *:not(:has(input))',function(e){
		if($(this).parent().children().eq(5).prop('class') == 'item_comments_view'){ // 줄이기
			$(this).parent().children().eq(5).prop('class','item_comments');
			$(this).parent().parent().css('background-color','');
			$(this).parent().children().eq(5).find('img').remove();
		}else{
			$(this).parent().children().eq(5).prop('class','item_comments_view').show(); //늘리기
			$(this).parent().parent().css('background-color','#EAEAEA');
			if($(this).parent().children().eq(6).text() != '-'){
				$(this).parent().children().eq(5).append($('<img/>',{
					width : '250px',
					height : '200px',
					src:"../image/review/"+$(this).parent().children().eq(6).text()
				}));
			}
		}
		
	});
 
	
	//페이지 클릭
	$('#paging').on('click','span',function(){
		location.href="#"; 
		var pg = $(this).prop('class');
		itemReview(pg);
	});
	
	
	//json Date to YYYY-MM-DD
	function jsonDateFormat(date) {
		var year = date.getYear()+1900;
		var month = date.getMonth()+1;
		var day = date.getDate();
		return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
	}
	
	// 개당 삭제 누를 때
	$('body').on('click','#reviewOneDeleteBtn',function(){
		var thisisme = $(this);
		$.ajax({
			type : "POST",
			url : "/finalProject/admin/reviewOneDelete.do",
			data : {'seq' : thisisme.parent().prev().children().eq(0).children().eq(0).val()
					,'serial' : thisisme.parent().prev().children().eq(1).text()
					},
			dataType : "json",
			success : function(data){
				$('#dialog > div').text('성공적으로 삭제되었습니다');
				$('#dialog_frame').show();
			}
		});		
	});
	
	// 선택삭제 클릭 시
	$('#reviewListDeleteBtn').click(function(){
		var isChk = false;
		 var arr = document.getElementsByName("seqSerial");
		 for(var i=0; i<arr.length;i++){
			 if(arr[i].checked){
				 isChk = true;
				 break;
			 }
		 }
		 
		 if(!isChk) {
			 $('#dialog > div').text('한 개 이상 선택해주세요.');
			 $('#dialog_frame').show();
			 return false;
		 }else{
			 $('#myConfirmDialog_frame').show();
		 }
	});

	
	//기본다이얼로그 이벤트
	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
		location.reload();
 	});
	
	//confirm 다이얼로그
	$('#myConfirmDialog_closeBtn, #myConfirmDialog_cancelBtn').click(function(){
		$('#myConfirmDialog_frame').hide();
	});
	
	$('#myConfirmDialog_okBtn').click(function() {
		$.ajax({
			type : "POST",
			url : "/finalProject/admin/reviewListDelete.do",
			data : $('#reviewListDelete').serialize(),
			dataType : "json",
			success : function(data){
				$('#myConfirmDialog_frame').hide();
				
				$('#dialog > div').text('성공적으로 삭제되었습니다');
				$('#dialog_frame').show();
			}
		});
		
	});
});
</script>