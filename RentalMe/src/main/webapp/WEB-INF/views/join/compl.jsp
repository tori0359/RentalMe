<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/join.css">
<jsp:include page="../template/header.jsp"></jsp:include>
</head>
<body>
	<div id="join_terms">
		<h3>
			<small>회원가입>약관동의>정보입력>가입완료</small>
		</h3>
		<ul id="myTab8" class="nav nav-tabs nav-justified" role="tablist">
			<li role="presentation" class="disabled"><a href="#">약관동의</a></li>
			<li role="presentation" class="disabled"><a href="#">정보입력</a></li>
			<li role="presentation" class="active"><a href="#"
				id="active_tab">가입완료</a></li>
		</ul>
		<div id="joinus">
			<h3>가입해주셔서 감사합니다 :&#41;</h3>
			<a href="#" class="btn btn-lg btn-block" id="join_btn"
				role="button">메인으로</a>
		</div>
	</div>
</body>
</html>