<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 결제 api연동하기 (아임포트)-->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<style type="text/css">
.content {
	height: 100%;
}
.content-inner {
	margin-left:200px;
	margin-right:200px;
}
#cip {
	font-weight: bolder;
    font-size: 35pt;
}
.content-inner-path {
	text-align: center;
}
.content-inner-menu {
	text-align: center;
}
.content-inner-menu-path {
	font-style: italic;
	text-align: right;
}
.content-inner-menu-path2 {
	font-style: italic;
	text-align: right;
}
#pathStyle {
	color: black;
	text-decoration: none !important
}
/* -스크롤 -*/
.scrolltop {
    display: none;
    position: fixed;
    right: 80px;
    bottom: 340px;
    z-index: 1030;
    font-size: 2.875rem;
    color: #868e96;
    transition: all 0.5s ease-in-out;
    opacity: 0.8;
}
.scrolltop:hover, .scrolltop:focus {
	color: #dc3545;
	transition: all 0.5s ease-in-out;
}
#topButton {
	border: 0px;
}
/* ---------- 상세정보 영역 시작 -------- */
#gdsNmStyle { 
	line-height: 0.7em;
	font-weight: bolder;
}
#brandNmStyle {
	line-height: 0.2em;
	text-decoration:none;
	font-size: 1.8rem;
}
#detailNm h3{
	font-size: 2.50rem;
    font-weight: bolder;
}

#detailValue h3{
	text-align: left;
    font-size: 2.50rem;
    font-weight: bolder;
    color: darkred;
}
#disPrice {
	border: 0;
	width: 125px;
	background-color : white;
}
.chargediv {
	display: inline;
}
#gradeGroup {
	display: inline;
}
	/* 별점 시작 */
	.star-rating { width:103px; }
	.star-rating,.star-rating span { display:inline-block; height:20px; overflow:hidden; background-image: url('/imgs/star8.jpg'); background-repeat: no-repeat; }
	.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; width:0%;}
	/* 별점 끝 */

/* ---------- 상세정보 영역 끝 -------- */

/* ---------- 옵션 영역 시작 ---------- */

/* ---------- 옵션 영역 끝 ---------- */

.content-inner-best {
	text-align: center;
}
.content-inner-best-path {
	font-weight: bolder;
	font-size: 20pt;
	color: blue;
}
.label label-default {
	font-size: 20pt;
}
#optionStyle{
	display: inline;
}
#starGrd {
	border: 0;
	width: 60px;
	font-weight: bolder;
	color: #CC0099;
	background-color : white;
}
#starText {
	border: 0;
	width: 52px;
	background-color : white;
}
#starCnt {
	border: 0;
	font-size:13pt;
	font-weight: bolder;
	width: 100px;
	color: #1E90FF;
	background-color : white;
	cursor:pointer;
}
#optionSelect1 {
	line-height:1.1em;
	font-weight: bolder;
}
#optionSelect2 {
	line-height:1.0em;
}
#quick {
	font-size:16pt;
	color: red;
	font-weight: bolder;
	vertical-align:middle;
}
#quick0 {
	font-size:12pt;
	color: black;
	font-weight: bolder;
	vertical-align:middle;
}
#charge_button4 {
	color: black;
}
#myModalLabel {
	background-image: url('/imgs/quest2.jpg');
	height: 160px;
	
}.#myModalLabel2 {
	height: 160px;
	
}
#agree {
	height:100px;
}
/* --------- 제품 정보 영역 --------- */
#info1 {
	text-align: center;
}
#li1 {
	list-style: none;
	font-size: 20pt;
	font-weight: bolder;
}
#li2 {
	list-style: none;
}
.ordtable>thead>tr>th {
	text-align:center;
}
 
.ordtable>tbody>tr>td {
	vertical-align: middle;
	text-align: center;
	display: table-cell;
}
#reviewTable {
	width: 1160px;
	margin-left: auto;
	margin-right: auto;
}
#re1 {
	width: 100px;
}
#re2 {
	width: 760px;
}
#re3 {
	width: 150px;
}
#re4 {
	width: 150px;
}
#reviewGrade1 {
	font-size: 11pt;
}
#sort-btn1, #sort-btn2, #sort-btn3, #sort-btn4 {
	cursor:pointer;
}
#cartConfirm {
	font-size: 15pt;
	font-weight: bolder;
	
}
/* --------- 제품 정보 끝 --------- */
/* --------- 결제하기 모달 시작 --------- */
#realTotPrice { 
	width: 120px;
	text-align: center;
	vertical-align: middle;
	color: white;
}
#realTotPriceTxt {
	width: 570px;
	text-align: center;
}
#realTotPriceTxt {
	font-weight: bolder;
    color: darkred;
}
/* --------- 결제하기 모달 끝 --------- */
/* --------- BEST 영역 시작 --------- */
/* List style */

/* Mobile only */
@media (max-width: 767px) {
    .page-header { text-align: center; } 
}
@media (max-width: 479px) {
    .caption-box { word-break: break-all; }
    ul.thumbnails li { margin-bottom: 30px; }
}

/* ADD-ON */

