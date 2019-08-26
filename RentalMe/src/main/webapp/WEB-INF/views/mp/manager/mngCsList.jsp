<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../../template/header.jsp"></jsp:include>
</head>
<body>
<!-- 관리자 공지게시판 리스트 -->
<div id="content" class="col-md-10 col-md-offset-1">
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
			<c:forEach items='${alist}' var="bean">
				<tr>
					<td>${bean.faqNo }</td>
					<td>${bean.sub }</td>
					<td>${bean.regDt }</td>
				</tr>
			</c:forEach>
	</table>
</div>
</body>
<jsp:include page="../../template/footer.jsp"></jsp:include>
</html>



