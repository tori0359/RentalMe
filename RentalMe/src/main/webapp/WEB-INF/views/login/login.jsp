<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/login.css" />
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
	<div id="login_main">
		<h3>로그인</h3>
		<form action="/login" method="post">
			<div class="form-group">
				<input type="text" class="form-control" name="userId" id="userId" value="${userId}"
					placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="userPw"
					name="userPw" placeholder="비밀번호">
			</div>
			<c:if test="${msg == 'pwFail'}">
				<div id="errCheck-danger">아이디와 비밀번호가 일치하지 않습니다.</div>
			</c:if>
			<c:if test="${msg == 'notEmailKey'}">
				<div id="errCheck-danger">이메일 인증을 진행하여 주시기 바랍니다.</div>
			</c:if>
			<c:if test="${msg == 'bannedId'}">
				<div id="errCheck-danger">사용정지 계정입니다.</div>
			</c:if>
			<c:if test="${msg == 'kickId'}">
				<div id="errCheck-danger">사용불가 계정입니다.</div>
			</c:if>
			<c:if test="${msg == 'notUserId'}">
				<div id="errCheck-danger">등록된 사용자가 아닙니다.</div>
			</c:if>
			<c:if test="${msg == 'pwFailCntOver'}">
				<div id="errCheck-danger">비밀번호 5회 입력오류로 계정이 정지되었습니다.</div>
			</c:if>
			
			<div class="row row-no-gutters">
				<div class="col-xs-6">
					<div class="checkbox">
						<label> <input type="checkbox" name="isUseLogin"> 자동 로그인
						</label>
					</div>
				</div>
				<div id="right_align" class="col-xs-6">
					<a data-toggle="modal" data-target="#id_pw_find" href="#">아이디/비밀번호찾기</a>
				</div>
			</div>

			<button type="submit" class="btn btn-default btn-lg btn-block">로그인</button>
		</form>
		<button id="signup" type="button" class="btn btn-default btn-lg btn-block">회원가입</button>
	</div>

	<!-- modal -->
	<div id="id_pw_find" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="idPwFindTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div id="modal-header">
					<h4 class="modal-title" id="idPwFindTitle">계정 정보 찾기</h4>
				</div>
				<div class="modal-body">
					<div id="find_tab">
						<button id="id_tab" type="button" class="btn btn-default" disabled>아이디 찾기</button>
						<button id="pw_tab" type="button" class="btn btn-default">비밀번호 찾기</button>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optionsRadios"
							id="find_cellphone" value="option1" checked> 등록된 핸드폰으로 찾기
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optionsRadios"
							id="find_email" value="option2"> 등록된 이메일로 찾기
						</label>
					</div>
					<div id="id_find">
						<div id="id_cellphone_find">
							<input type="text" placeholder="번호입력" />
						</div>
						<div id="id_email_find">
							<input type="text" placeholder="메일주소입력" name="inputEmail" id="inputEmail" />
						</div>
						
						<div id="email-danger">email은 영문+숫자만 가능합니다.</div>
						<div id="empty-danger">이메일을 입력해주시기 바랍니다.</div>
						<div id="noEmail-danger">등록된 이메일이 아닙니다.</div>						
					</div>
				</div>				
				<div id="modal-footer">
					<div>
						<button id="id_find_btn" type="button"
							class="btn btn-default btn-block" >찾기</button>
					</div>
				</div>

				<div id="pw_find">
					<div id="insert_id">
						<input type="text" placeholder="아이디"  name="pwUserId" id="pwUserId"/>
					</div>
					<div id="pw_cellphone_find">
						<input type="text" placeholder="핸드폰번호입력" name="pwHp" id="pwHp"/>
					</div>
					<div id="pw_email_find">
						<input type="text" placeholder="메일주소입력" name="pwInputEmail" id="pwInputEmail"/>
					</div>
					<div>
						<button id="pw_find_btn" type="button"
							class="btn btn-default btn-block">찾기</button>
					</div>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<div id="find_id_modal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">아이디 찾기</h4>
				</div>
				<div class="modal-body" id="find_id_body" style="overflow: auto; height: 500px;">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<div id="find_pw_modal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">비밀번호 변경</h4>
				</div>
				<div class="modal-body">
					<div>
						<input type="text" placeholder="비밀번호" />
					</div>
					<div>
						<input type="text" placeholder="비밀번호확인" />
					</div>
				</div>
				<div class="modal-footer">
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