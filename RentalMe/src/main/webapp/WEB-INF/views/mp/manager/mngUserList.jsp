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
<script type="text/javascript" src="../../js/mpMngUser.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
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
				<!--  <th><input type="checkbox" id="allCheck"></th> -->
				<th>회원번호			</th>
				<th>아이디				</th>
				<th>이름				</th>
				<!--  <th>생년월일			</th> -->
				<th>성별				</th>   
				<th>핸드폰				</th>
				<!--  <th>핸드폰 동의			</th>	-->
				<th>이메일				</th>
				<!--  <th>이메일 동의			</th>	-->
				<!--  <th>주소				</th> 	-->				
				<!--  <th>회원상태			</th>	-->
				<th>가입일자			</th>
				<th>최근 접속일자 		</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>			 
			<c:forEach items="${userInfo }" var="info">
				<tr>
					<!--  <td><input type="checkbox" name="userNo" value="${info.mbNo }"></td> -->
					<td>${info.mbNo }</td>
					<td>${info.userId }</td>
					<td>${info.userNM }</td>
					<!--  <td>${info.birthDay }</td> -->
					<td>${info.genderGbCd }</td>
					<td>${info.hp }</td>
					<!--  <td>${info.hpYn }</td>-->
					<td>${info.email }</td>
					<!-- <td>${info.emailYn }</td>-->
					<!-- 
					<td>
						<c:if test="${not empty info.zipCode}">
							(${info.zipCode })
						</c:if>
						${info.addr }&nbsp;${info.addrDetail }
					</td>
					 -->
					<!--  <td>${info.userStsCd }</td>-->
					<td>${info.joinDt }</td>
					<td>${info.chgDt }</td>
					<td>
						<input type="button" id="${info.mbNo }" onclick="userDatail(this.id)" class="userDetail btn btn-info btn-sm"   value="상세정보"/>
						<input type="button" id="${info.mbNo }" onclick="userLeave(this.id)"  class="userLeave btn btn-danger btn-sm"  value="탈퇴">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="paginationBox">

		<ul class="pagination">

			<c:if test="${paging.prev}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="prevEvent('${path}','${paging.page}', '${paging.range}', '${paging.rangeSize}')">
						&lt;
					</a>
				</li>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
				<li class="page-item <c:out value="${paging.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#" onClick="pageChange('${path}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
						${idx} 
					</a>
				</li>
			</c:forEach>
			<c:if test="${paging.next}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="nextEvent('${path}','${paging.range}', '${paging.range}', '${paging.rangeSize}')" >
						&gt;
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	</div>
	
	<!-- 모달영역 -->
	<div id="mngUserDatail" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">사용자 정보</h4>
				</div>
				<div class="modal-body" style="overflow: auto; height: 500px;">
					<form class="form-horizontal">
					 <div class="form-group">
					    <label for="mbNo" class="col-sm-2 control-label">회원번호</label>
					    <div class="col-sm-3">
					      <p class="form-control-static" id="mbNo"></p>
					    </div>
					    <label for=levelGbCd class="col-sm-2 control-label">구분</label>
					    <div class="col-sm-4" style="text-align: center">
							<label class="radio-inline">
							  <input type="radio" id="inlineRadioOptions" name="levelGbCd" value="1"> 회원　
							</label>
							<label class="radio-inline">
							  <input type="radio" id="inlineRadioOptions" name="levelGbCd" value="2"> 관리자　
							</label>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
					    <div class="col-sm-3">
					      <p class="form-control-static" id="userId"></p>
					    </div>
					    <label for="userNm" class="col-sm-2 control-label">이름</label>
					    <div class="col-sm-4">
					      <p class="form-control-static" id="userNm"></p>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="birthDay" class="col-sm-2 control-label">생년월일</label>
					    <div class="col-sm-3">
					      <p class="form-control-static" id="birthDay"></p>
					    </div>
					    <label for="inputPassword3" class="col-sm-2 control-label">성별</label>
					    <div class="col-sm-4" style="text-align: center">
							<label class="radio-inline">
							  <input type="radio" id="inlineRadioOptions2" name="genderGbCd" value="1"> 남　
							</label>
							<label class="radio-inline">
							  <input type="radio" id="inlineRadioOptions2" name="genderGbCd" value="2"> 여　
							</label>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="hp" class="col-sm-2 control-label">핸드폰</label>
					    <div class="col-sm-3">
					      <p class="form-control-static" id="hp"></p>
					    </div>
					    <label for="hpYn" class="col-sm-2 control-label">수신동의</label>
					    <div class="col-sm-4" style="text-align: center">
							<label class="checkbox-inline">
							  <input type="checkbox" id="hpYn" name="hpYn"> 　
							</label>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="email" class="col-sm-2 control-label">이메일</label>
					    <div class="col-sm-3">
					      <p class="form-control-static" id="email"></p>
					    </div>
					    <label for="emailYn" class="col-sm-2 control-label">수신동의</label>
					    <div class="col-sm-4" style="text-align: center">
							<label class="checkbox-inline">
							  <input type="checkbox" id="emailYn" name="emailYn"> 　
							</label>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="addr" class="col-sm-2 control-label">주소</label>
					    <div class="col-sm-9">
					      <p class="form-control-static" id="addr"></p>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="addrDetail" class="col-sm-2 control-label">상세주소</label>
					    <div class="col-sm-9">
					      <p class="form-control-static" id="addrDetail"></p>
					    </div>
					  </div>
						<div class="form-group">
					    <label for="userStsCd" class="col-sm-2 control-label">회원상태</label>
					    <div class="col-sm-3">
					      <select class="form-control" id="userStsCd">
							  <option value="1">정상</option>
							  <option value="2">정지</option>
							  <option value="3">삭제</option>
						  </select>
					    </div>
					  </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</body>
</html>