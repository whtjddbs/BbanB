<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
h3.title {
    padding: 10px 0px;
    border-bottom: 4px solid black;
    margin-bottom: 0px;
    font-size: 24px;
    font-weight: 700;
}
.deliveryControll {overflow: hidden; width: 100%; height: auto;}
.deliveryControll ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%;}
.deliveryControll ul li {display: table-cell; float: left; width: 100%; padding: 10px 0px 10px 2%;}
.deliveryControll ul li:first-child {border-bottom: 2px solid black; width: 100%}
.deliveryControll ul li > div {width: 100%; overflow: visible; height: auto; text-align: center;}
.deliveryControll ul li > div > div {float: left; text-align: center;}
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(0)  /* 체크박스 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(1) {width: 5%;} /* 체크박스 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(2) {width: 25%;} /* 주문번호 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(3) {width: 15%;} /* 접수제목 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(4) {width: 15%;} /* 접수일자 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(5) {width: 15%;} /* 진행상태 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(6) {width: 15%;} /* 완료일자 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(7) {width: 10%;} /* 구분 */
.deliveryControll ul li:nth-child(1)~li > div > div:nth-child(8) {width: 10%; text-align: center;} /* 완료버튼 */
.deliveryControll ul li:nth-child(2) {border-bottom: 1px solid black;}
.deliveryControll ul li:nth-child(1)~li {border-bottom: 1px solid #d4d4d4;}




.delivery_step {width: 100%; overflow: hidden; height: auto;}
.delivery_step > * {float: left; margin-right: 20px;}
.delivery_step select {
	width: 150px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: ; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
}
.delivery_step select::-ms-expand {display:none}

.delivery_step div:last-child {float: right; padding-right: 2%;}
.delivery_step div input {
	width: 150px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit;
	border: 1px solid black; 
}

.searchBtn {width: 150px;padding: .8em .5em;border: 1px solid #303033;background: #303033;font-size: 13px;color: #fff;line-height: 20px;}


.delivery_title > div {padding-left: 50px; padding-right:50px; border-right: 1px solid #d4d4d4; text-align: center; font-weight: 700; width: 15%}
.delivery_title > div:nth-child(2) {width: 25%;}
.delivery_title > div:last-child {float: left; border-right: 0px solid #d4d4d4;}

.delivery_item {cursor: pointer;}
.delivery_item > div {width:15%;}
.delivery_item > div:eq(1) {width:25%;}
.delivery_item > div:last-child {cursor: default;}

#delivery_item_detail {overflow: hidden; height: auto; width: 90%; border: 1px solid #d4d4d4; margin: 10px 0px 10px 5%; display: none;}
#delivery_item_detail .stepbox {border-top: 3px solid black; border-bottom: 1px solid black; padding: 5px 0px;}
 #delivery_item_detail .stepbox span {font-family: "Do Hyeon"; font-weight: 700;} 

.items {width: 100%; float: left;height: 300px; overflow: hidden; overflow-y: scroll;}
.items .item {width: 100%; display: inline-block; *display: inline; padding: 10px 0px;}
.items .item .item_info {display: block;float: left; vertical-align: middle;}
.items .item .item_info .item_name {font-family: "Do Hyeon"; font-size: 24px; font-weight: 900; padding: 10px 0px; word-wrap: break-word;font-size: 18px;line-height: 24px;font-weight:500; word-wrap: break-word;}
.items .item .item_info .item_size {font-size: 12px; padding-bottom: 10px;}
.itmes .item .item_info .item_count {padding: 10px 0px;}
.items .item .item_image {height: auto; width: 140px;}
.items .item img { float: left; width: 160px; vertical-align: middle; padding: 0px 30px; }



#dialog_frame {
	background-color: transparent;
    z-index: 1000;
    opacity: 1;
	display: none;
    position: fixed;
    overflow: hidden;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    text-align: center;
}
#dialog {
	width: inherit;
    height: inherit;
    padding: 50px 40px 40px;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.5) 20px 20px 80px 0px;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
    position: absolute;
    top: 50%;
    left: 50%;
    box-sizing: border-box;
    min-width: 300px;
}
#dialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}


#currentPaging{
	border-bottom: 1.5px solid #000;
	cursor: pointer;
	font-weight: 700;
    color: #000;
    text-decoration:none;
	padding: 1px;
	margin: 10px;
}
#paging{
	text-decoration: none;
	cursor: pointer;
	color: #bcafaf;
	text-decoration:none;
	padding: 1px;
	margin: 10px;
}


.my_btnbox {margin-top: 20px; text-align: right;}

#myConfirmDialog_frame {
	background-color: rgba(255,255,255,0.8);
    z-index: 1000;
    opacity: 1;
	display: none;
    position: fixed;
    overflow: hidden;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    text-align: center;
}
#myConfirmDialog {
	width: inherit;
    height: inherit;
    padding: 30px 40px 40px 40px;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.5) 20px 20px 80px 0px;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
    position: absolute;
    top: 50%;
    left: 50%;
    box-sizing: border-box;
    width: 350px;
    height: 150px;
}
#myConfirmDialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}
#myConfirmDialog_okBtn {
	position: fixed;
	width: 80px;
	height: 30px;
	bottom: 20px;
	left: 80px;
	border: 1px solid black;
	background-color: black;
	color: white;
	outline: none;
	cursor: pointer;
}
#myConfirmDialog_cancelBtn {
	position: fixed;
	width: 80px;
	height: 30px;
	bottom: 20px;
	right: 80px;
	border: 1px solid black;
	background-color: black;
	color: white;
	outline: none;
	cursor: pointer;
}

