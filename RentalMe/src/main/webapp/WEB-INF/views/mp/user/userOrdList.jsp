<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	   		float:left;
	   }
	   
	   #choosedel{
	   		font-family: "nanumR";
	   		width:55px;
	   		height:30px;
	   		float:right;
	   		color:black;
	   		font-weight:600;
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
	   
	    .delete_btn1{
	   		background-color: #D8D8D8;
	   		color:black;
	   		height:30px;
	   		font-family: "nanumB";	
	   		font-weight: border;	
	   }
	   
	   .delete_btn2{
	   		background-color: #4d4d4d;
	   		color:white;
	   		height:30px;
	   		font-family: "nanumB";
	   		font-weight: border;		
	   }
	   
	   .btn:hover,
	   .btn:focus{
	   		background-color: #D8D8D8;
	   }
	
	   .cartresult{
	   		height:100px;
	   		width: 230px;
	   		float:right;
	   }
	   
	   .cartresult>p{
	   		font-weight:bolder;
	   		font-size: 15pt;
	   		font-family: "nanumB";
	   		line-height: 100px;
	   }
	   
	   .cartbtn{
	   		width:180px;
	   		height:50px;
	   		float:right;
	   		margin-top:25px;
	   }
	   .pathdiv{
	   		height:30px;
	   }
	   
	   
</style>
<script type="text/javascript">

</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
	<p id="title">주문내역</p>
	<div>
	<div class="pathdiv">
       <p id="path">마이페이지> 주문내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: black;"></div>
       	<table class="ordtable table">
       	<thead>
       		<tr class="active">
       			<th>주문일</th>
       			<th>상품명/선택사항</th>
       			<th>수량</th>
       			<th>렌탈기간</th>
       			<th>상품금액</th>
       			<th>주문상태</th>
       			<th>상품후기</th>
			
       		</tr>
       	</thead>
       	<tbody>
       	
       	<c:forEach items="${alist}" var="bean">
       		<tr>  
       			<td>${bean.odrDt}</td>
       			<td><img class="ordimg" src="imgs/bed1.jpg"/>상품명</td>
       			<td>${bean.odrQty}</td>
       			<td>${bean.agreeTem}개월</td>
       			<td><fmt:formatNumber value="${bean.gdsPrice}" pattern="#,###.##"/>원</td>
       			<td>
       				<c:if test= "${bean.odrStsGbCd eq 'DW'}">
       					입금대기
       				</c:if>
       				<c:if test= "${bean.odrStsGbCd eq 'OC'}">
       					주문확정
       				</c:if>
       				<c:if test= "${bean.odrStsGbCd eq 'RW'}">
       					반품대기
       				</c:if>
       				<c:if test= "${bean.odrStsGbCd eq 'RC'}">
       					반품확정
       				</c:if>
       			</td>
       			<td><button type="button" class="btn" style="font-size: 9pt;">후기쓰기</button></td>
       		</tr>
       	</c:forEach>
       	</tbody>
       	</table>
       </div>
      <div class="hr"></div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>