<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
		#title{
	   		font-size: 18pt;
	   		font-weight: bolder;
	   		text-align: center;
	   		font-family: "nanumB";
	   		margin: 50px;
	   }
	   #path{
	   		font-weight: bolder;
	   		font-family: "nanumB";
	   }

	    .ordtable>thead>tr>th{
        	text-align:center;
        }
        
        .ordtable>tbody>tr>td{
        	vertical-align: middle;
        	text-align: center;
        	display: table-cell;
        }
        
	   .ordimg{
	   		width:150px;
	   }
	   
	  
        
</style>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
	<p id="title">주문내역</p>
	<div>
       <p id="path">마이페이지> 주문내역</p>
       	<table class="ordtable table">
       	<thead>
       		<tr class="active">
       			<th>주문일</th>
       			<th>상품명/선택사항</th>
       			<th>주문코드</th>
       			<th>렌탈기간</th>
       			<th>상품금액</th>
       			<th>상품후기</th>
       		</tr>
       	</thead>
       	<tbody>
       		<tr>  
       			<td>2019/06/27</td>
       			<td><img class="ordimg" src="imgs/bed1.jpg"/></td>
       			<td>B123</td>
       			<td>6개월</td>
       			<td>월30,000원 x 6</td>
       			<td><button type="button" class="btn btn-default">후기쓰기</button></td>
       		</tr>
       		<tr>
       			<td>2019/06/27</td>
       			<td><img class="ordimg" src="imgs/bed2.jpg"/></td>
       			<td>B123</td>
       			<td>6개월</td>
       			<td>월30,000원 x 6</td>
       			<td><button type="button" class="btn btn-default">후기쓰기</button></td>
       		</tr>
       	</tbody>
       	</table>
       </div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>