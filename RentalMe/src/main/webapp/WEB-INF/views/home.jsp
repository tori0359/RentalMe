<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="">
	<title>Home</title>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${alist }" var="bean">
		<tr>
			<td>${bean.num }</td>
			<td><input type="text" name="sub" value="${bean.sub }"/></td>
			<td>${bean.nalja }</td>		
		</tr>
		</c:forEach>		
	</table>
</body>
</html>
