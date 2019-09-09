<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
   <style type="text/css">
       /*폰트설정*/
        @font-face {
            font-family: "altair";
            src: url("${pageContext.request.contextPath}/fonts/altair.extrabold-italic.ttf") format("truetype");
            font-style: normal;
        }
      @font-face {
            font-family: "hanserif";
            src: url("${pageContext.request.contextPath}/fonts/SourceHanSerifK-Medium.otf") format("opentype");
            font-style: normal;
        }
      
      @font-face {/*한글 보통 폰트*/
            font-family: "nanumR";
            src: url("${pageContext.request.contextPath}/fonts/NanumSquare_acL.ttf") format("truetype");
            font-style: normal;
        }
      @font-face {/*한글 진한 폰트*/
            font-family: "nanumB";
            src: url("${pageContext.request.contextPath}/fonts/NanumSquare_acR.ttf") format("truetype");
            font-style: normal;
        }
      @font-face {/*한글 더두꺼운 폰트*/
            font-family: "nanumEB";
            src: url("${pageContext.request.contextPath}/fonts/NanumSquare_acEB.ttf") format("truetype");
            font-style: normal;
        }
        
    html,
    body {
		    margin:0;
		    padding:0;
		    height:100%;
	    
	 }
	    
       #wrap{
            min-height:100%;
            position:relative;
            padding-bottom: 200px;
     }
     
     .navbar-default .navbar-nav > .open > a {
         color: black;
         background: white;
      }
          
      .hr {
         height: 1px;
         width: 100%;
         background-color: lightgrey;
      }
      
      #subtitle>a{
         font-family: "altair";
         color:white;
         font-size: 45pt;
         font-style: italic;
      }
      
      #subtitle>a:hover{
         text-decoration: none;
      }
      
      #subtitle>h4{
         font-family: "hanserif";
         color: lightgrey;
      }
      
      .navbar-link:hover,
      .navbar-link:active{
         font-weight: bolder;
         text-decoration: none;
         color:white;
      }
      
      .navbar-link:visited,
      .navbar-link:link{
         text-decoration: none;
         color:white;
      }
      
      .navtitle{
         padding: 1px;
         background-color: black;
         width:100%;
      }
      .menu{
         width:100%;
         height:45px;
         position: relative;
         z-index:2;
      }
      .login{
         width:100%;
         background-color: black;
      }

      .navbar-text>a{
         font-family: nanumB;
         color:black;
      }
      
      .dropdown-menu, .dropdown-menu a { 
         font-size: 14px; 
         font-weight: bold; 
         font-family: "nanumB";
      } 
      
    
      
      .dropdown.open .dropdown-menu {
         max-height: 400px;
         opacity: 1;
      }

      .nav a{
         font-family: "nanumB";
         font-weight: 600;
         font-size:11pt;
         display: block;
      }
      
      .nav a:hover{
         font-weight: 900;
      }
      
      .navbar{/*메뉴바 흰색*/
         background-color: white;
      }
      
      .navbar-header{
         background-color: white;
      }
      
      .container-fluid{
         background-color: white;
      }
      
      .navbar .navbar-nav {
        display: inline-block;
      float: none;
      }
      
      .navbar .navbar-collapse {
           text-align: center;
      }
      
     .navbar-text a{
         color:white;
      }
      
      .navbar-text{
         color:white;
      }
      
    .dropdown:hover .dropdown-menu { 
         /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */ 
         height: auto;
         
         /* 드롭다운 마우스 hover 자동기능 */
         /*
        display: block;
        margin-top: 0;
        */
      } 
      .dropdown #used_link_btn{
      	 width: 100px;
      	 height: 40px;
      	 margin-top: 4px;
      	 font-family: "nanumB";
      	 font-weight: bold;
      	 background-color: white;
      	 border: none;
      	 font-size: 15px;
      	 color: #707070;
      }
    
   .login{
       background:black;
       width: 100%;
      }
      
    .dropdown-menu>a:hover,
   .dropdown-menu>a:active{ /* 중고거래 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
         color: white;
         font-weight: bolder;
         background: #E7A602; 
         text-decoration: none;
         
      } 
      
      .dropdown-menu a { /* 하위 메뉴의 a 태그 스타일 설정 */ 
         color: #2d2d2d;
         background-color: white;
         margin-top: -1px;
      } 
      
      .dropdown-menu>li a{
         text-align: center;
         height: 40px;
         line-height: 40px;
      }
      

      
       #content{
         font-family: "nanumB";
         font-size: 15px;
         color: black;
         /*border: 1px solid black;*/ /*나중에 주석처리 해야함*/
         padding-top: 50px;
         height:100%;
         position: relative;
         z-index:1;
      }
      
      #content>div{
      }

   
   </style>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
   <script type="text/javascript">
		$('#rjfo').click(function(){
			windows.location.href="/used";
		});
   </script>
