<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.name{
	width:400px;
	height:100px;
	display:inline-block;
}
.name>div>h2{
	font-family:"nanumEB";
	text-align: center;
	line-height: 80px;
}
.name div{
	display: inline-block;
}
.name>div:nth-child(2){
	margin-left:10px;
}
.name>div>p{
	font-family:"nanumB";
	font-size:13pt;
	text-align: center;
}
.deposit>h2{
	font-family:"nanumEB";
}
.deposit>p{
	font-family:"nanumEB";
}
.charge{
	width: 150px;
	height: 50px;
	background-color: darkgrey;
}
.charge>p{
	font-family: "nanumB";
	color:white;
}
.chargetable{
	margin-top: 50px;
}
.charge_btn{
	background-color: #D8D8D8;
	color:black;
	height:30px;
	font-family: "nanumB";	
   	font-weight: border;	
}
.chargediv{
	width:200px;
	height:100px;
	float: right;
}
.usetable{
	text-align:center;
}
#deposituse{
	margin-top: 50px;
}
</style>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>

<!-- 결제 api연동하기 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script>
	window.onload=function(){
		$('#menuuse').attr('class','active');
		$('#menucharge').attr('class','noactive');
		$('#menurefund').attr('class','noactive');
		$('#deposituse').show();
		$('#depositcharge').hide();
		$('#depositrefund').hide();
		$('#menuuse').click(function(){
			
			$('#menuuse').attr('class','active');
			$('#menucharge').attr('class','noactive');
			$('#menurefund').attr('class','noactive');
			
			$('#deposituse').show();
			$('#depositcharge').hide();
			$('#depositrefund').hide();
			
		});
		
		$('#menucharge').click(function(){
			$('#menucharge').attr('class','active');
			$('#menuuse').attr('class','noactive');
			$('#menurefund').attr('class','noactive');
			
			$('#depositcharge').show();
			$('#deposituse').hide();
			$('#depositrefund').hide();
		});
		$('#menurefund').click(function(){
			$('#menurefund').attr('class','active');
			$('#menucharge').attr('class','noactive');
			$('#menuuse').attr('class','noactive');
			$('#depositrefund').show();
			$('#deposituse').hide();
			$('#depositcharge').hide();
		});

	
		$('#charge_button').click(function(){
			alert("충전이 완료되었습니다!");
		});
	}
	
</script>
</head>
<body>
<div style="margin-top:100px;" class="jumbotron">
  <div class="container">
	  <div class="row">
	  	<div class="name col-md-3 col-md-offset-3">
		  	<div>
		  	
		  	<input type="hidden" value="${loginMbNo}">
		     <c:if test="${empty userVo.userNM}">
		     	<h2>${loginUserId}</h2>
		     </c:if>
		     <c:if test="${!empty userVo.userNM }">
		     	<h2>${userVo.userNM}</h2>
		     </c:if>
		  	</div>
		  	<div><p>님</p></div>
	  	</div>
	  <div class="deposit col-md-3 col-md-offset-2">
		  <h2>현재 예치금</h2>
		  <h2><fmt:formatNumber pattern="#,###.##">
		 	<c:if test="${empty callVo.remnDeposit}">
				0
			</c:if>
			<c:if test="${!empty callVo.remnDeposit}">
				${callVo.remnDeposit}
			</c:if>
		  </fmt:formatNumber> 원</h2>
	  </div>
	  </div>
  </div>
</div>
<ul class="depositmenu nav nav-tabs nav-justified">
  <li role="presentation" id="menuuse" class="noactive"><a href="javascript:void(0)">예치금 사용내역</a></li>
  <li role="presentation" id="menucharge" class="noactive"><a href="javascript:void(0)">예치금 충전</a></li>
  <li role="presentation" id="menurefund" class="noactive"><a href="javascript:void(0)">예치금 환불</a></li>
