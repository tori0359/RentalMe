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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/join.js"></script>
</head>
<body>
	<div id="join_terms">
		<h3>
			<small>회원가입&gt;약관동의</small>
		</h3>
		<ul id="myTab8" class="nav nav-tabs nav-justified" role="tablist">
			<li role="presentation" class="active"><a href="#"
				id="active_tab">약관동의</a></li>
			<li role="presentation" class="disabled"><a href="#">정보입력</a></li>
			<li role="presentation" class="disabled"><a href="#">가입완료</a></li>
		</ul>
		<div class="join_terms_content">약관입력</div>
		<div class="checkbox">
			<label> <input id="isOk1" name="isOk" type="checkbox"
				value="" /> 약관동의
			</label>
		</div>
		<br />
		<div class="join_terms_content">약관입력</div>
		<div class="checkbox">
			<label> <input id="isOk2" name="isOk" type="checkbox"
				value="" /> 약관동의
			</label>
		</div>
		<div class="checkbox">
			<label> <input id="check_all" type="checkbox" value="" />
				전체동의
			</label>
		</div>
		<button id="join_next_btn" class="btn btn-default" disabled="disabled">다음으로</button>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>