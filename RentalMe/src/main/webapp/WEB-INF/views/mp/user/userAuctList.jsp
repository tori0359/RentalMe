<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	#title2{
            font-size: 15pt;
            font-weight: bolder;
            font-family: "nanumB";
            margin: 60px 0 50px 0;
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
        }
        
       .ordtable>tbody>tr>td{
           vertical-align: middle;
           text-align: center;
           display: table-cell;
        }
        
      .ordimg{
            width:150px;
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
      #realTotPriceTxt {
		width: 570px;
		text-align: center;
		font-weight: bolder;
	    color: darkred;
	}
</style>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	window.onload = function () {

		 // 구매 모달
	       $('#myModal').on('shown.bs.modal', function (e) {
	    	   var gdsCd = $(e.relatedTarget).data('gds-cd');
	    	   var gdsNm = $(e.relatedTarget).data('gds-nm');
	    	   var bidPrice = $(e.relatedTarget).data('bid-price');
				$(e.currentTarget).find('input[name="crudGbCd"]').val("UUPC");
				$(e.currentTarget).find('input[name="odrGbCd"]').val("10");
				$(e.currentTarget).find('input[name="gdsCd"]').val(gdsCd);
				$(e.currentTarget).find('input[name="gdsNm"]').val(gdsNm);
				$(e.currentTarget).find('input[name="bidPrice"]').val(bidPrice);
				//$(e.currentTarget).find('input[name="odrStsGbCd"]').val("PC");
	       });
	
	       // 포기 모달
	       $('#myModal2').on('shown.bs.modal', function (e) {
	    	   var gdsCd = $(e.relatedTarget).data('gds-cd');
	    	   var gdsNm = $(e.relatedTarget).data('gds-nm');
	    	   var bidPrice = $(e.relatedTarget).data('bid-price');
				$(e.currentTarget).find('input[name="crudGbCd"]').val("UUPC");
				$(e.currentTarget).find('input[name="odrGbCd"]').val("10");
				$(e.currentTarget).find('input[name="gdsCd"]').val(gdsCd);
				$(e.currentTarget).find('input[name="gdsNm"]').val(gdsNm);
				$(e.currentTarget).find('input[name="bidPrice"]').val(bidPrice);
				//$(e.currentTarget).find('input[name="odrStsGbCd"]').val("PC");
	      });
		
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



</script>
</head>
<body>
	<div>
	<div class="titlediv">
       <p id="title2">경매내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: black;"></div>
       	 <div id="info">
       	 <p>
	       	 <input type="hidden" value="${loginMbNo}">
		     <c:if test="${empty userVo.userNM}">
		     	${loginUserId} 님의 경매내역입니다.
		     </c:if>
		     <c:if test="${!empty userVo.userNM }">
		     	${userVo.userNM} 님의 경매내역입니다.
		     </c:if>
		  </p>
       	 </div>
       	<table class="ordtable table">
       	<thead>
       		<tr class="active">
       			<th>경매상품코드
       			<th>경매상품명</th>
       			<th>낙찰일시</th>
       			<th>낙찰가격</th>
       			<th>낙찰상태</th>
       			<th>주문</th>
       		</tr>
       	</thead>
       	<tbody>
       	<c:forEach items="${alist}" var="bean" varStatus="status">
       		<tr>  
       			<td style="vertical-align:middle;">${bean.gdsCd }</td>
       			<td style="text-align:left; vertical-align:middle;">
	                <a style="text-decoration:none; color:black;"href="/rental/Appli/lg/${fn:substring(bean.gdsCd,4,6) }/detail/${bean.gdsCdDetail}">
	                <img class="ordimg" src="${bean.img1}"/><textarea rows="2" cols="30" style="vertical-align:middle; border:0; cursor:pointer; resize: none;" readonly="readonly" >${bean.gdsNm }</textarea>
	                <input type=hidden value="${bean.gdsCd}"/></a>
                </td>
       			<td style="vertical-align:middle;">${bean.bidTime}</td>
       			<td style="vertical-align:middle;"><fmt:formatNumber pattern="##,###.##">${bean.bidPrice}</fmt:formatNumber> 원
       				<input id="auctPrice" type="hidden" value="${bean.bidPrice}"/>
       			</td>
       			<c:if test="${bean.actBidStsCd eq 1}">
       				<td style="vertical-align:middle;">낙찰</td>
       				<td style="vertical-align:middle;">
	       				<button id="odrBtn${status.index }" type="button" class="btn btn-primary" style="font-size: 9pt;" data-toggle="modal" data-target="#myModal" data-gds-cd="${bean.gdsCd }" data-gds-nm="${bean.gdsNm }" data-bid-price="${bean.bidPrice }"  >결제</button>
	       				<!-- 
	       				<form action="/act/cancel" method="post">
	 						<button type="submit" class="btn btn-danger" style="font-size: 9pt;" >포기</button>
	 					</form>
	 					 -->
	 					 <button id="odrBtn${status.index }" type="button" class="btn btn-danger" style="font-size: 9pt;" data-toggle="modal" data-target="#myModal2" data-gds-cd="${bean.gdsCd }">포기</button>
       				</td>
       			</c:if>
       			<c:if test="${bean.actBidStsCd eq 2}">
       				<td style="vertical-align:middle;">예비</td><td></td>
       			</c:if>
       			<c:if test="${bean.actBidStsCd eq 3}">
       				<td style="vertical-align:middle;">종료</td><td></td>
       			</c:if>
       			
       		</tr>
       	</c:forEach>
       	</tbody>
       	</table>
       </div>
       <div class="hr" style="height:2px;"></div>
       <c:forEach items="${alist }" var="bean" varStatus="status">
      <!-- 결제하기 모달 -->
	 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		 <div class="modal-dialog" role="document">
		  	<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">주문하기</h4>
			    </div>
				<div class="modal-body">
				    <div class="row" style="border:0px solid orange;">
 								<h3><label for="realGdsNm">&nbsp;&nbsp;상품정보</label></h3>
  							<div id="detailNm" class="col-md-4" style="border:0px solid black;">
					    	<h4><label for="realGdsNm">상품명</label></h4>
					    	<h4><label for="realGdsPrice">낙찰가격</label></h4>
						</div>
						<div id="detailNm2" class="col-md-8">
					    	<input type="text" class="form-control" id="realGdsCd" name="gdsCd" value="${bean.gdsCd }" style="display: none;">
							<input type="text" class="btn btn-defalut" style="background-color:white; text-align:left;" name="gdsNm" value="gdsNm"  >
							<fmt:setLocale value="ko_KR"></fmt:setLocale>
							<input type="text" class="btn btn-defalut" id="realGdsPrice2" disabled="disabled" style="background-color:white; text-align:left;" name="bidPrice" value="bidPrice" pattern="#,###" />원 "  >
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
				    	<input type="hidden"  id="realTotPrice" style="border:0px;" name="bidPrice" readonly="readonly"  value="${bean.bidPrice }">
				    	<fmt:setLocale value="ko_KR"></fmt:setLocale>
				    	<h2><input type="text"  id="realTotPriceTxt" style="border:0px;" name="bidPrice" readonly="readonly" value="<fmt:formatNumber value="${bean.bidPrice }" pattern="#,###" />원 "></h2>
				    	<input type="hidden" name="gdsCd" value="gdsCd"/>
				    	<input type="hidden" name="gdsNm" value="gdsNm"/>
				    	<input type="hidden" name="bidPrice" value="bidPrice"/>
					</div>
				    <div class="modal-footer">
				    	<button type="button" id="realSubmit" class="btn btn-danger">주문하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				    </div>
		    	</div>
			</div>
    	</div>
	</div>
	<!-- 모달 끝 -->		
	</c:forEach>
	<!-- 반품 모달 -->
	<form id="target" action="/mp/decision" method="post">
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel2">포기요청</h4>
			    </div>
				<div class="modal-body">
					<input type="hidden" name="gdsCd" value="gdsCd"/>
				</div>
				<div class="form-group">
			    	<label for="name" id="cartConfirm">&nbsp;&nbsp;&nbsp;포기요청 하시겠습니까?</label>
				</div>
			    <div class="modal-footer">
			    	<button type="submit" id="questSubmit" class="btn btn-danger">요청</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			    </div>
			</div>
	    </div>
	</div>
	</form>
	<!-- 모달 끝 -->
</body>
</html>