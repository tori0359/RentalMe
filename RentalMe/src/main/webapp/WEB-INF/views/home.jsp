<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
   <style type="text/css">
		 /*폰트설정*/
        @font-face {
            font-family: "altair";
            src: url("fonts/altair.extrabold-italic.ttf") format("opentype");
            font-style: normal;
        }
      @font-face {
            font-family: "hanserif";
            src: url("fonts/SourceHanSerifK-Medium.otf") format("opentype");
            font-style: normal;
        }
      
      @font-face {/*한글 보통 폰트*/
            font-family: "nanumR";
            src: url("fonts/NanumSquare_acL.ttf") format("truetype");
            font-style: normal;
        }
      @font-face {/*한글 진한 폰트*/
            font-family: "nanumB";
            src: url("fonts/NanumSquare_acR.ttf") format("truetype");
            font-style: normal;
        }
      @font-face {/*한글 더두꺼운 폰트*/
            font-family: "nanumEB";
            src: url("fonts/NanumSquare_acEB.ttf") format("truetype");
            font-style: normal;
        }
	  .row{
		  width:100%;
		  margin:0px;
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
         /* font-style: italic; */
      }
      
      #subtitle>a:hover{
         text-decoration: none;
      }
      
      #subtitle>h4{
         font-family: "hanserif";
         color: lightgrey;
      }
      
      .navbar-link:hover,.navbar-link:active{
         font-weight: bolder;
         text-decoration: none;
      }
      
      .navbar-link:visited,.navbar-link:link{
         text-decoration: none;
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
      
      #topMenu { 
         height: 50px;
         width: 1400px;
      } 
   
      #topMenu ul { 
         list-style-type: none;
         margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */ 
         padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
      } 
      
      #topMenu ul li { 
         color: black; 
         background-color: ; 
         float: left;
         line-height: 30px;
         vertical-align: middle; 
         text-align: center;
         position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */ 
      } 
      .navbar-text>a{
         font-family: nanumB;
         color:black;
      }
      
      .menuLink, .submenu a {
         text-decoration:none;
         display: block;
         width: 140px; 
         font-size: 14px; 
         font-weight: bold; 
         font-family: "nanumB";
         padding: 8px;
         
      } 
      
      .menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */ 
         color: black; 
      } 
   
      .topMenuLi>a{
         color: black;
         text-decoration: none;
         font-family: "nanumB";
      }
      
      .topMenuLi:hover .menuLink{ /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
         color: white;
         font-weight: bolder;
         background-color: #4d4d4d; 
         text-decoration: none;
      } 
      .topMenuLi2>a{
         color: black;
         text-decoration: none;
      }
      
      .topMenuLi2>a:hover,.topMenuLi2>a:active{ /* 중고거래 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
         color: white;
         font-weight: bolder;
         background-color: #E7A602; 
         text-decoration: none;
      } 
      
      .submenu a { /* 하위 메뉴의 a 태그 스타일 설정 */ 
         color: #2d2d2d;
         background-color: white;
         margin-top: -1px;
      } 
      
      .submenu { /* 하위 메뉴 스타일 설정 */ 
         position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */ 
         height: 0px; /* 초기 높이는 0px로 설정 */ 
         overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */ transition: height .3s;
         -webkit-transition: height .3s; /* (구버전 크롬/사파리) */ 
         -moz-transition: height .3s; /* (구버전 파폭) */ 
         -o-transition: height .3s; /* (구버전 오페라) */ 
      } 
  
      .topMenuLi:hover .submenu { 
         /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */ 
         height: 400px;
      } 
      
      .submenu a:hover{/* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
         color: black; 
         background-color: #dddddd; /* 배경을 RGB(DDDDDD)로 설정 */ 
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
	   .row{
		   margin: 0px;
	   }
       
       
       #joinus{
                width: 500px;
                text-align: center;
                margin: 100px auto;
            }
        #join_btn{
            color: black;
            font-weight: bold;
            border-color: black;
        } 
	
	</style>
   <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
   <script type="text/javascript" src="js/bootstrap.js"></script>
   <script type="text/javascript">
   var sel_files = [];
   
   $(document).ready(function() {
       $("#input_imgs").on("change", handleImgsFilesSelect);
   }); 

   function handleImgsFilesSelect(e) {
       var files = e.target.files;
       var filesArr = Array.prototype.slice.call(files);

       filesArr.forEach(function(f) {
           if(!f.type.match("image.*")) {
               alert("확장자는 이미지 확장자만 가능합니다.");
               return;
           }

           sel_files.push(f);

           var reader = new FileReader();
           reader.onload = function(e) {
               var img_html = "<img src=\"" + e.target.result + "\" />";
               $(".imgs_wrap").append(img_html);
           }
           reader.readAsDataURL(f);
       });
   }
   </script>
