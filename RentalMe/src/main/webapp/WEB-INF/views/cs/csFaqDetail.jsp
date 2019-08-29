<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/header.jsp"></jsp:include>
<script type="text/javascript">
	 	$(document).ready(function(){
			$("#cancel").click(function(){
					window.history.back();
				})
			
		})
	</script>
<style type="text/css">
        #daeContent{
        	margin-top:70px;
        }
       
        #daeContent tr>td:nth-child(1){
            width:15%;
        }
        #daeContent tr>td:nth-child(2){
            width:85%;
        }
        #daeButton input{
            float:right;
            margin:5px 10px 5px 10px;
            background:white;
            border-radius:5px;
            outline:none;
        }
       
        #daeButton>button:nth-child(1){
        
        }
        textarea{
            width:100%;
            height:250px;
        }
        #content{
        	height:600px;
        }
	</style>
</head>
<body>
<div id="content">
<form action="/mp/mng/csFaqUpdatePage">
	<div class="col-md-10 col-md-offset-1"> 
        <table class="table" id="daeContent">
            <tr>
                <td><label for="id" >작 성 자</label></td>
                <td>관리자</td>
            </tr>
            <tr>
                <td><label for="id" >글 번 호</label></td>
                <td><input type="hidden" name="faqNo" value="${bdetail.faqNo}">${bdetail.faqNo}</td>
                <td><input type="hidden" name="csGbCd" value="${bdetail.csGbCd}"></td>
            </tr>
            <tr>
                <td><label for="">분류</label></td>
                <c:if test="${bdetail.csClassGbCd eq '1'}">
                <td>주문</td>
                </c:if>
                <c:if test="${bdetail.csClassGbCd eq '2'}">
                <td>배송</td>
                </c:if>
                <c:if test="${bdetail.csClassGbCd eq '3'}">
                <td>결제</td>
                </c:if>
                <c:if test="${bdetail.csClassGbCd eq '4'}">
                <td>교환취소</td>
                </c:if>
                <c:if test="${bdetail.csClassGbCd eq '5'}">
                <td>회원정보</td>
                </c:if>
                <c:if test="${bdetail.csClassGbCd eq'6'}">
                <td>기타</td>
                </c:if>
            </tr>
            <tr>
                <td><label for="" >제목</label></td>
                <td>${bdetail.sub}</td>
            </tr>
            <tr>
                <td><label for="" >내용</label></td>
                <td>${bdetail.content}</td>
            </tr>
            <tr>
                <td></td>
                <td id="daeButton" >
                  <input id="cancel" type="reset" value="취소">
                  <input id="updae" type="submit" value="수정">
                </td>
            </tr>
        </table>
	</div>
 </form>
</div>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>