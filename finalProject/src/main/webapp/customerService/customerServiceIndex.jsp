<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.mypage_left {width: 230px;height: 1028px;float: left;margin-left: 20px;}

.mypage_right {width:73%; overflow: visible; height:auto; float: left; left: 250px; min-width: 800px;}
.mypage_right > section:nth-child(2) {padding:80px 0px 0px 0px; overflow: hidden; position: relative;}

.my_shop{padding-bottom:27px}
.my_shop h4{margin-bottom:8px;font-size:18px;font-weight:800;color:#303033}
.my_shop h4 a{text-decoration: none; color:#303033;}
ul{margin-bottom:31px; list-style: none; padding-left: 0px;}
ul li{padding:9px 0 10px}
ul a{font-size:16px;color:#5d5d5d;font-weight:200;text-decoration: none;}
</style>

<!-- 메인페이지 죄측메뉴바 -->
<nav class="mypage_left">
	<jsp:include page="customerServiceNav.jsp"/>
</nav>

<!-- 메인페이지 우측바디 -->
<article class="mypage_right">
	<!-- 메인페이지 바디 -->
	<section>
		<jsp:include page="${customerServiceBody }"/>
	</section>
</article>