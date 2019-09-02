<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
</head>
<body>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>잔여 예치금</th>
			<th>마지막 거래 날짜</th>
			<th>상세정보</th>
		</tr>
		<c:forEach items="${alist }" var="bean">
		<tr>
			<td>${bean.userNm }</td>
			<td>${bean.userNm }</td>
			<td>${bean.userNm }</td>
			<td></td>
		</tr>
		</c:forEach>
	</table>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>