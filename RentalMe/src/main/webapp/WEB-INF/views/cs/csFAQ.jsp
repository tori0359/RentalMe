<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!doctype html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
    <meta charset="UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){

			var i=0;
			$("#noticeBar td:nth-child(1)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
				
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(2)").css("background","black").css("color","white");
			});
			$("#noticeBar td:nth-child(3)").mouseover(function(){
			  $(this).css("background", "black").css("color","white");
			}).mouseout(function(){
				$(this).css("background", "white").css("color","black"),$("#noticeBar td:nth-child(2)").css("background","black").css("color","white");
			});
			$("#noticeBar td:nth-child(1)").click(function(){
				location.replace("/cs/csNotice");
			});
			$("#noticeBar td:nth-child(3)").click(function(){
				location.replace("/cs/csInquiry");
			});
			$(".list0").hide(); 
			//전체보기
			$("#noticeMenuBar td:nth-child(1)").click(function(){
				$(this).css("background","black").css("color","white");
				location.href="/cs/csFAQ";
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
				$(".list0").show();
				$(".list1 ,.list2, .list3, .list4, .list5, .list6").hide();
				i=0;

			})
			//주문
			$("#noticeMenuBar td:nth-child(2)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
				$(".list1").show();
				$(".list0, .list2, .list3, .list4, .list5, .list6").hide();
				$("#paginationBox").hide();
			})
			//배송
			$("#noticeMenuBar td:nth-child(3)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
				$(".list2").show();
				$(".list0, .list1, .list3, .list4, .list5, .list6").hide();
				$("#paginationBox").hide();
			})
			//결제
			$("#noticeMenuBar td:nth-child(4)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
				$(".list3").show();
				$(".list0, .list1, .list2, .list4, .list5, .list6").hide();
				$("#paginationBox").hide();
			})
			//교환취소
			$("#noticeMenuBar td:nth-child(5)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
				$(".list4").show();
				$(".list0, .list1, .list2, .list3,  .list5, .list6").hide();
				$("#paginationBox").hide();
			})
			//회원정보
			$("#noticeMenuBar td:nth-child(6)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
				$(".list5").show();
				$(".list0, .list1, .list2, .list3, .list4, .list6").hide();
				$("#paginationBox").hide();
				
			})
			//기타
			$("#noticeMenuBar td:nth-child(7)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
				$(".list6").show();
				$(".list0, .list1, .list2, .list3,.list4, .list5").hide();
				$("#paginationBox").hide();
			});

			$('#btnSearch').click(function(e){

				e.preventDefault();

				var url = "${pageContext.request.contextPath}/cs/csFAQ";
				url = url + "?searchType=" + $('#searchType').val();
				url = url + "&keyword=" + $('#keyword').val();
				location.href = url;
				console.log(url);

			});
	
		})
		
		function menuClick(s) {
			$.ajax({
				url:'ordlist',
				type:'GET',
				data:{param:s},
				success:function(result){
					alert(result);
				},
				erro:function(jqXHR,testStatus,errorThrown){
					alert('오류가 발생했습니다');
				}

			}) 
		}
	</script>
	<style type="text/css">
		#noticeBar{
			height:250px;
		}
		#noticeBar table{
			margin-top: 80px;
			font-size:20px;
		}
		#noticeBar td:nth-child(1){
			border-bottom-left-radius: 10px;
			border-top-left-radius: 10px;
			color:white;
			background:black;
			width:34%;
			text-align: center;
		}
		#noticeBar td:nth-child(2){
			background:white;
			border-left:0.1px solid;
			border-right:0.1px solid;
			width:33%;
			text-align: center;
		}
		#noticeBar td:nth-child(3){
			border-bottom-right-radius: 10px;
			border-top-right-radius: 10px;
			background:white;
			width:33%;
			text-align: center;
		}
		#noticeBar>table{
			width:100%;
			height:50px;
		}
		#noticeBar td:nth-child(2){
			background:black;
			color:white;
		}
		#noticeBar td:nth-child(1){
			background:white;
			color:black;
		}
		#noticeMenuBarSpace{
			height:50px;
		}
		#noticeMenuBar{
			width:100%;
		}
		#noticeMenuBar button{
			
		}
		#noticeMenuBar td:not(:last-child){
			border:1px solid;
			border-color:beige;
			width:80px;
			height:30px;
			margin: 0px 5px 0px 5px;
			background:white;
			text-align: center;
			text-decoration:none;
		}
		#noticeMenuBar td:not(:last-child):hover{
			background:black;
			color:white;
		}
		#noticeMenuBar td:nth-child(1){
			background: black;
			color:white;
		}
		#noticeMenuBar td:last-child{
			float:right;
		}
		#csContent{
			height:800px;
		}
		#all:not(#aSub){
			text-align: center;
		}
		#allnext th:nth-child(1){
			width:10%;
			text-align:center;
		}
		#allnext th:nth-child(2){
			width:10%;
			text-align:center;
		}
		#allnext th:nth-child(3){
			width:80%;
			text-align:center;
		}
		#all tr:nth-child(1){
			text-align:center;
		}
		#paginationBox {
			width: 100%;
			text-align: center;
			margin: 0px auto;
		}
		#aSub{
			text-decoration:none;
			text-align:left;
		}
		#aSub:hover{
			color:red;
		}
		#noticeMenuBar tr>td{
			cursor:pointer;
		}
		#firTable tr>td{
			cursor:pointer;
		}
	</style>
