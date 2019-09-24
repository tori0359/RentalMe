<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.optionSelect1 {
	font-weight: bolder;
	font-family: "nanumB";
	font-size:13pt;
}		

</style>
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
	<h3>${UsedVo.mcnm }</h3>
	<div id="hiddenMyId">${loginUserId}</div>
	<div class="hiddenLoginId">${loginMbNo}</div>
<!-- carousel -->
<div id="carouselD">
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      	<img src="${UsedVo.img1 }"style="width: 490px; height: 490px;">
    </div>
    <div class="item">
      	<img src="${UsedVo.img2 }"style="width: 490px; height: 490px;">
    </div>
    <div class="item">
    	<img src="${UsedVo.img3 }"style="width: 490px; height: 490px;">
    </div>
    <div class="item">
    	<img src="${UsedVo.img4 }"style="width: 490px; height: 490px;">
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
			<div >${UsedVo.modelNm }</div>
			<div class="used_price1">${UsedVo.usedGdsPrice }</div>
		</div>
		<hr>
		<div class="row">
		  <div id="showbrand" class="col-md-4"><h4 class="optionSelect1">브랜드</h4></div>
		  <div id="showcategory" class="col-md-8"><h4 class="optionSelect1">${UsedVo.brandNm }</h4></div>
		</div>
		<div class="row">
		  <div class="col-md-4"><h4 class="optionSelect1">카테고리</h4></div>
		  <div class="col-md-8"><h4 class="optionSelect1">${UsedVo.mcnm }</h4></div>
		</div>
	</div>
	<div id="subImgF">
		<img src="${UsedVo.img1 }"style="width: 100px; height: 100px;">
		<img src="${UsedVo.img2 }"style="width: 100px; height: 100px;">
		<img src="${UsedVo.img3 }"style="width: 100px; height: 100px;">
		<img src="${UsedVo.img4 }"style="width: 100px; height: 100px;">
	</div>
	<ul class="tabs">
		<li class="tab">상품설명</li>
		<li class="tab">상품문의</li>	
	</ul>

	<div id="bigInfo" class="row">
		<div id="detailInfo" class="col-md-5" style="border-right:2px solid lightgrey;">
			<p style="font-size:18pt; padding:10px;">상품 정보</p>
			<div><pre style="font-size:12pt; font-family:'nanumB'; font-weight:normal;">${UsedVo.content }</pre></div>
		</div>
		<div id="sellInfo" class="col-md-5" style="border:0px solid blue;">
			<p style="font-size:18pt; padding:10px;">판매자 정보</p>
			<div id="sellManId"><p style="font-size:12pt;">${UsedVo.userId }</p></div>
			<div id="hiddenNM">${UsedVo.mbNo }</div>
		</div>
	</div>

	<div id="storeReviewList">
	<form action="/used/cmtAdd" method="post">
		<input type="hidden" name="usedGdsNo" value="${UsedVo.usedGdsNo }">
		<input type="hidden" name="mbNo" value="${loginMbNo }">
		<input type="hidden" name="usedReGbCd" value="1">	
		<input type="hidden" name="delYn" value="N">
		<input type="radio" id="noSecret" name="secretYn" value="1" checked="checked"> 비밀안함
		<input type="radio" id="secret" name="secretYn" value="2"> 비밀
		<div class="row">
		<!-- <textarea name="content" rows="3" placeholder="글자수 200자 제한"></textarea> -->
		<input type="text" class="form-control" id="repleContentInput" name="content" placeholder="엔터로 입력">
		<!-- <button class="btn btn-default" type="submit">작성</button> -->
		</div>
	</form>
	<c:forEach items="${cmt }" var="cmet">
	<div class="cmtContent">
		<div class="secretCmt">${cmet.secretYn }</div>
		<div class="cmtUserId"><p>${cmet.userId }</p></div>
		<div>${cmet.chgDt }</div>
		<div>${cmet.content }</div>
		<input class="cmtNo" type="hidden" value="${cmet.usedGdsComtNo }">
		<input class="cmtDt" type="hidden" value="${cmet.usedGdsComtDt }">
		<!-- <a class="insertReple" href="#none">답글달기</a> -->
		<!-- <a class="declBtn" data-toggle="modal" href="#declmodal">신고하기</a> -->
		<button type="button" class="btn btn-danger declBtn" data-toggle="modal" href="#declmodal">신고</button>
	</div>
	<div class="cmtContent">
		비밀글입니다.
	</div>
	</c:forEach>
	</div>
</div>

<div id="usedFoot">
</div>

<div id="declmodal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div style="height:50px;" class="modal-header">
        <h4 style="font-weight:bolder;"class="modal-title">신고하기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/used/cmtDecl" method="post">
      <div class="modal-body">
	        <div>
	        	<p style="font-weight:bolder;">신고대상: 
	        	<span id="declId"></span></p>
	        	<input id="declNo" type="hidden" name="usedGdsComtNo">
	        	<input id="declDt" type="hidden" name="usedGdsComtDt">
	        	<input type="hidden" name="usedGdsNo" value="${UsedVo.usedGdsNo }">
	        </div>
        <div> 
			<textarea style="width:70%;" rows="5" placeholder="신고사유"></textarea>
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
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>