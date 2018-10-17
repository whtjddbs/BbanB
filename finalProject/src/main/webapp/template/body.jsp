<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"/>
<!-- <link rel="stylesheet" href="../css/template.css"> -->
</head>
<style type="text/css">
    .slide, .slidectrl {
        list-style:none;
        padding:0;
        margin:0;
    }
     
    .slidebox {
        width:1200px;
        overflow:hidden;
        position:relative;
        height:500px;
        margin-left: 20%;
    }
     
    .slide {
        width:7500px;
        height:500px;
        position:absolute;
        left:0;
        display: inline-block;
    }
     
    .slide li {
        display:inline-block;
        width:1200px;
        height:500px;  
        text-align:center;
        color:white;
        font-size:30px;
        line-height:150px;
        /* margin-right:-4px; */
    }
    .slide li img{
    	width: 1200px;
    	height : 500px;
    }
     
    .slidectrl {
        width:800px;
        text-align:center;
  	    margin-top:10px;
        margin-left:29%;
    }
     
    .slidectrl li {
        display:inline-block;
    }
    
    .slidepos button {
 		background: none;
 		border:none;
 		outline:none;
    }
    
    .slidepos button i {
    	color:gray;
    }
    
    /*recommendation*/
.body_recommendation{
	margin-top:87px;
}
.body_recommendation .body_recommendation_title{
	height: auto;
	color: #333;
	font-size: 48px;
	text-transform: uppercase;
	text-align: center;
	margin-bottom: 15px;
	margin: 0;
	line-height: 100%;
}
.body_recommendation .body_recommendation_link_group{
	text-align: center;
	font-size: 0;
	margin-bottom: 40px;
}
.body_recommendation ul, li{
	margin: 0;
	padding: 0;
}
.body_recommendation li{
	display: inline;
	font-size: 16px;
	list-style: none;
}
.body_recommendation_link_group li:first-child{
	margin-left: 0px;
}
.body_recommendation_link_group li button{
	height: 30px;
	padding : 0 20px;
	vertical-align: middle;
	width: auto;
	border: 0;
	outline:0;
	background: none;
	font-weight: normal;
	cursor: pointer;
	text-transform: none;
	overflow: visible;
	font: inherit;	
	margin: 0;
	color: inherit;
}
.body_recommendation_link_group li:hover button span,
.body_recommendation_link_group li.active button span{
	color: #333;
	border-bottom : 3px solid #000;
}
.body_recommendation_link_group li.active button span{
	display: block;
	position: relative;
	height: 100%;
}
</style>

