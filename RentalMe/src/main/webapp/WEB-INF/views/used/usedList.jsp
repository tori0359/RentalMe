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
		margin-bottom: 300px;
		font-family: "nanumB";
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
		float: left;
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
		clear: both;
		margin-bottom: 10px;
	}
	#form_tab{
		clear: both;
	}
	.tabcl{
		display: inline-block;
		width: 19.3%;
	}
	.tabcl>.tab_btn{
		width: 100%;
		background-color: white; 
		outline: 0;
		border: 1px solid black; 
	}


	.used_thing{
		width: 95%;
		margin: 15px auto;
	}
	.line_thing{
		width: 200px;
		height: 300px;
		margin-left: 20px;
		margin-bottom: 40px;
		display: inline-block;
		cursor: pointer;
	}
	.used_thing_img{
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
	.tabcl>.activeTab{
		background-color: black;
		color: white;
	}

</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/used.js"></script>
</head>
<script type="text/javascript">

	$(function(){		
		var mclass=${gdsMclassCd};
		if(mclass==10){
			var gdsnm='big';
			$('.tabcl').eq(0).find('.tab_btn').addClass('activeTab');
		}else if(mclass==20){
			gdsnm='sml';
			$('.tabcl').eq(1).find('.tab_btn').addClass('activeTab');
		}else if(mclass==30){
			gdsnm='kit';
			$('.tabcl').eq(2).find('.tab_btn').addClass('activeTab');
		}else if(mclass==40){
			gdsnm='app';
			$('.tabcl').eq(3).find('.tab_btn').addClass('activeTab');
		}else if(mclass==50){
			gdsnm='etc';
			$('.tabcl').eq(4).find('.tab_btn').addClass('activeTab');
		}
		/* var link=$('.pagelink').attr('href'); */
		var arrlink=new Array($('.pagelink').length);
		var link;
		var link2;
		var link3;
		var mat='startPage='+${page};
		for(var i=0; i<$('.pagelink').length; i++){
			link=$('.pagelink').eq(i).attr('href');
			link2=link.replace(/modelNm=&align=1/gi,'modelNm=${modelNm}&align=${align}');
			arrlink[i]=link2.replace('big',gdsnm);
			if(arrlink[i].match(mat) !== null){
				$('.pagelink').eq(i).parent().addClass('active');
			}
			$('.pagelink').eq(i).attr('href',arrlink[i]);
		}
		//${pageContext.request.contextPath }/used/big?startPage=${chg }&modelNm=&align=1
		var classnum=$('.used_price');
		var price;
		for(var i=0; i<classnum.length; i++){
			price=$('.used_price').eq(i).text();
			$('.used_price').eq(i).text(numberWithCommas(price));	
		}

		for(var i=0; i<$('.whattab').length; i++){
			$('.whattab').eq(i).text();
		}
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
	<div>
	<a href="/used/store/${loginMbNo }" id="goUsedManager">중고거래 관리</a>
	</div>
<div id="form_tab">
	<form class="tabcl" action="/used/big">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button class="tab_btn" type="submit">대형가전</button>
	</form>
	<form class="tabcl" action="/used/sml">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button class="tab_btn" type="submit">소형가전</button>
	</form>
	<form class="tabcl" action="/used/kit">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button class="tab_btn" type="submit">주방가전</button>
	</form>
	<form class="tabcl" action="/used/app">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button class="tab_btn" type="submit">가구</button>
	</form>
	<form class="tabcl" action="/used/etc">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button class="tab_btn" type="submit">기타</button>
	</form>
</div>
	<div class="used_thing">
	<c:forEach items="${alist1 }" var="bean">
		<div class="line_thing" onclick="location.href='/used/detail/${bean.usedGdsNo }'">
			<div class="used_thing_img"><img src="${bean.img1 }" style="width: 100%; height: 100%;"></div>
			<div>${bean.brandNm }</div>
			<div>${bean.modelNm }</div>
			<span class="used_price">${bean.usedGdsPrice }원</span>
			<div class="whattab">${bean.gdsMclassCd }</div>
		</div>
	</c:forEach>
	</div>
  <ul class="pagination">
 <!--    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li> -->
    <c:forEach begin="1" end="${listsize }" var="x">
    <c:set var="chg" value="10"/>
    <c:set var="chg" value="${x*chg-chg }"/>
    <li><a class="pagelink" href="${pageContext.request.contextPath }/used/big?startPage=${chg }&modelNm=&align=1"><c:out value="${x }"/></a></li>
    </c:forEach> 
<!--     <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li> -->
  </ul>  
	
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>