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

<!-- 결제 api연동하기 (아임포트)-->
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
			
			var amount = $('#chargeDeposit').val();
			var userId = $('#UserId').val();
			
			alert(amount+"원을 충전하시겠습니까?");
			
			var IMP = window.IMP;
			IMP.init('imp86711610');
			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'vbank',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '렌탈미 예치금 충전',
			    amount : amount,
			    buyer_name : userId
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        
					$.ajax({
						url: "/mp/deposit",
						type: "post",
						data: { "chargeDeposit" : rsp.paid_amount },
						success : function(){
							location.href = "/mp/deposit";
						}

					});
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }

			    alert(msg);
			});


			
		});


		//예치금 환불 신청 버튼 눌렀을 때
		$('#refund_button').click(function(){

			//입력한 환불 요청 금액 저장
			var refundinput = $('#refundinput').val();

			//현재 예치금 
			var remnDepositInput = $('#remnDepositInput').val();

		
			var refund;
			var remnDeposit;
			//환불 요청 금액이 공백이 아닐 때
			if(refundinput != ""){
				$('#refund').val(refundinput);
				refund = $('#refund').val();

				$('#remnDeposit').val(refundinput);
				remnDeposit = $('#remnDeposit').val();

				$.ajax({
					url:"deposit/refund",
					type: "post",
					data: { "refund" : refund, "remnDeposit" : remnDeposit },
					success : function(data){
						var msg = data;
						
						if(msg == "duplication"){
							$('#refundtext').text("이미 요청된 환불이 있습니다.");
						}else if(msg == "not duplication"){
							$('#refundtext').text("관리자에게 환불이 요청되었습니다.");
						}else{
							$('#refundtext').text("예치금이 부족합니다.");
						}
					}				
				});

			}else{
				$('#refundtext').text("환불요청 금액을 입력하세요.");
			}
			
			$('#myModal').modal('show');
			
			//모달 확인버튼을 눌렀을 때
			$('#modalconfirm').click(function(){
				$('#myModal').modal('hide');
			});

			
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

<!-- <form action="/mp/deposit" method="post"> -->
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
			     <input type="hidden" id="UserId" value="${loginUserId}"/>
       			</td>
       		</tr>
       		<tr>
       			<th class="active" style="text-align:center;">입금 금액(원)</th>
       			<td><input type="text" name="chargeDeposit" id="chargeDeposit"></td>
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
<!-- </form> -->
<div id="depositrefund" class="col-md-12">


	<table class="chargetable table">
			<tr>
       			<th class="active" style="text-align:center;">현재 예치금</th>
       			<td>
       			<fmt:formatNumber pattern="#,###.##">
	       			<c:if test="${empty remnDeposit}">
						0
					</c:if>
					 <c:if test="${!empty remnDeposit}">
						${remnDeposit}
					</c:if>
       			</fmt:formatNumber> 원
       			<input type="hidden" id="remnDepositInput" name="remnDepositInput" value="${remnDeposit}"/>
				</td>
       			
       		</tr>
			<tr>
       			<th class="active" style="text-align:center;">환불요청 금액(원)</th>
       			<td><input type="text" name="refundinput" id="refundinput"></td>
       		</tr>
       		<tr>
       			<th class="active" style="text-align:center;">환불수단</th>
       			<td>
       				<input type="radio" name="refund2" value="계좌이체">무통장입금 &nbsp;
       			</td>
       		</tr>
       		
	</table>
	<div>
       			<p style="font-family:'nanumB';"> *환불요청 확인 후 유선으로 처리 도와드리겠습니다.</p>
       		</div>
       		
	<div class="chargediv">
       		<button style="width:150px; margin-left:50px;" class="btn btn-danger" id="refund_button">환불 신청하기</button>
    </div>

	<!-- <form action="/mp/deposit/refund" method="post"> -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="height:10px;" aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
	      <div class="modal-body">
	       <input type="hidden" id="refund" name="refund"/>
	       <input type="hidden" id="remnDeposit" name="remnDeposit"/>
	       <div style="text-align:center;">
	       <span id="refundtext" style="line-height:16pt; font-family:'nanumB'; font-weight:bolder; font-size:11pt;"></span>
	       </div>
	      </div>
	      <div class="modal-footer">
	        <button style="background:black;" type="submit" id="modalconfirm" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- </form> -->
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>