</head>
<body>
<div id="csContent">
<div id="noticeBar" class="col-md-10 col-md-offset-1">
	<table id="firTable">
		<tr>
			<td>공지사항</td>
			<td>FAQ</td>
			<td>1:1문의</td>
		</tr>
	</table>
<br/><br/><br/><br/><br/>
</div>
<div id="noticeMenuBarSpace" class="col-md-10 col-md-offset-1">
			<table id="noticeMenuBar" class="col-md-6">
				<tr>
					<td>전체보기</td>
					<td onclick="menuClick('order');">주문</td>
					<td>배송</td>
					<td>결제</td>
					<td>교환취소</td>
					<td>회원정보</td>
					<td>기타</td>
					<td>
						<select style="height:25px;" name="searchType" id="searchType">
							<option>선택하기</option>
							<option value="title">제목</option>
						</select>
						<input type="text" name="keyword" id="keyword">
						<button name="btnSearch" id="btnSearch">검색</button>
					</td>
				</tr>
			</table>
</div>
<div id="contentList" class="col-md-10 col-md-offset-1">
	<table id="all" class="table table-hover">
		<tr id="allnext" >
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
		</tr>
		<tr>
			<c:forEach items="${blist}" var="bean">
					<tr class="list0">
						<td style="text-align:center;">${bean.faqNo}</td>
						<c:if test="${bean.csClassGbCd eq '1' }">
						<td style="text-align:center;">주문</td>
						</c:if>
						<c:if test="${bean.csClassGbCd eq '2' }">
						<td style="text-align:center;">배송</td>
						</c:if>
						<c:if test="${bean.csClassGbCd eq '3' }">
						<td style="text-align:center;">결제</td>
						</c:if>
						<c:if test="${bean.csClassGbCd eq '4' }">
						<td style="text-align:center;">교환취소</td>
						</c:if>
						<c:if test="${bean.csClassGbCd eq '5' }">
						<td style="text-align:center;">회원정보</td>
						</c:if>
						<c:if test="${bean.csClassGbCd eq '6' }">
						<td style="text-align:center;">기타</td>
						</c:if>
						<td id="aSub" style="text-align:left;"><a href="csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}">${bean.sub}</a></td>
					</tr>
			</c:forEach>
		</tr>
		<tr> 
			<c:forEach items="${blist}" var="bean">
			
				<c:if test="${bean.csClassGbCd eq '1'}">
					<tr class="list1">
						<td>${bean.faqNo}</td>
						<td>주문</td>
						<td id="aSub" style="text-align:left;"><a href="csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}">${bean.sub}</a></td>
					</tr>
				</c:if>
			 
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${blist}" var="bean">
			
				<c:if test="${bean.csClassGbCd eq '2'}">
					<tr class="list2">
						<td>${bean.faqNo}</td>
						<td style="text-align:center;">배송</td>
						<td id="aSub" style="text-align:left;"><a id="aSub" href="csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}">${bean.sub}</a></td>
					</tr>
				</c:if>
			 
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${blist}" var="bean">
				<c:if test="${bean.csClassGbCd eq '3'}">
					<tr class="list3">
						<td>${bean.faqNo}</td>
						<td style="text-align:center;">결제</td>
						<td id="aSub" style="text-align:left;"><a href="csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}">${bean.sub}</a></td>
					</tr>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${blist}" var="bean">
			 <c:if test="${bean.csClassGbCd eq '4'}">
					<tr class="list4">
						<td>${bean.faqNo}</td>
						<td style="text-align:center;">교환취소</td>
						<td id="aSub" style="text-align:left;"><a href="csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}">${bean.sub}</a></td>
					</tr>
			  </c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${blist}" var="bean">
				<c:if test="${bean.csClassGbCd eq '5'}">
					<tr class="list5">
						<td>${bean.faqNo}</td>
						<td style="text-align:center;">회원정보</td>
						<td id="aSub" style="text-align:left;"><a href="csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}">${bean.sub}</a></td>
					</tr>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<c:forEach items="${blist}" var="bean">
				<c:if test="${bean.csClassGbCd eq '6'}">
					<tr class="list6">
						<td>${bean.faqNo}</td>
						<td style="text-align:center;">기타</td>
						<td id="aSub" style="text-align:left;"><a href="csFaqDetail?csGbCd=${bean.csGbCd}&faqNo=${bean.faqNo}&csClassGbCd=${bean.csClassGbCd}">${bean.sub}</a></td>
					</tr>
				</c:if>
			 
			</c:forEach>
		</tr>
	</table>
	<%
		String searchType=request.getParameter("searchType"); 
		String keyword=request.getParameter("keyword"); 
		
		System.out.println(searchType);
		System.out.println(keyword);
	%>
</div>
</div>
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
									<a class="page-link" style="cursor:pointer" onClick="pageChange('${pathPaging}','${idx}', '${paging.range}','${paging.rangeSize}','${searchType}','${keyword}')"> 
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
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>