<div>
	<div style="margin-left: 7%;">
		<img style="height: 800px;" src="../image/main/main_pic11.jpg">
	</div>
	<div class="body_video" style="margin-left: 18%; margin-bottom: 20px;">
	<!-- 	<embed src="../video/finalProject_mainVideo.mp4" width="1000" height="700"  autostart="true"> -->
		<video src="../video/finalProject_mainVideo.mp4" controls loop muted autoplay width="1200" height="900"></video>
	</div>
	<div>
		<img src="../image/main/mainPic.jpg">
	</div>
	
	<div style="margin-left:30%;">
		<div style="text-size:25px; line-height: 24px; letter-spacing: 3.84px; margin-bottom: 6px; margin-left: 20%;">GET IN GEAR!</div>
		<div style="font-size:50px; ling-height: 62.4px; letter-spacing:2.64px; margin-bottom: 7.2px;">BBANB STYLE ON POINT</div>
	</div>
	

	<div style="float:left; margin-left: 13%;">		
		<a href="/finalProject/new/itemDisplay.do?main_codename=sport&sub_codename=top&pg=1" style="color:#000; text-decoration:none;"><img src="../image/main/main_pic6.jpg">
		<div style="margin: 15px 150px 0; font-size: 18px; line-height: 18px; letter-spacing: 2.16px; margin-top: 16.8px;">NEW! ALL TOP></div></a>
	</div>
	<div style="float:left; margin-right: 30px;">		
		<a href="/finalProject/new/itemDisplay.do?main_codename=sport&sub_codename=men&pg=1" style="color:#000; text-decoration:none;"><img src="../image/main/main_pic7.jpg">
		<div style="margin: 15px 120px 0; font-size: 18px; line-height: 18px; letter-spacing: 2.16px; margin-top: 16.8px;">NEW! ALL MEN'S></div></a>
	</div>
	<div style="float:left;">		
		<a href="/finalProject/new/itemDisplay.do?main_codename=sport&sub_codename=leggings&pg=1" style="color:#000; text-decoration:none;"><img src="../image/main/main_pic8.jpg">
		<div style="margin: 15px 120px 0; font-size: 18px; line-height: 18px; letter-spacing: 2.16px; margin-top: 16.8px;">NEW! ALL LEGGINGS></div></a>
	</div>


	
	 <!-- <div>
		<div class="slidebox">
			<h2 class="body_tit_main" style="margin-bottom: 40px; height: 52px; color: #333; font-size: 48px; text-transform: uppercase; text-align: center; margin: 0; font-weight: normal; line-height: 100%;  margin-top: 30px;">style story</h2>
		    <ul class="slide">
		        <li><img src="../image/main/main_pic2.jpg" >1</li>
		        <li><img src="../image/main/main_pic3.jpg" >2</li>
		        <li><img src="../image/main/main_pic4.jpg" >3</li>
		        <li><img src="../image/main/main_pic5.jpg" >4</li>
		        <li><img src="../image/main/main_pic1.jpg" >5</li>
		    </ul>
		</div>
		     
		<ul class="slidectrl">
		    <li><button type="button" id="leftbtn">◀</button></li>
		    <li><button id="leftbtn" class="glyphicon glyphicon-chevron-left"></button></li>
		    <li class="slidepos">
		        <button type="button"><i class="material-icons">fiber_manual_record</i></button>
		        <button type="button"><i class="material-icons">fiber_manual_record</i></button>
		        <button type="button"><i class="material-icons">fiber_manual_record</i></button>
		        <button type="button"><i class="material-icons">fiber_manual_record</i></button>
		        <button type="button"><i class="material-icons">fiber_manual_record</i></button>
		    </li>
		    <li><button type="button" id="rightbtn">▶</button></li>
		    <li><button  id="rightbtn" class="glyphicon glyphicon-chevron-right"></button></li>
		</ul>
	 </div>
 -->
	
	<div style="width: 99%;">
		<img src="../image/main/mainEvent.jpg" style="margin-top:50px;">
	</div>
	<div style="width: 99%;">
		<img style="float: right; margin-bottom: 50px;"src="../image/main/mainEvent2.jpg">
	</div>
	
	<div style="width: 99%; margin-left: 5%; margin-bottom: 30px;">
		<a href="/finalProject/etc/talkaboutfit.do"><img src="../image/main/pic8.jpg"></a>
	</div>
	
	<div class="body_video">
		<embed src="https://dm.victoriassecret.com/appfeatures/1268132919181/BLMxVS_LONGFORM_1L_HD_ProRHQ_1600x900.mp4" width="100%" height="600" autostart="true">
	</div>
	

		<div class="body_recommendation">
			<h1 class="body_recommendation_title">recommendations</h1>
			<ul class="body_recommendation_link_group">
				<li class="body_recommendation_active">
					<button type="button" id="recommend_allBtn">
						<span>ALL</span>
					</button>	
				</li>
				<li class="body_recommendation_active">
					<button type="button" class="recommend_Btn" value="bras">
						<span>BRAS</span>
					</button>
				</li>
				<li class="body_recommendation_active">
					<button type="button" class="recommend_Btn" value="panties">
						<span>PANTIES</span>
					</button>
					
				</li>
				<li class="body_recommendation_active">
					<button type="button" class="recommend_Btn" value="mens">
						<span>MEN'S</span>
					</button>
					
				</li>
				<li class="body_recommendation_active">
					<button type="button" class="recommend_Btn" value="sport">
						<span>SPORT</span>
					</button>
				</li>
			</ul>
			<div class="recommendation_thumbnail_list" id="reco_main_bt" style="margin-left: 10%;">
				<ul>
					<li style="float: left; margin-bottom: 50px; position: relative; margin-right: 22px;">
						<a href="/finalProject/itemView/itemViewTop.do?seq=4" style="text-decoration: none; color: black;">
							<div>
								<img style="width: 269px; height : 271px;" src="../image/bras/bralette_004.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">Sexy illusions bralette</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">48,000</span>
								</div>
							</div>
						</a>
					</li>
					<li style="float: left; margin-bottom: 50px; position: relative; margin-right: 22px;">
						<a href="/finalProject/itemView/itemViewTop.do?seq=119" style="text-decoration: none; color: black;">
							<div>
								<img  style="width: 269px; height : 271px;" src="../image/bras/pushup_030.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">T-shirt intimates front close pushup bra</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">38,000</span>
								</div>
							</div>
						</a>
					</li>
					<li style="float: left; margin-bottom: 50px; position: relative; margin-right: 22px;" >
						<a href="/finalProject/itemView/itemViewTop.do?seq=180" style="text-decoration: none; color: black;">
							<div>
								<img  style="width: 269px; height : 271px;" src="../image/mens/boxer_001.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">Active stretch boxer</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">33,000</span>
								</div>
							</div>
						</a>
					</li>
					<li style="float: left; margin-bottom: 50px; position: relative; margin-right: 22px;">
						<a href="/finalProject/itemView/itemViewTop.do?seq=429" style="text-decoration: none; color: black;">
							<div>
								<img  style="width: 269px; height : 271px;" src="../image/sport/leggings_001.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">3 stripes long leggings</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">60,000</span>
								</div>
							</div>
						</a>
					</li>
					<li style="float: left; margin-bottom: 50px; position: relative; margin-right: 22px;">
						<a href="/finalProject/itemView/itemViewTop.do?seq=475" style="text-decoration: none; color: black;">
							<div>
								<img  style="width: 269px; height : 271px;" src="../image/sport/Men_017.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">Superstar training T-shirt</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">31,000</span>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div> <!-- recommendation_thumbnail_list-->
		<div class="recommendation_thumbnail_list2" style="position: relative;	overflow: hidden; width:150%; margin-left:10%;">
			<ul>
			</ul>
		</div>
		</div><!-- body_recommendation -->
		
 <c:if test="${lebCookie == null }">
  	<div class="body_layer_popup" style="position:fixed; width:500px;left:30%; margin-left:-380px; top:250px; z-index:100; display:none;" id="body_layer_pop">
		<div style="width:500px;">
			<img id="popup_img" src="../image/main/main_pic9.jpg" width="500" height="500" border="0" usemap="#m_pop" />
		</div>
		
		<div style="width:100%; height: 30px; background: #000;">
			<div style="float:left; color: #fff; padding-top: 3px; margin-left:10px;"><input type="checkbox" name="pop_today" id="pop_today" />오늘 하루 이 창 열지 않음</div>
			<div style="float:right; color: #fff; padding-top: 3px; margin-right: 10px;"><a href="javascript:closeWin()">[close]</a></div>
		</div>
	</div> 
	
	<div class="body_layer_popup2" style="position:fixed; width:500px;left:10%; margin-left:-100px; top:250px; z-index:99; display:none;" id="body_layer_pop">
		<div style="width:500px;">
			<img src="../image/main/main_pic10.jpg" width="500" height="500" border="0" usemap="#m_pop" />
		</div>
		
		<div style="width:100%; height: 30px; background: #000;">
			<div style="float:left; color: #fff; padding-top: 3px; margin-left:10px;"><input type="checkbox" name="pop_today" id="pop_today" />오늘 하루 이 창 열지 않음</div>
			<div style="float:right; color: #fff; padding-top: 3px; margin-right: 10px;"><a href="javascript:closeWin()">[close]</a></div>
		</div>
	</div>  
