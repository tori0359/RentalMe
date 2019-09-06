<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	#title2{
            font-size: 15pt;
            font-weight: bolder;
            font-family: "nanumB";
            margin: 60px 0 50px 0;
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
      #info{
      	width:93%;
      	margin: 20px auto;
      	border:7px solid #E6E6E6;
      	padding: 15px;
      }
      
      #info p{
      	line-height:20px;
      	font-family:"nanumB";
      }
</style>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
<script>
	
</script>


</head>
<body>
	<div>
	<div class="titlediv">
       <p id="title2">경매내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: black;"></div>
       	 <div id="info">
       	 <p>
	       	 <input type="hidden" value="${loginMbNo}">
		     <c:if test="${empty userVo.userNM}">
		     	${loginUserId} 님의 경매내역입니다.
		     </c:if>
		     <c:if test="${!empty userVo.userNM }">
		     	${userVo.userNM} 님의 경매내역입니다.
		     </c:if>
		  </p>
       	 </div>
       	<table class="ordtable table">
       	<thead>
       		<tr class="active">
       			<th>경매낙찰 상품</th>
       			<th>낙찰날짜</th>
       			<th>낙찰가격</th>
       			<th>결제여부</th>
       		</tr>
       	</thead>
       	<tbody>
       	<c:forEach items="${alist}" var="bean">
       		<tr>  
       			<td><img class="ordimg" src="imgs/bed1.jpg"/>${bean.gdsNm}</td>
       			<td>${bean.bidTime}</td>
       			<td><fmt:formatNumber pattern="##,###.##">${bean.bidPrice}</fmt:formatNumber> 원
       			<input id="auctPrice" type="hidden" value="${bean.bidPrice}"/></td>
       			<td>
       				<button id="pay" style="background:#151515; color:white;" type="button" class="btn" style="font-size: 9pt;" >결제</button>
 					<button style="background:#D8D8D8; color:black;" type="button" class="btn" style="font-size: 9pt;" >포기</button>
       			</td>
       		</tr>
       	</c:forEach>
       	</tbody>
       	</table>
       </div>
       <div class="hr" style="height:2px;"></div>
      
</body>
</html>