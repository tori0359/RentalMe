<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/join.css">
<jsp:include page="../template/headerRe.jsp"></jsp:include>
</head>
<body>
	<div style="margin: 100px;">
		<h3>안녕하세요, ${param.user_id} 님</h3>
		<br>
		<p>환영합니다!</p>
		<br>
		<p>회원가입이 정상적으로 이루어 졌습니다.</p>
		<br>
		<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<br> <a href="${pageContext.request.contextPath}/">메인 페이지로
			이동하기</a>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>