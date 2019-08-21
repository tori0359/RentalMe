<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content {
		height: 800px;
	}
</style>
<jsp:include page="./template/headerRe.jsp"></jsp:include>
</head>
<body>
<<<<<<< HEAD
	<table>
		<tr>
			<th>번호1</th>
			<th>제목1</th>
			<th>날짜1</th>
		</tr>
		<c:forEach items="${alist }" var="bean">
		<tr>
			<td>${bean.num }</td>
			<td><input type="text" name="sub" value="${bean.sub }"/></td>
			<td>${bean.nalja }</td>		
		</tr>
		</c:forEach>		
	</table>
=======
	<div class="content">
		<h1>메인페이지</h1>
	</div>
>>>>>>> refs/remotes/origin/hij
</body>
<jsp:include page="./template/footer.jsp"></jsp:include>
</html>