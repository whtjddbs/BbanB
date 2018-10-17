<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/itemView.css">
</head>
<body> 

<div class="detail_info_area">
    <div class="accodionbx">    
       <div class="productInfo" style=" width: 100%;">상품정보</div>
       		<div class="code">
           		<p id="productCode">상품코드 : ${param.seq }</p><br>
           		<p>배송정보 : <br>
           			OPEN EVENT!! 2018년 12월 31일까지 무료배송
           		</p>
       		</div>
    </div>
  
    <!---->
    
    <div class="accodionbx">
      	<div class="deliveryInfo"  style=" width: 100%;">배송정보</div>
            <br>
            <div class="code">제주,산간지역은 교환,반품시 왕복 9,000원의 추가배송비가 청구되니 구매시 신중한 선택 부탁드립니다.</div>
   </div>

	<div class="itemDetailInfo" style=" width: 100%;">상품설명</div>
	<div class="item_Detail">
	   	<!--여기에 상품설명 뿌릴거야~  -->
	</div>
	
	<div class="sizeInfo" style=" width: 100%;"> 사이즈정보</div>
	                
	
	
	<div  class="Information">
	    <div  class="code">
	        <h2 >사이즈정보</h2>
	        <p  class="code">상세 사이즈의 치수는 측정 방법과 위치에 따라 오차가 발생할 수 있습니다<br >구매 시 상세 사이즈를 확인 바랍니다.</p>
	    </div>
	    
	    <div class="tblareaTop">
	    <c:if test="${itemDTO.main_codename == 'bras' }">
	        <table class="tblarea2">	<!-- 여자브라 -->
	            <thead>
		            <tr class="infoTbl">
		                <th><div>밑가슴둘레</div></th>
		                <th><div>허용범위</div></th>
		                <th><div>컵사이즈</div></th>
		                <th><div>윗가슴둘레-밑가슴둘레</div></th>
		            </tr>
	            </thead>
	            <tbody>
	           		<tr>
		                <td><div>65</div></td>
		                <td><div>63~68cm</div></td>
						<td><div>AA컵</div></td>
		                <td><div>5cm 내외</div></td>
		            </tr>
		            <tr>
		                <td><div>70</div></td>
		                <td><div>68~73cm</div></td>
						<td><div>A컵</div></td>
		                <td><div>7.5cm 내외</div></td>
		            </tr>
		            <tr>
		                <td><div>75</div></td>
		                <td><div>73~78cm</div></td>
		                <td><div>B컵</div></td>
		                <td><div>10cm 내외</div></td>
		            </tr>
		            <tr>
		                <td><div>80</div></td>
		                <td><div>78~83cm</div></td>
						<td><div>C컵</div></td>
		                <td><div>12.5cm 내외</div></td>
		            </tr>
		            <tr>
		                <td><div>85</div></td>
		                <td><div>83~88cm</div></td>
						<td><div>D컵</div></td>
		                <td><div>15cm 내외</div></td>	
		            </tr>
		            <tr>
		                <td><div>90</div></td>
		                <td><div>88~93cm</div></td>
						<td><div>E컵</div></td>
		                <td><div>17.5cm 내외</div></td>	              
		            </tr>
		            <tr>
		                <td><div>95</div></td>
		                <td><div>93~98cm</div></td>
						<td><div>E+컵</div></td>
		                <td><div>20cm 내외</div></td>	              
		            </tr>		            
	            </tbody>
	        </table>
	        </c:if>
	        <c:if test="${itemDTO.main_codename ==  'panties'}">
	        <table class="tblarea2"> <!-- 여자팬티 -->
	        	<thead>
	        		<tr class="infoTbl">
	        			<th><div>팬티 사이즈</div></th>
	        			<th><div>가로</div></th>
	        			<th><div>세로</div></th>
	        			<th><div>옆길이</div></th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<tr>
						<td><div>S</div></td>
	        			<td><div>19.5cm</div></td>
	        			<td><div>21cm</div></td>
	        			<td><div>17cm</div></td>
					</tr>
					<tr>
						<td><div>M</div></td>
	        			<td><div>23cm</div></td>
	        			<td><div>22cm</div></td>
	        			<td><div>17cm</div></td>
					</tr>	        		
	        		<tr>
	        			<td><div>L</div></td>
	        			<td><div>26.5cm</div></td>
	        			<td><div>23cm</div></td>
	        			<td><div>17.5cm</div></td>
	        		</tr>
	        		<tr>
	        			<td><div>XL</div></td>
	        			<td><div>30cm</div></td>
	        			<td><div>24cm</div></td>
	        			<td><div>17.5cm</div></td>	        			
	        		</tr>	        		
	        	</tbody>
	        </table>
	        </c:if>
	        <c:if test="${itemDTO.main_codename ==  'mens' && itemDTO.sub_codename != 'tanktop'}">
	        <table class="tblarea2"> <!-- 남자팬티 -->
	        	<thead>
	        		<tr class="infoTbl">
	        			<th><div>SIZE</div></th>
	        			<th><div>엉덩이 둘레(cm)</div></th>
	        			<th><div>허리둘레(cm)</div></th>
	        			<th><div>허리 사이즈(in)</div></th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<tr>
	        			<td><div>S</div></td>
	        			<td><div>90 ~ 98</div></td>
	        			<td><div>78 ~ 88</div></td>
	        			<td><div>28 ~ 31</div></td>
	        		</tr>
	        		<tr>
	        			<td><div>M</div></td>
	        			<td><div>93 ~ 103</div></td>
	        			<td><div>89 ~ 96</div></td>
	        			<td><div>32 ~ 34</div></td>
	        		</tr>
	        		<tr>
	        			<td><div>L</div></td>
	        			<td><div>100 ~ 108</div></td>
	        			<td><div>94 ~ 104</div></td>
	        			<td><div>35 ~ 37</div></td>
	        		</tr>
	        		<tr>
	        			<td><div>XL</div></td>
	        			<td><div>105 ~ 110</div></td>
	        			<td><div>102 ~ 122</div></td>
	        			<td><div>38 ~ </div></td>
	        		</tr>
	        	</tbody>
	        </table>
	        </c:if>
	        <c:if test="${itemDTO.main_codename == 'mens' && itemDTO.sub_codename =='tanktop'}">
	        <table class="tblarea2"> <!-- 남자런닝 -->
	        	<thead>
	        		<tr class="infoTbl">
	        			<th><div>SIZE</div></th>
	        			<th><div>어깨</div></th>
	        			<th><div>가슴</div></th>
	        			<th><div>길이</div></th>
	        			<th><div>소매</div></th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<tr>
	        			<td><div>S</div></td>
	        			<td><div>44</div></td>
	        			<td><div>45</div></td>
	        			<td><div>68</div></td>
	        			<td><div>19</div></td>
	        		</tr>
	        		<tr>
	        			<td><div>M</div></td>
	        			<td><div>49</div></td>
	        			<td><div>51</div></td>
	        			<td><div>75</div></td>
	        			<td><div>21</div></td>
	        		</tr>
	        		<tr>
	        			<td><div>L</div></td>
	        			<td><div>54</div></td>
	        			<td><div>56</div></td>
	        			<td><div>80</div></td>
	        			<td><div>22</div></td>
	        		</tr>
					<tr>
						<td><div>XL</div></td>
	        			<td><div>59</div></td>
	        			<td><div>61</div></td>
	        			<td><div>83</div></td>
	        			<td><div>23</div></td>
					</tr>
	        	</tbody>
	        </table>
	        </c:if>
	        <c:if test="${itemDTO.sub_codename=='leggings'}">
	        <table class="tblarea2"> <!-- 레깅스 -->
	        	<thead>
	        		<tr class="infoTbl">
	        			<th><div>SIZE</div></th>
	        			<th><div>총장</div></th>
	        			<th><div>허리단면</div></th>
	        			<th><div>허벅지단면</div></th>
	        			<th><div>밑위</div></th>
	        			<th><div>밑단단면</div></th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<tr>
	        			<td><div>S</div></td>
	        			<td><div>83</div></td>
	        			<td><div>31</div></td>
	        			<td><div>19</div></td>
	        			<td><div>23</div></td>
	        			<td><div>10.5</div></td>
	        		</tr>
	        		<tr>
	        			<td><div>M</div></td>
	        			<td><div>85</div></td>
	        			<td><div>32.5</div></td>
	        			<td><div>20</div></td>
	        			<td><div>24</div></td>
	        			<td><div>11</div></td>	        			
	        		</tr>
	        		<tr>
	        			<td><div>L</div></td>
	        			<td><div>89</div></td>
	        			<td><div>34</div></td>
	        			<td><div>22</div></td>
	        			<td><div>24.5</div></td>
	        			<td><div>11.5</div></td>
	        		</tr>
					<tr>
						<td><div>XL</div></td>
	        			<td><div>90</div></td>
	        			<td><div>37</div></td>
	        			<td><div>24</div></td>
	        			<td><div>25</div></td>
	        			<td><div>12</div></td>
					</tr>
	        	</tbody>
	        </table>
	        </c:if>
	        <c:if test="${itemDTO.sub_codename=='men' }">
	        <table class="tblarea2"> <!-- 남자 트레이닝 -->
	        	<thead>
	        		<tr class="infoTbl">
	        			<th><div>SIZE</div></th>
	        			<th><div>허리</div></th>
	        			<th><div>허벅지</div></th>
	        			<th><div>밑위</div></th>
	        			<th><div>밑단</div></th>
	        			<th><div>총기장</div></th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<tr>
	        			<td><div>S</div></td>
	        			<td><div>31.5</div></td>
	        			<td><div>26.5</div></td>
	        			<td><div>28.5</div></td>
	        			<td><div>16</div></td>
	        			<td><div>95</div></td>
	        		</tr>
	        		<tr>
	        			<td><div>M</div></td>
	        			<td><div>33.5</div></td>
	        			<td><div>27.5</div></td>
	        			<td><div>29.5</div></td>
	        			<td><div>17</div></td>
	        			<td><div>96</div></td>	        			
	        		</tr>
	        		<tr>
	        			<td><div>L</div></td>
	        			<td><div>35.5</div></td>
	        			<td><div>28.5</div></td>
	        			<td><div>30.5</div></td>
	        			<td><div>18</div></td>
	        			<td><div>97</div></td>
	        		</tr>
					<tr>
						<td><div>XL</div></td>
	        			<td><div>37.5</div></td>
	        			<td><div>29.5</div></td>
	        			<td><div>31.5</div></td>
	        			<td><div>19</div></td>
	        			<td><div>98</div></td>
					</tr>
	        	</tbody>
	        </table>
	        </c:if>
	        <c:if test="${itemDTO.sub_codename=='top' }">
	        <table class="tblarea2"> <!-- 여자 탑 사이즈 -->
	        	<thead>
	        		<tr class="infoTbl">	        			
	        			<th><div>A</div></th>
	        			<th><div>B</div></th>
	        			<th><div>C</div></th>
	        			<th><div>D</div></th>
	        			<th><div>E</div></th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<tr>	        			
	        			<td><div>S</div></td>
	        			<td><div>S/M</div></td>
	        			<td><div>M</div></td>
	        			<td><div>M/L</div></td>
	        			<td><div>L</div></td>	        			
	        		</tr>
	        		<tr>
	        			<td><div>M</div></td>
	        			<td><div>M/L</div></td>
	        			<td><div>L</div></td>
	        			<td><div>L/XL</div></td>
	        			<td><div>XL</div></td>
	        		</tr>
					<tr>
	        			<td><div>L</div></td>
	        			<td><div>L/XL</div></td>
	        			<td><div>XL</div></td>
	        			<td><div>XL/1X</div></td>
	        			<td><div>1X</div></td>
					</tr>
					<tr>
	        			<td><div>XL</div></td>
	        			<td><div>XL</div></td>
	        			<td><div>1X</div></td>
	        			<td><div>1X/2X</div></td>
	        			<td><div>2X</div></td>
					</tr>
	        	</tbody>
	        </table>
	        </c:if>
	    </div>
	</div>
	
	<br>
	
	<div  class="itemInfo" style=" width: 100%;">
        	상품정보 보기
    </div>
    <div class="information">
        <table  class="itemTblarea">
            <tbody >
			<tr >
                <th  >
                    <div  >
                        제품 소재
                    </div>
                </th>
                <td >
                    <div  >
                        면 100% 40수 고밀도
                    </div>
                </td>
            </tr>
        	<tr >
                <th  >
                    <div  >
                        	색상
                    </div>
                </th>
                <td >
                    <div  >
                       	 블랙, 카키, 베이지, 민트, 오션블루
                    </div>
                </td>
            </tr>
        	<tr >
                <th  >
                    <div  >
                       	 치수
                    </div>
                </th>
                <td >
                    <div  >
                        2 size (허리26-30)  총장:95cm 허벅지:28cm 밑단:19cm, 3 size (허리30-34)  총장:99cm 허벅지:31cm 밑단:21cm, 4 size (허리34-38) 총장:103cm 허벅지:33cm 밑단:22cm
                    </div>
                </td>
            </tr>
			<tr >
                <th  >
                    <div  >
                        	제조자
                    </div>
                </th>
                <td >
                    <div  >
                    		(주)Bbanb
                    </div>
                </td>
            </tr>
            <tr >
                <th  >
                    <div  >
                        	제조국
                    </div>
                </th>
                <td >
                    <div  >
                        KOREA
                    </div>
                </td>
            </tr>
            <tr >
                <th  >
                    <div  >
                       	 세탁방법 및 취급시 주의사항
                    </div>
                </th>
                <td >
                    <div  >
                       	 온수세탁 금지
                    </div>
                </td>
            </tr>
            <tr >
                <th  >
                    <div  >
                        제조연월
                    </div>
                </th>
                <td >
                    <div  >
                        201705
                    </div>
                </td>
            </tr>
            <tr >
                <th  >
                    <div  >
                        품질보증기준
                    </div>
                </th>
                <td >
                    <div  >
                        전자상거래법 준수
                    </div>
                </td>
            </tr>
            <tr >
                <th  >
                    <div  >
                        A/S 책임자와 전화번호
                    </div>
                </th>
                <td >
                    <div  >
                        29CM 고객행복센터 1644-0560
                    </div>
                </td>
            </tr>
        
            </tbody>
        </table>
	</div>
</div>
<div>
  <jsp:include page="../itemView/itemViewMid2.jsp"/>
</div>  

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

//seq가져오기
$.ajax({
	type : 'POST',
	url : '/finalProject/itemView/getProductCode.do',
	data : 'seq=${param.seq}',
	dataType : 'json',
	success : function(data) {
		//alert(JSON.stringify(data));
		
		$('#ProductCode').text(data.itemDTO.seq);
	}
});

//상품설명 
$.ajax({
	type: 'POST',
	url : '/finalProject/itemView/getItemDetail.do',
	data : 'seq=${param.seq}',
	dataType : 'json',
	success : function(data){
		//alert(JSON.stringify(data));
		$('.item_Detail *').remove();
		
		$.each(data.list, function(index, item){
			$('.item_Detail').append($('<div/>',{

			}).append($('<div/>',{
				style : 'text-align: center; font-size: 18px; font-weight: 700;',
				html : item.main_codename
			})).append($('<div/>',{
				style : 'text-align: center; font-size: 22px; font-weight: 1000;',
				html : item.sub_codename
			})).append($('<div/>',{
				style : 'text-align: center; font-size: 15px;',
				html : item.info
			})))
		});
	}
});

</script>

</body>
</html>