</ul>
<div class="hr" style="height:3px; background-color: black;"></div>
<div id="deposituse">
	<table class="usetable table">
		<thead>
		<tr>
			<th class="active" style="text-align:center;">사용내역</th>
			<th class="active" style="text-align:center;">사용금액</th>
			<th class="active" style="text-align:center;">사용날짜</th>
		</tr>
		
		
		</thead>
		<c:forEach items="${alist}" var="bean" >
		<tr>
			<td>
				<c:if test="${bean.depositGbCd eq '1'}">
					예치금 충전
				</c:if>
				<c:if test="${bean.depositGbCd eq '2'}">
					예치금 사용
				</c:if>
				<c:if test="${bean.depositGbCd eq '3'}">
					예치금 환불
				</c:if>
			</td> 
			<td>
				<c:if test="${bean.depositGbCd eq '1'}">
					<fmt:formatNumber pattern="##,###.##">${bean.chargeDeposit}</fmt:formatNumber> 원
				</c:if>
				<c:if test="${bean.depositGbCd eq '2'}">
					<fmt:formatNumber pattern="##,###.##">${bean.useDeposit}</fmt:formatNumber> 원
				</c:if>
				<c:if test="${bean.depositGbCd eq '3'}">
					<fmt:formatNumber pattern="##,###.##">${bean.refundDeposit}</fmt:formatNumber> 원
				</c:if>
			</td>
			<td>${bean.depositDt}
			<input type="hidden" name="depositSeq" value="${bean.depositSeq}"/>
			</td>
		</tr>

		<c:set var="remnDeposit" value="${bean.remnDeposit}"/>
		<c:set var="userId" value="${bean.userId}"/>
		<c:set var="mbNo" value="${bean.mbNo }"/>
		</c:forEach>
	</table>
</div>

<form action="/mp/deposit" method="post">
<div id="depositcharge" class="col-md-12">
	<table class="chargetable table">
			<tr>
       			<th class="active" style="text-align:center;">현재 예치금</th>
       			<td><fmt:formatNumber pattern="#,###.##">
       			<c:if test="${empty remnDeposit}">
					0
				</c:if>
				 <c:if test="${!empty remnDeposit}">
					${remnDeposit}
				</c:if>
       			
       			
       			</fmt:formatNumber> 원
       			<input type="hidden" name="" value="${remnDeposit}"/>
       			<input type="hidden" name="" value="${mbNo}"/></td>
       			
       		</tr>
       		<tr>
       			<th class="active" style="text-align:center;">입금인</th>
       			<td> 
       			<c:if test="${empty userVo.userNM}">
		     	${loginUserId}
			     </c:if>
			     <c:if test="${!empty userVo.userNM }">
			     	${userVo.userNM}
			     </c:if>
       			</td>
       		</tr>
       		<tr>
       			<th class="active" style="text-align:center;">입금 금액(원)</th>
       			<td><input type="text" name="chargeDeposit"></td>
       		</tr>
       		<tr>
       			<th class="active" style="text-align:center;">결제수단</th>
       			<td><input type="radio" name="pay" value="계좌이체">계좌이체 &nbsp;
       			<input type="radio" name="pay" value="신용카드">신용카드</td>
       		</tr>
       	</table>
       	<div class="chargediv">
       		<button style="width:150px;" id="charge_button" type="submit" class="btn btn-danger">충전하기</button>
       	</div>
</div>
</form>

<div id="depositrefund" class="col-md-12">
	<table class="chargetable table">
			<tr>
       			<th class="active" style="text-align:center;">현재 예치금</th>
       			<td><fmt:formatNumber pattern="#,###.##">${remnDeposit}</fmt:formatNumber> 원</td>
       		</tr>
			<tr>
       			<th class="active" style="text-align:center;">환불요청 금액(원)</th>
       			<td><input type="text"></td>
       		</tr>
       		<tr>
       			<th class="active" style="text-align:center;">환불수단</th>
       			<td>
       				<input type="radio" name="refund" value="계좌이체">무통장입금 &nbsp;
       				<input type="radio" name="refund" value="신용카드">카드취소<br>
       				<div style="margin-top:10px;">
       					<input type="text" placeholder="예금주명"/>
       					<input type="text" placeholder="은행명"/>
       				</div>
       			
	       			<div>
	       				<input style="width:352px; margin-top:3px;" type="text" placeholder="계좌번호"/>
	       			</div>
       			</td>
       		</tr>
	</table>
	<div class="chargediv">
       		<button style="width:150px; margin-left:50px;" type="button" class="btn btn-danger">환불 신청하기</button>
    </div>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>