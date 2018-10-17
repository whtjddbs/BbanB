<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
.orderList .orderList_table1{
	padding-left: 4%;
	padding-right: 4%;
}
.orderList .orderList_table2{
	padding-top : 6%;
	padding-left: 4%;
	padding-right: 4%; 
}
.orderList .orderList_table1 tbody tr:nth-child(2) td{
	font-size: 13px;
}
.orderList .orderList_table1 tbody tr:nth-child(2)~tr:not(:last-child) td{
	padding: 25px 0px 25px 0px;
}
.orderList .orderList_table2 tbody tr td{
	padding: 6px 0px 6px 0px;
}
span{
	font-size: 12px;
}
#closeBtn{
	width: 115px;
	height: 35px;
	background: white;
	border-color:white;
	color: black;
	font-weight:900;
	border: 0px;
	border-bottom: 1px solid black;
	text-align: left;
}
#printBtn{
	width: 115px;
	height: 35px;
	background: white;
	border-color:white;
	color: black;
	font-weight:900;
	border: 0px;
	border-bottom: 1px solid black;
	text-align: left;
}
</style>

<div class="orderList" id="orderList" style="width:90%; height: auto; border:1px solid #d4d4d4; margin-left: 5%">
	<table class="orderList_table1" style="width:100%;">
		<thead>
			<tr>
				<td colspan="7" width="80%" align="left" style="border-bottom: 1px solid black; padding-top: 30px">주문확인서</td>				
			</tr>
			<tr>
				<td colspan="7" style="font-size: 8px;">
					안녕하세요. 고객님<br>
					소중한 인연을 맺게 해주신 고객님꼐 감사드립니다.<br>
					고객님께 늘 정성을 다하는 빤브가 되도록 최선을 다하겠습니다.
				</td>
			</tr>		
		</thead>
		<tbody>
			<tr>
				<td colspan="7" style="padding-top: 30px; border-bottom: 1px solid black;">	
					<span>주문리스트</span>&emsp;<span>[주문상품정보: ${param.serial }]</span>
				</td>
			</tr>
			<tr>
				<td width="6%" align="center">상품</td>
				<td width="15%" align="center">상품코드</td>
				<td width="27%" align="left">상품명옵션</td>
				<td width="12%" align="center">마일리지</td>
				<td width="15%" align="center">판매가</td>
				<td width="6%" align="center">수량</td>
				<td width="12%" align="center">주문금액</td>				
			</tr>
	<c:if test="${not empty list }">
		<c:set var="sum" value="0"/> 
		<c:set var="pointSum" value="0"/>
		<c:set var="discountSum" value="0"/>
		<c:set var="countSum" value="0"/>
		<c:forEach var="data" items="${list }">
			<fmt:parseNumber var="sum" integerOnly="true" value="${data.PRICE * data.COUNT }"/>						
			<fmt:parseNumber var="totalSum" integerOnly="true" value="${totalSum+finalSum }"/>
			<fmt:parseNumber var="pricePoint" integerOnly="true" value="${data.PRICE * 0.01 }"/>
			<fmt:parseNumber var="discountPrice" integerOnly="true" value="${data.PRICE * (1-data.DISCOUNT)}"/>
			<fmt:parseNumber var="discount" integerOnly="true" value="${data.DISCOUNT*100 }"/>
			<c:set var="finalPrice" value="${discountPrice*data.COUNT }"/>
			<c:set var="point" value="${pricePoint}"/>
			<c:set var="pointSum" value="${point }"/>
			<c:set var="totalPoint" value="${totalPoint+pointSum }"/>
			<c:set var="totalDiscountSum" value="${totalDiscountSum+finalPrice }"/>
			<c:set var="totalCountSum" value="${totalCountSum+data.COUNT }"/>
			<tr>
				<td width="6%" align="center">
					<img src="../image/${data.MAIN_CODENAME }/${data.IMG }" width="60px" height="60px"/>
				</td>
				<td width="10%" align="center">
					<span>${data.SEQ }</span>
				</td>
				<td width="27%" align="left">
					<span>${data.NAME }</span><br>
					<span>${data.COLOR }</span>
					<span>[Size]${data.SIZE1 }</span>
				</td>
				<td width="10%" align="center"> 
					<span><c:out value="${point }" />pt</span>
				</td>
				<td width="23%" align="center">
					<span>${data.PRICE }원</span><br><span>[${discount }%]</span><span>${discountPrice}원</span>
				</td>
				<td width="6%" align="center">
					<span>${data.COUNT }</span>
				</td>
				<td width="10%" align="center">
					<span><c:out value="${finalPrice }"/>원</span>
				</td>
			</tr>
		</c:forEach>
	</c:if>
			<tr>
				<td colspan="7" style="border-bottom: 1px solid black;">
				&nbsp;<span>주문상품수 ${totalCountSum }개</span>&nbsp;<span>적립마일리지 <c:out value="${totalPoint }"></c:out> Pt</span>&emsp;<span>상품 총 금액 <c:out value="${totalDiscountSum }"/>원</span>&nbsp;<span>+총 배송비 0원 </span>&emsp;<span>합계금액 <c:out value="${totalDiscountSum}"/>원</span>
				</td> 
			</tr>
		</tbody>
	</table>
	<table class="orderList_table2" style="width: 100%;">
		<c:if test="${not empty list }">
			<c:forEach var="data" items="${list }" varStatus="status">
				<c:if test="${status.index==0 }">				
				<tr>
					<td colspan="4" style="border-bottom: 1px solid black; font-size: 14px; font-weight: bold">구매자정보</td>			
				</tr>
				<tr>
					<td width="25%" align="left" style="margin-left: 13px;">
						<span>주문하신 분</span>
					</td>
					<td width="25%" align="left">
						<span>${memberDTO.name }</span>
					</td>
					<td width="25%" align="left">
						<span>이메일주소</span>
					</td>
					<td width="25%" align="left">
						<span>${memberDTO.email }</span>
					</td>
				</tr>
				<tr>
					<td width="25%" align="left">
						<span>전화번호</span>
					</td>
					<td width="25%" align="left">
						<span>${memberDTO.tel1 }-${memberDTO.tel2 }-${memberDTO.tel3 }</span>
					</td>
					<td width="25%" align="left">
						<span>휴대폰번호</span> 
					</td>
					<td width="25%" align="left">
						<span>${memberDTO.tel1 }-${memberDTO.tel2 }-${memberDTO.tel3 }</span>
					</td>			
				</tr>
				<tr>
					<td colspan="4" style="padding-top : 30px; border-top: 1px solid black; border-bottom: 1px solid black; font-size: 14px; font-weight: bold">
						결제정보
					</td>			
				</tr>	
				<tr>
					<td width="25%" align="left" style="margin-left: 13px;">
						<span>결제방법</span>
					</td>
					<td width="25%" align="left">
						<span>신용/체크카드</span>
					</td>
					<td width="25%" align="left">
						<span>주문 일시</span>
					</td>
					<td width="25%" align="left">
						<span>${data.LOGTIME }</span>
					</td>
				</tr>
				<tr>
					<td  width="25%" align="left">
						<span>마일리지 사용금액</span>
					</td>
					<td colspan="3" width="25%" align="left">
						<span>0 pt</span>
					</td>			
				</tr>	
				<tr>
					<td width="25%" align="left" style="margin-left: 13px;">
						<span>총 결제 금액</span>
					</td>
					<td width="25%" align="left">
						<span><c:out value="${totalDiscountSum}"/>원</span>
					</td>
					<td width="25%" align="left">
						<span>입금 예정자명</span>
					</td>
					<td width="25%" align="left">
						<span>${data.BUYNAME }</span>
					</td>
				</tr>
				<tr>
					<td width="25%" align="left">
						<span>입금은행 정보</span>
					</td>
					<td width="25%" align="left">
						<span></span>
					</td>
					<td width="25%" align="left">
						<span></span> 
					</td>
					<td width="25%" align="left">
						<span></span>
					</td>			
				</tr>
				<tr>
					<td colspan="4" style="padding-top : 30px; border-top: 1px solid black; border-bottom: 1px solid black; font-size: 14px; font-weight: bold">
						배송지정보
					</td>			
				</tr>	
				<tr>
					<td width="25%" align="left" style="margin-left: 13px;">
						<span>받으시는 분</span>
					</td>
					<td colspan="3" width="25%" align="left">
						<span>${data.BUYNAME }</span>
					</td>			
				</tr>
				<tr>
					<td width="25%" align="left">
						<span>전화번호</span>
					</td>
					<td width="25%" align="left">
						<span>${data.TEL1 }-${data.TEL2 }-${data.TEL3 }</span>
					</td>
					<td width="25%" align="left">
						<span>휴대폰번호</span> 
					</td>
					<td width="25%" align="left">
						<span>${data.TEL1 }-${data.TEL2 }-${data.TEL3 }</span>
					</td>			
				</tr>	
				<tr>
					<td width="25%" align="left" style="margin-left: 13px;">
						<span>주소</span>
					</td>
					<td colspan="3" width="25%" align="left">
						<span>(${data.ZIPCODE })${data.ADDR1 }${data.ADDR2 }</span>
					</td>			
				</tr>
				<tr>
					<td width="25%" align="left">
						<span>배송요청사항</span>
					</td>
					<td colspan="3" width="25%" align="left">
						<span></span>
					</td>
				</tr>
				</c:if>
			</c:forEach>
		</c:if>
				<tr> 
					<td colspan="4" style="padding-top : 20px; border-top: 1px solid black;">
						<img src="../image/main/subLogo.jpg" style="width:60; height: 30;">
					</td>
				</tr>
				<tr>
					<td colspan="4" style="padding-top: 20px; font-size: 10px; font-weight: bold;">	
						상호명:(주)빤브 &nbsp; 사업장소재지:서울특별시 종로구 돈화문로 26 단성사 &nbsp;팩스:000-0000-0000 &nbsp;사업자등록번호:111-11-111111 &nbsp;고객센터:1234-1234 &nbsp;이메일 BbanB@project.com &nbsp;대표이사:조성윤 &nbsp;개인정보책임자:조성윤 &nbsp;호스팅서비스:(주)6남2녀
					</td>
				</tr>
				<tr>
					<td colspan="2" style="padding-top: 30px;">
						<input type="button" id="closeBtn" value="창닫기" onclick="javascript()"/>
					</td>
					<td colspan="2" style="padding-top: 30px;">
						<input type="button" id="printBtn" value="프린트" onclick="javascript:printIt(document.getElementById('orderList').innerHTML)"/>
					</td>
				</tr>
			
	</table>
		
</div>

<script type="text/javascript">
function printIt(printThis){
	var win = null;
	win = window.open();
	self.focus();
	win.document.open();
	win.document.write(printThis);
	win.document.close();
	win.print();
	win.close();
}

function javascript(){
	self.close();
}
</script>