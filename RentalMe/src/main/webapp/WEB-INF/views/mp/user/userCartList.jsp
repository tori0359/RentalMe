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
   
      
	   
	   
</style>
<script type="text/javascript">

		/**************************/
		/**** 전역변수 선언시작 ***/
		/**************************/
		var vSumTotPrice = 0;				// 장바구니 토탈금액 셋팅
		var vGdsPriceArr = new Array();		// 장바구니 상품가격 배열
		var vOdrQtyArr = new Array();		// 장바구니 상품수량 배열
		
		<c:set var="alistLength" value="${fn:length(alist)}"></c:set>
		var vCnt = "${alistLength}";	// 장바구니 총 리스트수
		
		<c:forEach items="${alist}" var="bean" varStatus="status">
			vGdsPriceArr[${status.index}] = "${bean.gdsPrice}";
			vOdrQtyArr[${status.index}] = "${bean.odrQty}";
			vSumTotPrice = vSumTotPrice + ${(bean.gdsPrice * bean.odrQty)};
		</c:forEach>
		vSumTotPrice += "";	// 타입변환
		/**************************/
		/**** 전역변수 선언끝 *****/
		/**************************/

		// All 체크박스 선택
		function checkAll(){
		    if( $("#allCheck").is(':checked') ){
		      $("input[name=chBox]").prop("checked", true);
		      $('#sumTotPrice').val(vSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
		    }else{
		      $("input[name=chBox]").prop("checked", false);
		      $('#sumTotPrice').val(0);
		    }
		}

		// 상품 체크박스 선택
		function chBox(num) {
			if($('#chBox'+num).is(':checked')) {
				var fSumTotPrice = 0;	// 함수 내 토탈금액 셋팅
				for(var i=0; i<vCnt; i++) {
					if($('#chBox'+i).is(':checked')) {
						//alert("i = " + i + " vGdsPriceArr["+i+"] = " + vGdsPriceArr[i]);
						fSumTotPrice =  Number(fSumTotPrice) + Number(vGdsPriceArr[i]);
					}
				}
				fSumTotPrice += "";
				$('#sumTotPrice').val(fSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
			} else {
				var fSumTotPrice = 0;	// 함수 내 토탈금액 셋팅
				for(var i=0; i<vCnt; i++) {
					if($('#chBox'+i).is(':checked')) {
						fSumTotPrice = Number(fSumTotPrice) + Number(vGdsPriceArr[i]);
					}	
				}
				fSumTotPrice += "";
				$('#sumTotPrice').val(fSumTotPrice.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
				//$('#sumTotPrice').val(0);
			}
		}


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
			<button type="button" class="delete_btn2 btn">주문하기</button>
		</div>
</div>
      
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>