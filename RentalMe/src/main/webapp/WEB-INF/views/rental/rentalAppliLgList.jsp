<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RentalMe - 렌탈</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
<style type="text/css">
.content {
	height: 100%;
}
.content-inner {
	margin-left:205px;
	margin-right:205px;
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
	text-decoration: none !important;
}
#pathStyleMain {
	color: black;
	text-decoration: none !important;
	font-family:"nanumEB";
	font-size:40pt;
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


/* ---------- 소메뉴 영역 시작 -------- */
#sMenuBorder1 {
	border-top:1px solid #999;
	border-bottom:1px solid #999;
}
#sMenuBorder2 {
	border-bottom:1px solid #999;
}
#menuBtn11, #menuBtn21, #menuBtn31, #menuBtn41, #menuBtn51, #menuBtn61 {
	border-left:0px solid #999;
	font-family:"nanumEB";

}
#menuBtn16, #menuBtn26, #menuBtn36, #menuBtn46, #menuBtn56, #menuBtn66 {
	border-left:0px solid #999;
	font-family:"nanumEB";
}
#menuBtn15, #menuBtn25, #menuBtn35, #menuBtn45, #menuBtn55, #menuBtn65 {
	border-right:0px solid #999;
	font-family:"nanumEB";
}
#menuBtn20, #menuBtn30, #menuBtn40, #menuBtn50, #menuBtn60, #menuBtn70 {
	border-right:0px solid #999;
	font-family:"nanumEB";
}

/* ---------- 소메뉴 영역 끝 -------- */

/* ---------- 옵션 영역 시작 ---------- */
#option-price-search {
	width: 400px;
	text-align: left;
	border-left: none;
}
#priceSearchSt {
	width: 100px;
	text-align: right;
}
#priceSearchEd {
	width: 100px;
	text-align: right;
}
#contentSearch {

}
#option-select {
	text-align: center;
}
h6 {
	display: inline;
}
#bestNotice1, #bestNotice3 {
	font-size: 9pt;
}
#option-menu, #option-price, #option-status, #option-result {
	width: 150px;
	text-align: center;
	vertical-align:middle;
	font-size: 11pt;
	font-weight: bolder;
}
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

/* BEST 인기상품 케러셀 명 시작 */
#best1 {
	font-family:"nanumEB";
	font-size:30pt;
} 
#best2 {
	font-family:"nanumEB";
	font-size:19pt;
}

/* BEST 인기상품 케러셀 명 끝 */

/* --------- BEST 영역 시작 --------- */
/* List style */
ul.thumbnails { 
	list-style: none; 
	margin: 0px 0px 0px 0px;
	padding: 0;
}
li.col-sm-3 {
	padding: 2px 2px 2px 2px;
}
.imglist:hover{
	border: 2px solid black;
	margin: -2px -0px;
}

.caption-box h4 {
    font-size: 1.50rem;
    color: #444;
    }
.caption-box h5 {
	text-align: center;
    font-size: 2.00rem;
    color: darkred;
    }
.caption-box p {
	text-decoration:none;
	font-size: 1.25rem;
	color: #999;
}
.caption-box a:link{
	color:#007cd0;
	text-decoration:none;
}
.caption-box a:visited{
	color:#007cd0;
	text-decoration:none;
}
.caption-box a:active{
	color:#007cd0;
	text-decoration:none;
}
.caption-box a:hover{
	color:#007cd0;
	text-decoration:none;
}
.caption-box {
	text-align: left;
}
.btn.btn-mini {
	font-size: 0.63rem;
}
#brandNmStyle{
	font-weight:bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.stsAlignN{
	font-weight:bold;
}
.stsAlignU{
	color:pink;
}
.thumbnailDiv{
	border: 1px solid red;
	height: 250px;
	text-align: center;
}
.thumbnailDiv a img{
	display: block;
	height: 240px;
	max-height: 240px;
}
 .img-responsive, .thumbnail > img, .thumbnail a > img, .carousel-inner > .item > img, .carousel-inner > .item > a > img {
    display: block;
    max-width: 100%;
    height: 180px;
}

/* ------ 하단 정렬 시작------- */
#sort-btn1, #sort-btn2, #sort-btn3, #sort-btn4, #sort-btn5, #sort-btn6 {
	cursor:pointer;
}

/* ------ 하단 정렬 끝------- */
#paginationBox {
	width: 100%;
	text-align: center;
	margin: 0px auto;
}

