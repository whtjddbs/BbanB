<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/itemView.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<style type="text/css">
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.option_lstbx {
	width: 100%;
	height: auto;
	overflow: hidden;
	margin: 20px 0px;
}
.option_color {
	float: left;
	width: 25%;
}

.option_size {
	float: left;
	width: 25%;
}

.option_num{
	float: left;
	width: 25%;
}

.option_price{
	float: left;
	width: 15%;
	padding-top: 1px;
}

.numcountbx button{
	float: left;
	position: relative;
    width: 28px;
    height: 28px;
    border: 1px solid #cdcdcd;
    border-radius: 0;
    background: #fff;
    font-size: 15px;
    color: #5d5d5d;
    cursor: pointer;
    text-decoration: none;
    margin: 0px;
}

.numcountbx input{
	float: left;
	width: 35px;
    height: 28px;
    border: 1px solid #cbcbcb;
    border-width: 1px 0;
    margin: 0px;
    font-size: 13px;
    color: #666;
    text-align: center;
    box-sizing: border-box;
}


#deleteBtn{
	overflow: visible;
    width: 16px;
    height: 16px;
    margin:0px 0px 0px 7px;
    padding: 1px;
    box-sizing: border-box;
    background: transparent;
    float: right;
    cursor: pointer;
}

.result_total{
	border-top: 2px solid #000;
	text-align: right;
    line-height: 32px;
}

.num{
	font-size: 22px;
    color: #ff4800;
}
a#MOVE_ON_BTN{
   position: fixed; /* 화면에 고정 */
   right: 3%; /* 버튼 위치 설정 */
   bottom : 50px; /* 버튼 위치 설정 */
   display: none; /*화면에서 숨김  */
   z-index: 999;/* 다른 태그들 보다 위에 오도록 */   
}

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

#moveCart{
    display: inline-block;
    width: 161px;
    margin-top: 24px;
    border: 1px solid #d4d4d4;
    border-radius: 2px;
    font-size: 14px;
    color: #5d5d5d;
    line-height: 40px;
    text-align: center;
    box-sizing: border-box;
}


#dialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}

#dialogClear {
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

.img-zoom-lens {
  /* z-index: 1; */
  position: absolute;
  border: 4px solid #e1e1e1;
  background: #fff;
  /*set the size of the lens:*/
  width: 150px;
  height: 180px;
  opacity: .65;
  pointer-events: none;
  top:-300px;
  left:-300px;
}

.img-zoom-result {
  border: 1px solid #d4d4d4;
  /*set the size of the result div:*/
  position: absolute;
  width: 300px;
}

#itemViewTotalDiv {width: 80%; min-width: 1000px; max-width: 1400px; margin: 0px auto;}
</style>

</head>
<body>
<div id="itemViewTotalDiv">
<form id="itemViewForm" action="/finalProject/order/checkout.do" method="POST">
<div class="detail_category">
	<ul >
	    <li class="category1" >
            <select id="stat1">
            	<option>MAIN</option>
            </select>
	    </li>
	    <li class="category2" >
              <select id="stat2">
           		<option>SUBMAIN</option>
              </select>
	    </li>
	</ul>
</div>

<!---->
<fmt:parseNumber var="finalPrice" integerOnly="true" value="${itemDTO.price * (1-itemDTO.discount) }"/>
<fmt:parseNumber var="discount" integerOnly="true" value="${itemDTO.discount*100}"/>
<fmt:parseNumber var="point" integerOnly="true" value="${finalPrice / 100}"/>
<div  class="image" id="ProductDetail">
	<img  class="imagebox"  id="ProductImage" src="../image/${itemDTO.main_codename}/${itemDTO.img}">
   	<div  class="item_detail_view">
		<h3  class="name" id="ProductName">${itemDTO.name }</h3>  
		<div  class="sale">
			<c:if test="${itemDTO.discount == 0 }">
				<div class="noSale">${itemDTO.price } 원</div>
			</c:if>
			<c:if test="${itemDTO.discount != 0 }">
				<div class="o" id="ProductPrice">${itemDTO.price }</div>
		    	<div class="s" id="ProductDiscount">${discount }% ${finalPrice } 원</div>
		    </c:if>
		</div>
		<div class="policy" id="savePoint">적립금 : ${point } P</div>
		<div id="allSelect">
			<div id="select1" class="selbx">
				<select id="colorSlt">
					<option value="">COLOR를 선택해주세요</option>
				</select>
			</div>
			<div id="select2" class="selbx">
				<select  id="sizeSlt">
					<option  value="">SIZE를 선택해주세요</option>
				</select>
			</div>
			<c:if test="${itemDTO.main_codename == 'bras' }">
			<div id="select3" class="selbx">
				<select  id="cupSlt">
					<option  value="">SIZE를 선택해주세요</option>
				</select>
			</div>
			</c:if>
	
			<div id=totalPrice style="float: left; width: 100%;" align="center"></div>
				<input type="hidden" id="inputBtn" value="submit">
			<div id=totalResult style="float: left; width: 100%;" align="center">
				<div  class="result_total">
					<span  class="total_price">총 상품 금액 : </span>
					<span  class="num"><span id="priceNum"></span>원</span>
				</div>
	        </div>
			

			<div  class="chooseBox">  
				<div>               	
	 				<a  class="shopbag" id="checkLogin1">SHOPPING BAG</a>
	  				<a  class="buyNow" id="checkLogin2">BUY NOW</a>
				</div>
			</div>
		</div>	
	</div>
