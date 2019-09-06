<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mpMng.css" >
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMng.js"></script>
</head>
<body>
   <div>
   <div class="titlediv">
       <p id="title">주문 상세 내역<span>&nbsp;&nbsp;&nbsp;&nbsp;결제번호:${ordNo }</span></p>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <table class="table">
     	<tr>
     		<th>주문상품</th>
     		<th>개당금액</th>
     		<th>수량</th>
     		<th>금액</th>
     	</tr>
     	<c:set var="total" value="0"/>
     	<c:forEach items="${alist }" var="bean">
     	<tr>
     		<td>${bean.gdsNm }</td>
     		<td><fmt:formatNumber value="${bean.gdsPrice }" pattern="#,###.##"/>원</td>
     		<td>${bean.odrQty }</td>
     		<td><fmt:formatNumber value="${bean.odrAmt }" pattern="#,###.##"/>원 </td> 
     	</tr>
     	<c:set var="total" value="${total +bean.odrAmt }"/>
     	</c:forEach>
     	<tr>
     		<td></td>
     		<td></td>     		
     		<th>총합</th>
     		<th><fmt:formatNumber value="${total }" pattern="#,###.##"/>원</th>     		
     		
     	</tr>
     </table>
     <div class="titlediv">
     	<p id="title2">받는사람</p>
     	</div>
     	<div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
          <table class="table">
             <tr>
             	<th>이름</th>
             	<td>${info.userNM }</td>
             </tr>
             <tr>
             	<th>전화번호</th>
             	<td>${info.hp }</td>
             </tr>
             <tr>
             	<th>주소</th>
             	<td>${info.addr }<br/>${info.addrDetail }</td>
             </tr>
          </table>
       </div>
       
      <div class="hr"></div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>