<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
   integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
   crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/myDialog.css">
<link rel="stylesheet" type="text/css" href="../css/paging.css">
<link rel="stylesheet" type="text/css" href="../css/itemView.css">
<title>Insert title here</title>
<style>
.div_comments{
   text-overflow: ellipsis;
   overflow : hidden;
   white-space: nowrap;
}

.btn_black {
   width: 120px;
   padding: .6em .5em;
   border: 1px solid #303033;
   background: #303033;
   font-size: 13px;
   color: #fff;
   line-height: 20px;
}

.m_d_btn {
    border: 1px solid #d4d4d4;
    color: #5d5d5d;
    background: transparent;
    cursor: pointer;
    height: 25px;
    font-size: 12px;
    border-radius: 2px;
}

.btn_cancel{
   width : 80px;
}

.container{
   width : 700px;
   height: 500px;
}

.write_A > div:not(:last-child) {cursor: pointer;}
</style>
</head>
<body>
<div class="information">
   <div  class="item_container">
      <div  class="review_section">
         <div  class="dscBx">
            <h2  class="item_tit" style="width:45%; float: left;">상품후기 </h2>
            <c:if test="${sessionScope.memberDTO != null}">
               <div class="productReply">
                  <a style="color: #333;">후기쓰기</a>
               </div>
            </c:if>
         </div>
         <p class="review_info_point" style=" margin-top: 18px;font-size: 16px; line-height: 26px;">후기 작성시 최대 1,500 point를 드립니다</p>
      </div>
   </div>
</div>   

<!----------------------------------------- 리뷰창 --- -->
<form id="fileUpload" action="/finalProject/itemView/itemViewReview2.do" method="post">
   <div class="container" style="position: relative;  background: #f5f5f5;">
      <ul style="list-style: none;">
               <li class="join_row"  style="display: table; width: 80%; table-layout: fixed;">
                     <div class="addr_div" style="width: 80px; display: table-cell;">
                        <label style="display: inline-block; font-size: 14px; color: #303033; line-height: 40px;">아 이 디  : </label>                     
                     </div>
                     <div style="display: table-cell;">
                        <div style="height: 40px; padding: 0 8px; font-size: 18px; color: #303033; line-height: 40px;">${memberDTO.id}</div>
                     </div>
                  </li>
                  <li class="join_row" style="margin-top: 5px; display: table; width: 80%; table-layout: fixed;">
                     <div class="addr_div" style="width: 80px; display: table-cell;">
                        <label style="display: inline-block; font-size: 14px; color: #303033; line-height: 40px;">주문번호 : </label>                     
                     </div>
                     <div style="display: table-cell;">
                        <select id="Serial_Select" style="height: 30px;">
                     <!-- 가져온 serial option태그로 삽입 -->
                        </select>
                     </div>
                  </li>
                  <li class="join_row" style="margin-top: 10px; display: table; width: 80%; table-layout: fixed;">                  
                     <div class="addr_div" style="width: 80px; display: table-cell;">
                        <label  style="display: inline-block; font-size: 14px; color: #303033; line-height: 40px;">별&nbsp;&nbsp;&nbsp;&nbsp;점  : </label>
                     </div>   
                     <div id="reviewWriteStar" style="display: table-cell;">   
                        <i id="star1" class="far fa-star" style="color: black;"></i>
                        <i id="star2" class="far fa-star" style="color: black;"></i>
                        <i id="star3" class="far fa-star" style="color: black;"></i>
                        <i id="star4" class="far fa-star" style="color: black;"></i>
                        <i id="star5" class="far fa-star" style="color: black;"></i>
                        <input type="hidden" name="star" id="starCnt" value="0">
                     </div>
                  </li>                                                
               <li class="join_row">
                  <div class="addr_div">
                     <label>내 &nbsp;&nbsp;&nbsp;용 : </label>
                     <div class="textarea">
                        <textarea cols="90" rows="10" id="comments" name="comments"></textarea>
                     </div>
                     <div id="commentDiv"></div>
                  </div>
               </li>
               
               <br>
               <li class="join_row">
                  <label>상품이미지</label>
                  <input type="file" name="img" id="img"  size="50"/>
                  <div id="imgDiv"></div>
               </li>
              <div class="btn_area" style="padding-left: 430px;">
                 <button type="button" id="itemViewReviewBtn" class="btn_black">상품후기 등록</button>
                 &nbsp;
                 <button type="button" id="cancelBtn" class="btn_black btn_cancel">취소</button>
              </div>
      </ul>
   </div>
