<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<style type="text/css">
	#head{
		padding-top:50px;
	}
	#contentTable{
		padding-top:60px;
	}
	#btn00{
		float:right;
	}
	#yetyet{
		color:green;
	}
	#inging{
		color:blue;
	}
	#endend{
		color:red;
	}
	#goodstext{
		color:black;
	}
	#goodstext:hover{
		text-decoration:none;
		font-weight:bolder;
		color:red;
	}
	#choosedel{
		color:blue;
		margin-left:3px;
		margin-bottom:5px;
	}
	#choosedel:hover{
		cursor:pointer;
		text-decoration:none;
		color:red;
	}
</style>
<script type="text/javascript">

	$(function(){
 		$('.gdsLink').click(function(){
			var link=$(this).parent().find('.hiddenCd').val().substring(2,12);
			window.location.href='/act/admin/10'+link;
		});	 
		
	});

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
<div id="head"><h2>경매상품 리스트</h2></div>
<script>
$(function(){
	$('#choosedel').click(function(){
		 var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $("input[class='chBox']:checked").each(function(){
			    checkArr.push($(this).attr("data-actNum"));
			   });
			    
			   $.ajax({
				    url : "/mp/mng/deleteList",
				    type : "post",
				    data : { chbox : checkArr},
				    success : function(){
				    	location.href = "/mp/mng/actList";
			    	}
			   });
		  } 
	 });
});

</script>
<div id="contentTable" class="col-md-10 col-md-offset-1">
<a id="choosedel">선택삭제</a>
	<table class="table table-hover">
		<tr>
			<th style="text-align:center"><input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll();"/></th>
			<th style="text-align:center">상품코드</th>
			<th style="text-align:center">상품명</th>
			<th style="text-align:center">등록일</th>
			<th style="text-align:center">경매여부</th>
		</tr>
			<c:forEach items="${actList}" var="bean">
				<tr>
					<td style="text-align:center"><input type="checkbox" class="chBox" name="chBox" data-actNum="${bean.gdsCd}">
       				</td>
					<td style="text-align:center"><input type="hidden" name="num" value="${bean.gdsCd}"/>${bean.gdsCd}</td>
					<td><a>${bean.gdsNm}</a></td>
					<td style="text-align:center">${bean.regDt}</td>
					<c:choose>
						<c:when test="${bean.actStsCd eq '1'}">
							<td id="yetyet" style="text-align:center">대기</td>
						</c:when>
						<c:when test="${bean.actStsCd eq '2'}">
							<td id="inging" style="text-align:center">진행중</td>
						</c:when>
						<c:otherwise>
							<td id="endend" style="text-align:center">경매완료</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
	</table>
				<div id="btn00"><a href="/mp/mng/actInsertPage"><input type="button" id="btn00" value="등록"></a></div>
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
									<a class="page-link" onClick="pageChange('${pathPaging}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
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
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>