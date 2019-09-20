<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mpMng.css" >
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mpMng.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
<script type="text/javascript">

	window.onload = function() {

	   // 구매 모달
       $('#myModal').on('shown.bs.modal', function (e) {
    	   var gdsCd = $(e.relatedTarget).data('gds-cd');
    	   var odrNo = $(e.relatedTarget).data('odr-no');
			$(e.currentTarget).find('input[name="crudGbCd"]').val("UUAC");
			$(e.currentTarget).find('input[name="odrGbCd"]').val("30");
			$(e.currentTarget).find('input[name="gdsCd"]').val(gdsCd);
			$(e.currentTarget).find('input[name="odrNo"]').val(odrNo);
       });

   	   // 구매 모달
       $('#myModal2').on('shown.bs.modal', function (e) {
    	   var gdsCd = $(e.relatedTarget).data('gds-cd');
			$(e.currentTarget).find('input[name="gdsCd"]').val(gdsCd);
       });

       

	}

</script>
</head>
<body>
   <div class="titlediv">
       <p id="title">경매 내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <div id="info">
     <p style="text-align: center;">
     	
     </p>
     </div>
	<table class="ordtable table">
	<thead>
		<tr class="active">
			<th>경매번호</th>
			<th>경매상품명</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>낙찰가격</th>
			<th>낙찰일시</th>
			<th>낙찰상태</th>
			<th>낙찰취소</th>
			<th>주문상태/주문번호</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${alist }" var="bean">
		<tr>
			<td style="vertical-align:middle;">${bean.gdsCd }</td>
			<td style="vertical-align:middle;">
				<textarea rows="2" cols="40" style="vertical-align:middle; border:0; cursor:pointer; resize: none; text-align:center;" readonly="readonly">${bean.gdsNm }</textarea>
			</td>
			<td style="vertical-align:middle;">${bean.mbNo }</td>
			<td style="vertical-align:middle;">${bean.userNm }</td>
			<td style="vertical-align:middle;"><fmt:formatNumber pattern="##,###.##">${bean.bidPrice}</fmt:formatNumber>원
   				<input id="auctPrice" type="hidden" value="${bean.bidPrice}"/>
   			</td>
			<td style="vertical-align:middle;">${fn:substring(bean.bidTime,0,10)}
       			<br>${fn:substring(bean.bidTime,11,19)}
       		</td>
			<c:if test= "${bean.actBidStsCd == 1}">
				<td style="vertical-align:middle;">낙찰</td>
				<td style="vertical-align:middle;">
					<input type="hidden" name="gdsCd" value="${bean.gdsCd }">
					<c:choose>
						<c:when test="${bean.odrStsGbCd eq 'DW' || bean.odrStsGbCd eq 'AC'}">
							<button class="btn btn-default btn-sm" style="opacity: 0.7;" disabled="disabled" >취소</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-danger btn-sm" type="submit" style="font-size: 9pt;  margin-top:15px; margin-bottom:15px;"  data-toggle="modal" data-target="#myModal2" data-gds-cd="${bean.gdsCd }" >취소</button>
						</c:otherwise>	
					</c:choose>
				</td>
				<td style="vertical-align:middle;">
				<c:if test="${empty bean.odrStsGbCd }">
					<button id="odrBtn${status.index }" type="button" class="btn btn-default" style="font-size: 9pt;  margin-top:15px; margin-bottom:15px;  opacity:0.7" disabled="disabled" >주문대기</button>
				</c:if>
				<c:if test="${bean.odrStsGbCd eq 'DW' }">
					<button id="odrBtn${status.index }" type="button" class="btn btn-success" style="font-size: 9pt; margin-top:10px;"  data-toggle="modal" data-target="#myModal" data-gds-cd="${bean.gdsCd }" data-odr-no="${bean.odrNo }" >입금확인</button><br>
					<p class="tdtext2" id="odrNo${status.index }" style="text-align:center; color:red; margin-top:-5px; ">
               			<br>${bean.odrNo} &nbsp;
              		</p> 
				</c:if>
				<c:if test="${bean.odrStsGbCd eq 'AC' }">
					<button id="odrBtn${status.index }" type="button" class="btn btn-default" style="font-size: 9pt;  margin-top:10px;  opacity:0.7" disabled="disabled" >주문완료</button><br>
					<p class="tdtext2" id="odrNo${status.index }" style="text-align:center; color:red; margin-top:-5px; ">
               			<br>${bean.odrNo} &nbsp;
              		</p> 
				</c:if>
				</td>
			</c:if>			
			<c:if test= "${bean.actBidStsCd == 2}">
				<td style="vertical-align:middle;">예비</td>
				<td style="vertical-align:middle;"></td>
			</c:if>
			<c:if test= "${bean.actBidStsCd == 3}">
				<td style="vertical-align:middle;">종료</td>
				<td style="vertical-align:middle;"></td>
			</c:if>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>
    <div class="hr" style="height:2px;"></div>
	<!-- 입금확인 모달 -->
    <form id="target" action="/mp/mng/act/spec/decision" method="post">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">입금확인</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			    </div>
				<div class="modal-body">
					<input type="hidden" class="custom-control-input" name="crudGbCd" value="crudGbCd"/>
			    	<input type="hidden" class="custom-control-input" name="odrGbCd" value="odrGbCd"/>
			    	<input type="hidden" class="custom-control-input" name="gdsCd" value="gdsCd"/>
			    	<input type="hidden" class="custom-control-input" name="odrNo" value="odrNo"/>
			    	입금완료 하시겠습니까?
				</div>
			    <div class="modal-footer">
			    	<button type="submit" id="questSubmit" class="btn btn-success">완료</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			    </div>
			</div>
	    </div>
	</div>
	</form>
	<!-- 모달 끝 -->
	<!-- 낙찰취소 모달 -->
    <form id="target" action="/mp/mng/act/spec/cancel" method="post">
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel2">낙찰취소</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			    </div>
				<div class="modal-body">
			    	<input type="hidden" class="custom-control-input" name="gdsCd" value="gdsCd"/>
			    	낙찰취소 하시겠습니까?
				</div>
			    <div class="modal-footer">
			    	<button type="submit" id="questSubmit" class="btn btn-success">취소승인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			    </div>
			</div>
	    </div>
	</div>
	</form>
	<!-- 모달 끝 -->
	<div id="paginationBox">

		<ul class="pagination">

			<c:if test="${paging.prev}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="prevEvent('${path}','${paging.page}', '${paging.range}', '${paging.rangeSize}')">
						&lt;
					</a>
				</li>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
				<li class="page-item <c:out value="${paging.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#" onClick="pageChange('${path}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
						${idx} 
					</a>
				</li>
			</c:forEach>
			<c:if test="${paging.next}">
				<li class="page-item">
					<a class="page-link" href="#" onClick="nextEvent('${path}','${paging.range}', '${paging.range}', '${paging.rangeSize}')" >
						&gt;
					</a>
				</li>
			</c:if>
		</ul>
	</div>

</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>