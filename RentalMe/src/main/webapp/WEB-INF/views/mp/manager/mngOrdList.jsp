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
   
</style>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<script type="text/javascript">
   $(function(){
		if($('.titlediv').text().indexOf('주문') != -1){
			$('.changeVal').eq(1).hide();
			for(var i=0; i<$('.stscdtxt').length; i++){
				if($('.stscdtxt').eq(i).text().indexOf('입금') == -1){
					$('.stscdtxt').eq(i).parent().children().first().hide();
					$('.stscdtxt').eq(i).parent().prepend('<td></td>');
				}
			}
			
		}else if($('.titlediv').text().indexOf('반품') != -1){
			$('.changeVal').eq(0).hide();
			for(var i=0; i<$('.stscdtxt').length; i++){
				if($('.stscdtxt').eq(i).text().indexOf('반품대기') == -1){
					$('.stscdtxt').eq(i).parent().children().first().hide();
					$('.stscdtxt').eq(i).parent().prepend('<td></td>');
				}
			}
		}
		
   });
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
     <input type="button" class="changeVal" onclick="getPost('ord')" value="주문확정">
     <input type="button" class="changeVal" onclick="getPost('rtn')" value="반품확정">
          <table class="ordtable table">
          <thead>
             <tr class="active">
             	<th></th>
                <th>주문일</th>
                <th>주문번호</th>
                <th>회원번호</th>
                <th>주문상태</th>
                <th>주문금액</th>
                <th>주문구분</th>
                <th>상세보기</th>
         
             </tr>
          </thead>
          <tbody>
           <c:forEach items="${alist}" var="bean">
             <tr>  
             	<td><input type="checkbox" class="checkSelect" name="odrNo" value="${bean.odrNo }"></td>
                <td>${bean.odrDt}</td>
                <td>${bean.odrNo}</td>
                <td>${bean.mbNo}</td>
                <td class="stscdtxt">
                   <c:if test= "${bean.odrStsGbCd eq 'DW'}">
                      입금대기
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'OC'}">
                      주문확정
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'PC'}">
                      구매확정
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'RW'}">
                      반품대기
                   </c:if>
                   <c:if test= "${bean.odrStsGbCd eq 'RC'}">
                      반품확정
                   </c:if>
                </td>
                <td><fmt:formatNumber value="${bean.totOdrAmt}" pattern="#,###.##"/>원</td>
                <td>
                <c:if test= "${bean.odrGbCd eq '10'}">
                	렌탈
                </c:if>
                <c:if test= "${bean.odrGbCd eq '20'}">
                	경매
                </c:if>
                </td>
                <td>
	           	<a style="background:#151515; color:white;" type="button" class="btn" style="font-size: 9pt;" href="/mp/mng/detail/${bean.odrNo }">상세보기</a>
    	        </td>
             </tr>
          </c:forEach>
          </tbody>
          </table>
          </form>
       </div>
      <div class="hr"></div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>