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

   
      
	   
	   
</style>
<script type="text/javascript">

		function checkAll(){
		    if( $("#th_checkAll").is(':checked') ){
		      $("input[name=checkRow]").prop("checked", true);
		    }else{
		      $("input[name=checkRow]").prop("checked", false);
		    }
		}

</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
	<div>
	<div class="titlediv">
       <p id="title">장바구니</p>
     </div>
     <div class="hr" style="height:3px; background-color: black;"></div>
       	 <div id="info">
       	 <p>
	       	 <input type="hidden" value="${loginMbNo}">
		     <c:if test="${empty userVo.userNM}">
		     	${userVo.userNM} 님이 렌탈미에서 주문한 내역입니다.
		     </c:if>
		     <c:if test="${!empty userVo.userNM }">
		     	${userVo.userNM} 님이 렌탈미에서 주문한 내역입니다.
		     </c:if>
		  </p>
       	 </div>
       <a href="#" id="choosedel">선택삭제</a>
       	<table class="ordtable table">
       	<thead>
       		<tr class="active">
       			<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"/></th>
       			<th>상품명/선택사항</th>
       			<th>수량</th>
       			<th>렌탈기간</th>
       			<th>상품금액</th>
       		</tr>
       	</thead>
       	<tbody>
   		 <c:set var="sumPrice" value="0"/>
       	<c:forEach items="${alist}" var="bean">
       		<tr data-tr_value="${bean.usedGdsNo}">  
       			<td><input type="checkbox" class="checkRow" name="checkRow" data-wishNum="${bean.usedGdsNo}"></td>
       			<td><img class="ordimg" src="imgs/bed1.jpg"/>${bean.gdsNm}</td>
       			<td>${bean.odrQty}</td>
       			<td>${bean.agreeTem}개월</td>
       			<td><fmt:formatNumber value="${bean.gdsPrice}" pattern="#,###.##"/>원
       			</td>
       		</tr>
       	<c:set var="sumPrice" value="${sumPrice +(bean.gdsPrice * bean.odrQty)}"/>
       	</c:forEach>
       	</tbody>
       	</table>
       </div>
       <div class="hr" style="height:2px;"></div>
       <div class="cartresult">
       	<p>총 주문 금액: <fmt:formatNumber value="${sumPrice}" pattern="#,###.##"/> 원</p>
       </div>
       <div class="hr" style="height:2px; margin-top:100px;"></div>
		<div class="cartbtn">
			<button type="button" class="delete_btn1 btn">계속 쇼핑하기</button>
			<button type="button" class="delete_btn2 btn">주문하기</button>
		</div>
      
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>