<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 결제 api연동하기 (아임포트)-->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<style type="text/css">
		#title2{
	   		font-size: 15pt;
	   		font-weight: bolder;
	   		font-family: "nanumB";
	   		margin: 60px 0 50px 0;;
	   }
	   
	   #choosedel{
	   		font-family: "nanumR";
	   		width:55px;
	   		height:30px;
	   		float:right;
	   		color:black;
	   		font-weight:600;
	   }

	    .ordtable>thead>tr>th{
        	text-align:center;
        	font-family: "nanumB";
        }
        .ordtable>thead>tr>th:nth-child(1){
        	text-align:left;
        }
        
        .ordtable>tbody>tr>td{
        	vertical-align: middle;
        	text-align: center;
        	display: table-cell;
        	font-family: "nanumB";
        }
        .ordtable>tbody>tr>td:nth-child(1),
        .ordtable>tbody>tr>td:nth-child(2){
        	text-align:left;
        }
        
	   .ordimg{
	   		width:100px;
	   }
	   
	    .delete_btn1{
	   		background-color: #D8D8D8;
	   		color:black;
	   		height:30px;
	   		font-family: "nanumB";	
	   		font-weight: border;	
	   }
	   
	   .delete_btn2{
	   		background-color: #4d4d4d;
	   		color:white;
	   		height:30px;
	   		font-family: "nanumB";
	   		font-weight: border;		
	   }
	   
	   .btn:hover,
	   .btn:focus{
	   		background-color: #D8D8D8;
	   }
	
	   .cartresult{
	   		height:100px;
	   		width: 280px;
	   		float:right;
	   		display: inline;
	   		
	   }
	   
	   .cartresult>p{
	   		font-weight:bolder;
	   		font-size: 15pt;
	   		font-family: "nanumB";
	   		display: inline;
	   		
	   }
	   
	   #sumTotPrice{
	   		width: 120px;
	   		font-weight:bolder;
	   		font-size: 15pt;
	   		font-family: "nanumB";
	   		display: inline;
	   		text-align:right;
	   		border: 0px;
	   }
	   
	   .cartbtn{
	   		width:180px;
	   		height:50px;
	   		float:right;
	   		margin-top:25px;
	   }
	   .pathdiv{
	   		height:30px;
	   }
	   .titlediv{
            height:40px;
      }
        #info{
	      	width:93%;
	      	margin: 20px auto;
	      	border:7px solid #E6E6E6;
	      	padding: 15px;
      }
      
      #info p{
	      	line-height:20px;
	      	font-family:"nanumB";
      }
	.tdtext{
      		margin:30px 0;
      }
