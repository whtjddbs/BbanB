<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="../css/paging.css">
<style type="text/css">
h3.title {padding: 10px 0px; border-bottom: 4px solid black; margin-bottom: 0px; font-size: 24px; font-weight: 700;}

.memberManagementControll {overflow: hidden; width: 100%; height: auto;}
.memberManagementControll ul {display: table; list-style: none; padding: 0px; margin: 0px; width: 100%;}
.memberManagementControll ul li {display: table-cell; float: left; width: 100%; padding : 15px 0px 15px 2%;}
.memberManagementControll ul li:first-child {border-bottom: 2px solid black; width: 100%} 
.memberManagementControll ul li > div {width: 100%; overflow: visible; height: auto; text-align: center;}
.memberManagementControll ul li > div > div {float: left; text-align: center;}
.memberManagementControll ul li > div > div:nth-child(1) {width: 10%;} /* 등급 */ 
.memberManagementControll ul li > div > div:nth-child(2) {width: 10%;} /* 아이디 */
.memberManagementControll ul li > div > div:nth-child(3) {width: 10%;} /* 이름 */
.memberManagementControll ul li > div > div:nth-child(4) {width: 30%;} /* 주소 */
.memberManagementControll ul li > div > div:nth-child(5) {width: 15%;} /* 이메일 */
.memberManagementControll ul li > div > div:nth-child(6) {width: 10%;} /* 연락처 */
.memberManagementControll ul li > div > div:nth-child(7) {width: 10%;} /* 가입일 */
.memberManagementControll ul li:nth-child(1) {border-bottom: 2px solid black;}
.memberManagementControll ul li:nth-child(1)~li {border-bottom: 1px solid #d4d4d4; cursor: pointer;}

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

.memberMenager_title > div {border-right: 1px solid #d4d4d4; text-align: center; font-weight: 700; width: 10%}
.memberMenager_title > div:last-child {float: left; border-right: 0px solid #d4d4d4;}

.delivery_user {cursor: pointer;}
.delivery_user > div {width:15%;}
.delivery_user > div:last-child {cursor: default;}

#member_detail {overflow: hidden; height: auto; width: 90%; border: 1px solid #d4d4d4; margin: 10px 0px 10px 5%; display: none;}
#member_detail .stepbox {border-top: 3px solid black; border-bottom: 1px solid black; padding: 5px 0px;}
#member_detail .stepbox span {font-family: "Do Hyeon"; font-weight: 700;} 

.users {width: 100%; float: left;height: 300px;overflow: scroll;}
.users .user {width: 100%; display: inline-block; *display: inline; padding: 10px 0px;}
.users .user .user_info {display: block;float: left; vertical-align: middle;}
.users .user .user_info .user_name {font-family: "Do Hyeon"; font-size: 24px; font-weight: 900; padding: 10px 0px; word-wrap: break-word;font-size: 18px;line-height: 24px;font-weight:500; word-wrap: break-word;}
.users .user .user_info .user_size {font-size: 12px; padding-bottom: 10px;}
.itmes .user .user_info .user_count {padding: 10px 0px;}
.users .user .user_image {height: auto; width: 140px;}
.users .user img { float: left; width: 160px; vertical-align: middle; padding: 0px 30px; }

.member_comments{
	text-overflow: ellipsis;
	overflow : hidden;
	white-space: nowrap;
}

.member_comments_view {
    height: auto;
    white-space: normal;
    text-overflow: clip;
}
</style>
</head>
<body>
	<div class="memberManagementControll">
		<h3 class="title">회원 관리</h3>
		<ul>
			<li>
				<div class="memberMenager_title">
					<div>등급</div>
					<div>아이디</div>
					<div>이름</div>			
					<div>주소</div>
					<div>이메일</div>
					<div>연락처</div>
					<div>가입일</div>				
				</div>
			</li>
			<c:if test="${list != null }">
				<c:forEach var="item" items="${list}">
						<li>
							<div class="userInfo_list">
								<div>
									<!-- 0: green 1: yellow 2: orange 3: red 4: vip -->
									<c:choose>
										<c:when test="${item.lev== 0}">green</c:when>
										<c:when test="${item.lev== 1}">yellow</c:when>
										<c:when test="${item.lev== 2}">orange</c:when>
										<c:when test="${item.lev== 3}">red</c:when>
										<c:otherwise>vip</c:otherwise>
									</c:choose>
								</div>
								<div>${item.id}</div>
								<div>${item.name}</div>
								<div class="member_comments">${item.addr1} ${item.addr2}</div>
								<div>${item.email }</div>
								<div>${item.tel1} - ${item.tel2} - ${item.tel3}</div>
								<div>
								<fmt:formatDate value="${item.logtime }" pattern="yyyy-MM-dd"/>
								</div>
							</div>
						</li>
				</c:forEach>
				
			</c:if>
		</ul>
	<div id="paging" class="paging">${paging.pagingHTML }</div>
	</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.adminMenu > ul > li:eq(0) > a').css('color','black').css('font-weight','800');
	
	$(document).on('click','.paging > span',function(){
		var pg = $(this).prop('class');
		location.href='/finalProject/admin/memberManagement.do?pg='+pg;
	});
	
	$('li:has(.userInfo_list)').click(function(){
		if($(this).children(0).children().eq(3).prop('class')=='member_comments') {
			$(this).children(0).children(3).prop('class','member_comments_view');
			$(this).css('background-color','#EAEAEA');
		}else {
			$(this).children(0).children(3).prop('class','member_comments');
			$(this).css('background-color','white');
		}
	});
});
</script>
</html>