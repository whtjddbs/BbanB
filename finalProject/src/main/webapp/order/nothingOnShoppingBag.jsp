<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.continueBtn{background-color: white; border: 1px solid #d4d4dr; color: black; padding: 30px 45px; text-align: center; text-decoration: none; display: inline-block;font-weight: 700; font-size: 15px; margin: 30px 2px; cursor: pointer;}
#nothing{
	width: 70%;
    padding: 100px 0;
    margin-top: 40px;
    border-top: 4px solid #000;
    border-bottom: 1px solid #000;
    text-align: center;
    color: #000;
    font-weight: 500;
    font-size: 2em;
}

</style>
<section class="shoppingBag">
	<div align="center">
		<h3 style="font-size: 20px;">
			<span>01 shoppingBag</span> >
			<span>02 order</span> >
			<span>03 order confirmed</span>
		</h3>
		<div id="nothing">
			<p style="text-align: center; color: #000; font-weight: 500; font-size: 1em; ">장바구니에 담은 상품이 없습니다.</p>
			<p><button class="continueBtn" type="button">CONTINUE SHOPPING</button></p>
		</div>
	</div>
</section>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.continueBtn').on('click',function(){
		location.href='/finalProject/main/index.do';
	});
});
</script>
