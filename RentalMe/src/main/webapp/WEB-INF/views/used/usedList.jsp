<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/used.css" >
<jsp:include page="../template/headerRe.jsp"></jsp:include>
<style type="text/css">
	.usedList{
		width: 80%;
		margin: 100px auto;
		border: 1px solid black;
		margin-bottom: 300px;
	}
	.usedList #search{
		display: inline-block;
		margin-left: 10px;
	}
	.usedList h3{
		display: inline-block;
		margin: auto 20px;
	}
	.usedList select{
		display: inline-block;
		float: right;
		width: 10%;
		height: 30px;
		min-width: 100px;
	}
	#goUsedManager{
		background-color: black;
		color: white;
		float: right;
		width: 120px;
		height: 30px;
		text-align: center;
		line-height: 30px;
		margin-left: 5px;
		font-size: 15px;
		font-weight: bold;
	}
	.usedList .tabs{
		margin-top: 40px;
		width: 100%;
		border-bottom: 5px solid black;
	}
	.usedList .tabs>li{
		display: inline-block;
		width: 20.5%;
		height: 30px;
		line-height: 30px;
		background-color: lightgray;
		text-align: center;
		cursor:pointer;
		margin-left: -2px;
	}
	.usedList .tabs>li:first-child{
		margin-left: -40px;
	}
	.usedList .tabs>li:not(.active):hover{
		background-color: white;
	}
	.usedList .tabs> .active{
		background-color: black;
		color: white;
	}
	

	#used_thing{
		width: 95%;
		border: 1px solid black;
		margin: 15px auto;
	}
	.line_thing{
		border: 1px solid black;
		width: 200px;
		height: 300px;
		margin-left: 20px;
		margin-bottom: 40px;
		display: inline-block;
		
	}
	.used_thing_img{
		border: 1px solid black;
		width: 200px;
		height: 200px;
		margin: auto;
	}
	.pagination{
		display: block;
		text-align: center;
	}
	.pagination>li>a{
		float: none;
	}

</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/used.js"></script>
</head>
<script type="text/javascript">
	$(function(){
		var classnum=$('.used_price');
		var price;
		for(var i=0; i<classnum.length; i++){
			price=$('.used_price').eq(i).text();
			$('.used_price').eq(i).text(numberWithCommas(price));	
		}
		$('.tab:first-child').addClass('active');
		var who;	// 클릭한 탭이 누군지
		$('.tab').eq(0).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
			bigApc();
		});
		$('.tab').eq(1).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
			smlApc();
		});
		$('.tab').eq(2).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
			kitApc();
		});
		$('.tab').eq(3).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
			furniture();
		});
		$('.tab').eq(4).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
			etc();
		});
		function removeCls(who){
			$('.tabs').find('li').removeClass('active');
			who.addClass('active');
		}
		
		function bigApc(){ 		//대형가전
			
		}
		function smlApc(){ 		//소형가전

		}
		function kitApc(){ 		//주방가전

		}
		function furniture(){ 	//가구

		}
		function etc(){ 		//기타

		}
		function numberWithCommas(x) { //숫자 3자리 콤마
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	});

	
</script>
<body>
<div class="usedList">

	<h3>중고제품</h3>
	<div id="search">
	<form action="#">
		<input type="text" id="search" placeholder="검색">
		<button type="submit">검색</button>
	</form>
	</div>
	
	<a href="/used/store" id="goUsedManager">중고거래 관리</a>
	
	<select id="align">
		<option>인기순</option>
		<option>조회순</option>
		<option>저가순</option>
		<option>고가순</option>
	</select>
	
	<ul class="tabs">
		<li class="tab">대형가전</li>
		<li class="tab">소형가전</li>
		<li class="tab">주방가전</li>
		<li class="tab">가구</li>		
		<li class="tab">기타</li>		
	</ul>
	
	<div id="used_thing">
	<c:forEach items="${alist }" var="bean">
		<div class="line_thing">
			<div class="used_thing_img"></div>
			<div><a href="#">${bean.BRAND_NM }</a></div>
			<div><a href="#">${bean.MODEL_NM }</a></div>
			<a href="#" class="used_price">${bean.USED_GDS_PRICE }</a>원
		</div>
	</c:forEach>
	</div>
	
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="active"><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
	
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>