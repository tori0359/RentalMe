<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mpMng.css" >
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/used.js"></script>
</head>
<body>
   <div class="titlediv">
       <p id="title">예치금 내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <div id="info">
     <p>
     </p>
     </div>
	<table class="ordtable table">
	<thead>
		<tr class="active">
			<th>회원번호</th>
			<th>이름</th>
			<th>잔여 예치금</th>
			<th>마지막 거래 날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${alist }" var="bean">
		<tr class="usedTableTrClick" onclick="location.href='/mp/mng/deposit/${bean.mbNo }'">
			<td>${bean.mbNo }</td>
			<td>${bean.userNm }</td>
			<td><fmt:formatNumber value="${bean.remnDeposit}" pattern="#,###.##"/>원</td>
			<fmt:parseDate value="${bean.chgDt }" var="time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
			<td><fmt:formatDate value="${time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>