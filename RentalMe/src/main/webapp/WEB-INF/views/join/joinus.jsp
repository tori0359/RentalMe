<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/join.css" >
<jsp:include page="../template/headerRe.jsp"></jsp:include>
</head>
<jsp:include page="../template/header.jsp"></jsp:include>
<body>
	
	<div id="joinus">
		<h3>회원가입</h3>
		<p>안녕하세요 렌탈미입니다.</p>
		<a href="/join/terms" class="btn btn-lg btn-block" id="join_btn" role="button">가입하기</a>
	</div>
	
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>