</form>

<div id="item_reviewTbl"></div>
<div id="itemReviewPagingDiv" style="float: left; width: 100%; margin-top: 10px;" align="center"></div>
<input type="hidden" value="1" id="pg">
<input type="hidden" value="1" id="pg2">

<div class="information">
   <div  class="dscBx">
      <h2  class="item_tit"  style="width:35%; float: left;">상품 Q&amp;A </h2>
      <div  class="askInfo" >
          <ul class="qnAList" >
              <li class="active">
                  <a>ALL</a>
              </li>
              <li >
                  <a>상품문의 </a>
              </li>
              <li >
                  <a>재입고문의 </a>
              </li>
              <li >
                  <a>사이즈문의 </a>
              </li>
              <li >
                  <a>배송문의 </a>
              </li>
              <li >
                  <a>기타 </a>
              </li>
          </ul>
      </div>
      <c:if test="${sessionScope.memberDTO != null}">
         <div class="productReply" id="qnAWrite">
            <a style="cursor:pointer; color: black;" >Q&amp;A쓰기</a>
         </div>
      </c:if>
   </div>
</div>


<div class="itemViewQnA" style="position: relative; padding: 24px 30px 30px; background: #f5f5f5;">
   <ul style="list-style: none;">
      <li style="display: table; width: 80%; table-layout: fixed;">
         <div style="width: 80px; display: table-cell;">
            <label style="display: inline-block; font-size: 14px; color: #303033; line-height: 40px;">아이디</label>
         </div>
         <div style="display: table-cell;">
            <div id="userId" style="height: 40px; padding: 0 14px; font-size: 14px; color: #303033; line-height: 40px;" >${memberDTO.id}</div>
         </div>
      </li>
      <li style="margin-top: 10px; display: table; width: 80%; table-layout: fixed;">
         <div style="width: 80px; display: table-cell;">
            <label style="display: inline-block; font-size: 14px; color: #303033; line-height: 40px;">이메일 주소</label>
         </div>
         <div style="display: table-cell;">
            <div style="display: inline-block; width: 260px; background: #fff;">
               <input id="userEmail" type="text" value="${memberDTO.email}" style="width: 100%; height: 40px; padding: 0 14px; font-size: 15px; color: #1a1a1a; border: 0; outline: none;">
            </div>
         </div>
      </li>
      <li style="margin-top: 10px; display: table; width: 100%; table-layout: fixed;">
         <div style="width: 80px; display: table-cell;">
            <label style="display: inline-block; font-size: 14px; font-weight: 400; color: #303033;">문의내용</label>
         </div>
         <div style="display: table-cell;">
            <span style="width: 260px; height: 35px; background: #fff; display: inline-block; position: relative; height: 40px; padding: 9px 0 0 14px; border: 1px solid #d4d4d4;">
               <select id="userCategory" style="display: block; width: 100%; height: 100%; margin: -4px 0 0; padding: 0; border : 0 none; background: #fff; font-size: 14px; line-height: 30px; outline: none;">
                  <option>상품문의</option>
                  <option>재입고문의</option>
                  <option>사이즈문의</option>
                  <option>배송문의</option>
                  <option>기타</option>
               </select>
            </span>
            <div style="margin-top: 10px; border: 1px solid #d4d4d4; backtround: #fff;">
               <textarea id="userComments" placeholder="질문을 입력해 주세요." rows="5" value="문의내용 작성" style="background: #fff; width: 100%; padding: 0; font-size: 13px; line-height: 24px;"></textarea>
            </div>
         </div>
      </li>
   </ul>
   <div style="margin-top: 10px; text-align: right;">
      <button id="closeBtn" style="background: #fff; border: 1px solid #d4d4d4; font-weight: 700; font-size: 13px; width: 82px; height: 40px; vertical-align: bottom; line-height: 40px;">닫기</button>
      <button id="upBtn" style="background: #303033; font-size: 13px; line-height: 40px;  font-weight: 700; color: #fff; width: 82px; height: 40px; vertical-align: bottom;">등록</button>
   </div>
</div>

<div id="qnATable"></div>
<div id="qnAPagingDiv" style="float: left; width: 100%; margin-top: 5px;" align="center"></div>
<input type="hidden" value="" id="category_type">
<input type="hidden" value="1" id="pg">
<input type="hidden" value="1" id="pg2">


