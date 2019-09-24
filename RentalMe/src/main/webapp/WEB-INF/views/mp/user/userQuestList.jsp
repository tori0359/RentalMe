<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
<meta charset="UTF-8">
<title>RentalMe - 내 문의</title>
<style type="text/css">	
	#uptext{
		height:130px;
	}
	#ansNo{
		color:red;
	}
	#ansYe{
		color:blue;
	}
	#contentTable th{
		text-align:center;
	}
	#subText{
		text-decoration:none;
		color:black;
	}
	#subText:hover{
		color:red;
		font-weight: bold;
	}
	#info{
			width:93%;
			margin:20px 0px 10px 20px;
			border:4px solid #A4A4A4;
			padding: 10px;
		}
	.titlediv{
            height:40px;
      }
      #title2{
	   		font-size: 15pt;
	   		font-weight: bolder;
	   		font-family: "nanumB";
	   		margin: 60px 0 50px 0;;
	   }
      
</style>
<script>
window.onload=function(){
	$('#choosedel').click(function(){
		
		
	 });
}
</script>
</head>
<body>
<div style="height:100%;">
	<div class="titlediv">
		    <p id="title2">내 문의 보기</p>
	</div>
	<div class="hr" style="height:3px; background-color: black;"></div>
	<div id="info">
     <p class=" col-md-offset-1">
     	<input type="hidden" value="${id}">
	     	<p style="font-weight: bold;">연락 드리겠습니다</p>
     </div>
	
	
	<table class="table table-hover" id="contentTable">
		<tr class="active">
			<th style="width:15%;">번호</th>
			<th>제목</th>
			<th>등록일</th>
			<th>답변유무</th>
			<th>삭제</th>
		</tr>
			<!-- <form action="" method="get"> -->
			<c:forEach items="${mylist}" var="bean">
				<tr align="center">
						<form action="/mp/mp/QuestDelete" method="get">
						<td><input type="hidden" name="pquestNo" value="${bean.pquestNo}"/>
						<input type="hidden" name="mbNo" value="${bean.mbNo}"/>${bean.pquestNo}</td>
						<td style="text-align:left;"><a id="subText" href="${pageContext.request.contextPath}/mp/mp/questDetail?pquestNo=${bean.pquestNo}&mbNo=${bean.mbNo}">${bean.sub }</a></td>
						<td>${bean.regDt}</td>
						<c:if test="${bean.questStsCd eq '1'}">
							<td id="ansNo">N</td>
						</c:if>
						<c:if test="${bean.questStsCd eq '2'}">
							<td id="ansYe">Y</td>
						</c:if>
							<td style="text-align: center;"><input id="choosedel" class="btn btn-danger" type="submit" value="삭제"/></td>
						</form>
				</tr>
			</c:forEach>
			<!-- </form> -->
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
									<a style="cursor:pointer;" class="page-link" onClick="pageChange('${pathPaging}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
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