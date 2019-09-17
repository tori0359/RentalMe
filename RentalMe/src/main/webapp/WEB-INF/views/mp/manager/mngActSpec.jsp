<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mpMng.css" >
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMng.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
</head>
<body>
   <div class="titlediv">
       <p id="title">경매 내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <div id="info">
     <p style="text-align: center;">
     	
     </p>
     </div>
	<table class="ordtable table">
	<thead>
		<tr class="active">
			<th>상품번호</th>
			<th>회원번호</th>
			<th>응찰가격</th>
			<th>응찰시간</th>
			<th>응찰상태</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${alist }" var="bean">
		<tr>
			<td>${bean.gdsCd }</td>
			<td>${bean.mbNo }</td>
			<td>${bean.bidPrice }</td>
			<td>${bean.bidTime }</td>
			<c:if test= "${bean.actBidStsCd == 1}">
				<td>낙찰</td>
				<td>
				<form action="/mp/mng/act/spec/cancel" method="post">
					<input type="hidden" name="gdsCd" value="${bean.gdsCd }">
					<button class="btn btn-default btn-sm">낙찰취소</button>
				</form>
				</td>
			</c:if>			
			<c:if test= "${bean.actBidStsCd == 2}">
				<td>예비</td>
				<td></td>
			</c:if>
			<c:if test= "${bean.actBidStsCd == 3}">
				<td>종료</td>
				<td></td>
			</c:if>
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

</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>