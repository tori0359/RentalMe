<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/headerRe.jsp"></jsp:include>
<!-- datepicker 라이브러리(3개) -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/join.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/join.js"></script>
</head>
<body>
	<div id="join_terms">
		<ul id="myTab8" class="nav nav-tabs nav-justified" role="tablist">
			<li role="presentation" class="disabled"><a href="#">약관동의</a></li>
			<li role="presentation" class="active"><a href="#"
				id="active_tab">정보입력</a></li>
			<li role="presentation" class="disabled"><a href="#">가입완료</a></li>
		</ul>
		<div id="join_input">
			<form action="info" method="post">
				<div>
					<input type="text" class="form-control" id="id" name="userId"
						placeholder="아이디">
				</div>
				<div id="id-success">아이디 사용가능</div>
				<div id="id-danger">5~20자 영문소문자,대문자,숫자만 사용가능</div>
				
				<div>
					<input type="password" class="form-control" id="pw" name="userPw"
						placeholder="비밀번호">
				</div>
				<div>
					<input type="password" class="form-control" id="pwf"
						placeholder="비밀번호 확인">
				</div>
				<div class="pw-chk" id="pw-success">비밀번호가 일치합니다</div>
				<div class="pw-chk" id="pw-danger">비밀번호가 다릅니다</div>
				<div class="pw-chk" id="pw-danger2">8~20자 영문+숫자+특수문자 조합하여 입력해주세요.</div>
				
				<div>
					<input type="text" class="form-control" id="hp" name="hp"
						placeholder="(-)은 제외하고 연락처를 입력">
				</div>
				<div id="hp-danger">10~11자 숫자만 사용가능</div>
				<div>
					<input type="email" class="form-control" id="email" name="email"
						placeholder="이메일">
				</div>
				<div id="email-danger">email은 영문+숫자만 가능합니다.</div>
				<div>
					<label for="birth">생년월일</label> 
					<input type="text" class="form-control" id="birth" name="birthDay" />
				</div>
				<div id="option_select">
					<label id="genderGbCd">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</label>
					<label>&nbsp;</label>
					<label> <input type="radio" name="genderGbCd" id="optionsRadios1"
						value="1" checked> 남
					</label> <label> <input type="radio" name="genderGbCd" id="optionsRadios2"
						value="2"> 여
					</label>
				</div>
				<button type="submit"  id="joinBtn" class="btn btn-default">가입하기</button>
			</form>
		</div>
	</div>
	<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>