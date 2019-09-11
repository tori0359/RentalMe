<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mpMng.css" >
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
</head>
<body>
	<div class="titlediv">
	     <p id="title">사용자관리</p>
	</div>
	<div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
	<div id="info">
	   <p style="text-align: center;">
	   
	   </p>
	</div>
	<div id="data" style="width:100%; height:100%; overflow:auto;">
	<table class="ordtable table">
		<thead>
			<tr class="active">
				<th><input type="checkbox" id="allCheck"></th>
				<th>회원번호			</th>
				<th>아이디				</th>
				<th>이름				</th>
				<th>생년월일			</th>
				<th>성별				</th>   
				<th>핸드폰				</th>
				<th>핸드폰 동의			</th>	
				<th>이메일				</th>
				<th>이메일 동의			</th>	
				<th>주소				</th> 					
				<th>회원상태			</th>	
				<th>가입일자			</th>
			</tr>
		</thead>
		<tbody>			 
			<c:forEach items="${userInfo }" var="info">
				<tr>
					<td><input type="checkbox" name="userNo" value="${info.mbNo }"></td>
					<td>${info.mbNo }</td>
					<td>${info.userId }</td>
					<td>${info.userNM }</td>
					<td>${info.birthDay }</td>
					<td>${info.genderGbCd }</td>
					<td>${info.hp }</td>
					<td>${info.hpYn }</td>
					<td>${info.email }</td>
					<td>${info.emailYn }</td>
					<td>
						<c:if test="${not empty info.zipCode}">
							(${info.zipCode })
						</c:if>
						${info.addr }&nbsp;${info.addrDetail }
					</td>
					<td>${info.userStsCd }</td>
					<td>${info.joinDt }</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	</div>
</body>
</html>