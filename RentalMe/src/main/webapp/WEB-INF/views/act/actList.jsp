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
	 #actRun:hover,
	 #actEnd:hover{
	 	cursor: pointer;
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
	 .actCon{
	 	float: left;
	 	cursor: pointer;
	 }
	 .text{
	 	font-family:'nanumB'; 
	 	font-size:12pt;
	 	font-weight: bolder;
	 }
	 .color{
	 	color: #DF7401;
	 }
	 .wrapper{
	 	position: relative;
	 }
	 #end p{
	 	text-align:center;
	 	font-family:"nanumEB";
	 	font-size:29pt;
	 	border:1px solid blue;
	 	padding:35px;
	 	margin-top: 12%;
	 	border:17px solid #DF0101;
	 	border-style: double;
	 	font-weight: bolder;
	 	-ms-transform: rotate(-5deg); 
		-webkit-transform: rotate(-5deg);
		transform: rotate(-5deg);
	 }
	 #tag{
	 	color: black;
	 }
	 #tag:hover{
	 	text-decoration: none;
	 	color: black;
	 }
	 #brandNmStyle{
		line-height: 0.2em;
		text-decoration:none;
		font-size: 1.8rem;
		color: #999;
		font-family:"nanumB";
		font-weight: 600;
	}
	   
</style>
<script type="text/javascript">
	window.onload=function(){
		$('#actRunList').show();
		$('#actEndList').hide();
		
		$('#actEnd').click(function(){
			$('#actEnd').css("background-color","black");
			$('#actEnd').css("color","white");
			$('#actRun').css("background-color","#F1F0EE");
			$('#actRun').css("color","black");

			$('#actRunList').hide();
			$('#actEndList').show();
		});
		
		$('#actRun').click(function(){
			$('#actRun').css("background-color","black");
			$('#actRun').css("color","white");
			$('#actEnd').css("background-color","#F1F0EE");
			$('#actEnd').css("color","black");

			$('#actRunList').show();
			$('#actEndList').hide();
		});
		var sessionMbno=$('#ssId').val();
		$('.actCon').click(function(){
			var startPrice=$(this).find('.hiddenPrice').val();
			if(sessionMbno==''){
				alert('로그인 해주세요');
				window.location.href='/login';
			}else {
				if(startPrice>${myMb}){
					alert('보증금이 부족해요');
				}else{
					window.location.href='/act/'+$(this).find('#hiddenCd').val();
				}
			}
		}); 
	}

</script>
</head>
<body>
<input type="hidden" id="ssId" value="${loginMbNo }">
<div id="actList">
	<div id="actMenuDiv">
		<div class="actMenu" id="actRun"><p>경매 진행중</p></div>
		<div class="actMenu" id="actEnd"><p>경매 종료</p></div>
		<div class="hr" style="clear:both; height:3px; background-color: black;"></div>
	</div>
	<div id="actRunList">
		<c:forEach items="${alist}" var="bean">
			<div class="row" >
				<div class="col-md-10 col-md-offset-1">
					<div style="height:100%;" class="actCon">
						<div class="col-md-4" id="imgDiv" style="padding:20px 0px 20px 50px;">
							<img class="ordimg" src="/imgs/bed1.jpg"/>
						</div>
						<div class="col-md-3" id="contentDiv">
							<input id="hiddenStsCd" type="hidden" value="${bean.actStsCd }">
							<input id="hiddenCd" type="hidden" value="${bean.gdsCdDetail}"/>
							<input class="hiddenPrice" type="hidden" value="${bean.gdsStPrice}"/>							
							<div><h4 id="brandNmStyle">${bean.brandNm}</h4></div>
							<div><h2 style="font-family:'nanumEB' ">${bean.gdsNm }</h2></div>
							<div><p style="font-family:'nanumB';">${bean.content }</p></div><br>
							<div><h4 class="text"><span class="color">시작가</span><span class="startPrice">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<fmt:formatNumber pattern="#,###.##"> ${bean.gdsStPrice }</fmt:formatNumber> 원</span></h4></div>
							<div><h4 class="text" ><span class="color">경매 시작 시간</span>&emsp;&emsp;&emsp;<span class="span"> ${bean.actStTime }</span></h4></div>
							<div><h4 class="text" ><span class="color">경매 종료 시간</span>&emsp;&emsp;&emsp;<span class="span"> ${bean.actEdTime }</span></h4></div>
						</div>
					</div>
				</div>
				<div class="hr" style="clear:both; height:2px;"></div>
			</div>
		</c:forEach>
	</div>
<div style="background-color:rgba(128,128,128,0.2);" id="actEndList">
		<c:forEach items="${alist2}" var="bean">
			<div class="row wrapper" >
				<div class="col-md-10 col-md-offset-1">
					<div style="height:100%;" id="actCon">
					<div id="end" style="opacity:1; position:absolute; height:40px; width:60%; padding:30px; margin-left:20%; z-index:100;"><p>경매 종료</p></div>
						<div class="col-md-4" id="imgDiv" style="opacity:0.2; padding:20px 0px 20px 50px;">
							<img class="ordimg" src="/imgs/bed1.jpg"/>
						</div>
						<div style="opacity:0.2;" class="col-md-3" id="contentDiv">
							<input type="hidden" value="${bean.gdsCd}"/>
							<div><h2 style="font-family:'nanumEB'">${bean.gdsNm }</h2></div>
							<div><p style="font-family:'nanumB';">${bean.content }</p></div><br>
							<div><h4 class="text"><span>시작가</span><span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;<fmt:formatNumber pattern="#,###.##"> ${bean.gdsStPrice }</fmt:formatNumber> 원</span></h4></div>
							<div><h4 class="text" ><span>경매 시작 시간</span>&emsp;&emsp;&emsp;<span class="span"> ${bean.actStTime }</span></h4></div>
						</div>
					</div>
				</div>
			</div>
			<div class="hr" style="clear:both; height:2px; background-color:darkgrey;" ></div>
		</c:forEach>
</div>
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>