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

		window.onload = function () {
			 $('#choosedel').click(function(){
					var confirm_val=confirm("찜목록에서 삭제하시겠습니까?");

					if(confirm_val){
						var checkArr = new Array();

						$('input[class="checkRow"]:checked').each(function(){
							checkArr.push($(this).attr("data-wishNum"));
						});

						$.ajax({
							url : "/mp/wish/delete",
							type : "post",
							data : {checkRow : checkArr},
							success : function(result){

								if(result == 1){
									location.href="/mp/wish";
								} else{
									alert("삭제실패");
								}
							}
							
						});
					}
				});
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
		     	${loginUserId} 님의 찜한 상품 목록입니다.
		     </c:if>
		     <c:if test="${!empty userVo.userNM }">
		     	${userVo.userNM} 님의 찜한 상품 목록입니다.
		     </c:if>
		  </p>
       	 </div>
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
       		<tr data-tr_value="${bean.usedGdsNo}">  
       			<td><input type="checkbox" class="checkRow" name="checkRow" data-wishNum="${bean.usedGdsNo}"></td>
       			<td><img class="ordimg" src="imgs/bed1.jpg"/>${bean.modelNm}</td>
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