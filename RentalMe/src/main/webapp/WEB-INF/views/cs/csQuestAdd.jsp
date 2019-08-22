<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!doctype html>
<html>
<head>
<jsp:include page="../template/headerRe.jsp"></jsp:include>
    <meta charset="UTF-8">
	<script type="text/javascript">
	/* 	$(document).ready(function(){
			$("#daeButton>button:nth-child(1)").click(function(){
					window.history.back();
				})
			
			})
	 */
	</script>
	<style type="text/css">
        #dae{
            font-size:30pt;
        }
        #daeContent tr>td:nth-child(1){
            width:15%;
        }
         #daeContent tr>td:nth-child(2){
            width:85%;
        }
        #daeButton>button{
            float:right;
            margin:5px 10px 5px 10px;
        }
        #daeButton>button:nth-child(1){
        
        }
        textarea{
            width:100%;
            height:250px;
        }
        #csContent{
        	height:800px;
        }
	</style>
</head>
<body>
<div id="csContent">

<div id="dae" class="col-md-4 col-md-offset-2">
<br/><br/>
    1:1문의
    
<br/><br/>
</div>
<div class="col-md-8 col-md-offset-2">
    <form action="">
        <table class="table" id="daeContent">
            <tr>
                <td><label for="id" >아 이 디</label></td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td><label for="category">분류</label></td>
                <td>
        <div class="dropdown">
          <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            선택항목
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
            <li><a href="#">교환/환불</a></li>
            <li><a href="#">배송</a></li>
            <li><a href="#">주문</a></li>
          </ul>
        </div>
           </td>
            </tr>
            <tr>
                <td><label for="sub" >제목</label></td>
                <td><input type="text" name="sub"></td>
            </tr>
            <tr>
                <td><label for="id" >내용</label></td>
                <td><textarea name="conetent"></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td id="daeButton">
                   <button type="button" class="btn btn-primary">취소</button>
                   <button type="button" class="btn btn-primary">문의하기</button>
                </td>
            </tr>
        </table>
        
    </form>
</div>
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>
