<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/used.css" >
<jsp:include page="../template/header.jsp"></jsp:include>
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


	.used_thing{
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
		cursor: pointer;
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
		$('.tab').eq(0).addClass('active');
		var classnum=$('.used_price');
		var price;
		for(var i=0; i<classnum.length; i++){
			price=$('.used_price').eq(i).text();
			$('.used_price').eq(i).text(numberWithCommas(price));	
		}
		/* $('.tab:first-child').addClass('active'); */
		var who;	// 클릭한 탭이 누군지
		$('.tab').eq(0).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
		});
		$('.tab').eq(1).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
		});
		$('.tab').eq(2).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
		});
		$('.tab').eq(3).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
		});
		$('.tab').eq(4).click(function(e){
			e.preventDefault();
			who=$(this);
			removeCls(who);
		});
	});
		function removeCls(who){ //탭활성화
			$('.tabs').find('li').removeClass('active');
			who.addClass('active');
		}
		function moveTab(num){ //탭옮김시 화면바뀜
			$('.used_thing').not($('.used_thing').eq(num)).hide();
			$('.used_thing').eq(num).show();
		}
		
		function numberWithCommas(x) { //숫자 3자리 콤마
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

	
</script>
<body>
<div class="usedList">

	<h3>중고제품</h3>
	<form action="/used/search">
	<div id="search">
		<input type="hidden" name="gdsLclassCd" value="20">
		<input type="hidden" name="gdsMclassCd" value="${gdsMclassCd }">
		<input type="text" name="modelNm" id="search" placeholder="검색">
		<select name="align" id="align">
			<option value="1">등록순</option>
			<option value="2">낮은 가격순</option>
			<option value="3">높은 가격순</option>
		</select>
		<button type="submit">검색</button>
	</div>
	</form>
	
	<a href="/used/store/${loginMbNo }" id="goUsedManager">중고거래 관리</a>
<div>
	<a href="/used/10">대형가전</a>
	<a href="/used/20">소형가전</a>
	<a href="/used/30">주방가전</a>
	<a href="/used/40">가구</a>
	<a href="/used/50">기타</a>
</div>
<!-- 	<ul class="tabs">
		<li class="tab" id="bigApp" value="10">대형가전</li>
		<li class="tab" id="smlApp" value="20">소형가전</li>
		<li class="tab" id="kitApp" value="30">주방가전</li>
		<li class="tab" id="furniture" value="40">가구</li>		
		<li class="tab" id="etc" value="50">기타</li>	
	</ul>
	 -->
	<div class="used_thing">
	<c:forEach items="${alist1 }" var="bean" begin="1" end="10">
		<div class="line_thing" onclick="location.href='/used/detail/${bean.usedGdsNo }'">
			<div class="used_thing_img"><img src="${bean.img1 }" style="width: 100%; height: 100%;"></div>
			<div>${bean.brandNm }</div>
			<div>${bean.modelNm }</div>
			<span>${bean.usedGdsPrice }원</span>
			<div>탭종류:${bean.gdsMclassCd }</div>
		</div>
	</c:forEach>
	</div>
	<!-- 1~10 11~20 21~30 -->
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach begin="1" end="${listsize }" var="x">
    <li><a href="#"><c:out value="${x }"/></a></li>
    </c:forEach>
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