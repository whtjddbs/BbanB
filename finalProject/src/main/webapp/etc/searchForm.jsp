<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="../css/itemList.css">
<link rel="stylesheet" href="../css/paging.css">
<link rel="stylesheet" href="../css/myDialog.css">
<style>
.btn_bor {
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
    padding-right: 20px;
}

#dialog a {
   outline : none;
   text-decoration : none;
}

#loginTitle{
   font-size : 24px;
}

#arrowIcon{
   font-size: 15px;
    position: absolute;
    padding-top: 12px;
    padding-left: 8px;
}

.large_tab {margin-bottom: 30px;}
   .large_tab > ul:after{display:table;clear:both;content:""}
   .large_tab > ul > li > a{display:inline-block;position:relative;text-transform:uppercase}
   
@media screen and (min-width:541px){
   .large_tab{display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center}
   .large_tab > ul > li{float:left;padding:0 18px}
   .large_tab > ul > li > a{font-size:18px;line-height:42px;color:#5d5d5d;font-weight:200}
   .large_tab > ul > li > a.active{font-size:24px;line-height:40px;color:#000;font-weight:700}
   .large_tab > ul > li > a.active:before{position:absolute;top:60%;left:18px;z-index:-1;background:#ff4800;width:96%;height:25px;background:url(https://img.29cm.co.kr/next29cm/navibar.png) 50% 100% no-repeat;background-size:auto 25px;content:""}
   .large_tab > ul > li + li:before{display:inline-block;width:1px;height:40px;margin:0 31px 0 0;background:#d4d4d4;vertical-align:top;content:""}
}

@media screen and (max-width:540px){
   .large_tab{-ms-flex-wrap:nowrap;flex-wrap:nowrap;-webkit-box-pack:center;-ms-flex-pack:center;justify-content:center;overflow:auto;-webkit-overflow-scrolling:touch;-webkit-appearance:none;-webkit-backface-visibility:hidden;-webkit-transform:translateZ(0);-webkit-perspective:0}
   .large_tab, .large_tab ul{display:-webkit-box;display:-ms-flexbox;display:flex}
   .large_tab > ul{width:100%}
   .large_tab > ul > li{-webkit-box-flex:1;-ms-flex:1;flex:1;text-align:center}
   .large_tab > ul > li > a{display:block;margin:0 8px;padding:19px 12px;font-size:15px;line-height:20px;color:#d4d4d4;font-weight:600}
   .large_tab > ul > li > a.active{color:#000;font-weight:600}
}
</style>
</head>
<input type="hidden" id="jsyjsyjsy" value="jsy">
<input type="hidden" name="pg" id="pg" value="1">
<div class="searchForm_shop_wrap">
   <div class="searchForm_searchfield">
      <div class="searchForm_search_wrap" style="max-width:700px; margin: 0 auto; padding: 80px;">
         
            <div class="searchForm_searchinput" style="position:relative; border-bottom: 6px solid #000; height: 50px;">
               
               <div class="searchForm_suggestbx">
                  <input class="searchForm_search-input" id="searchForm_Id" placeholder="Search" type="text" value='${param.header_search_text }' style="display: block; width: 90%; height: 100%; font-size: 30px;border: 0; background: #fff; color: 333; outline: none; float: left;">
               
                   <a href="javascript:void(0)" style="font-size: 30px; text-decoration: none; color: #000000;"><button class="searchBtn glyphicon glyphicon-search" aria-hidden="true" style="outline: none; border: 0; background: #fff; width: 25px; height: 25px;"></button></a>
                  <a href="javascript:void(0)" style="font-size: 30px; text-decoration: none; color: #000000;"><button type="button" class="clearBtn fa fa-close" aria-hidden="true" style="outline: none; border: 0; background: #fff; width: 25px; height: 25px; display:none;"></button></a>
               <!--<button type="button" class="searchForm_close" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>  -->
               <!-- <button class="searhForm_btn_search" style="float: right; border: 0; cursor: pointer; margin: 0;"></button>
               <button class="searchForm_btn_clear" style="float: right; border: 0; cursor: pointer; margin: 0;"><i class="fa fa-times"></i></button> -->
               </div><!--searchForm_suggestbx  -->
               
            </div><!--searchForm_searchinput  -->
         
         <div class="searchForm_search_lst" style="height: 36px; padding-top: 18px;">
               <div class="searchForm_related" style="font-size: 14px;">
                  <dl>
                     <dt style="float:left; width: 90px; font-weight: 700;">인기검색어</dt>
                     <dd style="height: 36px;">
                        <span style="display:inline-block; margin-right: 15px;"><a href="/finalProject/new/itemDisplay.do?main_codename=bras&sub_codename=pushup&pg=1" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">Push-up</a></span>
                        <span style="display:inline-block; margin-right: 15px;"><a href="/finalProject/new/itemDisplay.do?main_codename=mens&sub_codename=jockstraps&pg=1" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">jockstraps</a></span>
                        <span style="display:inline-block; margin-right: 15px;"><a href="/finalProject/new/itemDisplay.do?main_codename=sport&sub_codename=leggings&pg=1" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">Leggings</a></span>
                        <span style="display:inline-block; margin-right: 15px;"><a href="/finalProject/new/itemDisplay.do?main_codename=sport&sub_codename=top&pg=1" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">Sport Bra</a></span>
                        <span style="display:inline-block; margin-right: 15px;"><a href="/finalProject/new/itemDisplay.do?main_codename=bras&sub_codename=demi&pg=1" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">Demi Bra</a></span>
                        <span style="display:inline-block; margin-right: 15px;"><a href="/finalProject/new/itemDisplay.do?main_codename=mens&sub_codename=trunk&pg=1" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">Trunk</a></span>
                     </dd>
                  </dl>
               </div>
            </div>
         
      </div><!-- searchForm_search_wrap -->
   </div><!-- searchForm_Searchfield -->
   
   <!-- <div class="searchForm_filter">
      <div class="searchForm_filter_title" style="float:left; width: 33%;">
         <span>PRICE</span>
      </div>
      <div class="searchForm_filter_range" style="float:left; width: 33%;">
         
      </div>
      <div class="searchForm_filter_btn" style="float:left; width: 33%;">
         <button type="text">적용</button>
      </div>
   </div>searchForm_filter -->
   <div class="large_tab" style="display:none;">
      <ul>
         <li>
            <a href="#" class="active">PRODUCT (<span id="searchTotalA"></span>)</a>
         </li>
      </ul>
   </div>
   <div class="searchForm_viewItem" style="margin-left: 13%; margin-top: 2%; width: 80%; overflow: hidden; height: auto;">
   </div>
   <div id="searchFormPagingDiv" style="padding: 30px; margin-left: 50%;"></div>
</div><!-- searchForm_shop_wrap -->

<!-- 기본 다이얼로그 -->
<div id="dialog_frame">
   <div id="dialog">
      <i class="material-icons" id="dialog_closeBtn">clear</i>
      <div id="loginTitle">로그인하세요</div>
      <a class="btn_bor" id="loginGoBtn">로그인하러 가기
      <!-- <i class="far fa-angle-right" style="font-size:24px;"></i></a> -->
      <i class="material-icons" id="arrowIcon">arrow_forward_ios</i></a>
   </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
   $('.clearBtn').click(function(){
      $('#searchForm_Id').val('');
   });    
    
   $('.searchForm_suggestbx:eq(0)').click(function(){
   $('.searchForm_suggestbx:eq(1)').toggle();      
   });
   
   $('.searchForm_search-input').click(function(){
      $('.clearBtn').show();
      $('.searchBtn').hide();
   });
   
   $('.clearBtn').click(function(){
      $('.searchBtn').show();
      $('.clearBtn').hide();
   });
   
    if($('#searchForm_Id').val()!='') search(1); 
   
   //ajax - item띄우기
   $("#searchForm_Id").keydown(function(e){
      if(e.keyCode==13){
         search(1);
      }
   });
   
   function search(pg) {
      $.ajax({
         type : 'POST',
         url: '/finalProject/etc/search.do',
         data : 'name='+$('#searchForm_Id').val()+'&pg='+pg,
         dataType: 'json',
         success : function(data){
            //alert(JSON.stringify(data));
            $('.searchForm_viewItem *').remove();
            $.each(data.list, function(index, item){
               $('.searchForm_viewItem').append($('<div/>',{
                  class : 'itemAll',
                  //style : 'margin-top: 2%; margin-left: 4%; width: 20%; height: 50%; float: left;'
               }).append($('<div/>',{
                  class : 'itemInfo',
                  //style : 'width: 100%; height: 90%;'
               }).append($('<a/>',{
                  class : 'itemA',
                  href : '/finalProject/itemView/itemViewTop.do?seq='+item.SEQ,
                  //style : 'color: black; text-decoration: none; font-size: 12pt; font-wdith: 800; '
               }).append($('<div/>',{
                  class : 'itemImg',
                  //style : 'width: 100%; height: 75%;'
               }).append($('<img/>',{
                  src : '../image/'+item.MAIN_CODENAME+"/"+item.IMG,
                  //style : 'height: 100%; width: 100%; object-fit: one_pdtForm;'
               }))).append($('<div/>',{
                  class : 'itemText1',
                  text : item.SUB_CODENAME,
                  //style : 'font-weight: 700; color: black; margin-top: 4%; text-decoration: underline;'
               })).append($('<div/>',{
                  class : 'itemText2',
                  text : item.NAME,
                  //style : 'color : #5d5d5d; font-size: 9pt; margin-top: 3%; text-decoration: none;'
               })).append($('<div/>',{
                  class : 'itemText3',
                  text : item.PRICE,
                  //style : 'font-weight: 900; font-size: 10pt; color: black; text-decoration: none; margin-top: 2%;'
               }))).append($('<a/>',{
                  id : 'wish'+item.SEQ
               }).append($('<input/>',{
                  type: 'hidden',
                  id : 'wish'+item.SEQ,
                  value : item.SEQ
               })).append($('<i/>',{
                  style: 'color: red; font-size: 16px; cursor: pointer; padding-right: 10px;',
                  id : 'myHeart',
                  class : 'material-icons',
                  text : 'favorite_border'
               }))).append($('<span/>',{
                  style : 'padding-right: 30px;',
                  text : item.COUNT
               })).append($('<a/>').append($('<i/>',{
                  style: 'font-size: 16px; cursor: pointer; padding-right: 10px;',
                  class : 'material-icons',
                  text : 'chat_bubble_outline'
               }))).append($('<span/>',{
                  text : item.REVIEWCOUNT
               }))));
            });
            $('#searchFormPagingDiv').html(data.searchFormPaging.pagingHTML);
            
            $('.large_tab').show();
            $('#searchTotalA').text(data.searchTotalA);
            //위시 리스트 로딩
            if('${memberDTO}'!='') {
               $.ajax({
                  type : 'POST',
                  url : '/finalProject/member/getWishList.do',
                  dataType : 'json',
                  success : function(data){
                     //alert(JSON.stringify(data));
                     $.each(data.wishList, function(index, seq){
                        $('a#wish'+seq+' > i').text('favorite');
                     });
                  }
               });
            }
         }//success
      });
   }
   //페이지클릭
   $('#searchFormPagingDiv').on('click','span',function(){
      location.href="#";
      var pg=$(this).prop('class');
       search(pg); 
   });
    
    /* 로그인하러 가기 버튼 눌렀을 때 */
   $('#loginGoBtn').click(function(){
      location.href="/finalProject/member/loginForm.do"
   });
   
   $('#dialog_closeBtn').click(function(){
      $('#dialog_frame').hide();
   });
   
   //위시 리스트 추가
   $(document).on('click','#myHeart',function(){
      if('${memberDTO}'=='') $('#dialog_frame').show();
      else if($(this).text()=='favorite_border') {
         var thisisme = $(this).parent().next();
         $(this).text('favorite');
         $.ajax({
            type : 'POST',
            url : '/finalProject/member/addWishList.do',
            data : {'seq' : $(this).prev().val(),
                  'id' : '${memberDTO.id}'},
            dataType : 'json',
            success : function(data) {
               thisisme.text(parseInt(thisisme.text())+1);
            }
         });
      }else if($(this).text()=='favorite') {
         var thisisme = $(this).parent().next();
         $(this).text('favorite_border');
         $.ajax({
            type : 'POST',
            url : '/finalProject/member/deleteWishList.do',
            data : {'seq' : $(this).prev().val(),
                  'id' : '${memberDTO.id}'},
            dataType : 'json',
            success : function(data) {
               thisisme.text(parseInt(thisisme.text())-1);
            }
         });
      }
   });

 });
</script>

</html>