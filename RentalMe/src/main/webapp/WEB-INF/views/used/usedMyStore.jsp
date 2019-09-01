<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/used.css" >
<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/used.js"></script>
</head>
<body>
<div class="usedStore">
	<h2>나의 상점</h2>
	<div>
		<div class="hideenMbNo">${mbNo }</div>
		<div class="hiddenLoginId">${loginMbNo}</div>
		<div id="hiddenStsCd">${usedGdsResStsCd}</div>
		<form action="/used/store/now">
		<input type="hidden" name="mbNo" value="${mbNo }">
		<select id="usedGdsResStsCd" name="usedGdsResStsCd" onchange="this.form.submit()">
			<option value="0">전체</option>
			<option value="1">판매중</option>
			<option value="2">판매완료</option>		
		</select>
		</form>
	</div><br><br>
	
	<a href="/used/mng" id="insertThing">물품등록</a>
	<ul class="tabs">
		<li class="tab">상품목록</li>
		<li class="tab">상점후기</li>	
	</ul>
	<div id="myUsedList">
		<ul>
			<li>이미지</li>
			<li>상태</li>
			<li>물품명</li>
			<li>가격</li>
			<li>업로드날짜</li>
			<li></li>
			<li></li>
		</ul>
		<c:forEach items="${alist }" var="bean">
		<ul class="myUsedLt">
			<li><div><img src="${bean.img1 }" style="width: 100%; height: 100%;"></div></li>
			<li>${bean.usedGdsResStsCd }</li>
			<li>${bean.modelNm }</li>
			<li>${bean.usedGdsPrice }</li>
			<li>${bean.chgDt }</li>
			<li><form action="/used/store/del/${bean.usedGdsNo }" method="POST">
			<button type="submit" class="used_del"><img src="/imgs/deleteicon.png" alt="delete"/></button>
			</form></li>
			<li id="hiddenNo">${bean.usedGdsNo }</il>
		</ul>
		</c:forEach>
	</div>
	<div id="myUsedReview">
		<form action="/used/store/reviewinsert" method="post">
			<input type="hidden" name="storeNo" value="111">
			<input type="hidden" name="mbNo" value="${loginMbNo }">
			<input type="hidden" name="grade" value="1">
			<div id="textAreaInput" >
			<textarea class="form-control" name="content" rows="3"></textarea>
			</div>
			<button type="submit">후기등록</button>
		</form>
		<c:forEach items="${cmtlist }" var="bean">
		<div class="storeCmtList">
			<div>${bean.mbNo }님</div>
			<div>${bean.content }</div>
			<div>${bean.storeReviewDt }</div>
			<div><a href="#">신고</a></div>
		</div>
		</c:forEach>
	</div>
	
</div>
<div id="usedFoot">
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>