</div>
</form>
<!---->
<!---->
       
<div>
  <jsp:include page="../itemView/itemViewMid1.jsp"/>
</div>


<div id="dialog_frame" class="clear_frame">
	<div id="dialogClear">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
		<div>이미 선택된 옵션입니다</div>
	</div>
</div>
</div>

<div id="myresult" class="img-zoom-result"></div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

   /* top버튼 */
  $("body").scrollTop(0);
   
  $(function(){
		$(window).scroll(function(){
		   if($(this).scrollTop() > 400){
		      $('#MOVE_ON_BTN').fadeIn();
		   }else{
		      $('#MOVE_ON_BTN').fadeOut();
		   }/*스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼을 나타내고 사라지도록 설정   */
		});
		
		$('#MOVE_ON_BTN').click(function(){//버튼 클릭 이벤트 
		   $('html, body').animate({scrollTop: 0}, 400);//animation을 걸어서 화면 맨위로 이동하도록 설정 
		   return false;
		}); 
		
		//다이얼로그 닫기
		$('.clear_frame #dialog_closeBtn').click(function(){
			$('.clear_frame').hide();
		});
		
//////////////////////////////////////////////////////////////////////		
		//맨 위에 셀렉 박스
		//메인카테고리 로딩
		$.ajax({
			type : 'GET',
			url : '/finalProject/itemView/checkMain_codename.do',
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$.each(data.list, function(index, item){				
					$('.category1 > select').append($('<option/>',{
						value : item,
						text : item
					}))
				});
			}
		});
		//메인카테고리 선택시 서브카테고리 로딩
		$('.category1 select').change(function(){
			$.ajax({
				type : 'GET',
				url : '/finalProject/itemView/checkSub_codename.do',
				data : {'main_codename' : $(this).val() }, 
				dataType : 'json',
				success : function(data){
					//alert(JSON.stringify(data));
					$('#stat2 > option:gt(0)').remove();
					
					$.each(data.list, function(index, item){
						$('#stat2').append($('<option/>', {
							value : item,
							text : item
						}))
					});
				}
			});
		});
		//서브카테고리 선택시 해당 페이지로 이동
		$('#stat2').change(function(){
			location.href='/finalProject/new/itemDisplay.do?main_codename='+$('#stat1').val()+'&sub_codename='+$(this).val()+'&pg=1';
		});

//////////////////////////////////////////////////////////////////////   
 		//장바구니 담기
 		$('#checkLogin1').click(function(){
 			if($('.option_resultbx').length==0) {
				alert("상품 옵션을 선택해주세요");
			}else {		
				$('#itemViewForm').prop('action','/finalProject/order/addShoppingBag.do').submit();
			}
		});
		
		//즉시 구매
		$('#checkLogin2').click(function(){
			$('#itemViewForm').prop('action','/finalProject/order/checkout.do').submit();	
		});
//////////////////////////////////////////////////////////////////////
		//color 상품 DB가져와야됨
		$.ajax({
			type : 'POST',
			url : '/finalProject/itemView/getColor.do',
			data : 'seq=${param.seq}',
			dataType : 'json',
			success : function(data) {
				//alert('color:'+JSON.stringify(data));
				$.each(data.list, function(index, item){
					$('#colorSlt').append($('<option/>',{
						value : item,
						text : item.toUpperCase()
					}));
				});
			}
		});	
//////////////////////////////////////////////////////////////////////		
		//size1
		$('#colorSlt').change(function(){
			var count=$('#colorSlt option:selected').val();
			$('#sizeSlt').children('option:gt(0)').remove();
			
			if(count == ""){
				
			} else {
				$.ajax({
					type : 'POST',
					url : '/finalProject/itemView/getSize1.do',
					data : 'seq=${param.seq}&color='+$('#colorSlt').val(),
					dataType : 'json',
					success : function(data) {
						//alert(JSON.stringify(data));
						$.each(data.list, function(index, item){
							$('#sizeSlt').append($('<option/>',{
								value : item,
								text : item.toUpperCase()
							}));					
						});
					}
				});	
			 }
		});
		
/////////////////////////////////////////////////////////////////////		
		
		//이미지 줌 화면 설정
		$('#myresult').css('left',$('#ProductImage').offset().left+$('#ProductImage').width());
		$('#myresult').css('top',$('#ProductImage').offset().top);
		$('#myresult').css('height',$('#ProductImage').height());
		imageZoom("ProductImage", "myresult"); 
		
		$('#myresult').css('display','none');
 
//////////////////////////////////////////////////////////////////////
	// 아래 지정된 가격 창 뜨게 하기		
		if('${itemDTO.main_codename}'=='bras') {
			$('#totalResult').hide();
			
			$('#cupSlt').change(function(){
				$("#selectWhole option:eq(0)").prop("selected",true);
				$('#totalResult').show();
			});
			
			//size2
			$('#sizeSlt').change(function(){
				var count=$('#sizeSlt option:selected').val();
				$('#cupSlt').children('option:gt(0)').remove();
				
				if(count == ""){
					
				} else {
					$.ajax({
						type : 'POST',
						url : '/finalProject/itemView/getSize2.do',
						data : 'seq=${param.seq}&color='+$('#colorSlt').val()+'&size1='+$('#sizeSlt').val(),
						dataType : 'json',
						success : function(data) {
							//alert(JSON.stringify(data));
							$.each(data.list, function(index, item){
								$('#cupSlt').append($('<option/>',{
									value : item,
									text : item.toUpperCase()
								}));					
							});
						}
					});	
				 }
			});
					
			$('#cupSlt').change(function(){
				var check = '';
				//선택된 옵션창 띄우기
				$('.option_lstbx').each(function(index){
					var color = $(this).children().eq(0).children().eq(0).text();
					var size = $(this).children().eq(1).children().eq(0).text();
					var cup = $(this).children().eq(2).children().eq(0).text();
					if(color == $('#colorSlt').val() && size == $('#sizeSlt').val() && cup == $('#cupSlt').val()) {
						$('.clear_frame').show();
						check='true';
					}
					
				});
			
				if(check!='true') {
				
				//총 합계 창 보여주기
				$('#totalResult').show();
				
				$('<div/>',{ 
					class : 'option_resultbx'
				}).append($('<div/>',{
					class : 'option_lstbx'
				}).append($('<div/>',{
					class : 'option_color'
				}).append($('<span/>',{
					text: $('#colorSlt option:selected').val()	//셀렉 박스에 선택된 값 들어오게 하기		
				}))).append($('<div/>',{
					class : 'option_size'
				}).append($('<span/>',{
					text: $('#sizeSlt option:selected').val()+$('#cupSlt option:selected').val() //셀렉 박스에 선택된 값 들어오게 하기
				}))).append($('<div/>',{
					class : 'option_num'
				}).append($('<span/>',{
					class : 'numcountbx'
				}).append($('<button/>',{
					type : 'button',
					text: '-',	
					id : 'minus'
				})).append($('<input/>',{
					type: 'number',
					name : 'count',
					value: '1'
				})).append($('<button/>',{
					type : 'button',
					id : 'plus',
					text:'+'
				})))).append($('<div/>',{
					class :'option_price',
					text: '${finalPrice}' //
				})).append($('<div/>',{
					style : 'float : left;'
				}).append($('<i/>',{
					class : 'material-icons',
					id : 'deleteBtn',
					text: 'highlight_off'
				}))).append($('<input/>',{
					name : 'color',
					type : 'hidden',
					value :  $('#colorSlt option:selected').val()
				})).append($('<input/>',{
					name : 'size1',
					type : 'hidden',
					value : $('#sizeSlt option:selected').val()
				})).append($('<input/>',{
					name : 'size2',
					type : 'hidden',
					value : $('#cupSlt option:selected').val()
				})).append($('<input/>',{
					name : 'price',
					type : 'hidden',
					value : '${finalPrice}'
				})).append($('<input/>',{
					name : 'seq',
					type : 'hidden',
					value : '${param.seq}'
				}))).appendTo($('#totalPrice'));
				
				$('#totalPrice').show();
				}
				
				var sum = 0;
				$('.option_price').each(function(index){
					sum += parseInt($(this).text());
				});
				
				$('#priceNum').text(sum);
				//셀렉박스 초기화
				$('#colorSlt option:eq(0)').prop("selected",true);
				$('#sizeSlt option:eq(0)').prop("selected",true);
				$('#cupSlt option:eq(0)').prop("selected",true);
				$('#sizeSlt option:gt(0)').remove();
				$('#cupSlt option:gt(0)').remove();
				

			});

	} else {	
		//총합계 상품 골랐을시에 뜨게 만듬 	
		$('#totalResult').hide();
		
		$('#sizeSlt').change(function(){
			$("#selectWhole option:eq(0)").prop("selected",true);
			$('#totalResult').show();
		});
		
		$('#sizeSlt').change(function(){
			var check = '';
			$('.option_lstbx').each(function(index){
				var color = $(this).children().eq(0).children().eq(0).text();
				var size = $(this).children().eq(1).children().eq(0).text();
				if(color == $('#colorSlt').val() && size == $('#sizeSlt').val()) {
					$('.clear_frame').show();
					check='true';
				}					
			});
			
			if(check!='true') {
			
			//총 합계 창 보여주기
			$('#totalResult').show();
			
			$('<div/>',{ 
				class : 'option_resultbx'
			}).append($('<div/>',{
				class : 'option_lstbx'
			}).append($('<div/>',{
				class : 'option_color'
			}).append($('<span/>',{
				text: $('#colorSlt option:selected').val()	//셀렉 박스에 선택된 값 들어오게 하기		
			}))).append($('<div/>',{
				class : 'option_size'
			}).append($('<span/>',{
				text: $('#sizeSlt option:selected').val() //셀렉 박스에 선택된 값 들어오게 하기
			}))).append($('<div/>',{
				class : 'option_num'
			}).append($('<span/>',{
				class : 'numcountbx'
			}).append($('<button/>',{
				type : 'button',
				text: '-',	
				id : 'minus'
			})).append($('<input/>',{
				type: 'number',
				name : 'count',
				value: '1'
			})).append($('<button/>',{
				type : 'button',
				id : 'plus',
				text:'+'
			})))).append($('<div/>',{
				class :'option_price',
				text: '${finalPrice}' //
			})).append($('<div/>',{
				style : 'float : left;'
			}).append($('<i/>',{
				class : 'material-icons',
				id : 'deleteBtn',
				text: 'highlight_off'
			}))).append($('<input/>',{
				name : 'color',
				type : 'hidden',
				value :  $('#colorSlt option:selected').val()
			})).append($('<input/>',{
				name : 'size1',
				type : 'hidden',
				value : $('#sizeSlt option:selected').val()
			})).append($('<input/>',{
				name : 'size2',
				type : 'hidden',
				value : '-'
			})).append($('<input/>',{
				name : 'price',
				type : 'hidden',
				value : '${finalPrice}'
			})).append($('<input/>',{
				name : 'seq',
				type : 'hidden',
				value : '${param.seq}'
			}))).appendTo($('#totalPrice'));
			
			$('#totalPrice').show();
			}
			
			var sum = 0;
			$('.option_price').each(function(index){
				sum += parseInt($(this).text());
			});
			
			$('#priceNum').text(sum);
			//셀렉박스 초기화
			$('#colorSlt option:eq(0)').prop("selected",true);
			$('#sizeSlt option:eq(0)').prop("selected",true);
			$('#sizeSlt option:gt(0)').remove();
		});
	}
//////////////////////////////////////////////////////////////////////
//+- 클릭이벤트
	$(document).on('click','#plus',function(){
		
		var count = parseInt($(this).prev().val())+1;
		$(this).prev().val(count);
	
		$(this).parent().parent().next().text(parseInt('${finalPrice}')*count);
		
		//결과값 도출
		var sum = 0;
		$('.option_price').each(function(index){
			sum += parseInt($(this).text());
		});
		
		$('#priceNum').text(sum);
	});	
	$(document).on('click','#minus',function(){
		if($(this).next().val() > 1) {
			var count = parseInt($(this).next().val())-1;
			$(this).next().val(count);
			$(this).parent().parent().next().text(parseInt('${finalPrice}')*count);
		
			//결과값 도출
			var sum = 0;
			$('.option_price').each(function(index){
				sum += parseInt($(this).text());
			});
			
			$('#priceNum').text(sum);
		
		}
	});

//////////////////////////////////////////////////////////////////////	



		
		//이모티콘 x누를시 삭제 개별적으로 하나씩 삭제 &삭제될시 총합계도 삭제	
		$('#totalPrice').on('click','#deleteBtn',function(){
			$(this).parent().parent().remove();
			
			if($('.option_lstbx').text() == '') { //마지막 상자가 사라지면 총 합계 hide
				$('#totalResult').hide();
			}
			//결과값 도출
			var sum = 0;
			$('.option_price').each(function(index){
				sum += parseInt($(this).text());
			});
			
			$('#priceNum').text(sum);
			
		});

		$('#ProductImage').on('mouseenter',function(){
			$('#myresult').css('display','block');
			$('#ProductImage').css('cursor','none');
			$('.img-zoom-lens').css('display','');
			$('.img-zoom-lens').css('cursor','none');
		});
		
		$('#ProductImage').on('mouseleave',function(){
			$('#myresult').css('display','none');
			$('.img-zoom-lens').css('display','none');
		});
		
		//브라우저 확대/축소 이벤트
		$(window).resize(function (){
			$('#myresult').css('left',$('#ProductImage').offset().left+$('#ProductImage').width());
			$('#myresult').css('top',$('#ProductImage').offset().top);
			$('#myresult').css('height',$('#ProductImage').height());
			
			$('.img-zoom-lens').style.width = $('#myresult').width()/2 +"px";
			$('.img-zoom-lens').style.height = $('#myresult').height()/2 +"px";
		});
		
 });