/* --------- 결제하기 모달 시작 --------- */
#realTotPrice { 
	width: 120px;
	text-align: center;
	vertical-align: middle;
	color: white;
}
#realTotPriceTxt {
	width: 570px;
	text-align: center;
}
#realTotPriceTxt {
	font-weight: bolder;
    color: darkred;
}
/* --------- 결제하기 모달 끝 --------- */
	   
	   
</style>
<script type="text/javascript">

	window.onload = function () {
		$('#realGdsPrice').val(vSumTotPrice);
		$('#realGdsPrice2').val(vSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");

		$('#realTotPrice').val(vSumTotPrice);
		$('#realTotPriceTxt').val((vSumTotPrice.toString()).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
	}

	/**************************/
	/**** 전역변수 선언시작 ***/
	/**************************/
	var vSumTotPrice = 0;				// 장바구니 토탈금액 셋팅
	var vGdsCdArr = new Array();		// 장바구니 상품코드 배열
	var vCartSeqArr = new Array();		// 장바구니 일련번호 배열
	var vGdsPriceArr = new Array();		// 장바구니 상품가격 배열
	var vOdrQtyArr = new Array();		// 장바구니 상품수량 배열
	var vAgreeTermArr = new Array();	// 장바구니 계약기간 배열
	var vGdsNmArr = new Array();		// 장바구니 상품명 배열
	
	<c:set var="alistLength" value="${fn:length(alist)}"></c:set>
	var vCnt = "${alistLength}";	// 장바구니 총 리스트수
	var vCheckCnt = vCnt;			// 장바구니 체크 총 갯수(기본 All 체크 true 상태)
	
	<c:forEach items="${alist}" var="bean" varStatus="status">
		vGdsCdArr[${status.index}] = "${bean.gdsCd}";
		vCartSeqArr[${status.index}] = "${bean.cartSeq}";
		vGdsPriceArr[${status.index}] = "${bean.gdsPrice}";
		vOdrQtyArr[${status.index}] = "${bean.odrQty}";
		vAgreeTermArr[${status.index}] = "${bean.agreeTerm}";
		vGdsNmArr[${status.index}] = "${bean.gdsNm}";
		vSumTotPrice = vSumTotPrice + ${(bean.gdsPrice * bean.odrQty)};
	</c:forEach>
	vSumTotPrice += "";	// 타입변환

	var radioVal = "90";		// 결제정보 (10:카드  90:무통장(default))
	
	/**************************/
	/**** 전역변수 선언끝 *****/
	/**************************/

	// All 체크박스 선택
	function checkAll(){
	    if( $("#allCheck").is(':checked') ){
			$("input[name=chBox]").prop("checked", true);
			$('#sumTotPrice').val(vSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
			$('#realGdsNm').val(vGdsNmArr[0] + " 외 " + (vCnt-1) + "건");		// 장바구니 대표상품명
			$('#realGdsPrice').val(vSumTotPrice);	// 장바구니 주문하기모달 총 금액
			$('#realGdsPrice2').val(vSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");	// 장바구니 주문하기모달 총 금액
			$('#realTotPrice').val(vSumTotPrice);	// 장바구니 주문하기모달 토탈 총 금액
			$('#realTotPriceTxt').val((vSumTotPrice.toString()).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");	// 장바구니 주문하기모달 토탈 총 금액
			$('#realSubmit').prop("disabled",false);
			$('#realSubmit').attr('title','');
			vCheckCnt = vCnt; 
	    }else{
			$("input[name=chBox]").prop("checked", false);
			$('#sumTotPrice').val(0);
			$('#realGdsPrice').val(0);	
			$('#realGdsPrice2').val("0원");
			$('#realTotPrice').val(0);	
			$('#realTotPriceTxt').val("0원");
			$('#realSubmit').prop("disabled","disabled");
			$('#realSubmit').attr('title','선택한 상품이 없습니다.');
			vCheckCnt = 0;
	    }
	}

	// 상품 체크박스 선택
	function chBox(num) {
		if($('#chBox'+num).is(':checked')) {
			var fSumTotPrice = 0;	// 함수 내 토탈금액 셋팅
			var fCnt = 0;	// 함수 내 선택체크박스 수량
			var fTargetNm = "";	// 함수 내 대표상품명
			for(var i=0; i<vCnt; i++) {
				if($('#chBox'+i).is(':checked')) {
					//alert("i = " + i + " vGdsPriceArr["+i+"] = " + vGdsPriceArr[i]);
					fSumTotPrice =  Number(fSumTotPrice) + (Number(vGdsPriceArr[i]) * Number(vOdrQtyArr[i]));
					fCnt = Number(fCnt) + 1;
					if(fCnt == 1) {
						//alert(vGdsNmArr[i]);
						fTargetNm = vGdsNmArr[i];
					}
				}
			}
			fSumTotPrice += "";
			vCheckCnt = fCnt;
			$('#sumTotPrice').val(fSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));	// 장바구니 총 금액'
			$('#realGdsNm').val(fTargetNm + " 외 " + (fCnt-1) + "건");		// 장바구니 대표상품명
			$('#realGdsPrice').val(fSumTotPrice);	// 장바구니 주문하기모달 총 금액
			$('#realGdsPrice2').val(fSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");	// 장바구니 주문하기모달 총 금액
			$('#realTotPrice').val(fSumTotPrice);	// 장바구니 주문하기모달 토탈 총 금액
			$('#realTotPriceTxt').val((fSumTotPrice.toString()).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");	// 장바구니 주문하기모달 토탈 총 금액
			$('#realSubmit').prop("disabled",false);
			$('#realSubmit').attr('title','');
		} else {
			var fSumTotPrice = 0;	// 함수 내 토탈금액 셋팅
			var fCnt = 0;	// 함수 내 선택체크박스 수량
			var fTargetNm = "";	// 함수 내 대표상품명
			for(var i=0; i<vCnt; i++) {
				if($('#chBox'+i).is(':checked')) {
					fSumTotPrice = Number(fSumTotPrice) + (Number(vGdsPriceArr[i]) * Number(vOdrQtyArr[i]));
					fCnt = Number(fCnt) + 1;
					if(fCnt == 1) {
						fTargetNm = vGdsNmArr[i];
					}
				}	
			}
			if(fCnt == 0) {
				$('#realSubmit').prop("disabled","disabled");
				$('#realSubmit').attr('title','선택한 상품이 없습니다.');
			}
			fSumTotPrice += "";
			vCheckCnt = fCnt;
			$('#sumTotPrice').val(fSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
			$('#realGdsNm').val(fTargetNm + " 외 " + (fCnt-1) + "건");
			$('#realGdsPrice').val(fSumTotPrice);
			$('#realGdsPrice2').val(fSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");	
			$('#realTotPrice').val(fSumTotPrice);
			$('#realTotPriceTxt').val((fSumTotPrice.toString()).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
		}
	}

	// 결제하기 클릭
	function btnOdr() {
		var sUserId = "${loginUserId}";
		// 세션체크
		if((sUserId == "") || (sUserId == null)) {
			location.href = "/login";
		} else {

		}
	}

	// 결제하기 라디오버튼(무통장입금)
	$(document).on("click", "#inlineRadio1", function(){
		radioVal = $('input[name="inlineRadioOptions"]:checked').val();
		$('#bank').show();
		$('#bankInfo').show();
	});

	// 결제하기 라디오버튼(카카오페이)
	$(document).on("click", "#inlineRadio2", function(){
		radioVal = $('input[name="inlineRadioOptions"]:checked').val();
		$('#bank').hide();
		$('#bankInfo').hide();
	});

	// 결제하기 모달 결제하기
	$(document).on("click", "#realSubmit2", function(){

		var amount = $('#realTotPrice').val();	// 결제할 실제 금액
		var userId = "${loginUserId}";
		var crudGbCd = "IICART";
		var odrGbCd = "10";
		var payGbCd = radioVal;
		var mbNo = "${sessionMbNo}";
		
		// ajax 전송용 배열 선언
		//var checkValueArr = new Array();	// 장바구니 체크박스상태 배열
		var gdsCdArr = new Array();			// 장바구니 상품코드 배열
		var cartSeqArr = new Array();		// 장바구니 일련번호 배열
		var gdsPriceArr = new Array();		// 장바구니 상품가격 배열
		var odrQtyArr = new Array();		// 장바구니 상품수량 배열
		var agreeTermArr = new Array();		// 장바구니 계약기간 배열
		
		var j = 0;	// 건너뛴 i값 만큼 증가
		for(var i=0; i<vCnt; i++) {
			// 체크대상 리스트 value 변경
			// 대상 리스트만 전송
			if($('#chBox'+i).is(':checked')) {
				//checkValueArr[i-j] = "1";
				gdsCdArr[i-j] = vGdsCdArr[i];
				cartSeqArr[i-j] = vCartSeqArr[i];
				gdsPriceArr[i-j] = vGdsPriceArr[i];
				odrQtyArr[i-j] = vOdrQtyArr[i];
				agreeTermArr[i-j] = vAgreeTermArr[i];
			} else {
				j = j+1;
			}
		}

		// 전송대상 data 
		var allData = {'crudGbCd':crudGbCd, 'odrGbCd':odrGbCd, 'payGbCd':payGbCd, 'mbNo':mbNo, 'totOdrAmt':amount,'gdsCdArr':gdsCdArr, 'cartSeqArr':cartSeqArr,
					   'gdsPriceArr':gdsPriceArr, 'odrQtyArr':odrQtyArr, 'agreeTermArr':agreeTermArr  };

		// 배열값 테스트...
		/*
		for(var i=0; i<vCnt; i++) {
			alert("checkValueArr["+i+"] = " + checkValueArr[i] + "..." + "gdsCdArr["+i+"] = " + gdsCdArr[i] + "..." + "cartSeqArr["+i+"] = " + cartSeqArr[i] + "..." + 
					"gdsPriceArr["+i+"] = " + gdsPriceArr[i] + "..." + "odrQtyArr["+i+"] = " + odrQtyArr[i] + "..." + "agreeTermArr["+i+"] = " + agreeTermArr[i]);
		}
		*/
		
		// 카드(카카오페이 결제)
		if(payGbCd == 10) {
			var IMP = window.IMP;
			IMP.init('imp86711610');
			
			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'vbank',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '렌탈미 렌탈상품 결제',
			    amount : amount,
			    buyer_name : userId
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        
					$.ajax({
						url: "/mp/cart/odr",
						type: "post",
						data: allData,
						success : function(){
							location.href = "/mp/";
						}
					});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		
		} else {
			if(true) {
				var msg = '주문이 접수되었습니다.';
				$.ajax({
					url: "/mp/cart/odr",
					type: "post",
					data: allData,
					success : function(){
						location.href = "/mp/";
					}
				});
			} else {
				var msg = '주문에 실패하였습니다.';
		        msg += '에러내용 : 무통장입금 주문에러 ERR 900';
			}
			alert(msg);
		}

	});

</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
<div style="height:100%;">
	<div>
	<div class="titlediv">
       <p id="title2">장바구니</p>
     </div>
     <div class="hr" style="height:3px; background-color: black;"></div>
       	 <div id="info">
       	 <p>
	       	 <input type="hidden" value="${loginMbNo}">
		     <c:if test="${empty userVo.userNM}">
		     	${loginUserId} 님의 장바구니 내역입니다.
		     </c:if>
		     <c:if test="${!empty userVo.userNM }">
		     	${userVo.userNM} 님의 장바구니 내역입니다.
		     </c:if>
		  </p>
       	 </div>
       <a href="#" id="choosedel">선택삭제</a>
       <script>
		 $("#choosedel").click(function(){
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
		   var checkArr = new Array();
		   var checkSeq = new Array();
		   
		   $("input[class='chBox']:checked").each(function(){
		    checkArr.push($(this).attr("data-cartNum"));
		    checkSeq.push($(this).attr("data-cartSeq"));
		   });
		    
		   $.ajax({
		    url : "/mp/deleteCart",
		    type : "post",
		    data : { chbox : checkArr, chseq:checkSeq },
		    success : function(){
		     location.href = "/mp/cart";
		    }
		   });
		  } 
		 });
		</script>
       	<table class="ordtable table">
			<thead>
				<tr class="active">
					<th><input type="checkbox" checked="checked" name="allCheck" id="allCheck" onclick="checkAll();"/></th>
					<th>상품명/선택사항</th>
					<th>수량</th>
					<th>렌탈기간</th>
					<th>상품금액</th>
					<th>상품총금액</th>
				</tr>
			</thead>
	       	<tbody>
   		 	<c:set var="sumPrice" value="0"/>
	       	<c:forEach items="${alist}" var="bean" varStatus="status">
	       		<tr>  
	       			<td><input type="checkbox" class="chBox" id="chBox${status.index }" onclick="chBox(${status.index});" checked="checked" name="chBox" data-cartNum="${bean.gdsCd}" data-cartSeq="${bean.cartSeq }">
	       			</td>
	       			<td>
	       				<a style="text-decoration:none; color:black;"href="#">
	       				<img class="ordimg" src="../${bean.RImg1}"/>${bean.gdsNm}
	       				</a>
	       			</td>
	       			<td><p class="tdtext">${bean.odrQty}</p></td>
	       			<td><p class="tdtext">${bean.agreeTerm}개월</p></td>
	       			<td><p class="tdtext"><fmt:formatNumber value="${bean.gdsPrice}" pattern="#,###.##"/>원
	       			<td><p class="tdtext"><fmt:formatNumber value="${bean.odrQty * bean.gdsPrice}" pattern="#,###.##"/>원
	       			</p></td>
	       		</tr>
	       	<c:set var="sumPrice" value="${sumPrice +(bean.gdsPrice * bean.odrQty)}"/>
	       	</c:forEach>
	    	</tbody>
    	</table>
		</div>
		<div class="hr" style="height:2px;"></div>
		<div class="cartresult">
		<br><br>
			<p>총 주문 금액 :</p><input type="text" id="sumTotPrice" readonly="readonly" value="<fmt:formatNumber value="${sumPrice}" pattern="#,###.##"/>"> <p>원</p>
		</div>
		<div class="hr" style="height:2px; margin-top:100px;"></div>
		<div class="cartbtn">
			<button type="button" class="delete_btn1 btn">계속 쇼핑하기</button>
			<button type="button" id="realSubmit" class="delete_btn2 btn" onclick="btnOdr();" data-backdrop="static"  data-toggle="modal" data-placement="top" title="" data-target="#myModal1">주문하기</button>
		</div>
		<!-- 주문하기 모달 -->
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel1"></h4>
				    </div>
					<div class="modal-body">
					    <div class="row" style="border:0px solid orange;">
  								<h3><label for="realGdsNm">&nbsp;&nbsp;상품정보</label></h3>
   							<div id="detailNm" class="col-md-4" style="border:0px solid black;">
						    	<h4><label for="realGdsNm">상품명</label></h4>
						    	<!-- <h4><label for="realGdsPrice">총 렌탈가격(월)</label></h4>  -->
						    	<h4><label for="realGdsPrice2">총 렌탈가격(월)</label></h4>
							</div>
							<div id="detailNm" class="col-md-8" style="border:0px solid black;">
								<c:set var="alistLength" value="${fn:length(alist)}"></c:set>
								<c:forEach items="${alist }" var="alist" varStatus="status">
									<c:if test="${status.index eq '0' }">
								    	<!-- <input type="text" class="form-control" id="realGdsCd" disabled="disabled" style="background-color:white;" name="gdsCd" value="${alist.gdsCd }" style="display: none;">  -->
										<input type="text" class="btn btn-default" id="realGdsNm" disabled="disabled" style="background-color:white; border:solid 0px; text-align:left;" name="gdsNm" value="${alist.gdsNm } 외 ${alistLength-1 }건"  >
										<!-- <input type="text" class="form-control" id="realGdsPrice" name="gdsPrice" value="${alist.gdsPrice }" > -->
										<fmt:setLocale value="ko_KR"></fmt:setLocale>
										<input type="text" class="btn btn-default" id="realGdsPrice2" disabled="disabled" style="background-color:white; border:solid 0px; text-align:left;" name="gdsPrice2" value="<fmt:formatNumber value="${alist.gdsPrice }" pattern="#,###" />원 "  >
							    	</c:if>
						    	</c:forEach>
							</div>
						</div>
						<div class="row" style="border:0px solid orange;">
							<h3><label>&nbsp;&nbsp;결제정보</label></h3>
							<label class="radio-inline">
						  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="inlineRadioOptions" id="inlineRadio1" checked="checked" value="90">무통장입금
							</label>
							<label class="radio-inline">
						  		<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="10">카카오페이
							</label>
							<h5><label id="bank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 예금주명 : (주)렌탈미 &nbsp;&nbsp;&nbsp; 입금계좌번호 : 415015-92-928253(농협)</label></h5>
							<h5><label id="bankInfo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 무통장입금은 주문하기 후 입금이 완료되어야 최종 주문확정처리 됩니다.</label></h5>
						</div>
						<div class="form-group" id="realTotPriceTxtCls">
					    	<input type="text"  id="realTotPrice" style="border:0px;" name="realTotPrice" readonly="readonly"  value="${list1.gdsPrice }">
					    	<fmt:setLocale value="ko_KR"></fmt:setLocale>
					    	<h2><input type="text"  id="realTotPriceTxt" style="border:0px;" name="realTotPriceTxt" readonly="readonly" value="<fmt:formatNumber value="${list1.gdsPrice }" pattern="#,###" />원 "></h2>
						</div>
					    <div class="modal-footer">
					    	<button type="button" id="realSubmit2" class="btn btn-danger">주문하기</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					    </div>
			    	</div>
				</div>
	    	</div>
		</div>
		<!-- 모달 끝 -->
</div>
      
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>