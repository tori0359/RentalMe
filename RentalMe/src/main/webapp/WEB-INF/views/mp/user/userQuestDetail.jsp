<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../template/header.jsp"></jsp:include>
<script type="text/javascript">

	 	$(document).ready(function(){
			$("#back").click(function(){
					window.history.back();
			})
			$("#list").click(function(){
					location.href="/mp/mng/InqList";
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
        #answer{
        	margin-top:20px;
        	margin-right:10px;
        	padding-top:-20px;
        	margin-bottom:-55px;
        	
        }
        #answer button{
        	border-radius:5px;
        	background:white;
        	color:red;
        	border-radius:5px;
        	
        }
        #comment{
        	font-size:2em;
        	font-style: italic;
        	font-weight: bold;
        	border-bottom:1px solid;
        	
        }
        #replyed{
        	font-size:18px;
        	font-weight:lighter;
        }
	</style>
</head>
<body>
<div id="content">
	<div class="col-md-10 col-md-offset-1"> 
	<%-- 	<c:if test="${levelGbCd == '2'}">
			<c:if test="${bean.questStsCd eq '1'}">
	        	<form action="/mp/mng/answer"><div id="answer" align="right"><input type="hidden" name="pquestNo" value="${bean.pquestNo}"/><button>답변처리</button></div></form>
			</c:if>
		</c:if> --%>
			<div id="comment" >
					Inquiries
        	</div>
        <table class="table" id="daeContent">
           <%--  <tr>
                <td><label for="id" >작 성 자</label></td>
                <td><input type="hidden" name="mbNo" value="${bean.mbNo }">일반회원</td>
            </tr> --%>
            <tr>
                <td align="center"><label for="id" >글 번 호</label></td>
                <td><input type="hidden" name="mbNo" value="${bean.mbNo}"><input type="hidden" name="pquestNo" value="${bean.pquestNo}">${bean.pquestNo}</td>
               
            </tr>
            <tr>
                <td align="center"><label>분류</label></td>
                <c:if test="${bean.csClassGbCd eq '1'}">
                <td>주문</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq '2'}">
                <td>배송</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq '3'}">
                <td>결제</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq '4'}">
                <td>교환취소</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq '5'}">
                <td>회원정보</td>
                </c:if>
                <c:if test="${bean.csClassGbCd eq'6'}">
                <td>기타</td>
                </c:if>
            </tr>
            <tr>
                <td align="center"><label>제목</label></td>
                <td>${bean.sub}</td>
            </tr>
            <tr>
                <td style="padding-top:70px;" align="center"><label>내용</label></td>
                <td style="height:150px; padding-top:70px;">${bean.content}</td>
            </tr>
           
            <!-- <tr>
                <td></td>
                <td id="daeButton" >
                  <input class="btn btn-default" id="cancel" type="reset" value="뒤로">
                </td>
            </tr> -->
        </table>
        <br/>
        <div>
        <c:if test="${reply.replyContent ne null }">
        </c:if>
       		<div id="comment" >
        		Comment
        	</div>
        	<c:if test="${levelGbCd=='2'}">
        	<c:if test="${bean.questStsCd=='1'}">
	        	<form action="/mp/mng/csInqReply" method="get">
		        	<div class="col-md-10 col-md-offset-1">
			        	<br/><br/><br/>
			            	<input style="width:100%; margin-top:-10px;"type="text" class="form-control" id="repleContentInput" name="replyContent" placeholder="답글을 달아주세요(엔터로 입력)"/>
			      </div>
	            	<input type="hidden" name="pquestNo" value="${bean.pquestNo}"/>
	            	<input type="hidden" name="mbNo" value="${bean.mbNo}"/>
	        	</form>
        	</c:if>
        	</c:if>
        	
        	<div id="replyed" class="col-md-offset-2">
        		<br/><br/><span></span><span style="font-weight: bold;">${reply.replyContent}</span><span></span>
        	</div>
        </div>
            	<div id="daeButton">
            	<c:if test="${levelGbCd=='1'}">
      			  <input class="btn btn-primary" type="reset" id="back" value="뒤로">
            	</c:if>
            	<c:if test="${levelGbCd=='2'}">
      			  <input class="btn btn-primary" type="reset" id="list" value="목록으로">
            	</c:if>
            	</div>
			
	</div>
</div>
</body>
<jsp:include page="../../template/footer.jsp"></jsp:include>
</html>