</head>
<body>
<div>
    <div class="login container-fluid">
       <div class="col-md-11">
      <p class="navbar-text navbar-right">
      <c:choose>
      	<c:when test="${loginUserId == null }">
	      	<a href="/login" class="navbar-link">로그인</a> ㅣ
	      	<a href="/join/signup" class="navbar-link">회원가입</a>
      	</c:when>
      	<c:otherwise>
      		<a href="/mp/" class="navbar-link">${loginUserId }(${loginMbNo})님</a> ㅣ
	      	<a href="/logout" class="navbar-link">로그아웃</a>
      	</c:otherwise>
      </c:choose>
      </p>
      </div>
    </div>
     <div class="navtitle">
              <div id="title" class="text-center">
                 <h1>
                  <div id="subtitle">
                     <!--<h4>자취생들을 위한</h4>-->
                     <a href="/main">Rental<br/>Me</a>
                  </div>
                 </h1>
          </div>
      </div>
   <div>
  </div>
<div class="menu" >
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" id="bigmenu" class="dropdown-toggle" data-toggle="dropdown" >대형가전 렌탈</a>
          <ul class="dropdown-menu">
          	  <li><a href="/rental/Appli/lg/10?">전체보기</a></li>
              <li><a href="/rental/Appli/lg/11?">에어컨</a></li> 
              <li><a href="/rental/Appli/lg/12?">냉난방기</a></li> 
              <li><a href="/rental/Appli/lg/13?">냉장고</a></li>
              <li><a href="/rental/Appli/lg/14?">TV</a></li>
              <li><a href="/rental/Appli/lg/15?">세탁기</a></li>
              <li><a href="/rental/Appli/lg/16?">빨래건조기</a></li>
              <li><a href="/rental/Appli/lg/17?">정수기</a></li>
              <li><a href="/rental/Appli/lg/18?">공기청정기</a></li>
              <li><a href="/rental/Appli/lg/19?">복합기/프린터</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">소형가전 렌탈</a>
          <ul class="dropdown-menu">
          	  <li><a href="/rental/Appli/lg/20?">전체보기</a></li>
              <li><a href="/rental/Appli/lg/21?">커피머신</a></li> 
              <li><a href="/rental/Appli/lg/22?">제습기</a></li> 
              <li><a href="/rental/Appli/lg/23?">청소기</a></li>
              <li><a href="/rental/Appli/lg/24?">드라이어</a></li>
              <li><a href="/rental/Appli/lg/25?">빔프로젝터</a></li>
              <li><a href="/rental/Appli/lg/26?">컴퓨터/노트북</a></li>
              <li><a href="/rental/Appli/lg/27?">무선스피커</a></li>
              <li><a href="/rental/Appli/lg/28?">비데</a></li>
              <li><a href="/rental/Appli/lg/29?">면도기</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">주방가전 렌탈</a>
          <ul class="dropdown-menu">
          	   <li><a href="/rental/Appli/lg/30?">전체보기</a></li>
               <li><a href="/rental/Appli/lg/31?">음식물 처리기</a></li> 
               <li><a href="/rental/Appli/lg/32?">제빙기</a></li> 
               <li><a href="/rental/Appli/lg/33?">전자레인지</a></li>
               <li><a href="/rental/Appli/lg/34?">에어프라이어</a></li>
               <li><a href="/rental/Appli/lg/35?">오븐</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">가구 렌탈</a>
          <ul class="dropdown-menu">
			   <li><a href="/rental/Appli/lg/40?">전체보기</a></li>          
               <li><a href="/rental/Appli/lg/41?">침대</a></li> 
               <li><a href="/rental/Appli/lg/42?">매트리스</a></li> 
               <li><a href="/rental/Appli/lg/43?">쇼파</a></li> 
               <li><a href="/rental/Appli/lg/44?">책상</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">기타 렌탈</a>
          <ul class="dropdown-menu">
          	   <li><a href="/rental/Appli/lg/50?">전체보기</a></li> 
               <li><a href="/rental/Appli/lg/51?">악기</a></li> 
               <li><a href="/rental/Appli/lg/52?">명품</a></li> 
               <li><a href="/rental/Appli/lg/53?">귀금속</a></li> 
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">패키지 렌탈</a>
          <ul class="dropdown-menu">
          	   <li><a href="/rental/Appli/lg/60?">전체보기</a></li>
               <li><a href="/rental/Appli/lg/61?">침실 패키지</a></li> 
               <li><a href="/rental/Appli/lg/62?">주방 패키지</a></li> 
               <li><a href="/rental/Appli/lg/63?">욕실 패키지</a></li>
               <li><a href="/rental/Appli/lg/64?">기타 패키지</a></li> 
          </ul>
        </li>
       <li style="font-family: nanumB; padding: 12px; font-size: 13pt;" class="etc">ㅣ</li>
        <li class="dropdown">
          <form action="/used/big">
			<input type="hidden" name="startPage" value="0">
			<input type="hidden" name="modelNm" value="">
			<input type="hidden" name="align" value="1">			
			<input type="submit" id="used_link_btn" value="중고거래">
		  </form>
        </li>
        <li class="dropdown">
          <a href="${pageContext.request.contextPath}/act/" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">이벤트 경매</a>
        </li>
        <li class="dropdown">
          <a href="${pageContext.request.contextPath}/cs/csFAQ" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" >고객센터</a>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>
</div>
<div id="wrap">


</body>
</html>