<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
		#title{
	   		font-size: 18pt;
	   		font-weight: bolder;
	   		text-align: center;
	   		font-family: "nanumB";
	   		margin: 50px;
	   }
	   #path{
	   		font-weight: bolder;
	   		font-family: "nanumB";
	   		float:left;
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
	
	   .cartresult{
	   		height:100px;
	   		width: 230px;
	   		float:right;
	   }
	   
	   .cartresult>p{
	   		font-weight:bolder;
	   		font-size: 15pt;
	   		font-family: "nanumB";
	   		line-height: 100px;
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
	   .starR{
		  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		  background-size: auto 100%;
		  width: 30px;
		  height: 30px;
		  display: inline-block;
		  text-indent: -9999px;
		  cursor: pointer;
		}
		.starR.on{
			background-position:0 0;
			color:red;
		}
	  
</style>
<script type="text/javascript">
 	window.onload = function (){
		$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		}); 
	/* 	var class_by_name = document.getElementsByName('test_name')[0].className;
		if(($('.starR')[2].className!="on")
			 */

	} 

	

	$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		  
	});

	
	
	
</script>
<script>

</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
	<p id="title">주문내역</p>
	<div>
	<div class="pathdiv">
       <p id="path">마이페이지> 주문내역</p>
     </div>
     <div class="hr" style="height:3px; background-color: black;"></div>
       	<table class="ordtable table">
       	<thead>
       		<tr class="active">
       			<th>주문일</th>
       			<th>상품명/선택사항</th>
       			<th>수량</th>
       			<th>렌탈기간</th>
       			<th>상품금액</th>
       			<th>주문상태</th>
       			<th>상품후기</th>
			
       		</tr>
       	</thead>
       	<tbody>
       	
       	<c:forEach items="${alist}" var="bean">
       		<tr>  
       			<td>${bean.odrDt}</td>
       			<td><img class="ordimg" src="imgs/bed1.jpg"/>${bean.gdsNm}</td>
       			<td>${bean.odrQty}</td>
       			<td>${bean.agreeTem}개월</td>
       			<td><fmt:formatNumber value="${bean.gdsPrice}" pattern="#,###.##"/>원</td>
       			<td>
       				<c:if test= "${bean.odrStsGbCd eq 'DW'}">
       					입금대기
       				</c:if>
       				<c:if test= "${bean.odrStsGbCd eq 'OC'}">
       					주문확정
       				</c:if>
       				<c:if test= "${bean.odrStsGbCd eq 'RW'}">
       					반품대기
       				</c:if>
       				<c:if test= "${bean.odrStsGbCd eq 'RC'}">
       					반품확정
       				</c:if>
       			</td>
       			<td><button type="button" class="btn" style="font-size: 9pt;" data-toggle="modal" data-target="#myModal">후기쓰기</button></td>
       			<c:set var="gdsNm" value="${bean.gdsNm}"></c:set>
       		</tr>
       	</c:forEach>
       	</tbody>
       	</table>
       </div>
      <div class="hr"></div>
     <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">후기 쓰기</h4>
      </div>
      
      <div class="modal-body">
       	<label>상품명</label> <div>${gdsNm}</div>
       	<br>
       	<div class="hr"></div>
       	<br>
       	<label>후기</label><br>
		<div class="starRev">
		  <span class="starR on">별1</span>
		  <span class="starR">별2</span>
		  <span class="starR">별3</span>
		  <span class="starR">별4</span>
		  <span class="starR">별5</span>
		</div>
		<textarea style="width:100%; height:200px;"  placeholder="후기를 입력해주세요."></textarea>
       	
      </div>
     
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">저장</button>
      </div>
	</div>
    </div>
    </div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>