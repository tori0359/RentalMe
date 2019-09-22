<%@page import="javax.mail.Session"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
<jsp:include page="../template/headerMp.jsp"></jsp:include>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
	<script type="text/javascript">
	 	$(document).ready(function(){
			$("#cancel").click(function(){
					window.history.back();
			});
		})
		</script>
	<%
		String userId=(String)session.getAttribute("userId");
	
	%>
	<style type="text/css">
        #dae{
            font-size:25pt;
            font-style:italic;
            padding-top:-20px;
            marging-right:-10px;
        }
        #daeContent tr>td:nth-child(1){
            width:15%;
        }
        #daeContent tr>td:nth-child(2){
            width:85%;
        }
        #daeContent{
        	width:100%;
        }
        #daeButton input{
            float:right;
            margin:5px 10px 5px 10px;
            border-radius:7px;
            outline:none;
            font-weight: bold;
        }
      	#select{
      		width:125px;
      	}
        #text{
        	width:100%;
        }
        #csContent{
        	height:1200px;
        }
        #editor{
        	height:250px;
        }
        tr>td:nth-child(1){
        	vertical-align:middle;
        	text-align:center;
        }
        .ck-editor__editable {
  			 min-height: 250px;
		}
		#info{
			width:93%;
			margin:40px 0px 0px 60px;
			border:3px solid #BDBDBD;
			padding: 15px;
		}
	</style>
</head>
<body>
<div id="csContent">

	<div id="dae">
		<br/>
		    1:1문의
	     <br/>
	     <div class="hr" style="height:3px; background-color: #2E2E2E;"></div>
	</div>
	 <div id="info" class=" col-md-offset-1" >
     <p class=" col-md-offset-1">
     	<input type="hidden" value="${id}">
	     	<p>문의하시죠&nbsp<span style="font-size:18px; font-weight:bold;">${id}</span>님 성심성의것 답변해 드리겠습니다</p>
	     
     </p>
     </div>
	
	    <form action="/cs/csInquiryAdd" method="post">
	    <br/>
	    <div id="daeContent">
	    
	        <table style="width:100%"class="table">
	            <tr>
	                <td><label style="vertical-align:middle;">아 이 디</label></td>
	                <td><input type="hidden"/>${id}</td>
	                <td><input type="hidden" name="csGbCd" value="30"/></td>
	            </tr>
	            <tr>
	                <td><label for="category">분류</label></td>
	                <td>
	        <div>
	        	<select id="select" style="height:35px;"  name="csClassGbCd" class="form-control">
	        		<option value="" selected="selected">분류선택</option>
	        		<option value="1">주문</option>
	        		<option value="2">배송</option>
	        		<option value="3">결제</option>
	        		<option value="4">교환/취소</option>
	        		<option value="5">회원정보</option>
	        		<option value="6">기타</option>
	        	</select>
	        </div>
	           </td>
	            </tr>
	            <tr>
	                <td style="vertical-align:middle;"><label style="vertical-align:middle;">제목</label></td>
	                <td><input class="form-control" id="text" type="text" name="sub"></td>
	            </tr>
	            <tr>
	                <td style="vertical-align:middle;"><label style="vertical-align:middle;">내용</label></td>
	                <td><textarea id="editor" name="content" style="resize:none;"></textarea>
	                 <script>
					   		 ClassicEditor
					        .create( document.querySelector( '#editor' ),{removePlugins: [ 'ImageUpload' ]
					      } 
							        )
					        .catch( error => {
					            console.error( error );
					        } );
					 </script>
	    </td>
	            </tr>
	    
	            <tr>
	                <td></td>
	                <td id="daeButton" >
	                   <input class="btn btn-default" id="cancel" type="reset" value="취소">
	                   <input class="btn btn-danger" type="submit" value="문의하기" />
	                </td>
	            </tr>
	        </table>
	        </div>
	    </form>
	</div>

</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>
