<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RentalMe - 중고상점</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/used.css" >
<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/used.js"></script>
</head>
<body>
<div class="usedStore">
	<h2 id="topStore"><span>${userNm }&nbsp;</span>님의 상점</h2>
	<div>
		<div class="hideenMbNo">${mbNo }</div>
		<div class="hiddenLoginId">${loginMbNo}</div>
		<div id="hiddenStsCd">${usedGdsResStsCd}</div>
		<form action="/used/store/now#topStore">
		<input type="hidden" name="mbNo" value="${mbNo }">
		<select id="usedGdsResStsCd" name="usedGdsResStsCd" onchange="this.form.submit()">
			<option value="0">전체</option>
			<option value="1">판매중</option>
			<option value="2">판매완료</option>		
		</select>
		</form>
	</div><br><br>
	
	<a href="/used/mng" id="insertThing">물품 등록</a>
	<ul class="tabs">
		<li class="tab">상품 목록</li>
		<li class="tab">상점 후기</li>	
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
			<li class="usedSts">
			<c:if test="${bean.usedGdsResStsCd eq 1}">
				<button class="btn btn-info updateSts">판매중</button>
			</c:if>
			<c:if test="${bean.usedGdsResStsCd eq 2}">
				<button class="btn btn-default disabled">판매완료</button>
			</c:if>
			</li>
			<li><a href="/used/detail/${bean.usedGdsNo }">${bean.modelNm }</a></li>
			<li>${bean.usedGdsPrice }</li>
			<li>${bean.chgDt }</li>
			<li><form action="/used/store/del/${bean.usedGdsNo }" method="POST">
			<button type="submit" class="used_del"><img src="/imgs/deleteicon.png" alt="delete"/></button>
			</form></li>
			<li id="hiddenNo">${bean.usedGdsNo }</il>
		</ul>
		</c:forEach>
	</div>
	<div style="border:0px solid red;" id="myUsedReview">
		<form action="/used/store/reviewinsert" method="post">
			<input type="hidden" name="storeNo" value="${mbNo }">
			<input type="hidden" name="mbNo" value="${loginMbNo }">
			<input type="hidden" name="grade" value="1">
			<div id="textAreaInput" >
			<pre><textarea class="form-control" name="content" rows="5" placeholder="상점에 관한 후기를 써주세요."></textarea></pre>
			</div>
			<br>
			<button style="background-color:black; color:white;" id="rviBtn" class="btn btn-lg btn-block" type="submit">후기등록</button>
		</form>
		<c:forEach items="${cmtlist }" var="bean">
		<div style="border-bottom:1px solid lightgrey; margin-top:20px;" class="storeCmtList">
			<div class="mbNo"><p style="font-weight:bold; font-size:13pt">${bean.userNm }</p></div>
			<div class="storeReviewDt">${bean.storeReviewDt }</div>
			<div style="margin-bottom:30px; font-size:13pt;" class="content"><pre>${bean.content}</pre></div>
			<input type="hidden" class="hiddenStoreNo" value="${bean.storeNo }">
			<input type="hidden" class="hiddenStoreReNo" value="${bean.storeReviewNo }">
			<button  class="btn btn-danger declaration" data-toggle="modal" href="#declmodal">신고하기</button><br>
		</div>
		</c:forEach>
		<br>
	</div>
	
</div>

<div id="declmodal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div style="height:50px;" class="modal-header">
        <h5 style="font-weight:bolder;" class="modal-title">신고하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/used/store/cmtDecl" method="post">
      <div class="modal-body">
        <div>
        	<p>신고대상: <input style="border:none;" id="declMbNo" type="text" name="mbNo" readonly="readonly"></p>
        	<input id="declSNo" type="hidden" name="storeNo" value="${mbNo}"/>
        	<input id="declRNo" type="hidden" name="storeReviewNo" />
        	<input id="declRDt" type="hidden" name="storeReviewDt"/>
        </div>
        <div> 
			<input style="width:70%;" type="text" id="declReason" class="form-control" placeholder="신고사유">
		</div>
      </div>
      <div class="modal-footer">
        <button id="declGO" type="submit" class="btn btn-danger">신고</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div id="usedFoot">
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>