</script>

<script>
function imageZoom(imgID, resultID) {
	  var img, lens, result, cx, cy;
	  img = document.getElementById(imgID);
	  result = document.getElementById(resultID);
	  result.style.width = ($('#ProductImage').width()*0.7)+"px";
	  /*create lens:*/
	  lens = document.createElement("DIV");
	  lens.setAttribute("class", "img-zoom-lens");
	  lens.style.width = $('#myresult').width()/2 +"px";
	  lens.style.height = $('#myresult').height()/2 +"px";
	  /*insert lens:*/
	  img.parentElement.insertBefore(lens, img);
	  /*calculate the ratio between result DIV and lens:*/
	  cx = result.offsetWidth / lens.offsetWidth;
	  cy = result.offsetHeight / lens.offsetHeight;
	  /*set background properties for the result DIV*/
	  result.style.backgroundImage = "url('" + img.src + "')";
	  result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
	  /*execute a function when someone moves the cursor over the image, or the lens:*/
	  lens.addEventListener("mousemove", moveLens);
	  img.addEventListener("mousemove", moveLens);
	  /*and also for touch screens:*/
	  lens.addEventListener("touchmove", moveLens);
	  img.addEventListener("touchmove", moveLens);
	  function moveLens(e) {
	    var pos, x, y;
	    /*prevent any other actions that may occur when moving over the image*/
	    e.preventDefault();
	    /*get the cursor's x and y positions:*/
	    pos = getCursorPos(e);
	    /*calculate the position of the lens:*/
	    x = pos.x - (lens.offsetWidth / 2);
	    y = pos.y - (lens.offsetHeight / 2);
	    /*prevent the lens from being positioned outside the image:*/
	    if (x > img.width - lens.offsetWidth) {x = img.width - lens.offsetWidth;}
	    if (x < 0) {x = 0;}
	    if (y > img.height - lens.offsetHeight) {y = img.height - lens.offsetHeight;}
	    if (y < 0) {y = 0;}
	    /*set the position of the lens:*/
	    lens.style.left = x+$('#ProductImage').offset().left + "px";
	    lens.style.top = y+$('#ProductImage').offset().top + "px";
	    /*display what the lens "sees":*/
	    result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
	  }
	  function getCursorPos(e) {
	    var a, x = 0, y = 0;
	    e = e || window.event;
	    /*get the x and y positions of the image:*/
	    a = img.getBoundingClientRect();
	    /*calculate the cursor's x and y coordinates, relative to the image:*/
	    x = e.pageX - a.left;
	    y = e.pageY - a.top;
	    /*consider any page scrolling:*/
	    x = x - window.pageXOffset;
	    y = y - window.pageYOffset;
	    return {x : x, y : y};
	  }
}
</script>
</body>
</html>