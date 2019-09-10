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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMng.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
</head>
<body>
   <div class="titlediv">
       <p id="title">신고내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <div id="info">
     <p style="text-align: center;">
     	신고 처리를 해주세요
     </p>
     </div>
     <form action="/mp/mng/decl/update" method="post">
     <input type="submit" value="처리완료">
	<table class="ordtable table">
	<thead>
		<tr class="active">
			<th></th>
			<th>신고번호</th>
			<th>신고구분</th>
			<th>중고상품번호</th>
			<th>중고상품댓글번호</th>
			<th>상점번호</th>
			<th>상점후기번호</th>
			<th>신고날짜</th>
			<th>신고상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${alist }" var="bean">
		<tr class="usedTableTrClick">
			<td><input type="checkbox" name="declNo" value="${bean.declNo }"></td>
			<td>${bean.declNo }</td>
			<td>
			<c:if test= "${bean.usedReGbCd eq 'R1'}">
				댓글
			</c:if>
			<c:if test= "${bean.usedReGbCd eq 'R2'}">
				답글
			</c:if>
			<c:if test= "${bean.usedReGbCd eq 'R3'}">
				후기
			</c:if>
			</td>
			<td><a href="/used/detail/${bean.usedGdsNo }">${bean.usedGdsNo }</a></td>
			<td>${bean.usedGdsComtNo }</td>
			<td><a href="/used/store/${bean.storeNo }">${bean.storeNo }</a></td>
			<td>${bean.storeReviewNo }</td>
			<td>${bean.chgDt }</td>
			<td>
			<c:if test= "${bean.declResStsCd eq '1'}">
				처리완료
			</c:if>
			<c:if test= "${bean.declResStsCd eq '2'}">
				미완료
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	</form>
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