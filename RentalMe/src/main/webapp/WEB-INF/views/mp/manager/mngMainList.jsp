<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
	

	});
</script>
<style type="text/css">
	#btn00{
		text-align:right;
	}
	#uptext{
		height:130px;
	}
	#head>th:nth-child(n){
		text-align:center;
	}
	#maincontent td:nth-child(n){
		text-align:center;
	}
</style>
<title>Insert title here</title>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
</head>
<body>

<!-- 관리자 공지게시판 리스트 -->
<h1>공지/FAQ</h1>
<div id="content" class="col-md-10 col-md-offset-1">
<div align="right"><a href="${pageContext.request.contextPath}/mp/mng/csNoticeList">[상품리스트]</a>&nbsp&nbsp&nbsp<a href="${pageContext.request.contextPath}/mp/mng/csFaqList">[FAQ]</a></div>
	<table class="table table-hover">
		<tr id="head">
			<th>상품코드</th>
			<th>상품상태</th>
			<th>상품분류</th>
			<th>상품명</th>
			<th>브랜드명</th>
			<th>모델명</th>
			<th></th>
		</tr>
			<c:forEach items="${rlist}" var="bean">
				<tr id="maincontent">
					<form action="" method="post">
						<td>${bean.gdsCd}</td>
						<c:if test="${bean.gdsLclassCd eq '10'}">
						<td>새상품</td>
						</c:if>
						<c:if test="${bean.gdsLclassCd eq '20'}">
						<td>중고</td>
						</c:if>
						<c:if test="${bean.gdsMclassCd eq '10'}">
						<td>대형가전</td>
						</c:if>
						<c:if test="${bean.gdsMclassCd eq '20'}">
						<td>소형가전</td>
						</c:if>
						<c:if test="${bean.gdsMclassCd eq '30'}">
						<td>주방가전</td>
						</c:if>
						<c:if test="${bean.gdsMclassCd eq '40'}">
						<td>가구</td>
						</c:if>
						<c:if test="${bean.gdsMclassCd eq '50'}">
						<td>기타</td>
						</c:if>
						<c:if test="${bean.gdsMclassCd eq '60'}">
						<td>패키지</td>
						</c:if>
						<td>${bean.gdsNm}</td>
						<td>${bean.brandNm}</td>
						<td>${bean.modelNm}</td>
						<td><input type="submit" value="삭제"/></td>
					</form>
				</tr>
			</c:forEach>
	</table>
	<div align="center" width="100%">
				<div id="paginationBox">
						<ul class="pagination">
							<c:if test="${paging.prev}">
								<li class="page-item">
									<a class="page-link" onClick="prevEvent('${pathPaging}','${paging.page}', '${paging.range}', '${paging.rangeSize}')">
										&lt;
									</a>
								</li>
							</c:if>
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
								<li class="page-item <c:out value="${paging.page == idx ? 'active' : ''}"/> " >
									<a class="page-link" style="cursor: pointer;" onClick="pageChange('${pathPaging}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
										${idx} 
									</a>
								</li>
							</c:forEach>
							<c:if test="${paging.next}">
								<li class="page-item">
									<a class="page-link" onClick="nextEvent('${pathPaging}','${paging.range}', '${paging.range}', '${paging.rangeSize}')" >
										&gt;
									</a>
								</li>
							</c:if>
						</ul>
					</div>
	</div>
				<div id="btn00"><a href="/mp/mng/csAdd"><input type="button" id="btn00" value="등록"></a></div>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>







