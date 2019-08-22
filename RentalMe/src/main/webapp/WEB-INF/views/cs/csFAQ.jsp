<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!doctype html>
<html>
<head>
<jsp:include page="../template/headerRe.jsp"></jsp:include>
    <meta charset="UTF-8">
	<script type="text/javascript">
		$(document).ready(function(){
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
				location.replace("/rentalme/cs/csNotice");
			});
			$("#noticeBar td:nth-child(3)").click(function(){
				location.replace("/rentalme/cs/csInquiry");
			});
			$("#noticeMenuBar td:nth-child(1)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
			})
			$("#noticeMenuBar td:nth-child(2)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
			})
			$("#noticeMenuBar td:nth-child(3)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
			})
			$("#noticeMenuBar td:nth-child(4)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
			})
			$("#noticeMenuBar td:nth-child(5)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
			})
			$("#noticeMenuBar td:nth-child(6)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
			})
			$("#noticeMenuBar td:nth-child(7)").click(function(){
				$(this).css("background","black").css("color","white");
				$("#noticeMenuBar td").not($(this)).css("background","white").css("color","black");
			});
		})
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
		
		
		#contentList>table>tr>th:nth-child(1){
			width:20%;
			background:blue;
		}
		#contentList>table>tr>th:nth-child(2){
			width:60%;
		}
		#contentList>table>tr>th:nth-child(3){
			width:20%;
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
			height:700px;
		}
		
	</style>
</head>
<body>
<div id="csContent">
<div id="noticeBar" class="col-md-10 col-md-offset-1">
	<table>
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
			<td>주문</td>
			<td>배송</td>
			<td>결제</td>
			<td>교환취소</td>
			<td>회원정보</td>
			<td>기타</td>
			<td>
				<select style="height:25px;">
					<option>전체보기</option>
					<option>제목</option>
					<option>분류</option>
				</select>
				<input type="text"/>
				<button>검색</button>
			</td>
			
		</tr>
	</table>
</div>
<div id="contentList" class="col-md-10 col-md-offset-1">
		
	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
		</tr>
		<c:forEach items="${alist}" var="bean">
			<c:choose>
				<c:when test="${bean.CS_CLASS_GB_CD==1}">
					<tr>
						<td>${bean.FAQ_NO}</td>
						<td>주문</td>
						<td>${bean.SUB }</td>
					</tr>
				</c:when>
			</c:choose>
		</c:forEach>
	</table>
</div>
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>

