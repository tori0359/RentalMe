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
       <p id="title">중고거래 내역</p>
     </div>
     <div>
     	<form action="/mp/mng/used">
	     	<input type="text" name="usedGdsNo" placeholder="상품번호 입력">
	     	<input type="submit" value="검색">
     	</form>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <div id="info">
     <p style="text-align: center;">
     	삭제된 제품은 클릭할 수 없습니다.
     </p>
     </div>
	<table class="ordtable table">
	<thead>
		<tr class="active">
			<th>상품번호</th>
			<th>회원번호</th>
			<th>회원이름</th>
			<th>중분류</th>
			<th>소분류</th>
			<th>브랜드명</th>
			<th>모델명</th>
			<th>제목</th>
			<th>가격</th>
			<th>삭제여부</th>
			<th>등록일자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${alist }" var="bean">
		<tr class="usedTableTrClick" onclick="location.href='/used/detail/${bean.usedGdsNo}'">
			<td>${bean.usedGdsNo }</td>
			<td>${bean.mbNo }</td>
			<td>${bean.userNM }</td>
			<td>${bean.gdsMclassCd }</td>
			<td>${bean.gdsSclassCd }</td>
			<td>${bean.brandNm }</td>
			<td>${bean.modelNm }</td>
			<td>${bean.sub }</td>
			<td><fmt:formatNumber value="${bean.usedGdsPrice }" pattern="#,###.##"/>원</td>
			<td class="delYn">${bean.delYn }</td>
			<td>${bean.chgDt }</td>
			<%-- <td><a href="/mp/mng/deposit/${bean.mbNo }">${bean.userNm }</a></td>
			<td><fmt:formatNumber value="${bean.remnDeposit}" pattern="#,###.##"/>원</td>
			<fmt:parseDate value="${bean.chgDt }" var="time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
			<td><fmt:formatDate value="${time}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
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