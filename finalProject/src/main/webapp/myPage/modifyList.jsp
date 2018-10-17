<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="../css/paging.css">
<style type="text/css">
.modifyList_header {overflow:hidden; height: auto; padding-bottom:10px; border-bottom: 4px solid black;}
.modifyList h3 {float: left; margin: 0px;}
.modifyList_tab {
   float: right;
   overflow: hidden;
   height: auto;
}
.modifyList_tab ul {margin: 0px;}
.modifyList_tab ul li{
   list-style: none;
   display: list-item;
   float: left;
   padding: 2px 20px;
   font-size: 13px;
   vertical-align: bottom;
   color: #5d5d5d;
   cursor: pointer;
}
.modifyList_tab ul li:nth-child(1)~li {border-left: 1px solid #d4d4d4;}
.modifyList_tab ul li.active {
   color: black;
   font-weight: 700;
}

.itemControll {overflow: visible; width: 100%; min-width:800px; height: auto;}
.itemControll > ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%; min-width: 400px;}
.itemControll > ul > li {display: table-cell; float: left; width: 100%; padding : 10px 0px 10px 2%;}
.itemControll > ul > li:first-child {border-bottom: 2px solid black;}
.itemControll > ul > li > div {width: 100%; overflow: visible; height: auto;}
.itemControll > ul > li > div > div {float: left; text-align: center;}
.itemControll > ul > li > div > div:nth-child(1) {width: 9%;} /* cs처리구분 */
.itemControll > ul > li > div > div:nth-child(2) {width: 20%;} /* 주문번호 */
.itemControll > ul > li > div > div:nth-child(3) {width: 31%;} /* 접수제목 */
.itemControll > ul > li > div > div:nth-child(4) {width: 15%;} /* 접수일자 */
.itemControll > ul > li > div > div:nth-child(5) {width: 15%;} /* 진행상태 */
.itemControll > ul > li > div > div:nth-child(6) {width: 10%;} /* 완료일자 */
.itemControll > ul > li:nth-child(1) {border-bottom: 1px solid black;}
.itemControll > ul > li:nth-child(1)~li {border-bottom: 1px solid #d4d4d4;}

.modifyList_class{
   cursor : pointer;
}

.modifyListContent{
   background-color : #EAEAEA;
   text-align: center;
   display: none;
   padding-right: 10%;
}
</style>

<section class="modifyList">
   <input type="hidden" name="pg" id="pg" value="1">
   <div class="modifyList_header">
      <h3>취소/교환/반품 내역</h3>
      <div class="modifyList_tab">
         <ul>
            <li class="active">ALL</li>
            <li class="modifyList_orderType">주문취소</li>
            <li class="modifyList_orderType">상품교환</li>
            <li class="modifyList_orderType">반품접수</li>
         </ul>
      </div>
   </div>
</section>
<section class="itemControll">
   <ul>
      <li>
         <div class="item_title">
            <div>CS처리구분</div>
            <div>주문번호</div>
            <div>접수제목</div>
            <div>접수일자</div>
            <div>진행상태</div>
            <div>완료일자</div>
         </div>
      </li>
   </ul>
   <div class="modifyList_container">
      <div align=center id="modifyListPagingDiv" style="padding-top: 20px;"></div>
   </div>
</section>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
   
   $('.my_shop > ul:eq(0) > li:eq(1) > a').css('font-weight', '800');
   
   modifyList_All(1); 
   
   $('.modifyList_tab li').click(function(){
      $('.modifyList_tab li').removeClass('active');
      $(this).addClass('active');
   });
   
   $('.active').click(function(){ //ALL 다시 띄우기 
      modifyList_All(1);
   });
   
   function modifyList_All(pg){
      //All
      $.ajax({
         type:'POST',
         url : '/finalProject/myPage/viewModifyList.do',
         data : 'pg='+pg,
         dataType : 'json',
         success : function(data){
            //alert(JSON.stringify(data));
            $('li:has(.modifyList_class)').remove();
            
            $.each(data.list, function(index, item){
               $('<li/>').append($('<div/>',{
                  class : 'modifyList_class',
                  id : 'modifyListID',
               }).append($('<div/>',{
                  id : 'modifyListType',
                  text : item.type
               })).append($('<div/>',{
                  text : item.serial
               })).append($('<div/>',{               
                  text : item.title
               })).append($('<div/>',{
                  text : item.startDate
               })).append($('<div/>',{
                  text : item.status
               })).append($('<div/>',{
                  text : item.endDate==null? '-' : item.endDate
               }))).append($('<div/>',{
                  class: 'modifyListContent',
                  text : item.content
               })).appendTo($('.itemControll ul'));
            });
            $('#modifyListPagingDiv').html(data.refundRequestPaging.pagingHTML);
         }//success
      });
   }
   
   
   
   $('body').on('click','#modifyListID',function(){
	  if($(this).next().css('display')=='none') {
	      $(this).parent().css('background-color','#EAEAEA');    	 
	      $(this).next().show();
      }else {
    	  $(this).parent().css('background-color','white'); 
    	  $(this).next().hide();
      }
   });
   
   //페이지클릭
   $('#modifyListPagingDiv').on('click','span',function(){
      var pg=$(this).prop('class');
      var type = $('.active').text();
      
      if(type=='ALL') {         
         modifyList_All(pg);
      } else {
         vieworderType(type,pg);
      }
   });
   
   $(".modifyList_orderType").click(function(){
      var type = $(this).text();
      //alert(type);
      vieworderType(type,1);
   });
   
   //type에 따라서 띄우는 함수
   function vieworderType(type, pg){
      $.ajax({
         type:'POST',
         url : '/finalProject/myPage/viewModifyList_orderType.do',
         data : 'type='+type+'&pg='+pg,
         dataType : 'json',
         success : function(data){
            //alert(JSON.stringify(data));
            $('li:has(.modifyList_class)').remove();
            
            $.each(data.list, function(index, item){
               $('<li/>').append($('<div/>',{
                  class : 'modifyList_class',
                  id : 'modifyListID',
               }).append($('<div/>',{
                  text : item.type
               })).append($('<div/>',{
                  text : item.serial
               })).append($('<div/>',{               
                  text : item.title
               })).append($('<div/>',{
                  text : item.startDate
               })).append($('<div/>',{
                  text : item.status
               })).append($('<div/>',{
                  text : item.endDate==null? '-' : item.endDate
               }))).append($('<div/>',{
                  class: 'modifyListContent',
                  text : item.content
               })).appendTo($('.itemControll ul'));
            });
            $('#modifyListPagingDiv').html(data.refundRequestPaging.pagingHTML);
         }//success
      });
}

});
</script>