::-moz-selection { background: #ff5e99; color: #FFFFFF; }

a, a:focus, a:active, a:hover, object, embed { outline: none; }
:-moz-any-link:focus { outline: none; }
input::-moz-focus-inner { border: 0; }
/* --------- BEST 영역 끝 --------- */

/* --------- 상세 캐러셀 시작 --------- */
.product-slider { 
	 padding: 0px 5px 5px 5px; 
}

.product-slider #carousel { border: 1px solid; border-color:#cecece; }

.product-slider #thumbcarousel { margin: 12px 0 0; padding: 0 0px; }

.product-slider #thumbcarousel .item { text-align: center; }

.product-slider #thumbcarousel .item .thumb { border: 1px solid #cecece; width: %; margin: 0 2%; display: inline-block; vertical-align: middle; cursor: pointer; max-width: 75px; }

.product-slider #thumbcarousel .item .thumb:hover { border: 3px solid; border-color: black; }

.product-slider .item img { width: 100%; height: auto; }

.carousel-control { color: #0284b8; text-align: center; text-shadow: none; font-size: 30px; width: 30px; height: 30px; line-height: 20px; top: 23%; }

.carousel-control:hover, .carousel-control:focus, .carousel-control:active { color: #333; }

.carousel-caption, .carousel-control .fa { font: normal normal normal 30px/26px FontAwesome; }
.carousel-control { background-color: rgba(0, 0, 0, 0); bottom: auto; font-size: 20px; left: 0; position: absolute; top: 30%; width: auto; }

.carousel-control.right, .carousel-control.left { background-color: rgba(0, 0, 0, 0); background-image: none; }

/* --------- 상세 캐러셀 끝 ----------- */


</style>
<script type="text/javascript">

	window.onload = function () {
		//alert("안쪽 처음");
		
		//alert(vRtnCd);
		
		// 점수 평균 퍼센트
		$('#starPercent').width(vTotGrdAvgPercent);

		// 점수 평균
		$('#starGrd').val("("+vTotGrdAvg+")");

		// 리뷰 갯수
		$('#starCnt').val("("+vCnt+")");

		// 상담예약 등록
		$('#target').submit(function(){
			if($('#name').val().length == 0) {
				alert("이름을 입력해주세요.");
				return false;
			}
			if($('#hp').val().length < 9) {
				alert("휴대전화를 다시 입력해주세요.");
				return false;
			}
			if($('#hp').val().length < 9) {
				alert("이메일을 입력해주세요.");
				return false;
			}
		});

		// 상품평 리뷰갯수 클릭
		$("#gradeGroup #starCnt").on("click", function(event){
			var offset = $("#menu4 #sort-btn4").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		// menu1 영역 버튼클릭
		$("#menu1 #sort-btn1").on("click", function(event){
			var offset = $("#menu1 #sort-btn1").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		$("#menu1 #sort-btn2").on("click", function(event){
			var offset = $("#menu2 #sort-btn2").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});
		
		$("#menu1 #sort-btn3").on("click", function(event){
			var offset = $("#menu3 #sort-btn3").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		$("#menu1 #sort-btn4").on("click", function(event){
			var offset = $("#menu4 #sort-btn4").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		// menu2 영역 버튼클릭
		$("#menu2 #sort-btn1").on("click", function(event){
			var offset = $("#menu1 #sort-btn1").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		$("#menu2 #sort-btn2").on("click", function(event){
			var offset = $("#menu2 #sort-btn2").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});
		
		$("#menu2 #sort-btn3").on("click", function(event){
			var offset = $("#menu3 #sort-btn3").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		$("#menu2 #sort-btn4").on("click", function(event){
			var offset = $("#menu4 #sort-btn4").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		// menu3 영역 버튼클릭
		$("#menu3 #sort-btn1").on("click", function(event){
			var offset = $("#menu1 #sort-btn1").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		$("#menu3 #sort-btn2").on("click", function(event){
			var offset = $("#menu2 #sort-btn2").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});
		
		$("#menu3 #sort-btn3").on("click", function(event){
			var offset = $("#menu3 #sort-btn3").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		$("#menu3 #sort-btn4").on("click", function(event){
			var offset = $("#menu4 #sort-btn4").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		// menu4 영역 버튼클릭
		$("#menu4 #sort-btn1").on("click", function(event){
			var offset = $("#menu1 #sort-btn1").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		$("#menu4 #sort-btn2").on("click", function(event){
			var offset = $("#menu2 #sort-btn2").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});
		
		$("#menu4 #sort-btn3").on("click", function(event){
			var offset = $("#menu3 #sort-btn3").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		$("#menu4 #sort-btn4").on("click", function(event){
			var offset = $("#menu4 #sort-btn4").offset();
			$('html').animate({scrollTop : offset.top}, 0);
		});

		//alert("길이" + vReview.length);
		//alert("값 vReview[0] = " +  vReview[0]);
		
		// 상품후기 별점
		if(vReview.length > 0 ) {
			for(var i=0; i<vReview.length; i++) {
				if(vReview[i] == 0) {
					$('#reviewGrade'+(i+1)).html(reviewStar0);
				} else if(vReview[i] == 1) {
					$('#reviewGrade'+(i+1)).html(reviewStar1);
				} else if(vReview[i] == 2) {
					$('#reviewGrade'+(i+1)).html(reviewStar2);
				} else if(vReview[i] == 3) {
					$('#reviewGrade'+(i+1)).html(reviewStar3);
				} else if(vReview[i] == 4) {
					$('#reviewGrade'+(i+1)).html(reviewStar4);
				} else if(vReview[i] == 5){
					$('#reviewGrade'+(i+1)).html(reviewStar5);
				}
			}
		}

		// 최상단 이동
		jQuery(document).ready(function () {
			$(window).scroll(function () {
				if ($(this).scrollTop() > 100) {
					$('#backToTop').fadeIn(500);
				} else {
					$('#backToTop').fadeOut('slow');
				}
			});
			$('#backToTop').click(function (e) {
				e.preventDefault();
				$('html, body').animate({scrollTop: 0}, 200);
			});
		});

	//alert("바깥쪽");
	
	}
	
	/**************************/
	/**** 전역변수 선언시작 ***/
	/**************************/
	var vRtnCd = "${rtnCd}";
	var vGdsPrice = "";		// 렌탈가격 개월수에 따른 가걱변동 
	var vGdsPriceTemp = "";	// 렌탈가격 개월수에 따른 가걱변동 임시변수
	<c:forEach items="${list1}" var="list1">
		vGdsPrice = "${list1.gdsPrice}";
		vGdsPriceTemp = "${list1.gdsPrice}";
	</c:forEach>

	var vCnt;				// 리뷰 갯수
	var vTotGrdSum;			// 점수 합계
	var vTotGrdAvg;			// 점수 평균
	<c:forEach items="${grade}" var="grade">
		vCnt = "${grade.cnt}";
		vTotGrdSum = "${grade.totGrdSum}";
		vTotGrdAvg = "${grade.totGrdAvg}";
	</c:forEach>
	var vTotGrdAvgPercent =  (vTotGrdAvg*20) + ((vTotGrdAvg*20)*0.0003)*100;		// 점수 평균 퍼센트화

	var vReview = new Array();	// 리뷰 리스트
	<c:forEach items="${review}" var="review" varStatus="status">
		vReview[${status.index}] = "${review.grade}";
	</c:forEach>

	var reviewStar0 = "☆☆☆☆☆";
	var reviewStar1 = "★☆☆☆☆";
	var reviewStar2 = "★★☆☆☆";
	var reviewStar3 = "★★★☆☆";
	var reviewStar4 = "★★★★☆";
	var reviewStar5 = "★★★★★";

	var vRealGdsPrice = 0;		// 결제하기 최종상품가격
	<c:forEach items="${list1}" var="list1">
		vRealGdsPrice = "${list1.gdsPrice}";
	</c:forEach>
	var vRealOdrQty = 1;		// 결제하기 최종수량
	var vRealTotGdsPrice;		// 결제하기 최종상품가격 * 최종수량

	var radioVal = "90";		// 결제정보 (10:카드  90:무통장(default))
	
	/**************************/
	/**** 전역변수 선언끝 *****/
	/**************************/
	
	// 계약기간 변동에 따른 할인가격
	function chgAgreeTermBox() {
		var gdsPriceTemp = vGdsPrice;
		var boxSelect = document.getElementById("agreeTermBox");
		var vBoxSelect = boxSelect.options[boxSelect.selectedIndex].value;		// 장바구니 모달 수량 변경
		var boxValue = boxSelect.options[boxSelect.selectedIndex].value;
		if(boxValue == 6) {
			vGdsPriceTemp = gdsPriceTemp;
			realGdsPrice = vGdsPriceTemp;
			$('#gdsPrice').val(vGdsPriceTemp);		// 장바구니 모달 가격 변경
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");		// 상세정보 가격 변경
			$('#agreeTerm').val(vBoxSelect);		// 장바구니 모달 계약기간 변경
			$('#realGdsPrice').val(vGdsPriceTemp);	// 결제 모달 가격 변경
			$('#realGdsPrice2').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");	// 결제 모달 가격 가짜 변경
			$('#realAgreeTerm').val(vBoxSelect);	// 결제 모달 계약기간 변경
			vRealGdsPrice = parseInt(realGdsPrice);
		}
		else if(boxValue == 12) {
			vGdsPriceTemp = gdsPriceTemp;
			realGdsPrice = vGdsPriceTemp;
			$('#gdsPrice').val(vGdsPriceTemp);	
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");	
			$('#agreeTerm').val(vBoxSelect);
			$('#realGdsPrice').val(vGdsPriceTemp);
			$('#realGdsPrice2').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			$('#realAgreeTerm').val(vBoxSelect);
			vRealGdsPrice = parseInt(realGdsPrice);
		}
		else if(boxValue == 18) {
			gdsPriceTemp = String((gdsPriceTemp*0.95));
			vGdsPriceTemp = gdsPriceTemp;
			realGdsPrice = vGdsPriceTemp;
			$('#gdsPrice').val(vGdsPriceTemp);
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			$('#agreeTerm').val(vBoxSelect);
			$('#realGdsPrice').val(vGdsPriceTemp);
			$('#realGdsPrice2').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			$('#realAgreeTerm').val(vBoxSelect);
			vRealGdsPrice = parseInt(realGdsPrice);
		} else if(boxValue == 24) {
			gdsPriceTemp = String((gdsPriceTemp*0.95));
			vGdsPriceTemp = gdsPriceTemp;
			realGdsPrice = vGdsPriceTemp;
			$('#gdsPrice').val(vGdsPriceTemp);
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			$('#agreeTerm').val(vBoxSelect);
			$('#realGdsPrice').val(vGdsPriceTemp);
			$('#realGdsPrice2').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			$('#realAgreeTerm').val(vBoxSelect);
			vRealGdsPrice = parseInt(realGdsPrice);
		} else if(boxValue == 30) {
			gdsPriceTemp = String((gdsPriceTemp*0.90));
			vGdsPriceTemp = gdsPriceTemp;
			realGdsPrice = vGdsPriceTemp;
			$('#gdsPrice').val(vGdsPriceTemp);
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			$('#agreeTerm').val(vBoxSelect);
			$('#realGdsPrice').val(vGdsPriceTemp);
			$('#realGdsPrice2').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			$('#realAgreeTerm').val(vBoxSelect);
			vRealGdsPrice = parseInt(realGdsPrice);
		} else if(boxValue == 36) {
			gdsPriceTemp = String((gdsPriceTemp*0.90));
			vGdsPriceTemp = gdsPriceTemp;
			realGdsPrice = vGdsPriceTemp;
			$('#gdsPrice').val(vGdsPriceTemp);
			$('#disPrice').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			$('#agreeTerm').val(vBoxSelect);
			$('#realGdsPrice').val(vGdsPriceTemp);
			$('#realGdsPrice2').val(vGdsPriceTemp.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			$('#realAgreeTerm').val(vBoxSelect);
			vRealGdsPrice = parseInt(realGdsPrice);
		}
	}

	// 수량 셀렉트박스 클릭
	function selectOerQty() {
		var sSelect = document.getElementById("selectOerQty");
		var sSelectOdrQty = sSelect.options[sSelect.selectedIndex].value;
		realOdrQty = sSelectOdrQty;
		$('#odrQty').val(sSelectOdrQty);		// 장바구니 모달 변경 수량 변경
		$('#realOdrQty').val(sSelectOdrQty);	// 결제 모달 변경 수량 변경
		vRealOdrQty = sSelectOdrQty;
	}

	// 장바구니 클릭
	function btnCart() {
		var sUserId = "${loginUserId}";
		// 세션체크
		if((sUserId == "") || (sUserId == null)) {
			location.href = "/login";
		}
	}

	// 결제하기 클릭
	function btnOdr() {
		var sUserId = "${loginUserId}";
		// 세션체크
		if((sUserId == "") || (sUserId == null)) {
			location.href = "/login";
		} else {
			if(vRealGdsPrice != 0) {
				vRealTotPrice = vRealGdsPrice * vRealOdrQty;
				$('#realTotPrice').val(vRealTotPrice);
				$('#realTotPriceTxt').val((vRealTotPrice.toString()).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"원");
			}
		}
	}

	// 결제하기 라디오버튼(무통장입금)
	$(document).on("click", "#inlineRadio1", function(){
		radioVal = $('input[name="inlineRadioOptions"]:checked').val();
		$('#bank').show();
		$('#bankInfo').show();
	});

	// 결제하기 라디오버튼(카카오페이)
	$(document).on("click", "#inlineRadio2", function(){
		radioVal = $('input[name="inlineRadioOptions"]:checked').val();
		$('#bank').hide();
		$('#bankInfo').hide();
	});

	// 결제하기 모달 
	$(document).on("click", "#realSubmit", function(){
		var amount = $('#realTotPrice').val();	// 결제할 실제 금액
		var userId = "${loginUserId}";
		var crudGbCd = "II";
		var odrGbCd = "10";
		var payGbCd = radioVal;
		var seq	= "001";
		var mbNo = "${sessionMbNo}";
		var gdsSclassCd = $('#realGdsSclassCd').val();
		var gdsCd = "";
		var gdsPrice = $('#realGdsPrice').val();
		var agreeTerm = $('#realAgreeTerm').val();
		var deliverCost = "";
		var instalCost = "";
		var asCondition = "";
		var odrQty = $('#realOdrQty').val();

		<c:forEach items="${list1}" var="list1">
			gdsCd = "${list1.gdsCd}";
		 	deliverCost = "${list1.deliverCost}";
		 	instalCost = "${list1.instalCost}";
		 	asCondition = "${list1.asCondition}";
		</c:forEach>

		// 카드(카카오페이 결제)
		if(payGbCd == 10) {
			var IMP = window.IMP;
			IMP.init('imp86711610');
			
			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'vbank',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '렌탈미 렌탈상품 결제',
			    amount : amount,
			    buyer_name : userId
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        
					$.ajax({
						url: "/rental/Appli/lg/detail/odr",
						type: "post",
						data: { "totOdrAmt"  	: rsp.paid_amount,
								"crudGbCd"		: crudGbCd,
								"odrGbCd"		: odrGbCd,
								"payGbCd"		: payGbCd,
								"seq"			: seq,
						         "mbNo"			: mbNo,
						         "gdsSclassCd"	: gdsSclassCd,
						         "gdsCd"  		: gdsCd,
						         "gdsPrice"		: gdsPrice,
						         "agreeTerm"	: agreeTerm,
						         "deliverCost"  : deliverCost,
						         "instalCost"  	: instalCost,
						         "asCondition" 	: asCondition,
						         "odrQty"  		: odrQty
							 },
						success : function(){
							//location.href = "/rental/Appli/lg/"+gdsSclassCd+"/detail/"+gdsCd;
							location.href="/mp/";
						}
					});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		
		} else {
			if(true) {
				var msg = '주문이 접수되었습니다.';
				$.ajax({
					url: "/rental/Appli/lg/detail/odr",
					type: "post",
					data: { "totOdrAmt"  	: amount,
							"crudGbCd"		: crudGbCd,
							"odrGbCd"		: odrGbCd,
							"payGbCd"		: payGbCd,
							"seq"			: seq,
					         "mbNo"			: mbNo,
					         "gdsCd"  		: gdsCd,
					         "gdsSclassCd"	: gdsSclassCd,
					         "gdsPrice"		: gdsPrice,
					         "agreeTerm"	: agreeTerm,
					         "deliverCost"  : deliverCost,
					         "instalCost"  	: instalCost,
					         "asCondition" 	: asCondition,
					         "odrQty"  		: odrQty
						 },
					success : function(){
						//location.href = "/rental/Appli/lg/"+gdsSclassCd+"/detail/"+gdsCd;
						location.href="/mp/";
					}
				});
			} else {
				var msg = '주문에 실패하였습니다.';
		        msg += '에러내용 : 무통장입금 주문에러 ERR 900';
			}
			alert(msg);
		}

	});
	
	
</script>
<jsp:include page=".././template/header.jsp"></jsp:include>
</head>
<body>
	<div class="content">
	<br>
		<!--  페이지 상단이동 버튼 -->
	    <a id="backToTop" class="scrolltop" href="#">
			<i class="fas fa-chevron-circle-up">
				<button type="button" id="topButton" style="background-color:white;" data-toggle="tooltip" data-placement="top" title="최상단 이동">		
					<span class="glyphicon glyphicon-circle-arrow-up" aria-hidden="true"></span>
				</button>		
			</i>
	    </a>
		<div class="content-inner">
			<!--  이후 메뉴경로(19.09.02) -->
			<div class="content-inner-menu-path2">
				<c:forEach items="${path }" var="path">
					<h4><a href="/main" id="pathStyle"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a> &nbsp; > &nbsp; <a href="/rental/Appli/lg/${path.homeCd }?" id="pathStyle">${path.gdsMclassNm }</a>
						<c:if test="${not empty path.gdsSclassNm}">
							 &nbsp; > &nbsp; <a href="/rental/Appli/lg/${path.gubunCd }?" id="pathStyle">${ path.gdsSclassNm }</a>
						</c:if>
					</h4>
				</c:forEach>
			</div>
			<div>
				<div class="row">
					<!-- ********************* -->
					<!-- 상세 캐러셀 영역 시작 -->
					<!-- ********************* -->
					<div style="border:0px solid red;" class="product-slider col-md-5">
						<div id="carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<c:forEach items="${list1 }" var="list1">
								<div class="item active">
									<img src="${list1.img1 }">
								</div>
								<div class="item"> <img src="${list1.img2 }"> </div>
								<div class="item"> <img src="${list1.img3 }"> </div>
								<div class="item"> <img src="${list1.img4 }"> </div>
								</c:forEach>
							</div>
						</div>
						<div class="clearfix">
							<div id="thumbcarousel" class="carousel slide" data-interval="false">
								<div class="carousel-inner">
									<div class="item active">
										<div data-target="#carousel" data-slide-to="0" class="thumb"><img src="/imgs/sample1.jpg"></div>
										<div data-target="#carousel" data-slide-to="1" class="thumb"><img src="/imgs/sample2.jpg"></div>
										<div data-target="#carousel" data-slide-to="2" class="thumb"><img src="/imgs/sample3.jpg"></div>
										<div data-target="#carousel" data-slide-to="3" class="thumb"><img src="/imgs/sample4.jpg"></div>
									</div>
								</div>
						    	<!-- /carousel-inner --> 
							</div>
							<!-- /thumbcarousel --> 
						</div>
						<!-- /.container -->
					</div>
					<!-- ******************* -->
					<!-- 상세 캐러셀 영역 끝 -->
					<!-- ******************* -->
					<!-- ******************* -->
					<!-- 상세 정보 영역 시작 -->
					<!-- ******************* -->
					<div style="border:0px solid blue;" class="col-md-7">
						<c:forEach items="${list1 }" var="list1">
						<div style="border:0px solid pink">
							<h4 id="brandNmStyle">${list1.brandNm }</h4>
							<h2 id="gdsNmStyle">${list1.gdsNm }</h2>
							<h4 id="gradeGroup">
								<span class='star-rating'>
									<span id="starPercent"></span>
								</span>
							</h4>
							<h4 id="gradeGroup">
								<input type="text" id="starGrd" disabled value="0">
							</h4>
							<h4 id="gradeGroup">
								<input type="text" id="starText" disabled value="상품평">
							</h4>
							<h4 id="gradeGroup">
								<input type="text" id="starCnt" onfocus="this.blur();" readonly="readonly" value="">
							</h4>
						</div><p>
						<div style="border:1px solid gray"></div>
						<div class="row" style="border:0px solid orange;">
							<div id="detailNm" class="col-md-3" style="border:0px solid black;">
								<div><h3 id="optionSelect1">렌탈가격(월)</h3><h6><br></h6></div>
								<h4 id="optionSelect1">계약기간</h4><h6><br></h6>
								<h4 id="optionSelect1">배송비</h4><h6><br></h6>
								<h4 id="optionSelect1">설치비</h4><h6><br></h6>
								<h4 id="optionSelect1">AS조건</h4><h6><br></h6>
								<h4 id="optionSelect1">모델명</h4><h6><br></h6>
								<h4 id="optionSelect1">제품코드</h4><h6><br></h6>
								<h4 id="optionSelect1">수량</h4>
							</div>
							<div id="detailValue" class="col-md-9" style="border:0px solid pink;">
								<fmt:setLocale value="ko_KR"></fmt:setLocale>
								<div><h3 id="optionSelect3"><input type="text" id="disPrice" disabled value="<fmt:formatNumber value="${list1.gdsPrice }" pattern="#,###" />원"></h3><br></div>
								<div class="box box-primary">
									<select id="agreeTermBox" onchange="chgAgreeTermBox()">
										<option value="${list1.agreeTerm }">&nbsp;${list1.agreeTerm }개월(기본)</option>
										<option value="${list1.agreeTerm*2 }">${list1.agreeTerm*2 }개월</option>
										<option value="${list1.agreeTerm*3 }">${list1.agreeTerm*3 }개월</option>
										<option value="${list1.agreeTerm*4 }">${list1.agreeTerm*4 }개월</option>
										<option value="${list1.agreeTerm*5 }">${list1.agreeTerm*5 }개월</option>
										<option value="${list1.agreeTerm*6 }">${list1.agreeTerm*6 }개월</option>
									</select>
								</div><br>
								<h4>${list1.deliverCost }</h4><h6><br></h6>
								<h4>${list1.instalCost }</h4><h6><br></h6>
								<h4>${list1.asCondition }</h4><h6><br></h6>
								<h4>${list1.modelNm }</h4><h6><br></h6>
								<h4>${list1.gdsCd }</h4><h6><br></h6>
								<div class="box box-primary">
									<select id="selectOerQty" onchange="selectOerQty()">
										<option value=1>&nbsp;1대&nbsp;&nbsp;</option>
										<option value=2>2대</option>
										<option value=3>3대</option>
										<option value=4>4대</option>
										<option value=5>5대</option>
										<option value=6>6대</option>
										<option value=7>7대</option>
										<option value=8>8대</option>
										<option value=9>9대</option>
										<option value=10>10대</option>
									</select>
								</div><br>
							</div>
							<div class="row" style="border:0px solid orange;" align="center">
								<div class="chargediv">
						       		<button style="width:150px;" id="charge_button1" type="button" class="btn btn-info" data-backdrop="static" data-toggle="modal"data-target="#myModal">상담예약</button>
						       	</div>&nbsp;&nbsp;&nbsp;&nbsp;
						       	<div class="chargediv">
						       		<button style="width:150px;" id="charge_button2" type="submit" class="btn btn-success" onclick="btnCart();" data-backdrop="static" data-toggle="modal"data-target="#myModal2">장바구니</button>
						       	</div>&nbsp;&nbsp;&nbsp;&nbsp;
						       	<div class="chargediv">
						       		<button style="width:150px;" id="charge_button3" type="submit" class="btn btn-danger" onclick="btnOdr();" data-backdrop="static" data-toggle="modal"data-target="#myModal3">주문하기</button>
						       	</div>&nbsp;&nbsp;&nbsp;&nbsp;
							</div><br>
							<div class="row" style="border:0px solid orange;" align="center">
								<div class="chargediv">
						       		<button style="width:495px;" id="charge_button4" type="submit" class="btn btn-default" disabled="disabled" ><span id="quick0">렌탈미 빠른상담&nbsp;</span><span id="quick">&nbsp;1234-1234</span></button>
						       	</div>&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<form id="target" action="/rental/Appli/lg/detail/quest" method="post">
								<!-- 상담예약 모달 -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel"></h4>
										    </div>
											<div class="modal-body">
											    	<input type="text" class="form-control" id="gdsSclassCd" name="gdsSclassCd" value="${list1.gdsSclassCd }" style="display: none;" >
											    	<input type="text" class="form-control" id="gdsCd" name="gdsCd" value="${list1.gdsCd }" style="display: none;">
										    	<div class="form-group">
											    	<label for="name">이름</label>
											    	<input type="text" class="form-control" id="name" name="questNm" value="" placeholder="이름">
												</div>
												<div class="form-group">
											    	<label for="hp">휴대전화</label>
											    	<input type="text" class="form-control" id="hp" name="hp" value="" placeholder="(-)없이 숫자만 입력, 9자 이상">
												</div>
												<div class="form-group">
											    	<label for="email">이메일</label>
											    	<input type="text" class="form-control" id="email" name="email" value="" placeholder="rentalme@rentalme.com">
												</div>
												<div class="form-group">
											    	<label for="agree">개인정보 약관동의</label>
											    	<textarea class="form-control" id="agree" name="agree" readonly="readonly">고객님의 렌탈상품 상담과 관련하여 성실하게 답변 및 안내해 드리기 위해 필요한 최소한의 개인정보를 수집하고 있습니다. 이에개인정보의 수집 및 이용에 관하여 아래와 같이 고지하오니 충분히 읽어보신 후 동의하여 주시기 바랍니다. 
	
	1. 개인정보의 수집/이용 목적 정확한 렌탈료의 계산, 렌탈상품 및 렌탈신청 안내 및 전화를 이용한 추가적인 렌탈상품 안내 
	
	2. 수집하는 개인정보 항목 개인식별정보(성명, 전화번호) 
	
	3. 개인정보의 보유/이용기간 동의 시부터 최대 2년간 
	
	4. 개인정보의 수집/이용하는 자 렌탈미 
	
	※ 귀하는 상기 동의를 거부할 수 있습니다. 다만, 이에 대한 동의를 하시지 않을 경우에는 상담 서비스의 제공이 제한 될 수 있음을 알려드립니다.
													</textarea>
													<div>
							                            <div class="checkbox">
							                                <label>
							                                    <input type="checkbox" id="agreeCheck" name="remember" checked="checked" disabled="disabled"> 개인정보제공 동의
							                                </label>
							                            </div>
							                        </div>
												</div>
											</div>
										    <div class="modal-footer">
										    	<button type="submit" id="questSubmit" class="btn btn-primary">등록</button>
												<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
										    </div>
										</div>
								    </div>
								</div>
								<!-- 모달 끝 -->
							</form>
							<form id="target" action="/rental/Appli/lg/detail/cart" method="post">
								<!-- 장바구니 모달 -->
								<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel2"></h4>
										    </div>
											<div class="modal-body">
										    	<input type="text" class="form-control" id="gdsSclassCd" name="gdsSclassCd" value="${list1.gdsSclassCd }" style="display: none;" >
										    	<input type="text" class="form-control" id="gdsCd" name="gdsCd" value="${list1.gdsCd }" style="display: none;">
										    	<input type="text" class="form-control" id="mbNo" name="mbNo" value="${sessionMbNo }" style="display: none;">
										    	<input type="text" class="form-control" id="gdsPrice" name="gdsPrice" value="${list1.gdsPrice }" style="display: none;">
										    	<input type="text" class="form-control" id="agreeTerm" name="agreeTerm" value="${list1.agreeTerm}" style="display: none;">
										    	<input type="text" class="form-control" id="odrQty" name="odrQty" value="1" style="display: none;">
											</div>
											<div class="form-group">
										    	<label for="name" id="cartConfirm">&nbsp;&nbsp;&nbsp;장바구니에 등록 하시겠습니까?</label>
											</div>
										    <div class="modal-footer">
										    	<button type="submit" id="questSubmit" class="btn btn-primary">등록</button>
												<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
										    </div>
										</div>
								    </div>
								</div>
								<!-- 모달 끝 -->
							</form>
								<!-- 결제하기 모달 -->
								<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel3"></h4>
										    </div>
											<div class="modal-body">
											    <div class="row" style="border:0px solid orange;">
				    								<h3><label for="realGdsNm">&nbsp;&nbsp;상품정보</label></h3>
					    							<div id="detailNm" class="col-md-4" style="border:0px solid black;">
												    	<h4><label for="realGdsNm">상품명</label></h4>
												    	<h4><label for="realGdsPrice">렌탈가격(월)</label></h4>
												    	<h4><label for="realAgreeTerm">계약기간</label></h4>
												    	<h4><label for="realDeliverCost">배송</label></h4>
												    	<h4><label for="realInstallCost">설치비</label></h4>
												    	<h4><label for="realAsCondition">AS조건</label></h4>
												    	<h4><label for="realOdrQty">수량</label></h4>
													</div>
													<div id="detailNm2" class="col-md-8">
												    	<input type="text" class="form-control" id="realGdsCd" name="gdsCd" value="${list1.gdsCd }" style="display: none;">
												    	<input type="text" class="form-control" id="realGdsSclassCd" name="realGdsSclassCd" value="${list1.gdsSclassCd }" style="display: none;">
														<input type="text" class="btn btn-defalut" id="realGdsNm" disabled="disabled" style="background-color:white; text-align:left;" name="gdsNm" value="${list1.gdsNm }"  >
														<input type="text" class="form-control" id="realGdsPrice" name="gdsPrice" value="${list1.gdsPrice }" style="display: none;" >
														<fmt:setLocale value="ko_KR"></fmt:setLocale>
														<input type="text" class="btn btn-defalut" id="realGdsPrice2" disabled="disabled" style="background-color:white; text-align:left;" name="gdsPrice2" value="<fmt:formatNumber value="${list1.gdsPrice }" pattern="#,###" />원 "  >
														<input type="text" class="btn btn-defalut" id="realAgreeTerm" disabled="disabled" style="background-color:white; text-align:left;" name="agreeTerm" value="${list1.agreeTerm }"  >
														<input type="text" class="btn btn-defalut" id="realDeliverCost" disabled="disabled" style="background-color:white; text-align:left;" name="deliverCost" value="${list1.deliverCost }"  >
														<input type="text" class="btn btn-defalut" id="realInstalCost" disabled="disabled" style="background-color:white; text-align:left;" name="instalCost" value="${list1.instalCost }"  >
														<input type="text" class="btn btn-defalut" id="realAsCondition" disabled="disabled" style="background-color:white; text-align:left;" name="asCondition" value="${list1.asCondition }"  >
												    	<input type="text" class="btn btn-defalut" id="realOdrQty" disabled="disabled" style="background-color:white; text-align:left;" name="odrQty" value="1">
													</div>
												</div>
												<div class="row" style="border:0px solid orange;">
													<h3><label>&nbsp;&nbsp;결제정보</label></h3>
													<label class="radio-inline">
												  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="inlineRadioOptions" id="inlineRadio1" checked="checked" value="90">무통장입금
													</label>
													<label class="radio-inline">
												  		<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="10">카카오페이
													</label>
													<h5><label id="bank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 예금주명 : (주)렌탈미 &nbsp;&nbsp;&nbsp; 입금계좌번호 : 415015-92-928253(농협)</label></h5>
													<h5><label id="bankInfo">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 무통장입금은 주문하기 후 입금이 완료되어야 최종 주문확정처리 됩니다.</label></h5>
												</div>
												<div class="form-group" id="realTotPriceTxtCls">
											    	<input type="text"  id="realTotPrice" style="border:0px;" name="realTotPrice" readonly="readonly"  value="${list1.gdsPrice }">
											    	<fmt:setLocale value="ko_KR"></fmt:setLocale>
											    	<h2><input type="text"  id="realTotPriceTxt" style="border:0px;" name="realTotPriceTxt" readonly="readonly" value="<fmt:formatNumber value="${list1.gdsPrice }" pattern="#,###" />원 "></h2>
												</div>
											    <div class="modal-footer">
											    	<button type="button" id="realSubmit" class="btn btn-danger">주문하기</button>
													<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
											    </div>
									    	</div>
										</div>
							    	</div>
								</div>
								<!-- 모달 끝 -->					
						</div>
					</c:forEach>
					</div>
					<!-- ***************** -->
					<!-- 상세 정보 영역 끝 -->
					<!-- ***************** -->
				</div>
				<!-- ******************* -->
				<!-- 상세 하단 영역 시작 -->
				<!-- ******************* -->	
				<div id="bottom" style="border:0px solid green;">
					<div id="areaAll">
						<div id="area1">
							<br><br><br>
							<div id="menu1">
								<ul class="nav nav-tabs nav-justified">
									<li role="presentation" class="active" id="sort-btn1"><a>제품 상세정보</a></li>
									<li role="presentation" id="sort-btn2"><a>배송 및 A/S정보</a></li>
									<li role="presentation" id="sort-btn3"><a>교환/반품정보</a></li>
									<c:forEach items="${reviewCnt }" var="reviewCnt">
										<li role="presentation"id="sort-btn4"><a>상품후기(${reviewCnt.cnt })</a></li>
									</c:forEach>
								</ul>
							</div>
							<div id="info1">
								<br><br><br>
								<!-- for문.. -->
								<div id="imgs1">
									<img src="/imgs/inner1.jpg">
								</div>
								<div id="imgs2">
									<img src="/imgs/inner2.jpg">
								</div>
								<div id="imgs3">
									<img src="/imgs/inner3.jpg">
								</div>
							</div>
						</div>
						<div id="area2">
							<br><br><br>
							<div id="menu2">
								<ul class="nav nav-tabs nav-justified">
									<li role="presentation" id="sort-btn1"><a>제품 상세정보</a></li>
									<li role="presentation" class="active" id="sort-btn2" onClick=""><a>배송 및 A/S정보</a></li>
									<li role="presentation" id="sort-btn3"><a>교환/반품정보</a></li>
									<c:forEach items="${reviewCnt }" var="reviewCnt">
										<li role="presentation" id="sort-btn4"><a>상품후기(${reviewCnt.cnt })</a></li>
									</c:forEach>
								</ul>
							</div>
							<div id="info2">
								<br><br><br>
								<ul>
									<li id="li1"><span class="glyphicon glyphicon glyphicon-gift" aria-hidden="true"></span> 상품의 배송</li>
									<ul>
										<h4><li>신청상품의 안전한 배송을 위해, 고객님께서 주문시 지정한 배송장소 이외, 제3자 전달이나 임의장소 배송은 제공하지 않습니다.</li></h4>
										<h4><li>신청하신 제품의 전문설치기사가 배달, 설치해 드립니다. (도서 산간지역은 제한될 수 있습니다.) </li></h4>
										<h4><li>배송전일 또는 당일 오전에 배송설치기사가 고객님께 연락을 드린 후 배송설치 해 드립니다. </li></h4>
										<h4><li>신청상품은 7일~14일 이내 제품을 받아볼 수 있습니다. (단, 제조사 재고현황에 따라 배송일은 예고없이 변경될 수 있습니다.) </li></h4>
										<h4><li>에어컨 등 계절별 특수상품은 제조사 재고현황 및 설치기사 사정에 따라 14일~30일 이후 배송 될 수 있습니다. </li></h4>
										<h4><li>동일품목의 폐가전 무료수거가 가능합니다. (단, 에어컨은 별도 확인 필요) </li></h4>
										<h4><li>설치상품 주문 시, 설치환경을 반드시 체크해 주시기 바랍니다. (제품의 크기와 설치공간의 크기, 출입문 사이즈 등의 체크) </li></h4>
									</ul>
									<br><br>
									<li id="li1"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span> A/S조건</li>
									<ul>
										<h4><li>신청하신 렌탈상품은 제조사의 A/S 정책을 따르며, 제조사의 무상 A/S기간동안 제조사를 통해 A/S를 받으실 수 있습니다. <br>(1년 무상 A/S, 이후 유상 A/S 등, 단 고객과실일 경우는 유상 A/S)</li></h4>
										<h4><li>회사가 지정한 일부 상품에 한해, 3년 무상 A/S 서비스 (제조사 무상 A/S 1년 + 회사 무상 A/S 2년)가 제공됩니다. </li></h4>
										<h4><li>“무상A/S 3년” 이미지가 표기된 상품에 한하며, 1년이내는 제조사로, 1년이후~3년까지는 당사 고객센터로 신청바랍니다.</li></h4>
										<h4><li>“무상A/S 3년” 혜택은 아래의 경우 제공되지 않습니다.</li></h4>
										<h4><li id="li2">가. 제품하자가 아닌 고객과실에 의한 파손 등의 경우</li></h4>
										<h4><li id="li2">나. 상품품질 보증서에 기재된 상품품질보증의 상태, 조건, 혹은 이유에 해당하지 않는 것으로 인한 경우</li></h4>
										<h4><li id="li2">다. 제조사의 상품품질보증기간에 의한 무상수리 또는 제조사로부터 기타 무상수리가 가능한 경우</li></h4>
										<h4><li id="li2">라. 사용자가 임의로 상품을 개조,조립, 변경한 경우</li></h4>
										<h4><li id="li2">마. 상품을 수리 받기위해 발생한 고객의 교통비용 등</li></h4>
									</ul>
									<br><br>
								</ul>
							</div>
						</div>
						<div id="area3">
							<br><br><br>
							<div id="menu3">
								<ul class="nav nav-tabs nav-justified">
									<li role="presentation" id="sort-btn1"><a>제품 상세정보</a></li>
									<li role="presentation" id="sort-btn2"><a>배송 및 A/S정보</a></li>
									<li role="presentation" class="active" id="sort-btn3" onClick=""><a>교환/반품정보</a></li>
									<c:forEach items="${reviewCnt }" var="reviewCnt">
										<li role="presentation" id="sort-btn4"><a>상품후기(${reviewCnt.cnt })</a></li>
									</c:forEach>
								</ul>
							</div>
							<div id="info3">
								<br><br><br>
								<ul>
									<li id="li1"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 교환/반품 신청기간</li>
									<ul>
										<h4><li>교환/반품은 제품 수령일로부터 7일 이내에 가능합니다.</li></h4>
										<h4><li>다만, 제품이 표시.광고의 내용과 다르거나 제품의 불량, 하자 등 계약내용과 다르게 이행된 경우, 제품수령일로부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 교환/반품이 가능합니다.</li></h4> 
										<h4><li>제품을 교환/반품 하시기 전, 고객센터로 미리 연락을 주셔야 합니다.</li></h4> 
										<h4><li>제품 자체에 하자가 있는 경우, 각 제조사 서비스 센터로 접수하신 후, A/S기사의 판정을 거친 후, 소비자 분쟁해결기준에 의거하여 교환/환불/수리해 드립니다.</li></h4>
									</ul><br><br>
									<li id="li1"><span class="glyphicon glyphicon-usd" aria-hidden="true"></span> 반품 회수(배송)비용</li>
									<ul>
										<h4><li>제품이 표기, 광고의 내용과 다르거나 제품의 불량, 하자 등 계약내용과 다르게 이행된 경우에는 고객님께서 반품회수(배송)비용을 부담하실 필요가 없으나, 그 외 고객님의 단순 변심 및 제품에 대한 주관적이 불만족으로 인하여 반품을 진행하시는 경우 고객님께서 반품회수(배송) 비용을 부담하셔야 합니다.</li></h4>
									</ul><br><br>
									<li id="li1"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span> 교환/반품 불가 안내</li>
									<ul>
										<h4><li>제품 배송완료 후 고객님이 제품포장을 개봉하여 사용한 경우 또는 제품 배송완료 후 고객님께서 제품의 하자없음을 확인한 후 설치가 완료된 경우 등 고객님의 책임 있는 사유로 상품이 멸실 또는 훼손된 경우<br>(단, 단순히 상품의 내용을 확인하기 위해 포장 등을 훼손한 경우는 제외)</li></h4>
										<h4><li>고객님의 사용 또는 일부 소비로 제품의 가치가 현저히 감소된 경우</li></h4>
										<h4><li>패키지 상품의 경우 구성상품 일부의 개봉/설치/사용으로 상품가치가 현저히 감소된 경우</li></h4>
										<h4><li>시간이 경과 되어 재판매가 곤란할 정도로 상품가치가 상실된 경우</li></h4>
										<h4><li>설치 완료 상품에 하자가 없는 경우</li></h4>
										<h4><li>상품 등의 내용이 표시/광고 내용 및 계약내용과 같고, 별도의 하자가 없음에도 단순변심으로 인한 교환을 요구하는 경우</li></h4>
										<h4><li>기타, '전자상거래 등에서의 소비자 보호에 관한 법률'등 관계법령이 정하는 교환/반품제한 사유에 해당되는 경우</li></h4>
										<h4><li>그 밖에 교환/반품을 인정하는 경우, 통신판매업자에게 회복할 수 없는 중대한 피해가 예상되는 경우</li></h4>
									</ul><br><br>
									<li id="li1"><span class="glyphicon glyphicon-list" aria-hidden="true"></span> 해재시 위약관련 사항[2019년 10월 1일 이후 계약건부터 적용]</li>
									<ul>
										<h4><li>렌탈계약 해제 시, “정상적인 렌탈제품의 반납”여부에 따라, 아래의 해지위약관련 비용을 납부하셔야 합니다.</li></h4>
										<h4><li>“정상적인 렌탈제품의 반납”이란 반납된 제품이 정상 작동되고, 반납된 제품의 본품 및 구성품이 분실,파손없이 전부 반납된 경우를 말합니다. </li></h4>
										<h4><li id="li2">가. 정상적인 렌탈제품을 반납하고 해지할 경우 해지위약 관련 비용</li></h4>
										<h4><li id="li2">&nbsp;&nbsp; 1) 해지시점의 연체 렌탈료, 연체이자 (발생 시) </li></h4>
										<h4><li id="li2">&nbsp;&nbsp; 2) 중도해지 위약금 : 중도해지일 현재 잔여렌탈료 합계금액의 30% 금액</li></h4>
										<h4><li id="li2">&nbsp;&nbsp; 3) 면제받았던 설치비용(가입비+등록비 포함) : 20만원 </li></h4>
										<h4><li id="li2">&nbsp;&nbsp; 4) 회수비용 : 10만원~30만원 (제품별 상이함) </li></h4>
										<h4><li id="li2">나. 정상적인 렌탈제품을 반납하지 않고 해지할 경우 해지위약 관련 비용 </li></h4>
										<h4><li id="li2">&nbsp;&nbsp; 1) 해지시점의 연체렌탈료, 연체이자 (발생 시) </li></h4>
										<h4><li id="li2">&nbsp;&nbsp; 2) 잔여렌탈료 합계금액의 100% 금액 </li></h4>
										<h4><li id="li2">다. 잔여렌탈료 합계금액은 “월 렌탈료 x 잔여약정월 (단, 중도해지일이 포함된 월의 렌탈료는 일할계산)”로 계산됩니다.</li></h4>
									</ul>
									<br><br>
								</ul>
							</div>
						</div>
						<div id="area4">
							<br><br><br>
							<div id="menu4">
								<ul class="nav nav-tabs nav-justified">
									<li role="presentation" id="sort-btn1"><a>제품 상세정보</a></li>
									<li role="presentation" id="sort-btn2"><a>배송 및 A/S정보</a></li>
									<li role="presentation" id="sort-btn3"><a>교환/반품정보</a></li>
									<c:forEach items="${reviewCnt }" var="reviewCnt">
										<li role="presentation" class="active" id="sort-btn4" onClick=""><a>상품후기(${reviewCnt.cnt })</a></li>
									</c:forEach>
								</ul>
							</div>
							<div id="info4">
								<br><br><br>
								<table class="ordtable table" id="reviewTable">
									<thead>
									   <tr class="active">
									      <th id="re1">글번호</th>
									      <th id="re2">내용</th>
									      <th id="re3">만족도</th>
									      <th id="re4">작성자</th>
									   </tr>
									</thead>
						          	<tbody>
										<c:forEach items="${review }" var="review">
										<tr>
											<td>${review.rnk }</td>
											<td>${review.content }</td>
											<td id="reviewGrade${review.rnk }">${review.grade }</td>
											<td>${review.userNm }</td>
										</tr>
							          	</c:forEach>
						          	</tbody>
					          	</table>
							</div>
							<br><br><br><br><br>
						</div>
					</div>
				</div>
				<!-- ***************** -->
				<!-- 상세 하단 영역 끝 -->
				<!-- ***************** -->		
				</div>
			</div>
			<br><br>
		<jsp:include page=".././template/footer.jsp"></jsp:include>	
	</div>

</body>

</html>



