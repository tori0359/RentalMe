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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/join.js"></script>
</head>
<body>
	<div id="join_terms">
		<h3>
			<small>회원가입>약관동의>정보입력</small>
		</h3>
		<ul id="myTab8" class="nav nav-tabs nav-justified" role="tablist">
			<li role="presentation" class="disabled"><a href="#">약관동의</a></li>
			<li role="presentation" class="active"><a href="#"
				id="active_tab">정보입력</a></li>
			<li role="presentation" class="disabled"><a href="#">가입완료</a></li>
		</ul>
		<div id="join_input">
			<form action="info" method="post">
				<div>
					<input type="text" class="form-control" id="id" name="id"
						placeholder="아이디">
				</div>
				<div>
					<input type="password" class="form-control" id="pw" name="pw"
						placeholder="비밀번호">
				</div>
				<div>
					<input type="password" class="form-control" id="pwf" name="pwf"
						placeholder="비밀번호 확인">
				</div>
				<div class="pw-chk" id="pw-success">비밀번호가 일치합니다</div>
				<div class="pw-chk" id="pw-danger">비밀번호가 다릅니다</div>
				<br>
				<div>
					<input type="text" class="form-control" id="tel" name="tel"
						placeholder="연락처">
				</div>
				<div>
					<label for="birth">생년월일</label> <input type="date"
						class="form-control" id="birth" name="birth" />
				</div>
				<div>
					<input type="email" class="form-control" id="email" name="email"
						placeholder="이메일">
					<button id="send_code" class="btn btn-default" type="button">인증코드
						받기</button>
				</div>
				<div>
					<input type="text" class="form-control" id="auth" name="auth"
						placeholder="인증번호 입력">
				</div>
				<div id="option_select">
					<label> <input type="radio" name="sex" id="optionsRadios1"
						value="1" checked> 남
					</label> <label> <input type="radio" name="sex" id="optionsRadios2"
						value="2"> 여
					</label>
				</div>
				<button type="submit" class="btn btn-default">가입하기</button>
			</form>
		</div>
	</div>


	<div id="myInput" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">인증번호 전송</h4>
				</div>
				<div>
					<p>인증번호를 성공적으로 보냈습니다.</p>
				</div>
				<div>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>