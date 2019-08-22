<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	   
	   #choose{
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
	  
	   
	   .btnn{
	   		background-color: #4d4d4d;
	   		color: white;
	   		font-family: "nanumB";
	   		font-size:10pt;
	   		height: 20pt;
	   		text-align: center;
	   }
	   .btnn.hover{
	   		
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
	   .pathdiv{
	   		height:30px;
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

		function comma(num){//숫자가 3자리가 넘을때 , 찍는 함수
		  
		 
		}




</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
	<p id="title">♥ 찜한상품</p>
	<div>
	<div class="pathdiv">
       <p id="path">마이페이지> 찜한상품</p>
       	<a href="#" id="choose" onclick="delete()">선택삭제</a>
     </div>
     <div class="hr" style="height:3px; background-color: black;"></div>
       	<table class="ordtable table">
       	<thead>
       		<tr class="active">
       			<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"/></th>
       			<th>상품명</th>
       			<th>찜한 날짜</th>
       			<th>상품금액</th>
       		</tr>
       	</thead>
       	<tbody>
       	
       	<c:forEach items="${alist}" var="bean">
       		<tr>  
       			<td><input type="checkbox" name="checkRow" value="${content.IDX}"></td>
       			<td><img class="ordimg" src="imgs/bed1.jpg"/>${bean.usedGdsNo}</td>
       			<td>${bean.chgDt}</td>
       			<td>30,000원 </td>
       		</tr>
       	</c:forEach>
       	
       	</tbody>
       	</table>
       </div>
       <div class="hr"></div>
      
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>