<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/used.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/used.js"></script>
</head>
<body>
<div id="usedhead">
</div>
<div id="usedDetail">
	<h3>중고거래>가구</h3>
	<div id="hiddenMyId">${loginUserId}</div>
<!-- carousel -->
<div id="carouselD">
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      	<img src="${UsedVo.img1 }"style="width: 100%; height: 100%;">
    </div>
    <div class="item">
      	<img src="${UsedVo.img2 }"style="width: 100%; height: 100%;">
    </div>
    <div class="item">
    	<img src="${UsedVo.img3 }"style="width: 100%; height: 100%;">
    </div>
    <div class="item">
    	<img src="${UsedVo.img4 }"style="width: 100%; height: 100%;">
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
<!-- carousel -->
	<div id="showInfo">
		<div id="mainInfo">
			<div>${UsedVo.modelNm }</div>
			<div class="used_price1">${UsedVo.usedGdsPrice }</div>
		</div>
		<hr>
		<div class="row">
		  <div class="col-md-2">브랜드</div>
		  <div class="col-md-10">${UsedVo.brandNm }</div>
		</div>
		<div class="row">
		  <div class="col-md-2">카테고리</div>
		  <div class="col-md-10">${UsedVo.mcnm }</div>
		</div>
		<button>문의하기</button>
	</div>
	<ul class="tabs">
		<li class="tab">상품설명</li>
		<li class="tab">상점문의</li>	
	</ul>
	<div id="bigInfo">
		<div id="detailInfo">
			상품정보
			<div>${UsedVo.content }</div>
		</div>
		<div id="sellInfo">
			판매자 정보
			<div>${UsedVo.userId }</div>
		</div>
	</div>
	<div id="storeReviewList">
	<form action="/used/cmtAdd" method="post">
		<input type="hidden" name="usedGdsNo" value="${UsedVo.usedGdsNo }">
		<input type="hidden" name="mbNo" value="${loginMbNo }">
		<input type="hidden" name="usedReGbCd" value="1">	
		<input type="hidden" name="delYn" value="N">
		<textarea class="form-control" name="content" rows="3" placeholder="글자수 200자 제한"></textarea>
		<input type="radio" id="noSecret" name="secretYn" value="1" checked="checked"> 비밀안함
		<input type="radio" id="secret" name="secretYn" value="2"> 비밀
		<button type="submit">작성</button>
	</form>
	<c:forEach items="${cmt }" var="cmet">
	<div class="cmtContent">
		<div class="secretCmt">${cmet.secretYn }</div>
		<div>${cmet.userId }</div>
		<div>${cmet.chgDt }</div>
		<div>${cmet.content }</div>
		<a class="insertReple" data-toggle="modal" href="#repleContent">답글달기</a>
		<a href="#">답글</a>
		<a href="#">신고하기</a>
	</div>
	<div class="cmtContent">
		비밀글입니다.
	</div>
	</c:forEach>
	</div>
</div>

<div id="repleContent" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">답글달기</h4>
        <div class="row">
		  <div class="col-md-2">아이디</div>
		  <div class="col-md-10" id="repleId"></div>
        </div>
        <div class="row">
		  <div class="col-md-2">내용</div>
		  <div class="col-md-10" id="repleCnt"></div>
        </div>
        <form action="#" method="post">
			<input type="hidden" name="" value="">
			<textarea class="form-control" name="content" rows="3" placeholder="글자수 200자 제한"></textarea>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">작성</button>
		</form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div id="usedFoot">
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>