</c:if>
</div>




<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function closeWin() { 
	 if(document.getElementById("pop_today").checked){
	  setCookie( "ncookie", "done" , 24 ); 
	 }
	 document.getElementById('body_layer_pop').style.display = "none";
	}
	
	function setCookie( name, value, expirehours ) { 
		 var todayDate = new Date(); 
		 todayDate.setHours( todayDate.getHours() + expirehours ); 
		 document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
	}
	
	//팝업창 크기 조절
	var popup_size = $(window).height()/2 > 500 ? 500 : $(window).height()/2;
	$('.body_layer_popup').css('width', popup_size);
	$('#popup_img').css('width', popup_size).css('height', popup_size);
		
	cookiedata = document.cookie;
	
	// alert(cookiedata.indexOf("ncookie=done"));
	if (cookiedata.indexOf("ncookie=done") < 0){ 
	 // alert("false");
	 document.getElementById('body_layer_pop').style.display = "inline";
	} 
	else {
	 // alert("true");
	 document.getElementById('body_layer_pop').style.display = "none";
	}

$(document).ready(function(){	
	/* $(document).ready(function(){
	    var idx = 0;
	    var slidemax = 4;
	    var pos = 1204;
	 
	    function sliding(add) {
	        idx = idx + add;
	        if(idx < 0) idx = slidemax;
	        else if(idx > slidemax) idx = 0;
	        $('.slide').stop().animate({'left' : -(idx*pos)+"px"}, "slow");
	        $('.slidepos button i').css('color','gray');
	        $('.slidepos button:eq('+idx+') i').css('color','black');
	    }
	     
	    autoslide = setInterval(function() { sliding(1) }, 3000);
	     
	    function after() {
	        setTimeout(function() {
	            clearInterval(autoslide);  
	            autoslide = setInterval(function() { sliding(1) }, 3000);
	        }, 2000);
	    }
	     
	    $('#leftbtn, #rightbtn').click(function() {
	        clearInterval(autoslide);  
	        if($(this).attr('id') == "leftbtn") sliding(-1);
	        else sliding(1);
	        after();
	    });
	     
	    $('.slidepos > button').click(function() {
	        clearInterval(autoslide);  
	        idx = $(this).index(); 
	        sliding(0);
	        after();
	    });
	}); */
	
	$('#recommend_allBtn').click(function(){
		
		$('.recommendation_thumbnail_list').show();
		$('.recommendation_thumbnail_list2').hide();
	});
	
	$('.recommend_Btn').click(function(){
		//alert($(this).val());
		$.ajax({
			type: 'POST',
			url : '/finalProject/template/recommend.do',
			data : 'main_codename='+$(this).val(),
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$('.recommendation_thumbnail_list').hide();
				$('.recommendation_thumbnail_list2').show();
				$('.recommendation_thumbnail_list2 > ul > *').remove();
				
				 $.each(data.list, function(index, item){
					$('.recommendation_thumbnail_list2 > ul').append($('<li/>',{
						style : 'float: left; margin-bottom: 50px; position: relative; margin-right: 22px;'
					}).append($('<a/>',{
						href: '/finalProject/itemView/itemViewTop.do?seq='+item.seq,
						style: 'text-decoration: none; color: black;'
					}).append($('<div/>',{
						
					}).append($('<img/>',{
						src : '../image/'+item.main_codename+"/"+item.img,
						style : 'width: 269px; height : 271px;'
					}))).append($('<div/>',{
						text : item.name
					})).append($('<div/>',{
						
					}).append($('<span/>',{
						text : item.price.toLocaleString()
					})))));
				}); 
			}//success
		});
	});
});
	

</script>