/* Control box */
.control-box {
	width: 100%;
}
.carousel-control {

/* 	background: #666 !important;
	border: 0px;
	border-radius: 0px;
	display: inline-block;
	font-size: 34px;
	font-weight: 200;
	line-height: 18px;
	opacity: 0.5;
	padding: 120px 10px; */

	margin: 120px -55px 0px -55px;
	height: 30px;
	width: 30px;
}

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

</style>
<script type="text/javascript">

	window.onload = function () {
		//alert("안쪽 처음");

		// 소메뉴 셋팅
		var sMenu = ${menu};
		menu = sMenu;
		$('#menuBtn'+sMenu).attr('class','btn btn-primary');

		// 옵션적용 안내 셋팅
		if(${menu}%10 != 0) {
			$('#bestNotice1').hide();
			$('#bestNotice3').hide();
		} 
		
		// 옵션 브랜드 셋팅
		for(var i=0; i<vvBrandNm.length; i++) {
			$('#optionBrand'+vvBrandNm[i]).attr('class', 'label label-primary');
			document.getElementsByName("brandCheckBox"+vvBrandNm[i])[0].checked = true;
		}
		
		// 옵션 가격 셋팅(최소)
		var sPriceMin = "${priceMin}";
		$('#optionPriceMin'+sPriceMin).attr('class', 'label label-primary');
		if(!sPriceMin) {
		} else {
			document.getElementsByName("priceMinCheckBox"+sPriceMin)[0].checked = true;
		}
		
		// 옵션 가격 셋팅(절반)
		var sPriceHalf = "${priceHalf}";
		$('#optionPriceHalf'+sPriceHalf).attr('class', 'label label-primary');
		
		// 옵션 가격 셋팅(최대)
		var sPriceMax = "${priceMax}";
		$('#optionPriceMax'+sPriceMax).attr('class', 'label label-primary');
		if(!sPriceMax) {
		} else {
			document.getElementsByName("priceMaxCheckBox"+sPriceMax)[0].checked = true;
		}
		
		// 상품 상태 셋팅
		var sSts = "${sts}";
		$('#optionSts'+sSts).attr('class', 'label label-primary');
		if(!sSts) {
		} else {
			document.getElementsByName("stsCheckBox"+sSts)[0].checked = true;
		}

		// 상품 결과내검색value 셋팅
		var sSearchValue = "${search}";
		if(!sSearchValue) {
		} else {
			document.getElementById("contentSearch").value = sSearchValue;
		}

		// 상품 가격검색value(시작가) 셋팅
		var sSearchPriceSt = "${searchPriceSt}";
		if(!sSearchPriceSt) {
		} else {
			document.getElementById("priceSearchSt").value = sSearchPriceSt;
		}

		// 상품 가격검색value(종료가) 셋팅
		var sSearchPriceEd = "${searchPriceEd}";
		if(!sSearchPriceEd) {
		} else {
			document.getElementById("priceSearchEd").value = sSearchPriceEd;
		}
		
		// 상품 정렬
		var sSort = "${sort}";
		// 소팅1번 자동셋팅
		if(!sSort) {
			$('#sort-btn'+1).attr('class','active');
		} else {
			$('#sort-btn'+sSort).attr('class','active');
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
		
		//alert("안쪽마지막");
	}
	//alert("바깥쪽");

	/**************************/
	/**** 전역변수 선언시작 ***/
	/**************************/
	var loc = "/rental/Appli/lg/";	// 기본주소 URL 셋팅
	var vMenu = "${menu}"+"?";		// 소메뉴
	var vvBrandNm = new Array();	// 옵션 브랜드
	<c:forEach items="${brandNm}" var="brandNm" varStatus="status">
		vvBrandNm[${status.index}] = "${brandNm}";
	</c:forEach>
	var flg;
	var vSts = "${sts}"+"&";	// 옵션 상태
	var vSearchValue = "${search}"+"&";	// 옵션 검색value
	var vSearchPriceSt ="${searchPriceSt}";	// 옵션 가격검색 st
	var vSearchPriceEd ="${searchPriceEd}";	// 옵션 가격검색 ed
	var vSearchPrice = "&";	// 가격 st+ed 변수
	var vSort = "${sort}";	// 정렬기준
	if(!vSort) {
		vSort = "1";	// sort값 자동 셋팅
	}

	var vMasterLoc;	// 마스터 URL 셋팅

	// 최소가격 셋팅
	if(vSearchPriceSt != 0) {
		if((!vSearchPriceEd) || (vSearchPriceEd == 0)) {
			vSearchPrice = "&searchPriceSt="+vSearchPriceSt;
		}
	}

	// 최대가격 셋팅
	if(vSearchPriceEd != 0) {
		if((!vSearchPriceSt) || (vSearchPriceSt == 0)) {
			vSearchPrice = "&searchPriceEd="+vSearchPriceEd;
		}
	}

	// 최소&최대가격 셋팅
	if((vSearchPriceSt != 0) && (vSearchPriceEd != 0)) {
		vSearchPrice = "&searchPriceSt="+vSearchPriceSt+"&searchPriceEd="+vSearchPriceEd;
	}

	// 브랜드명 셋팅
	if(vvBrandNm.length > 0) {
		var vvBrandNmTemp = "";
		for(var i=0; i<vvBrandNm.length; i++) {
			vvBrandNmTemp += ("brandNm=" + (vvBrandNm[i]+"&") );
		}	
		vMasterLoc = loc + vMenu + vvBrandNmTemp;
	}
	else {
		vMasterLoc = loc + vMenu;
	}

	// 마스터변수
	vMasterLoc = vMasterLoc + ("&sts="+vSts) + ("&search="+vSearchValue) + vSearchPrice;
	
	/**************************/
	/**** 전역변수 선언끝 *****/
	/**************************/
	
	
	// 소메뉴 선택
	function menuBtnClick(menu) {
		var locGo = loc+menu+"?";
		location.href = locGo;
	}

	// 브랜드 checkBox 선택시
	function brandCheckBox(brandNm) {
		// 체크박스가 선택되었을 때
		if(document.getElementsByName("brandCheckBox"+brandNm)[0].checked == true) {
			flg = 1;	// brandNm 반복횟수 + 1
			optionBrandBtnClick(brandNm);
		} else {
			flg = 0;	// brandNm 반복횟수 + 0
			optionBrandBtnClick(brandNm);
		}
	}

	// 브랜드 선택
	function optionBrandBtnClick(brandNm) {
		var locGo;					// URL 주소저장
		var vvBrandNmTemp="";		// brandNm 임시저장

		// 브랜드명 중복검사
		function brandRoop() {
			for(var i=0; i<vvBrandNm.length+flg; i++) {
				if((i > 0) && (i <= vvBrandNm.length)) {
					vvBrandNmTemp += "&";
				}
				if(i < vvBrandNm.length) {
					if(vvBrandNm[i] == brandNm) {
					} else {
						vvBrandNmTemp += "brandNm="+vvBrandNm[i];
					}
				} else {
					if(vvBrandNm[i] == brandNm) {
					} else {
						vvBrandNmTemp += "brandNm="+brandNm;
					}
				}
			}
		}

		if(vvBrandNm.length > 0) {
			if(vSts != "&") {
				brandRoop();
				if(vSts.replace("&","") != vSts) {
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
				} else {
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+vSearchPrice+"&sort="+vSort;
				}
			} else {
				brandRoop();
				if(vSts.replace("&","") != vSts) {
					locGo = loc+vMenu+vvBrandNmTemp+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
				} else {
					locGo = loc+vMenu+vvBrandNmTemp+vSearchPrice+"&sort="+vSort;
				}
			}
		} else {
			if(vSts != "&") {
				brandRoop();
				if(vSts.replace("&","") != vSts) {
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
				} else {
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+vSearchPrice+"&sort="+vSort;
				}
			} else {
				brandRoop();
				if(vSts.replace("&","") != vSts) {
					locGo = loc+vMenu+vvBrandNmTemp+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
				} else {
					locGo = loc+vMenu+vvBrandNmTemp+vSearchPrice+"&sort="+vSort;
				}
			}
		}
		location.href = locGo;
	}

	// 상태 checkBox 선택시
	function stsCheckBox(sts) {
		
		// 체크박스가 선택되었을 때
		if(document.getElementsByName("stsCheckBox"+sts)[0].checked == true) {
			flg = 0;	// brandNm 반복횟수 + 0
			optionStsBtnClick(sts);
		} else {
			flg = 0;	// brandNm 반복횟수 + 0
			optionStsBtnClick(sts);
		}
	}
	
	// 상태 선택
	function optionStsBtnClick(sts) {

		var locGo;					// URL 주소저장
		var vvBrandNmTemp="";		// brandNm 임시저장
		
		// 상태 브랜드명 중복검사
		function stsRoop() {
			for(var i=0; i<vvBrandNm.length+flg; i++) {
				if((i > 0) && (i <= vvBrandNm.length)) {
					vvBrandNmTemp += "&";
				}
				if(i < vvBrandNm.length) {
					vvBrandNmTemp += "brandNm="+vvBrandNm[i];
				} else {
					vvBrandNmTemp += "brandNm="+brandNm;
				}
			}
		}
		
		if(vvBrandNm.length > 0) {
			if(vSts != "&") {
				if(vSearchValue != "&") {
					stsRoop();
					if(vSts.replace("&","") != sts) {
						locGo = loc+vMenu+vvBrandNmTemp+"&sts="+sts+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
					} else {
						locGo = loc+vMenu+vvBrandNmTemp+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
					}
				} else {
					stsRoop();
					if(vSts.replace("&","") != sts) {
						locGo = loc+vMenu+vvBrandNmTemp+"&sts="+sts+vSearchPrice+"&sort="+vSort;
					} else {
						locGo = loc+vMenu+vvBrandNmTemp+vSearchPrice+"&sort="+vSort;
					}
				}
			} else {
				if(vSearchValue != "&") {
					stsRoop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+sts+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
				} else {
					stsRoop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+sts+vSearchPrice+"&sort="+vSort;
				}
			}
		} else {
			if(vSts != "&") {
				if(vSearchValue != "&") {
					stsRoop();
					if(vSts.replace("&","") != sts) {
						locGo = loc+vMenu+"&sts="+sts+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
					} else {
						locGo = loc+vMenu+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
					}
				} else {
					stsRoop();
					if(vSts.replace("&","") != sts) {
						locGo = loc+vMenu+"&sts="+sts+vSearchPrice+"&sort="+vSort;
					} else {
						locGo = loc+vMenu+vSearchPrice;
					}
				}
			} else {
				if(vSearchValue != "&") {
					stsRoop();
					locGo = loc+vMenu+"&sts="+sts+"&search="+vSearchValue+vSearchPrice+"&sort="+vSort;
				} else {
					stsRoop();
					locGo = loc+vMenu+"&sts="+sts+vSearchPrice+"&sort="+vSort;
				}
			}
		}
		location.href = locGo;
	}

	// 결과 내 검색 (검색버튼)
	function search() {
		//vSearchValue = "";
		var searchValue = document.getElementById("contentSearch").value;
		searchValue = searchValue.replace(/(\s*)/g,"");
		searchValue += "&";

		var locGo;					// URL 주소저장
		var vvBrandNmTemp="";		// brandNm 임시저장
		flg = 0;

		// 결과내검색 브랜드명 중복검사
		function searchRoop() {
			for(var i=0; i<vvBrandNm.length+flg; i++) {
				if((i > 0) && (i <= vvBrandNm.length)) {
					vvBrandNmTemp += "&";
				}
				if(i < vvBrandNm.length) {
					vvBrandNmTemp += "brandNm="+vvBrandNm[i];
				} else {
					vvBrandNmTemp += "brandNm="+brandNm;
				}
			}
		}
		
		if(vvBrandNm.length > 0) {
			if(vSts != "&") {
				if(vSearchValue != "&") {
					searchRoop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+searchValue+vSearchPrice+"&sort="+vSort;
				} else {
					searchRoop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+searchValue+vSearchPrice+"&sort="+vSort;
				}
			} else {
				if(vSearchValue != "&") {
					searchRoop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+searchValue+vSearchPrice+"&sort="+vSort;
				} else {
					searchRoop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+searchValue+vSearchPrice+"&sort="+vSort;
				}
			}
		} else {
			if(vSts != "&") {
				if(vSearchValue != "&") {
					searchRoop();
					locGo = loc+vMenu+"&sts="+vSts+"&search="+searchValue+vSearchPrice+"&sort="+vSort;
				} else {
					searchRoop();
					locGo = loc+vMenu+"&sts="+vSts+"&search="+searchValue+vSearchPrice+"&sort="+vSort;
				}
			} else {
				if(vSearchValue != "&") {
					searchRoop();
					locGo = loc+vMenu+"&sts="+vSts+"&search="+searchValue+vSearchPrice+"&sort="+vSort;
				} else {
					searchRoop();
					locGo = loc+vMenu+"&sts="+vSts+"&search="+searchValue+vSearchPrice+"&sort="+vSort;
				}
			}
		}
		location.href = locGo;
	}


	// 가격 직접입력 (검색버튼)
	function search2() { 

		var searchPriceSt = document.getElementById("priceSearchSt").value;
		var searchPriceEd = document.getElementById("priceSearchEd").value;

		var locGo;					// URL 주소저장
		var vvBrandNmTemp="";		// brandNm 임시저장
		flg = 0;
		var searchPrice;

		//alert(searchPriceSt);
		//alert(searchPriceEd);
		
		if(searchPriceSt != 0) {
			if((!searchPriceEd) || (searchPriceEd == 0)) {
				//alert("앞단 가격만있음");
				searchPrice = "&searchPriceSt="+searchPriceSt;
			}
		}

		if(searchPriceEd != 0) {
			if((!searchPriceSt) || (searchPriceSt == 0)) {
				//alert("뒷단 가격만있음");
				searchPrice = "&searchPriceEd="+searchPriceEd;
			}
		}
		
		if((searchPriceSt != 0) && (searchPriceEd != 0)) {
			if(parseInt(searchPriceSt) > parseInt(searchPriceEd)) {
				alert("최소가격이 더 큽니다.");
				return false;
			} else {
				//alert("앞뒷단 가격 다있음");
				searchPrice = "&searchPriceSt="+searchPriceSt+"&searchPriceEd="+searchPriceEd;
			}
		}


		// 결과내검색 브랜드명 중복검사
		function search2Roop() {
			for(var i=0; i<vvBrandNm.length+flg; i++) {
				if((i > 0) && (i <= vvBrandNm.length)) {
					vvBrandNmTemp += "&";
				}
				if(i < vvBrandNm.length) {
					vvBrandNmTemp += "brandNm="+vvBrandNm[i];
				} else {
					vvBrandNmTemp += "brandNm="+brandNm;
				}
			}
		}
		
		if(vvBrandNm.length > 0) {
			if(vSts != "&") {
				if(vSearchValue != "&") {
					search2Roop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+vSearchValue+searchPrice+"&sort="+vSort;
				} else {
					search2Roop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+vSearchValue+searchPrice+"&sort="+vSort;
				}
			} else {
				if(vSearchValue != "&") {
					search2Roop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+vSearchValue+searchPrice+"&sort="+vSort;
				} else {
					search2Roop();
					locGo = loc+vMenu+vvBrandNmTemp+"&sts="+vSts+"&search="+vSearchValue+searchPrice+"&sort="+vSort;
				}
			}
		} else {
			if(vSts != "&") {
				if(vSearchValue != "&") {
					search2Roop();
					locGo = loc+vMenu+"&sts="+vSts+"&search="+vSearchValue+searchPrice+"&sort="+vSort;
				} else {
					search2Roop();
					locGo = loc+vMenu+"&sts="+vSts+"&search="+vSearchValue+searchPrice+"&sort="+vSort;
				}
			} else {
				if(vSearchValue != "&") {
					search2Roop();
					locGo = loc+vMenu+"&sts="+vSts+"&search="+vSearchValue+searchPrice+"&sort="+vSort;
				} else {
					search2Roop();
					locGo = loc+vMenu+"&sts="+vSts+"&search="+vSearchValue+searchPrice+"&sort="+vSort;
				}
			}
		}
		location.href = locGo;
	}

	// 정렬
	function sortBtn(sort) {
		var locGo;
		locGo = vMasterLoc+"&sort="+sort
		vMasterLoc = locGo;
		location.href = locGo+"#sort-btn1";
	}
	
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
			<div class="content-inner-path" id="cip">
				<c:forEach items="${path }" var="path">
					<a href="/rental/Appli/lg/${path.homeCd }?" id="pathStyleMain">${path.gdsMclassNm }</a>
				</c:forEach>
			</div>
			<div class="content-inner-menu" id="cim">
			<p>&nbsp;
				<!-- 이전 메뉴경로
				<div class="content-inner-menu-path">
					<c:forEach items="${path }" var="path">
						<br>
						<h4>홈 &nbsp; > &nbsp; ${path.gdsMclassNm }
							<c:if test="${not empty path.gdsSclassNm}">
								 &nbsp; > &nbsp; ${ path.gdsSclassNm }
							</c:if>
						</h4>
					</c:forEach>
				</div>
				 -->
				<!-- **************** -->
				<!-- 소메뉴 영역 시작 -->
				<!-- **************** -->
				<c:set var="list1Length" value="${fn:length(list1)}"></c:set>
				<c:set var="list1Q" value="${list1Length/5 }"></c:set>
				<c:set var="list1R" value="${list1Length%5 }"></c:set>
				<c:set var="roopCnt" value="1"></c:set>
				<c:set var="list1QR" value="${5 - list1R }"></c:set>
				
				<!-- 임시 test용 
				<c:out value="${list1Length }"></c:out>
				<c:out value="${list1Q }"></c:out>
				<c:out value="${list1R }"></c:out>	
				<c:out value="${list1QR }"></c:out>						
				 -->
				
				<!-- 소메뉴 list 반복문 -->						
				<c:forEach items="${list1}" var="list1Row" begin="0" end="${list1Length }" step="5" varStatus="status1Row">
					<div class="btn-group btn-group-justified" role="group">
					<c:if test="${roopCnt == 1 }">
						<c:set var="roopCnt" value="${roopCnt+1 }"></c:set>
					</c:if>
					<c:if test="${status1Row.count <= 2 }">
						<c:forEach items="${list1}" var="list1Co1" begin="0" end="10" varStatus="status1Col">
							<c:if test="${status1Row.count == 1 && status1Col.count <= 5}">
								<div class="btn-group" role="group" id="sMenuBorder1">
									<button type="button" class="btn btn-default" id="menuBtn${list1Co1.gdsSclassCd }" onclick="menuBtnClick(${list1Co1.gdsSclassCd });"><h4 style="font-weight: bolder;">${list1Co1.gdsSclassNm }</h4></button>
								</div>
							</c:if>
							<c:if test="${status1Row.count == 2 && status1Col.count >=6 }">
								<div class="btn-group" role="group" id="sMenuBorder2">
									<button type="button" class="btn btn-default" id="menuBtn${list1Co1.gdsSclassCd }" onclick="menuBtnClick(${list1Co1.gdsSclassCd });"><h4 style="font-weight: bolder;">${list1Co1.gdsSclassNm }</h4></button>
								</div>
							</c:if>
							<c:if test="${list1Q < 1 && status1Col.count == list1Length }">
								<c:forEach items="${list1 }" var="list1Blank" begin="0" end="${list1QR - 1 }">
									<div class="btn-group" role="group" id="sMenuBorder1">
										<button type="button" style="border-right:0px solid #999;" class="btn btn-default" id="menuBtn${list1Co1.gdsSclassCd }" ><h4><br></h4></button>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${list1Q > 1 && list1Q < 2 && status1Row.count == 2 && status1Col.count == list1Length }">
								<c:forEach items="${list1 }" var="list1Blank" begin="0" end="${list1QR - 1 }">
									<div class="btn-group" role="group" id="sMenuBorder2">
										<button type="button" style="border-right:0px solid #999;" class="btn btn-default" id="menuBtn${list1Co1.gdsSclassCd }" ><h4><br></h4></button>
									</div>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:if>
					</div>
				</c:forEach>
				<!-- ************** -->
				<!-- 소메뉴 영역 끝 -->
				<!-- ************** -->
			</div>
			<br>
			<div class="content-inner-option">
				<table class="table table-bordered">
					<tr class="active">
						<span id="bestNotice1"> * 전체보기 선택 또는 서브메뉴를 선택하지 않을 경우에만 [BEST 인기상품]이 표시됩니다.</span><span id="bestNotice2">&nbsp;</span><br>
						<span id="bestNotice3"> * 아래의 옵션은 [BEST 인기상품]에 적용되지 않습니다.</span><span id="bestNotice4">&nbsp;</span>
					</tr>
					<!-- ************** -->
					<!-- 옵션 영역 시작 -->
					<!-- ************** -->
					<tr>
						<th class="active" id="option-menu">브랜드</th>
						<td colspan="2">
							<c:forEach items="${list2}" var="list2" varStatus="status">
								<h4 id="optionStyle"><span class="label label-default" id="optionBrand${list2.brandNm }"><label ><input class="checkBox" type="checkbox" name="brandCheckBox${list2.brandNm }" onClick="brandCheckBox('${list2.brandNm}')" style="opacity: 0.0"; />${list2.brandNm }&nbsp;&nbsp;&nbsp;&nbsp;</label></span></h4>&nbsp;&nbsp;
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th class="active" id="option-price">가격</th>
						<td id="option-price-search" colspan="2">
							<form class="form-inline">
								<div class="form-group">
									<label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
									<div class="input-group">
										<div class="input-group-addon">직접입력</div>
										<input type="text" class="form-control" id="priceSearchSt" placeholder="0">
									</div>
									~
									<div class="input-group">
										<input type="text" class="form-control" id="priceSearchEd" placeholder="0">
									</div>
								</div>
								<button type="button" class="btn btn-success" onClick="search2();"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
							</form>
						</td>
					</tr>
					<tr>
						<th class="active" id="option-status">상태</th>
							<td colspan="2">
								<h4 id="optionStyle"><span class="label label-default" id="optionStsN" ><label ><input class="checkBox" type="checkbox" name="stsCheckBoxN" style="opacity: 0.0" onClick="stsCheckBox('N');"/>새상품&nbsp;&nbsp;&nbsp;</label></span></h4>&nbsp;&nbsp;
								<h4 id="optionStyle"><span class="label label-default" id="optionStsU" ><label ><input class="checkBox" type="checkbox" name="stsCheckBoxU" style="opacity: 0.0" onClick="stsCheckBox('U');"/>중고상품&nbsp;&nbsp;&nbsp;</label></span></h4>
							</td>
					</tr>
					<tr>
						<th class="active" id="option-result">결과 내 검색</th>
						<td colspan="2">
							<form class="form-inline">
								<div class="form-group">
									<label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
									<div class="input-group">
										<input type="text" class="form-control" id="contentSearch"  placeholder="결과 내 검색">
									</div>
								</div>
								<button type="button" class="btn btn-success" onClick="search();"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
							</form>							
						</td>
					</tr>
					<tr>
					</tr>
					<!-- ************ -->
					<!-- 옵션 영역 끝 -->
					<!-- ************ -->
				</table>
			</div>
			<br>
			<!-- 중메뉴선택이냐 소메뉴선택이냐에 따라 BEST 캐러셀 표시여부 조건-->
			<c:forEach items="${path }" var="path1">
			<c:if test="${empty path1.gdsSclassNm}">
			<div class="content-inner-best">
				<h1 id="best1">BEST 인기상품</h1>
				<div class="content-inner-best-path" id="best2">
					<c:forEach items="${path }" var="path2">
						${path2.gdsMclassNm }
					</c:forEach>
				</div>
				<br>
				<!-- ********************* -->
				<!-- BEST 캐러셀 영역 시작 -->
				<!-- ********************* -->
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div id="myCarousel" class="row carousel slide" data-ride="carousel">
								<!-- Wrapper for slides -->
								<div class="carousel-inner">
									<!-- /Slide1 -->
									<div class="item active">
										<ul class="thumbnails">
										<c:forEach items="${list4 }" var="list4" end="3">	
											<li class="col-sm-3">
											<div class="imglist">
												<div class="thumbnail" style="border:0px solid red; height:290px;">
													<a href="${menu }/detail/${list4.gdsCd }"><img style="height:100%;" src=${list4.img1 } alt="" ></a>
												</div>
												<div class="caption-box">
													<a href="${menu }/detail/${list4.gdsCd }">
														<p>${list4.brandNm }<div class="stsAlign${list4.gdsGbCd }">${list4.gdsGbNm }</div></p>
														<h4 id="brandNmStyle">${list4.gdsNm }</h4>
														<h4>모델명 : ${list4.modelNm }</h4>
														<fmt:setLocale value="ko_KR"></fmt:setLocale>
														<h5><fmt:formatNumber type="currency" value="${list4.gdsPrice }"></fmt:formatNumber>(월)</h5>
													</a>
												</div>
												</div>
											</li>
											
											</c:forEach>
										</ul>
									</div>
									<!-- /Slide2 -->
									<c:if test="${fn:length(list4) > 4}" >
									<div class="item">
										<ul class="thumbnails">
											<c:forEach items="${list4 }" var="list4" begin="4" end="7">
											<li class="col-sm-3">
											<div class="imglist">
												<div class="thumbnail">
													<a href="${menu }/detail/${list4.gdsCd }"><img src=${list4.img1 } alt=""></a>
												</div>
												<div class="caption-box">
													<a href="${menu }/detail/${list4.gdsCd }">
														<p>${list4.brandNm }<div class="stsAlign${list4.gdsGbCd }">${list4.gdsGbNm }</div></p>
														<h4 id="brandNmStyle">${list4.gdsNm }</h4>
														<h4>모델명 : ${list4.modelNm }</h4>
														<fmt:setLocale value="ko_KR"></fmt:setLocale>
														<h5><fmt:formatNumber type="currency" value="${list4.gdsPrice }"></fmt:formatNumber>(월)</h5>
													</a>
												</div>
											</div>
											</li>
											</c:forEach>
										</ul>
									</div>
									</c:if>
								</div>
								
								<!-- /Wrapper for slides .carousel-inner -->
								
								<!-- Control box -->
								<div class="control-box">
									<a data-slide="prev" href="#myCarousel"
										class="carousel-control left">‹</a> <a data-slide="next"
										href="#myCarousel" class="carousel-control right">›</a>
								</div>
								<!-- /.control-box -->
							</div>
							<!-- /#myCarousel -->
						</div>
						<!-- /.col-sm-12 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container -->
				<!-- ******************* -->
				<!-- BEST 캐러셀 영역 끝 -->
				<!-- ******************* -->
			</div>
			</c:if>
			</c:forEach>
			<div class="content-inner-sort">
			<br><br><br>
				<!-- ******************* -->
				<!-- 정렬 메뉴 영역 시작 -->
				<!-- ******************* -->
				<ul class="nav nav-tabs nav-justified">
				  <li role="presentation" id="sort-btn1" onClick="sortBtn(1);" onfocus="this.blur();" ><a>인기순</a></li>
				  <li role="presentation" id="sort-btn2" onClick="sortBtn(2);" onfocus="this.blur();"><a>최신순</a></li>
				  <li role="presentation" id="sort-btn3" onClick="sortBtn(3);" onfocus="this.blur();"><a>낮은가격순</a></li>
				  <li role="presentation" id="sort-btn4" onClick="sortBtn(4);" onfocus="this.blur();"><a>높은가격순</a></li>
				  <li role="presentation" id="sort-btn5" onClick="sortBtn(5);" onfocus="this.blur();"><a>판매량순</a></li>
				  <li role="presentation" id="sort-btn6" onClick="sortBtn(6);" onfocus="this.blur();"><a>리뷰 많은순</a></li>
				</ul>
				<!-- ***************** -->
				<!-- 정렬 메뉴 영역 끝 -->
				<!-- ***************** -->
			</div>
			<div class="content-inner-list">
			<br>
				<!-- **************** -->
				<!-- 리스트 영역 시작 -->
				<!-- **************** -->
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<div id="myCarousel" class="row carousel slide" data-ride="carousel">
								<!-- /list1 row -->
								<div>
									<ul class="thumbnails">
										<c:forEach items="${list5 }" var="list5">
										<li class="col-sm-3">
										<div class="imglist">
											<div style="cursor: pointer;" class="thumbnail thumbnailDiv media-middle" onclick="location.href='${menu }/detail/${list5.gdsCd }'">
												<img style="height:100%;" src=${list5.img1 } alt="">
											</div>
											<div class="caption-box">
												<a href="${menu }/detail/${list5.gdsCd }">
													<p>${list5.brandNm }<div class="stsAlign${list5.gdsGbCd }">${list5.gdsGbNm }</div></p>
													<h4 id="brandNmStyle">${list5.gdsNm }</h4>
													<h4>모델명 : ${list5.modelNm }</h4>
													<fmt:setLocale value="ko_KR"></fmt:setLocale>
													<h5><fmt:formatNumber type="currency" value="${list5.gdsPrice }"></fmt:formatNumber>(월)</h5>
													<br>
												</a>
											</div>
										</div>
										</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<!-- /#myCarousel -->
						</div>
						<!-- /.col-sm-12 -->
					</div>
					<!-- /.row -->
					<!-- **************** -->
					<!-- 페에징 처리 시작 -->
					<!-- **************** -->
					<div id="paginationBox">
						<ul class="pagination">
							<c:if test="${paging.prev}">
								<li class="page-item">
									<a class="page-link" onClick="prevEvent2('${pathPaging}','${paging.page}', '${paging.range}', '${paging.rangeSize}')">
										&lt;
									</a>
								</li>
							</c:if>
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="idx">
								<li class="page-item <c:out value="${paging.page == idx ? 'active' : ''}"/> " >
									<a class="page-link" onClick="pageChange2('${pathPaging}','${idx}', '${paging.range}', '${paging.rangeSize}')"> 
										${idx} 
									</a>
								</li>
							</c:forEach>
							<c:if test="${paging.next}">
								<li class="page-item">
									<a class="page-link" onClick="nextEvent2('${pathPaging}','${paging.range}', '${paging.range}', '${paging.rangeSize}')" >
										&gt;
									</a>
								</li>
							</c:if>
						</ul>
					</div>
					<!-- **************** -->
					<!-- 페에징 처리 끝   -->
					<!-- **************** -->
				</div>
				<!-- ************** -->
				<!-- 리스트 영역 끝 -->
				<!-- ************** -->
			</div>
		</div>
		<br><br>
		<jsp:include page=".././template/footer.jsp"></jsp:include>	
	</div>
</body>

</html>