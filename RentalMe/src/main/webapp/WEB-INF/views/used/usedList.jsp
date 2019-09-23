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
		width: 1200px;
		margin: 100px auto;
		margin-bottom: 300px;
		font-family: "nanumB";
	}
	.usedList #search{
		display: inline-block;
		margin-left: 5px;
		height: 32px;
	}
	.usedList h3{
		display: inline-block;
		margin: auto 20px;
		margin-bottom: 20px;
		font-weight: bold;
		font-size: 30px;
	}
	.usedList select{
		display: inline-block;
		float: left;
		width: 10%;
		height: 31px;
		min-width: 100px;
	}
/* 	 #goUsedManager{
	  background-color: #f4511e;
	  border: none;
	  color: white;
	  padding: 16px 32px;
	  text-align: center;
	  font-size: 16px;
	  margin: 4px 2px;
	  opacity: 0.6;
	  transition: 0.3s;
	  float: right;
	  margin-top: -50px;
	}
	#goUsedManager:hover{
		text-decoration: none;
		opacity: 1;
	} */
	#goUsedManager{
	  display: inline-block;
	  border-radius: 4px;
	  background-color: #FFC50D;
	  border: none;
	  color: #FFFFFF;
	  text-align: center;
	  font-size: 20px;
	  padding: 20px;
	  width: 200px;
	  transition: all 0.5s;
	  cursor: pointer;
	  margin: 5px;
	  float: right;
	  margin-top: -30px;
	  margin-bottom: 20px;
	}
	#goUsedManager span {
	  cursor: pointer;
	  display: inline-block;
	  position: relative;
	  transition: 0.5s;
	}
	
	#goUsedManager span:after {
	  content: '\00bb';
	  position: absolute;
	  opacity: 0;
	  top: 0;
	  right: -20px;
	  transition: 0.5s;
	}
	
	#goUsedManager:hover span {
	  padding-right: 25px;
	}

	#goUsedManager:hover span:after {
	  opacity: 1;
	  right: 0;
	}
	
	.used_modelNm{
		font-size: 13pt;
		font-weight: bold;
		margin-left: 10px;
		padding:0;
	}
	.used_price{
		font-size: 1.5em;
		font-weight: bold;
		color: #FF976E;
		margin-left: 10px;
	}
	.whattab{
		font-size: 11pt;
		color: gray;
		margin-bottom: 10px;
		margin-left: 10px;
	}
	#form_tab{
		margin-top: 50px;
		clear: both;
		margin-bottom: 100px;
	}
	#form_tab .tabcl:last-child .tab_btn{
		border-right: 1px solid black;
	}
	.tabcl{
		display: inline-block;
		width: 20.1%;
		margin-right: -4px;
	}
	.tabcl>.tab_btn{
		width: 100%;
		outline: 0;
		background-color: white;
		color: black;
		border-left: 1px solid black;
	}


	.used_thing{
		width: 95%;
		margin: 15px auto;
	}
	.line_thing{
		width: 200px;
		height: 350px;
		margin-left: 20px;
		margin-bottom: 40px;
		display: inline-block;
		cursor: pointer;
		border: 1px solid #DFD9C7;
	}
	.line_thing:hover{
		border: 2px solid #E8BD58;
		margin-top: -2px;
		box-shadow: 0px 0px 10px 10px rgba(42, 44, 44, 0.2);
	}
	.line_thing>div:first-child:not(){
		margin-left: 5px;
	}
	.used_brandNm{
		font-size: 11pt;
		margin-bottom: 3px;
		margin-left: 10px;
		font-weight:bolder;
		color: #A4A4A4;
		
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
		color: #FF976E;
		background-color: white;
	}
	.pagination > .active > a{
		background-color: #FF654F;
		border-color: #FF654F;
	}
	.pagination > .active > a:hover{
		background-color: #FF654F;
		border-color: #FF654F;
	}
	
	
	.tab_btn{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.tab_btn:hover{
  background:#fff;
  color:#E8BD58;
}
.tab_btn:before,.tab_btn:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #E8BD58;
  transition:400ms ease all;
}
.tab_btn:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.tab_btn:hover:before,.tab_btn:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
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

	 	$('.line_thing').mouseover(function(){
			$(this).children('div').children('img').css('margin-left','-2px');
		});		
		$('.line_thing').mouseout(function(){
			$(this).children('div').children('img').css('margin-left','0px');
		});

		var checkMbno=$('#checkMbno').val();
		if(checkMbno==''){
			$('#hideBtnMbno').hide();
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
</head>
<body>
<div class="usedList">
	<input id="checkMbno" type="hidden" value="${loginMbNo }">
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
		<button id="searchBtn" class="btn btn-default glyphicon glyphicon-search" type="submit"></button>
	</div>
	</form>
	<div id="hideBtnMbno">
	<a href="/used/store/${loginMbNo }" id="goUsedManager"><span>중고거래 관리</span></a>
	</div>
<div id="form_tab">
	<form class="tabcl" action="/used/big#btn_top">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button id="btn_top" class="tab_btn" type="submit">대형가전</button>
	</form>
	<form class="tabcl" action="/used/sml#btn_top">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button class="tab_btn" type="submit">소형가전</button>
	</form>
	<form class="tabcl" action="/used/kit#btn_top">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button class="tab_btn" type="submit">주방가전</button>
	</form>
	<form class="tabcl" action="/used/app#btn_top">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button class="tab_btn" type="submit">가구</button>
	</form>
	<form class="tabcl" action="/used/etc#btn_top">
		<input type="hidden" name="startPage" value="0">
		<input type="hidden" name="modelNm">
		<input type="hidden" name="align" value="1">			
		<button class="tab_btn" type="submit">기타</button>
	</form>
</div>
	<div class="used_thing">
	<c:forEach items="${alist1 }" var="bean">
		<div class="line_thing" onclick="location.href='/used/detail/${bean.usedGdsNo }'">
			<div class="used_thing_img"><img src="${bean.img1 }" style="width: 100%; height: 100%; padding: 4px;"></div>
			<div class="whattab">${bean.mclassName } > ${bean.sclassName }</div>
			<div class="used_brandNm">${bean.brandNm }</div>
			<div class="used_modelNm">${bean.modelNm }</div>
			<div class="used_price">${bean.usedGdsPrice } 원</div>
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