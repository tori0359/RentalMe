<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/header.jsp"></jsp:include>
<style type="text/css">
	#actList{
		margin: 100px auto;
		height:100%;
		width:65%;
		margin-bottom: 200px;
	}
	.ordimg{
	   	width:280px;
	 }
	 #actMenuDiv{
	 	width:100%;
	 }
	 .actMenu{
	 	height:45px;
	 	display:inline-block;
	 	text-align: center;
	 	line-height:45px;
	 	width:50%;
	 }
	 #actRun{
	 	background-color:black;
	 	color:white;
	 	float:left;
		border-top-left-radius: 10px;
	 	
	 }
	 #actEnd{
	 	background-color: #F1F0EE;
	 	float:left;
	 	border-top-right-radius: 10px;
	 }
	 
	 .actMenu p{
	 	font-family:"nanumR";
	 	font-weight: bolder;
	 	font-size:12pt;
	 }
	 #imgDiv,#contentDiv{
	 	display: inline-block;
	 	width: 400px;
	 }
	 #contentDiv{
	 	margin-top:30px;

	 }
	 #actCon{
	 	float: left;
	 }
	 .text{
	 	font-family:'nanumB'; 
	 	font-size:12pt;
	 	font-weight: bolder;
	 }
	   
</style>
</head>
<body>
<div id="actList">
	<div id="actMenuDiv">
		<div class="actMenu" id="actRun"><p>경매 진행중</p></div>
		<div class="actMenu" id="actEnd"><p>경매 종료</p></div>
		<div class="hr" style="clear:both; height:3px; background-color: black;"></div>
	</div>
		<c:forEach items="${alist}" var="bean">
			<div class="row" >
				<div class="col-md-10 col-md-offset-1">
					<div style="height:100%;" id="actCon">
						<div class="col-md-4" id="imgDiv" style="padding:20px 0px 20px 50px;">
							<img class="ordimg" src="/imgs/bed1.jpg"/>
						</div>
						<div class="col-md-3" id="contentDiv"">
							<input type="hidden" value="${bean.gdsCd}"/>
							<div><h2 style="font-family:'nanumEB'">${bean.gdsNm }</h2></div>
							<div><p style="font-family:'nanumB';">${bean.content }</p></div><br>
							<div><h4 class="text" style="color:#FE7B00;">시작가<span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<fmt:formatNumber pattern="#,###.##"> ${bean.gdsStPrice }</fmt:formatNumber> 원</span></h4></div>
							<div><h4 class="text" >경매 시작 시간&emsp;&emsp;&emsp;<span class="span"> ${bean.actStTime }</span></h4></div>
							<div><h4 class="text" >경매 종료 시간&emsp;&emsp;&emsp;<span class="span"> ${bean.actEdTime }</span></h4></div>
						</div>
					</div>
				</div>
				<div class="hr" style="clear:both; height:2px;"></div>
			</div>
		</c:forEach>
	
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>