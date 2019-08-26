<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/header.jsp"></jsp:include>
<style type="text/css">
	#usedDetail{
		height: 1500px;
	}
	.imgD{
		width: 100px;
		height: 100px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body>
<div id="usedDetail">
	<h3>중고거래>가구</h3>
	<div class="imgD"><img src="${UsedVo.img1 }" style="width: 100%; height: 100%;"></div>
	<div class="imgD"><img src="${UsedVo.img2 }" style="width: 100%; height: 100%;"></div>
	<div class="imgD"><img src="${UsedVo.img3 }" style="width: 100%; height: 100%;"></div>
	<div class="imgD"><img src="${UsedVo.img4 }" style="width: 100%; height: 100%;"></div>
	<span id="subDetail">${UsedVo.usedGdsNo }</span>
	<div>브랜드: ${UsedVo.brandNm }</div>
	<div>택배비: 택배비 별도</div>
	<div>카테고리: ${UsedVo.mcnm }</div>
	<div>상품내용: ${UsedVo.content }</div>
	<a href="#">찜하기</a>
	<form action="/used/cmtAdd" method="post">
		<input type="hidden" name="usedGdsNo" value="${UsedVo.usedGdsNo }">
		<input type="hidden" name="mbNo" value="101">
		<input type="hidden" name="usedReGbCd" value="1">	
		<input type="hidden" name="delYn" value="N">
		<textarea name="content"></textarea>
		<label><input type="radio" id="noSecret" name="secretYn" value="1" checked="checked"> 비밀안함</label>
		<label><input type="radio" id="secret" name="secretYn" value="2"> 비밀</label>
		<button type="submit">작성</button>
	</form>
	<c:forEach items="${cmt }" var="cmet">
	<div class="cmtContent">
		<div class="secretCmt">비밀여부: ${cmet.secretYn }</div>
		<div>회원번호: ${cmet.mbNo }</div>
		<div>내용: ${cmet.content }</div>
	</div>
	</c:forEach>
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>