</style>
</head>
<body>
	<section class="deliveryControll">
		<h3 class="title">주문취소 관리</h3>
		<ul>
			<li>
				<div class="delivery_title">
					<div>주문번호</div>
					<div>접수제목</div>
					<div>주문일자</div>
					<div>진행상태</div>
					<div>취소일자</div>
					<div>구  분</div>
					<!-- <div></div> -->
				</div>
			</li>
		</ul>
	</section>
	 <section id="delivery_item_detail">
		<div class="stepbox">
			주문일자 <span></span> 주문번호 <span></span>
		</div>
		<div class="items">
			<div class="item">
				<div class="item_image">
					<img>
				</div>
				<div class="item_info">
					<div class="item_name"></div>
					<div class="item_size"></div>
					<div class="item_price"></div>
					<div class="item_qty"></div>
				</div>
			</div>
		</div>
	</section>
	<div id="deliveryControllPaging" align="center" style="padding: 5px 30%;"></div>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.adminMenu > ul > li:eq(3) > a').css('color','black').css('font-weight','800');
	
	conditionalSearch('${param.pg}');
	
	
	
	//주문 리스트 클릭시
	$('.deliveryControll').on('click','.delivery_item > *:not(:has(input))',function(){
			if($(this).parent().next().prop('tagName')=='SECTION') {
				$('#delivery_item_detail').hide();
				$('.deliveryControll').append($('#delivery_item_detail'));
				return false;
			}
			
			$('#delivery_item_detail').hide();
		 	$(this).parent().parent().append($('#delivery_item_detail')); 
			
			var serial = $(this).parent().children().eq(0).text();
	

						
			$.ajax({
				type: 'POST',
				url: '/finalProject/admin/getRefundDetail.do',
				data: {'serial' :serial},
				dataType: 'json',
				success: function(data) {	
					//alert(JSON.stringify(data)+'dssaf');
					
					$('#delivery_item_detail .items .item').remove();
					$('#delivery_item_detail .refund_reason *').remove(); 
					
				/* 	var date = new Date(data.list.startdate); */		
					
					
					$.each(data.list, function(index,item){
						
					var date = new Date(item.STARTDATE);
					
					$('#delivery_item_detail > .stepbox span:eq(0)').text(jsonDateFormat(date));
					$('#delivery_item_detail > .stepbox span:eq(1)').text(serial);
							
							$('#delivery_item_detail .items').append($('<div/>',{
								class: 'item'
							}).append($('<div/>',{
								class:'item_image'
							}).append($('<img/>',{
								src:"../image/"+item.MAIN_CODENAME+"/"+item.IMG
							}))).append($('<div/>',{
								class: 'item_info'
							}).append($('<div/>',{
								class:'item_name',
								text:item.NAME
							})).append($('<div/>',{
								class:'item_size',
								text:'[COLOR]'+item.COLOR+ '[SIZE]'+item.SIZE1+item.SIZE2
							})).append($('<div/>',{
								class:'item_price',
								text: '가격: '+item.PRICE														
							})).append($('<div/>',{
								class:'item_qty',
								text: '수량: '+item.QTY
							}))));													
						

						});						
					}
				});
				$('#delivery_item_detail').slideToggle();
		});
	
	

	
	function conditionalSearch(pg){	
		
		$('.deliveryControll ul > li:gt(0)').remove();
		
		$.ajax({				
			type: 'POST',
			url:'/finalProject/admin/getRefundList.do',
			data:{'pg' : pg},
			dataType: 'json',
			success: function(data){
 				
				$('#delivery_item_detail').hide();
				$('.deliveryControll').append($('#delivery_item_detail'));

				
			  	$.each(data.mapList, function(index,item){	
			  		
			  		var startDate= new Date(item.STARTDATE);
			  		var endDate = new Date(item.ENDDATE);
			  		
			  		$('.deliveryControll ul').append($('<li/>')
					.append($('<div/>',{
					  			class: 'delivery_item'	
					  		}).append($('<div/>',{
					  			id : 'itemSerial',
					  			text: item.SERIAL	  					  			
					  		})).append($('<div/>',{
					  			text: item.TITLE
					  		})).append($('<div/>',{
					  			text: jsonDateFormat(startDate)  			
					  		})).append($('<div/>',{
					  			text: item.STATUS		  			
					  		})).append($('<div/>',{
					  			text: jsonDateFormat(endDate),
					  			class : 'endDate'
					  		})).append($('<div/>',{
					  			text: item.TYPE		  			
					  		}))));
					});
			  	$('#deliveryControllPaging').html(data.paging.pagingHTML);
			}			
		});
	}


		
	//페이지 클릭
	$('#deliveryControllPaging').on('click','span',function(){
		var pg = $(this).prop('class');
		$('#delivery_item_detail').hide();
		$('.deliveryControll').append($('#delivery_item_detail'));
		conditionalSearch(pg);
	});
	
	
	//json Date to YYYY-MM-DD
	function jsonDateFormat(date) {
		var year = date.getYear()+1900;
		var month = date.getMonth()+1;
		var day = date.getDate();
		return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
	}
	
	
	$('#ControllPaging').on('click','span',function(){		
		var pg = $(this).prop('class');
		myPointSearch(pg);
	});
	

});
</script>
</html>