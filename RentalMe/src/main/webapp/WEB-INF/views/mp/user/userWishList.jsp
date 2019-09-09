<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
		 #title2{
            font-size: 15pt;
            font-weight: bolder;
            font-family: "nanumB";
            margin: 60px 0 10px 0;
     	 }
	    .ordtable>thead>tr>th{
        	text-align:center;
        }
        
        .ordtable>thead>tr>th:nth-child(1){
        	text-align:left;
        }
        
        .ordtable>tbody>tr>td{
        	vertical-align: middle;
        	text-align: center;
        	display: table-cell;
        }
        
        .ordtable>tbody>tr>td:nth-child(1),
        .ordtable>tbody>tr>td:nth-child(2){
        	text-align:left;
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
      
      #choosedel{
	   		font-family: "nanumR";
	   		width:55px;
	   		height:30px;
	   		float:right;
	   		color:black;
	   		font-weight:600;
	   }
      
</style>
<script type="text/javascript">

		function checkAll(){
		    if( $("#allCheck").is(':checked') ){
		      $("input[name=chBox]").prop("checked", true);
		    }else{
		      $("input[name=chBox]").prop("checked", false);
		    }
		}

</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
	<div>
	<div class="titlediv">
       <p id="title2">♥찜한 상품</p>
     </div>
     <div class="hr" style="height:3px; background-color: black;"></div>
       	 <div id="info">
       	 <p>
	       	 <input type="hidden" value="${loginMbNo}">
		     <c:if test="${empty userVo.userNM}">
		     	${loginUserId} 님이 중고거래에서 찜한 상품 목록입니다.
		     </c:if>
		     <c:if test="${!empty userVo.userNM }">
		     	${userVo.userNM} 님이 중고거래에서 찜한 상품 목록입니다.
		     </c:if>
		  </p>
       	 </div>
       	 <a href="#" id="choosedel">선택삭제</a>
       	  <script>
		 $("#choosedel").click(function(){
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
		   var checkArr = new Array();
		   
		   $("input[class='chBox']:checked").each(function(){
		    checkArr.push($(this).attr("data-wishNum"));
		   });
		    
		   $.ajax({
		    url : "/mp/deleteWish",
		    type : "post",
		    data : { chbox : checkArr },
		    success : function(){
		     location.href = "/mp/wish";
		    }
		   });
		  } 
		 });
		</script>
       	 
       	<table class="ordtable table">
       	<thead>
       		<tr class="active">
       			<th><input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll();"/></th>
       			<th>상품명</th>
       			<th>찜한 날짜</th>
       			<th>상품금액</th>
       		</tr>
       	</thead>
       	<tbody>
       	
       	<c:forEach items="${alist}" var="bean">
       		<tr>  
       			<td><input type="checkbox" class="chBox" name="chBox" data-wishNum="${bean.usedGdsNo}"></td>
       			<td>
	       			<a style="text-decoration:none; color:black;"href="#">
	       			<img class="ordimg" src="${bean.UImg1}"/>${bean.modelNm}
	       			</a>
       			</td>
       			<td>${bean.chgDt}</td>
       			<td><fmt:formatNumber value="${bean.usedGdsPrice}" pattern="#,###.##"/>원</td>
       		</tr>
       	</c:forEach>
       	
       	</tbody>
       	</table>
       </div>
       <div class="hr"></div>
      
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>