<div class="informaion">
    <section>
        <div >
            <div  class="delInfo" style="margin-top:20px;">
                <h2 style="margin-bottom:20px;">배송정보</h2>
            </div>
            <ul style="margin-top:20px;">
                <li >Delivery 브랜드 업체발송은 상품설명에 별도로 기입된 브랜드 알림 배송공지 기준으로 출고되고 브랜드마다 개별 배송비가 부여됩니다.</li>
                <li >Delivery 29CM 자체발송은 오후 3시까지 결제확인된 주문은 당일 출고되고 5만원 이상 주문은 무료배송, 5만원 미만은 3,000원의 배송비가 추가됩니다.</li>
                <li >SPECIAL ORDER, PT 등 예약주문은 상세설명의 출고일정을 확인하시기 바랍니다.</li>
                <li >구두, 액세서리, 침구, 액자, 가구 등 상품설명의 제작기간을 숙지해주시기 바랍니다.</li>
                <li >가구 및 일부 상품, 제주도를 포함한 도서산간 지역은 추가배송비 입금요청이 있을 수 있습니다.</li>
            </ul>
            <div  class="asInfo" style="margin-top:20px;">
                <h2 style="margin-bottom:20px;">교환, 환불, A/S 안내</h2>
            </div>
            <ul  class="dsc_lst" style="margin-top:20px;">
                <li >상품 수령일로부터 7일 이내 반품 / 환불 가능합니다.</li>
                <li >변심 반품의 경우 왕복배송비를 차감한 금액이 환불되며, 제품 및 포장 상태가 재판매 가능하여야 합니다.</li>
                <li >상품 불량인 경우는 배송비를 포함한 전액이 환불됩니다.</li>
                <li >출고 이후 환불요청 시 상품 회수 후 처리됩니다.</li>
                <li >얼리 등 주문제작상품 / 카메라 / 밀봉포장상품 등은 변심에 따른 반품 / 환불이 불가합니다.</li>
                <li >일부 완제품으로 수입된 상품의 경우 A/S가 불가합니다.</li>
                <li >특정브랜드의 상품설명에 별도로 기입된 교환 / 환불 / AS 기준이 우선합니다.</li>
                <li >구매자가 미성년자인 경우에는 상품 구입 시 법정대리인이 동의하지 아니하면 미성년자 본인 또는 법정대리인이 구매취소 할 수 있습니다.  </li>
            </ul>
        </div>
    </section>
</div>

<!-- 기본 다이얼로그 -->
<div id="dialog_frame" style="z-index: 10000;">
   <div id="dialog">
      <i class="material-icons" id="dialog_closeBtn">clear</i>
      <div></div>
   </div>
</div>

<!-- <div class="insertFrame" id="dialog_frame">
   <div id="dialog">
      <i class="insertClose" id="dialog_closeBtn">clear</i>
         내용이 등록 되었습니다.
   </div>      
</div> -->

