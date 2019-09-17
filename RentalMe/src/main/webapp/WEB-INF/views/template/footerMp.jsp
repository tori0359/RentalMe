<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
	<style type="text/css">
		/*폰트 설정*/
        @font-face {
            font-family: "altair";
            src: url("${pageContext.request.contextPath}/fonts/Altair-bold Trial.ttf") format("truetype");
            font-style: normal;
        }
		@font-face {
            font-family: "hanserif";
            src: url("${pageContext.request.contextPath}/fonts/SourceHanSerifK-Medium.otf") format("opentype");
            font-style: normal;
        }
		@font-face {
            font-family: "NanumB";
            src: url("${pageContext.request.contextPath}/fonts/NanumSquare_acR.ttf") format("truetype");
            font-style: normal;
        }
		@font-face {
            font-family: "NanumEB";
            src: url("${pageContext.request.contextPath}/fonts/NanumSquare_acEB.ttf") format("truetype");
            font-style: normal;
        }
        
		.footer{
			width:100%;
			padding: 40px 0;
			height: 330px;
			position: absolute;
		    left: 0px;
		    bottom: 0px;
			text-align: center;
		}
		
		.footer p{
			font-family: NanumB;
			color: black;
			font-size: 10pt;
		}
		.footerLink>p>a{
			color:black;
			font-weight: bolder;
			
		}
		.footerLink>p>a:hover{
			text-decoration: underline;
		}
		#title{
         	font-family: "altair";
       	 	color: #1C1C1C;
        	font-size: 28pt;
        	text-decoration:none;
   	   }
   	   #footerhelp{
   	   		border:1px solid lightgray; 
   	   		width:50%; 
   	   		height:30px;
   	   		margin-bottom:10px;
   	   }
   	   #footerhelp a{
   	   		line-height:30px; 
   	   		padding-left:10px; 
   	   		color:grey;
   	   }
   	   #footerhelp a:hover{
   	   		text-decoration:none;
   	   		color:black;
   	   }

	</style>

</head>
<body>
</div>
</div>

<br><br><div class="footer">
<div class="hr"></div>
<div class="raw" style="text-align:left;">
	<div style="padding:12px 0 10px 20px; margin-top:8px;" class="footerLink col-md-offset-1">
		<p><a href="#">개인정보취급방침</a>&emsp;&emsp;<a href="#">이용약관</a>&emsp;&emsp;<a href="#">고객센터</a>&emsp;&emsp;  ㅣ &emsp;&emsp;<a href="#">회사소개</a></p>
	</div>
</div>
<div class="hr"></div><br>
	<div class="raw" >
			<div class="col-md-4 col-md-offset-1" style="border-right:1px solid lightgray; height:250px;">
			<div style="text-align:left;">
				<a id="title">Rental Me</a>
				<div style="margin-top:20px;">
					<p>상호명: 렌탈미 ㅣ 대표자: 오남매 ㅣ 주소: 서울 강남구 테헤란로5길 11</p>
					<p>대표전화: 1234-1234 ㅣ 팩스: 1234-1234 </p> 
					<p>사업자 등록번호: 1234-12-1234 ㅣ 통신판매업 신고 : 제2019-서울강남-777호</p>
					<p>Copyright©2019 주식회사 렌탈미 All right reserved. Design by 렌탈미</p>
					<p>개인정보보호관리책임자 : 오남매</p>
				</div>
			</div>
			</div>
			
			<div class="col-md-4" style="border-right:1px solid lightgray;">
				<div style="width:150px; display:inline-block; font-weight:bolder;">
					<p style="padding:5px;">CUSTOMER CENTER</p>
					<h3 style="font-weight:bolder;">1234-7777</h3>
					<p>월-금 09:30 - 18:00</p>
					<p>토 09:30 - 16:00</p>
				</div>
				<div style="width:150px;; display:inline-block; font-weight:bolder;">
					<p style="padding:5px;">A/S CENTER</p>
					<h3 style="font-weight:bolder;">4321-7777</h3>
					<p>월-금 09:30 - 18:00</p>
					<p>토 09:30 - 16:00</p>
				</div>
				<div>
					<img src="/imgs/footerimg.PNG"/>
				</div>
			</div>
			
			<div class="col-md-3" style="text-align:left; font-weight:bolder;">
			<div style="padding-left:40px;">
				<p style="padding:5px;">HELP</p>
				<div id="footerhelp"><a href="${pageContext.request.contextPath}/cs/csNotice" >1:1문의</a></div>
				<div id="footerhelp"><a href="${pageContext.request.contextPath}/cs/csFAQ" >공지사항</a></div>
			</div>
			</div>
	</div>
</div>
</div>
</body>
</html>
