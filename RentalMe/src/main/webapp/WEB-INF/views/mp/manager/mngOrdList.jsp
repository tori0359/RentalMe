<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
      #title{
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
      .titlediv{
            height:40px;
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
      .satis h4{
         font-family:"nanumEB";
      }
      .satis p{
         font-family:"nanumB";
      }
      #red{
         color:red;
      }
      span em.warning{
        color:#f00;
        fontweight: bold;
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
      #cartConfirm {
		font-size: 15pt;
		font-weight: bolder;
	}
   
</style>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<script type="text/javascript">
   $(function(){
	   	/*
		if($('.titlediv').text().indexOf('주문') != -1){
			$('.changeVal').eq(1).hide();
			for(var i=0; i<$('.stscdtxt').length; i++){
				if($('.stscdtxt').eq(i).text().indexOf('입금') == -1){
					$('.stscdtxt').eq(i).parent().children().first().hide();
					$('.stscdtxt').eq(i).parent().prepend('<td></td>');
				}
			}
		*/

			/*
			$('.depositConfirm').click(function(){
				$(this).parent().append('입금확인');
				$(this).hide();
				return false;
			});
			*/
		}
		/*
		else if($('.titlediv').text().indexOf('반품') != -1){
			$('.changeVal').eq(0).hide();
			for(var i=0; i<$('.stscdtxt').length; i++){
				if($('.stscdtxt').eq(i).text().indexOf('반품대기') == -1){
					$('.stscdtxt').eq(i).parent().children().first().hide();
					$('.stscdtxt').eq(i).parent().prepend('<td></td>');
				} else if($('.stscdtxt').eq(i).text().indexOf('반품대기') != -1){
					$('.stscdtxt').eq(i).html('<button class="returnConfirm">확정</button> <button class="returnCancel">반려</button>');						
				}
			}
			
			$('.returnConfirm').click(function(){
				$(this).parent().append('반품확정');
				$(this).parent().find('button').hide();
				return false;			
			});
			$('.returnCancel').click(function(){
				$(this).parent().append('반품반려');
				$(this).parent().find('button').hide();
				return false;			
			});
		}
		*/

		// 입금확인 모달
       $('#myModal').on('shown.bs.modal', function (e) {
			var odrNo = $(e.relatedTarget).data('odr-no');
			$(e.currentTarget).find('input[name="crudGbCd"]').val("UUOC");
			$(e.currentTarget).find('input[name="odrGbCd"]').val("10");
			$(e.currentTarget).find('input[name="odrNo"]').val(odrNo);
			//$(e.currentTarget).find('input[name="odrStsGbCd"]').val("PC");
       });

		// 반품확인 모달
       $('#myModal2').on('shown.bs.modal', function (e) {
			var odrNo = $(e.relatedTarget).data('odr-no');
			$(e.currentTarget).find('input[name="crudGbCd"]').val("UURC");
			$(e.currentTarget).find('input[name="odrGbCd"]').val("10");
			$(e.currentTarget).find('input[name="odrNo"]').val(odrNo);
			//$(e.currentTarget).find('input[name="odrStsGbCd"]').val("PC");
       });

		//alert("화면로딩 끝!");
		
   });
    /**************************/
	/**** 전역변수 선언시작 ***/
	/**************************/
    function getPost(mode){
		var theForm=document.frmSubmit;
		if(mode == "ord"){
			theForm.method="post";
			theForm.action="/mp/mng/update";
		}else if(mode == "rtn"){
			theForm.method="post";
			theForm.action="/mp/mng/cart/update";
		}
		theForm.submit();
	}
	/**************************/
	/**** 전역변수 선언끝 *****/
	/**************************/
   