<!-- confirm 다이얼로그 -->
<div id="myConfirmDialog_frame" style="display: none;">
   <div id="myConfirmDialog">
      <i class="material-icons" id="myConfirmDialog_closeBtn">clear</i>
		정말 삭제하시겠습니까?
      <button id="myConfirmDialog_okBtn">확인</button>
      <button id="myConfirmDialog_cancelBtn">취소</button>
   </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
   var apply = "";
   
   //리뷰작성창 숨기기
   $('.container').hide();
   
   //구매목록에 있는 상품만, 리뷰작성이 가능하게 처리하는 부분
   var serial=0;
   var count=0;
   var status="";
   $('.productReply > a:eq(0)').click(function(){
      $(this).bind('click', false);
      
      $.ajax({
            type: 'POST',
            url : '/finalProject/itemView/CheckItemViewReview.do',
            data: {'id':'${memberDTO.id}','seq':'${itemDTO.seq}'},
            dataType: 'json',
            success: function(data){
               //alert(JSON.stringify(data));
               $('#Serial_Select *').remove();
               $.each(data.mapList,function(index,item){
                  status=item.STATUS;
                  if(data.mapList[index]!=""){
                     //alert(JSON.stringify(data));
                     count+=1;
                     serial=item.SERIAL;   
                        //$('#Serial_Select > #Select_Option:eq('+index+')').text('serial');
                        $('#Serial_Select').append($('<option/>',{                        
                           id:'Select_Option',
                           text: item.SERIAL                        
                        }));                     
                  }   
               }); // each
               
               if (count==0 || status != '배송완료') {  
                  $('#dialog > div').text('리뷰를 작성할 수 없습니다.');
                  $('#dialog_frame').show();
               }else if (count!=0) {   
                  $('.container').show();
               }
            } // success                                       
      });
      
   });
   
   //위시 리스트 추가
   $('.container' ).on('click','#reviewWriteStar > i',function(){
      $(this).parent().find('i').prop('class','far fa-star'); //빈별
      
      if($(this).attr("id") == 'star1') {
         $('#star1').prop('class','fas fa-star');
         $('#starCnt').val(1);
      }
      else if($(this).attr("id") == 'star2') {
         $('#star1').prop('class','fas fa-star');
         $('#star2').prop('class','fas fa-star');
         $('#starCnt').val(2);
      }
      else if($(this).attr("id") == 'star3') {
         $('#star1').prop('class','fas fa-star');
         $('#star2').prop('class','fas fa-star');
         $('#star3').prop('class','fas fa-star');
         $('#starCnt').val(3);
      }
      else if($(this).attr("id") == 'star4') {
         $('#star1').prop('class','fas fa-star');
         $('#star2').prop('class','fas fa-star');
         $('#star3').prop('class','fas fa-star');
         $('#star4').prop('class','fas fa-star');
         $('#starCnt').val(4);
      }
      else if($(this).attr("id") == 'star5') {
         $('#star1').prop('class','fas fa-star');
         $('#star2').prop('class','fas fa-star');
         $('#star3').prop('class','fas fa-star');
         $('#star4').prop('class','fas fa-star');
         $('#star5').prop('class','fas fa-star');
         $('#starCnt').val(5);
      }
   });
   

   
   var comments;
   
   //상품후기 등록
   $('#itemViewReviewBtn').click(function(){
      //alert( $("#Serial_Select option:selected").val());
      var form = $('#fileUpload')[0];
      var formData = new  FormData(form);
      formData.append('id','${memberDTO.id}');
      formData.append('seq','${itemDTO.seq}');
      formData.append('starCnt',$('#starCnt').val());
      formData.append('comments',$('#comments').val());
      formData.append('serial', $("#Serial_Select option:selected").val());
      if($('#comments').val() == ''){
         $('#commentDiv').text('내용을 입력하세요').css('color','red').css('font-size','9pt');
      }else if($('#comments').val() != ''){
         $.ajax({
            type:'POST',
            url: '/finalProject/itemView/itemViewReview2.do',
            processData:false,
            contentType: false,
            enctype: "multipart/form-data",
            data : formData,
            dataType : 'text',
            success: function(data){
               //alert('완료');
               $('#dialog > div').text('내용이 등록되었습니다.');
                $('#dialog_frame').show();
                apply = "itemReview";
            } 
         });      
      }            
   });
   
   //다이얼로그 이벤트
   $('#dialog_closeBtn').click(function(){
      $('#dialog_frame').hide();
      if(apply == 'itemQnA'){
         $('#userComments').val('');
         $('.itemViewQnA').hide();
      }else if(apply == 'itemReview'){
         location.reload();
      }
    });
   
   
   //------------------ 기존
   itemViewMid2ReviewList();// 아이템 리뷰리스트 띄우기
   
   $('.itemViewQnA').hide();
   $('#qnAWrite').click(function(){
      $('.itemViewQnA').show();
   });
   $('#closeBtn').click(function(){
      $('.itemViewQnA').hide();
   });
   
   

   function qnAPaging(pg){// 상품문의 기타 등등  tab click 이벤트
      
      $('ul#qnAList li a').each(function(){
         if($(this).text()==$('#category').val()) $(this).trigger('click',pg);
      });
   }
   
   //paging
   $('#qnAPagingDiv').on('click','span',function(){
      var pg = $(this).prop('class');
      $('#pg').val(pg);
      itemViewMid2List();
   });
   
   //json Date to YYYY-MM-DD
   function jsonDateFormat(date) {
      var year = date.getYear()+1900;
      var month = date.getMonth()+1;
      var day = date.getDate();
      return year+(month>9 ? '-':'-0')+month+(day>9 ? '-':'-0')+day;
   }

    //상품 후기 불러오기
    function itemViewMid2ReviewList(){ 
       $.ajax({
         type : 'GET',
         url : '/finalProject/itemView/itemViewMid2ReviewList.do',
         data :'seq=${param.seq}&pg='+$('#pg').val(),
         dataType : 'json',
         success : function(data){
            //alert(JSON.stringify(data));
            $('#item_reviewTbl *').remove();
            $.each(data.list,function(index,mapperDTO){
               var date = new Date(mapperDTO.LOGTIME);
               
               $('<div/>',{
                  class : 'reviewForm'
               }).css({
                  'border-bottom' : '1px solid #d4d4d4',
                  'padding' : '20px 0px',
                  cursor:'pointer'
               }).append($('<div/>',{
                  text : '[color]'+mapperDTO.COLOR//'[size]'+mapperDTO.SIZE1+' '+mapperDTO.SIZE2
               }).css({
                     width: '10%',
                     'font-weight': '300',
                     color: '#a0a0a0',
                     'margin-left' : '20px',
                     cursor:'pointer',
                     float: 'left'
               })).append($('<span/>').css({
                  width : '50px'
               })).append($('<div/>',{
                  text : '[size]'+mapperDTO.SIZE1+' '+mapperDTO.SIZE2
               }).css({
                  width: '69%',
                  'font-weight': '300',
                  color: '#a0a0a0',
                  'margin-left' : '20px',
                  cursor:'pointer',
                  float:'left'
               })).append($('<div/>',{
                  text: mapperDTO.ID
               }).css({
                  display: 'inline',
                   float: 'left',
                   'margin-right' : '20px',
                   'width' : '4%'
               })).append($('<div/>', {
                  text: jsonDateFormat(date)
               }).css({
                  display: 'inline',
                  float: 'left',
                  'margin-right' : '20px'
               })).append($('<div/>',{
                  class : 'fiveStar'
               }).css({
                  display: 'inline',
                  cursor : 'pointer',
                  float: 'left'
               }).append($('<i/>',{ //빈별 5개
                  id : 'star1',
                  class: 'far fa-star'
               })).append($('<i/>',{
                  id : 'star2',
                  class: 'far fa-star'
               })).append($('<i/>',{
                  id : 'star3',
                  class: 'far fa-star'
               })).append($('<i/>',{
                  id : 'star4',
                  class: 'far fa-star'
               })).append($('<i/>',{
                  id : 'star5',
                  class: 'far fa-star'
               }))).append($('<div/>',{
                  class: 'div_icon'   
               }).append($('<img/>',{
                  src : mapperDTO.ITEM_IMAGE==undefined? '':'../image/main/imgIcon.jpg'
               }).css({
                  //float: 'right'
                   'padding-left': '60px'
               }))).append($('<div/>',{
                  class : 'div_comments',
                  html: mapperDTO.COMMENTS.replace(/(?:\r\n|\r|\n)/g, '<br/>')
               }).css({
                  display: 'inline',
                  'text-align': 'left',
                  'font-weight': '500',
                  'padding-bottom':'10px',
                  'margin-left' : '20px',
                  cursor:'pointer',
                  'text-overflow': 'ellipsis',
                  'display': 'inline-block',
                   'overflow': 'hidden',
                   'display': '-webkit-box',
                   '-webkit-line-clamp' : '1', /* 라인수 */
                   '-webkit-box-orient' : 'vertical',
                   'word-wrap' : 'break-word', 
                   'line-height' : '2em',
                   //'height' : '3.6em', 
                   'width': '60%'
               }).append($('<div/>',{
                  class : 'div_image',
               }).append($('<img/>',{
                  src : mapperDTO.ITEM_IMAGE==undefined? '': '../image/review/'+mapperDTO.ITEM_IMAGE
               }).css({
                  display: 'none',
                  'text-align': 'left',
                  'font-weight': '500',
                  'padding-bottom':'10px',
                  'margin-left' : '20px',
                  cursor:'pointer',
               })))).append($('<div/>').append($('<input/>',{
                  type : 'hidden',
                  id : 'serial',
                  value : mapperDTO.SERIAL
               }))).append($('<div/>',{
                  style : 'text-align: right;'+(mapperDTO.ID == '${memberDTO.id}'?'':'display:none;')
               }).append($('<input/>',{
                  type : 'button',
                  id : 'reviewDeleteBtn',
                  class : 'm_d_btn',
                  value : '삭제'
               }))).appendTo($('#item_reviewTbl'));
               
               for(var i=0; i<mapperDTO.STAR; i++) { //채워지는 별
                  $('.fiveStar:eq('+index+')').children().eq(i).prop('class','fas fa-star');
               }
               
               if(mapperDTO.ITEM_IMAGE==undefined){
                  $('.div_image:eq('+index+')').hide();
                  $('.div_icon:eq('+index+')').hide();
               }
            });
            
            $('#itemReviewPagingDiv').html(data.paging.pagingHTML);
         }
      });
   } 
   
    
   //줄이기
   $('body').on('click','.reviewForm > *:not(:has(#reviewDeleteBtn))',function(){
      if($(this).parent().children().eq(7).prop('class') == 'div_comments_view'){ //줄이기
         $(this).parent().children().eq(7).prop('class','div_comments'); 
         $(this).parent().children().eq(7).css('-webkit-line-clamp','1');
         $(this).parent().css('background-color',''); //백그라운드 기본
         $(this).parent().children().eq(7).children(0).children(0).hide(); //상품 후기 이미지
         $(this).parent().children().eq(6).show();//이미지 아이콘
      }else{
         $(this).parent().children().eq(7).prop('class','div_comments_view').slideDown(); //늘리기
         $(this).parent().children().eq(7).css('-webkit-line-clamp','');
         $(this).parent().children().eq(7).children(0).children(0).show(); //상품 후기 이미지
         $(this).parent().children().eq(6).hide();//이미지아이콘
         $(this).parent().css('background-color','#EAEAEA'); //백그라운드 회색
      }

   });   
   
   var category_type="";
   //QnA 불러오기
   function itemViewMid2List(){
      $.ajax({
         type : 'GET',
         url : '/finalProject/itemView/itemViewMid2List.do',
         data : 'pg='+$('#pg').val()+'&seq=${param.seq}&category='+category_type,
         dataType : 'json',
         success : function(data){
            //alert(JSON.stringify(data));
            
            $('#qnATable *').remove();
            $.each(data.list,function(index,item_askDTO){
               $('<div/>',{
                  class : 'write_A'
               }).css({
                  'border-bottom' : '1px solid #d4d4d4',
                  'padding':'10px 0px'
                  /* cursor:'pointer' */
               }).append($('<div/>',{
                  text: '['+item_askDTO.category+']'
                  }).css({
                     width: '100px',
                     'font-weight': '300',
                     color: '#a0a0a0',
                     'margin-left' : '20px',
                     cursor:'pointer'
               })).append($('<div/>',{
                  class: 'item_askComments',
                  text: item_askDTO.comments
               }).css({
                  display: 'inline',
                  'text-align': 'left',
                  'font-weight': '500',
                  'padding-bottom':'10px',
                  'margin-left' : '20px',
                  cursor:'pointer',
                  'text-overflow': 'ellipsis',
                  'display': 'inline-block',
                   'overflow': 'hidden',
                   'width': '60%',
                   'white-space': 'nowrap'
               })).append($('<input/>',{
                  type : 'hidden',
                  value : item_askDTO.seq
               })).append($('<div/>', {
                  text: item_askDTO.logtime
               }).css({
                  display: 'inline',
                  float: 'right',
               })).append($('<div/>',{
                  text: item_askDTO.id
               }).css({
                  display: 'inline',
                   float: 'right',
                   'margin-right' : '20px'
               })).append($('<br>')).append($('<div/>',{
                  text :'답변 : '
               }).css({
                  'margin-left' : '20px',
                  'padding-bottom':'10px',
                  'display' : 'none'
               })).append($('<div/>',{
                  style : 'text-align: right;'+(item_askDTO.id == '${memberDTO.id}'?'':'display:none;')
               }).append($('<input/>',{
                  type : 'button',
                  id : 'QnADeleteBtn',
                  class : 'm_d_btn',
                  value : '삭제'
               })).append($('<input/>',{
            	   type :'hidden',
            	   name : 'seq',
            	   value : item_askDTO.seq
               }))).appendTo($('#qnATable'));
               
               //writeQ
               $('<div/>',{
                  class : 'write_Q'
               }).append($('<div/>',{
                  id: 'ans_admin',
                  text: item_askDTO.reply
               }).css({
                   'margin-left': '20px'
               })).css({
                  float: 'left',
                  width : '100%',
                  display: 'none'
               }).appendTo($('#qnATable'));
               
            });
            
            $('#qnAPagingDiv').html(data.paging.pagingHTML);
         }
      });
   }
   
   $('#pg').val('1');
   itemViewMid2List();
   
   $(document).on('click','ul.qnAList li a', function(e,pg){ //클릭했을때  select시 css
      $(this).parent().parent().children().removeClass('active');
      $(this).parent().addClass('active');
      category_type=$(this).text();
      
      if(category_type=='ALL') category_type="";
      $('#pg').val(pg);
      $('#category_type').val($(this).text());
            
      $('#qnAPagingDiv').empty();
      itemViewMid2List();

   });
   //QnA 나타냄,숨김
   $('body').on('click','.write_A > *:not(:has(#QnADeleteBtn))',function(){
      if($(this).parent().next().prop('class') == 'item_askComments_view'){ //줄이기
         $(this).parent().next().prop('class','item_askComments').hide();
         $(this).parent().css('background-color','');
         $(this).parent().next().css('background','');
         $(this).parent().css('border-bottom','1px solid #d4d4d4');
         $(this).parent().children().eq(6).hide();//답변
      }else{
         //alert("늘리기");
         $(this).parent().next().prop('class','item_askComments_view').show(); //늘리기
         $(this).parent().css('background-color','#EAEAEA');
         $(this).parent().css('border-bottom','hidden');
         $(this).parent().next().css('background-color','#EAEAEA'); //답변 배경
         $(this).parent().children().eq(6).show();//답변         
      }

   });

   //QnA쓰기 등록
   $('#upBtn').click(function(){
      //alert('id='+$('#userId').text()+'&item_seq=${param.seq}'+'&category='+$('#userCategory').val()+'&comments='+$('#userComments').val());
      $.ajax({
         type : 'POST',
         url : '/finalProject/itemView/uploadQnAWrite.do',
         data : 'id='+$('#userId').text()+'&item_seq=${param.seq}'+'&category='+$('#userCategory').val()+'&comments='+$('#userComments').val(),
         dataType : 'text',
         success : function(data){   
            //$('.insertFrame').show();
            $('#dialog > div').text('내용이 등록되었습니다.');
             $('#dialog_frame').show();
             apply = "itemQnA";
            
            /* $('.insertClose').click(function(){
               $('.insertFrame').hide();
               $('#userComments').val('');
               $('.itemViewQnA').hide();
            }); */
            
            $('#pg').val('1'); //refresh
            category_type="";
            $('.qnAList > li').prop('class','');
            $('.qnAList > li:eq(0)').prop('class','active');
            itemViewMid2List();
         }
      });

   });
      
   //취소버튼
   $('#cancelBtn').click(function(){
      $('.container').hide();
   });
   
   var deleteSerial = "";
   var deleteSeq = "";
   var whichDelete = "";
   
   //리뷰 삭제버튼
   $('body').on('click','#reviewDeleteBtn',function(){
      deleteSerial = $(this).parent().prev().children(0).val();
      whichDelete = "review";
      $('#myConfirmDialog_frame').show();
   });
   
   //다이얼로그 이벤트
   $('#myConfirmDialog_closeBtn, #myConfirmDialog_cancelBtn').click(function(){
      $('#myConfirmDialog_frame').hide();
   });
   $('#myConfirmDialog_okBtn').click(function() {
	  if(whichDelete=='review') {
	      $.ajax({
	         type : "POST",
	         url : "/finalProject/itemView/itemReviewDelete.do",
	         data : {'seq' : '${param.seq}'
	               ,'serial' : deleteSerial },
	         dataType : "json",
	         success : function(data){
	            $('#myConfirmDialog_frame').hide();
	            $('#dialog > div').text('성공적으로 삭제되었습니다.');
	            $('#dialog_frame').show();
	            apply="itemReview";
	         }
	      });
	  }else if(whichDelete=='qna') {
		  $.ajax({
			  type : "POST",
		      url : "/finalProject/itemView/itemAskDelete.do",
		      data : {'seq' : deleteSeq},
		      dataType : 'text',
		      success : function(data) {
		    	  $('#myConfirmDialog_frame').hide();
		          $('#dialog > div').text('성공적으로 삭제되었습니다.');
		          $('#dialog_frame').show();
		          itemViewMid2List();
		      }
		  });
	  }
   }); 
   
   //QnA 삭제
   $(document).on('click','#QnADeleteBtn', function(){
	   whichDelete = "qna";
	   deleteSeq = $(this).next().val();
	   $('#myConfirmDialog_frame').show();
   });

});



</script>
</body>
</html>