</head>
<body>
<div>
 <div class="row">
    <div class="container">
       <div class="col-md-12">
      <p class="navbar-text navbar-right"> 
      <a href="#" class="navbar-link">로그인</a> ㅣ
      <a href="#" class="navbar-link">회원가입</a></p>
      </div>
    </div>
     <div class="navtitle">
              <div id="title" class="text-center">
                 <h1>
                  <div id="subtitle">
                     <!--<h4>자취생들을 위한</h4>-->
                     <a href="#">Rental<br/>Me</a>
                  </div>
                 </h1>
			 </div>
      </div>
   <div>
  </div>
</div>
<div class="menu" >
<div class="container-fluid">

   <div class="col-md-10 col-md-offset-1">
   <nav  id="topMenu"  > 
      <ul> 
         <li class="topMenuLi text-center"> 
            <a class="menuLink" href="#">대형가전 렌탈</a> 
            <ul class="submenu"> 
               <li><a href="#">에어컨</a></li> 
               <li><a href="#">냉난방기</a></li> 
               <li><a href="#">냉장고</a></li>
               <li><a href="#">TV</a></li>
               <li><a href="#">세탁기</a></li>
               <li><a href="#">빨래건조기</a></li>
               <li><a href="#">정수기</a></li>
               <li><a href="#">공기청정기</a></li>
               <li><a href="#">복합기,프린터</a></li>
            </ul> 
         </li>
         <li class="topMenuLi"> 
            <a class="menuLink" href="#">소형가전 렌탈</a> 
            <ul class="submenu"> 
               <li><a href="#">커피머신</a></li> 
               <li><a href="#">제습기</a></li> 
               <li><a href="#">청소기</a></li>
               <li><a href="#">드라이어</a></li>
               <li><a href="#">빔프로젝터</a></li>
               <li><a href="#">컴퓨터,노트북</a></li>
               <li><a href="#">무선스피커</a></li>
               <li><a href="#">비데</a></li>
               <li><a href="#">면도기</a></li>
            </ul> 
         </li> 
         <li class="topMenuLi"> 
            <a class="menuLink" href="#">주방가전 렌탈</a> 
            <ul class="submenu"> 
               <li><a href="#">음식물 처리기</a></li> 
               <li><a href="#">제빙기</a></li> 
               <li><a href="#">전자레인지</a></li>
               <li><a href="#">에어프라이어</a></li>
               <li><a href="#">오븐</a></li>
            </ul> 
         </li>
         <li class="topMenuLi"> 
            <a class="menuLink" href="#">가구 렌탈</a> 
            <ul class="submenu"> 
               <li><a href="#">침대</a></li> 
               <li><a href="#">매트리스</a></li> 
               <li><a href="#">쇼파</a></li> 
               <li><a href="#">책상</a></li>
            </ul> 
         </li> 
         <li class="topMenuLi"> 
            <a class="menuLink" href="#">기타 렌탈</a>
            <ul class="submenu"> 
               <li><a href="#">악기</a></li> 
               <li><a href="#">명품</a></li> 
               <li><a href="#">귀금속</a></li> 
            </ul>  
         </li>
         <li class="topMenuLi"> 
            <a class="menuLink" href="#">패키지 렌탈</a>
            <ul class="submenu"> 
               <li><a href="#">침실 패키지</a></li> 
               <li><a href="#">주방 패키지</a></li> 
               <li><a href="#">욕실 패키지</a></li>
               <li><a href="#">기타 패키지</a></li> 
            </ul>   
         </li><li style="font-family: nanumB; padding: 7px; font-size: 15pt;" >ㅣ</li>
         <li class="topMenuLi2"> 
            <a class="menuLink" href="#">중고거래</a>  
         </li> 
         <li class="topMenuLi2"> 
            <a class="menuLink" href="#">이벤트 경매</a>  
         </li> 
         <li class="topMenuLi"> 
            <a class="menuLink" href="#">고객센터</a>  
         </li> 
      </ul> 
      
   </nav>
   </div>cheerupseaau heregroupc
 </div>
</div>
</div>

<div class="hr">
   
   
</div>
<div id="content" class="col-md-10 col-md-offset-1">
<form action="upload" method="post" enctype="multipart/form-data">
	<div>
		sub:<input type="text" name="sub" />
	</div>
	<div>
		file:<input type="file" id="input_imgs" name="file1" multiple="multiple"/>
	</div>
	<button>전송</button>
</form>
<div>
<div class="imgs_wrap">
	
</div>
</div>
</div>
</body>
</html>