</script>
</head>
<body>
   <div>
   <div class="titlediv">
       <p id="title">${sub } 관리</p>
     </div>
     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
     <div id="info">

     </div>
     <form name="frmSubmit">
     <!-- 
     <input type="button" class="changeVal" onclick="getPost('ord')" value="주문확정">
     <input type="button" class="changeVal" onclick="getPost('rtn')" value="반품확정">
      -->
          <table class="ordtable table">
          <thead>
             <tr class="active">
             	<!-- <th></th>  -->
                <th>주문번호</th>
                <th>주문일</th>
                <th>주문구분</th>
                <th>회원번호</th>
                <th>회원명</th>
                <th>주문금액</th>
                <th>주문상태</th>
                <th>상세보기</th>
         
             </tr>
          </thead>
          <tbody>
           <c:forEach items="${alist}" var="bean" varStatus="status">
             <tr >  
             	<!-- <td style="vertical-align:middle;"><input type="checkbox" class="checkSelect" name="odrNo" value="${bean.odrNo }"></td>  -->
                <td style="vertical-align:middle;">${bean.odrNo}</td>
                <td style="vertical-align:middle;">${bean.odrDt}</td>
                <td style="vertical-align:middle;">
                <c:if test= "${bean.odrGbCd eq '10'}">
                	렌탈
                </c:if>
                <c:if test= "${bean.odrGbCd eq '20'}">
                	경매
                </c:if>
                </td>
                <td style="vertical-align:middle;">${bean.mbNo}</td>
                <td style="vertical-align:middle;">${bean.userNm }</td>
                <td style="vertical-align:middle;"><fmt:formatNumber value="${bean.totOdrAmt}" pattern="#,###.##"/>원</td>
                <td class="stscdtxt" style="vertical-align:middle;">
                   <c:if test= "${bean.odrStsGbCd eq 'DW'}">
                      <!-- 입금대기 -->
                      <!-- <button style="background:#151515; color:white;" class="btn btn-default depositConfirm">입금대기</button>  -->
                      <button id="odrBtn${status.index }" style="opacity:1.0;" type="button" class="btn btn-success" style="font-size: 9pt;" data-toggle="modal" data-target="#myModal" data-odr-no="${bean.odrNo}">입금확인</button>
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'OC'}">
                      <button id="disabled" style="opacity:0.5;" type="button" class="btn btn-default" style="font-size: 9pt;" disabled="disabled">주문확정</button>
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'PC'}">
                      <button id="disabled" style="opacity:0.5;" type="button" class="btn btn-primary" style="font-size: 9pt;" disabled="disabled">구매확정</button>
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'RW'}">
                      <button id="odrBtn${status.index }" style="background:#151515; color:white;" type="button" class="btn" style="font-size: 9pt;" data-toggle="modal" data-target="#myModal2" data-odr-no="${bean.odrNo}">반품확인</button>
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'RC'}">
                      <button id="disabled" style="opacity:0.3; background:#151515; color:white;" type="button" class="btn" style="font-size: 9pt;" disabled="disabled">반품완료</button>
                   </c:if>
                </td>
                <td style="vertical-align:middle;">
	           	<a style="background:#151515; color:white;" type="button" class="btn" style="font-size: 9pt;" href="/mp/mng/detail/${bean.odrNo }">상세보기</a>
    	        </td>
             </tr>
          </c:forEach>
          </tbody>
          </table>
          </form>
       </div>
      <div class="hr"></div>
      <!-- 입금확인 모달 -->
      <form id="target" action="/mp/mng/decision" method="post">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">입금확인</h4>
				    </div>
					<div class="modal-body">
				    	<input type="hidden" name="crudGbCd" value="crudGbCd"/>
				    	<input type="hidden" name="odrGbCd" value="odrGbCd"/>
				    	<input type="hidden" name="odrNo" value="odrNo"/>
					</div>
					<div class="form-group">
				    	<label for="name" id="cartConfirm">&nbsp;&nbsp;&nbsp;입금완료 하시겠습니까?</label>
					</div>
				    <div class="modal-footer">
				    	<button type="submit" id="questSubmit" class="btn btn-primary">완료</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				    </div>
				</div>
		    </div>
		</div>
		</form>
		<!-- 모달 끝 -->
		<!-- 반품확인 모달 -->
        <form id="target" action="/mp/mng/decision" method="post">
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel2">반품확인</h4>
				    </div>
					<div class="modal-body">
				    	<input type="hidden" name="crudGbCd" value="crudGbCd"/>
				    	<input type="hidden" name="odrGbCd" value="odrGbCd"/>
				    	<input type="hidden" name="odrNo" value="odrNo"/>
					</div>
					<div class="form-group">
				    	<label for="name" id="cartConfirm">&nbsp;&nbsp;&nbsp;반품완료 하시겠습니까?</label>
					</div>
				    <div class="modal-footer">
				    	<button type="submit" id="questSubmit" class="btn btn-primary">완료</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				    </div>
				</div>
		    </div>
		</div>
		</form>
		<!-- 모달 끝 -->
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>