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
		/* border:1px solid red; */
		width:100%;
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
	#headMenu>a:not(a:last-child()) {
		text-decoration:none;
		color:gray;
	}
	#headMenu>a:hover{
		color:blue;
		text-decoration:none;
	}
	#choosedel{
		color:red;
		margin-left:3px;
		margin-bottom:5px;
	}
	#choosedel:hover{
		cursor:pointer;
		text-decoration:none;
		color:red;
	}
	#contentList{
		height:480px;
	}
</style>
<title>Insert title here</title>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<script>

window.onload=function(){
	$('#choosedel').click(function(){
		 var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $("input[class='chBox']:checked").each(function(){
			    checkArr.push($(this).attr("data-actNum"));
			   });
			    
			   $.ajax({
				    url : "/mp/mng/deleteAppliList",
				    type : "post",
				    data : { chbox : checkArr},
				    success : function(){
				    	location.href = "/mp/mng/goodsList";
			    	}
			   });
		  } 
	 });
}
function checkAll(){
    if( $("#allCheck").is(':checked') ){
      $("input[name=chBox]").prop("checked", true);
    }else{
      $("input[name=chBox]").prop("checked", false);
    }
}
</script>
</head>
<body>

<!-- 관리자 공통상품 리스트 -->
<h1>공통상품리스트</h1>
<div id="contentList" class="col-md-10 col-md-offset-1">
	<div align="right" id="headMenu">
		<a href="${pageContext.request.contextPath}/mp/mng/goodsList">[전체상품]</a>&nbsp
		<a href="${pageContext.request.contextPath}/mp/mng/Appli/lg">[대형가전]</a>&nbsp
		<a href="${pageContext.request.contextPath}/mp/mng/Appli/sm">[소형가전]</a>&nbsp
		<a href="${pageContext.request.contextPath}/mp/mng/Appli/furn">[가구]</a>&nbsp
		<a href="${pageContext.request.contextPath}/mp/mng/Appli/rest">[기타]</a>&nbsp
		<a href="${pageContext.request.contextPath}/mp/mng/Appli/pkg">[패키지]</a>&nbsp
		<a id="choosedel">삭제처리</a>
	</div>
	<table class="table table-hover">
		<tr id="head">
			<th>상품코드</th>
			<th>상품상태</th>
			<th>상품분류</th>
			<th>상품명</th>
			<th>브랜드명</th>
			<th>모델명</th>
			<th>삭제여부</th>
			<td><input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll();"/></td>
		</tr>
			<c:forEach items="${rlist}" var="bean">
				<tr id="maincontent">
						<td>${bean.gdsCd}</td>
						<c:if test="${bean.gdsLclassCd eq '10'}">
						<td>새상품</td>
						</c:if>
						<c:if test="${bean.gdsLclassCd eq '20'}">
						<td style="color:gray;">*중고</td>
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
						
									<td><a href="${pageContext.request.contextPath}/rental/Appli/lg/${bean.gdsSclassCd }/detail/${bean.gdsCd}">${bean.gdsNm}</a></td>
								
						<td>${bean.brandNm}</td>
						<td>${bean.modelNm}</a></td>
						<c:if test="${bean.delYn  eq 'N'}">
						<td style="color:red;">N</td>
						<td style="text-align:center"><input type="checkbox" class="chBox" name="chBox" data-actNum="${bean.gdsCd}">
       				</td>
						</c:if>
						<c:if test="${bean.delYn  eq 'Y'}">
						<td style="color:blue;">Y</td>
						<td>▩</td>
						</c:if>
				</tr>
			</c:forEach>
	</table><br>
	<div id="btn00"><a href="${pageContext.request.contextPath}/mp/mng/rentalAddPage"><input type="button" id="btn01" value="등록"></a></div>
</div>
	<div align="center" style="width:100%">
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
									<a class="page-link" style="cursor:pointer" onClick="pageChange('${pathPaging}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
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
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>







