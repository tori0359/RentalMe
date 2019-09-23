<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
<jsp:include page="../../template/headerMng.jsp"></jsp:include>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<style type="text/css">
	 
     #text{
     	width:80%;
     }
     #csContent{
     		margin-top:100px;
        	height:900px;
     }
     #daeButton{
     	text-align:right;
     	padding:8px 180px 8px 8px;
     }
     h2{
     	padding:0px 0px 35px 20px;
     }
     #daeContent tr>td:nth-child(1){
     	width:250px;
     	text-align:center;
     }
     #selected{
     	display:visible;
     }
    .ck-editor__editable {
  			  min-height: 250px;
	}
	.ck.ck-editor {
	    max-width: 690px;
	}
</style>
<script type="text/javascript">

	/* function csselect(csGbCd){
				console.log(csGbCd);
			$.ajax({
				url:'csList',
				type:'GET',
				data:{'param':$("#select option:selected").val()},
				success:function(result){
					var sel=result;
					if(sel==20){
					$("#selected").find('td').remove().end().append('<td><label>FAQ분류</label></td>')
							.append('<td><select class=\"form-control\" style=\"height:35px; width:118px;\" name=\"csClassGbCd\"><option selected=\"selected\">FAQ항목</option><option value=\"1\">주문</option><option value=\"2\">배송</option><option value=\"3\">결제</option><option value=\"4\">교환취소</option><option value=\"5\">회원정보</option><option value=\"6\">기타</option></select></td>')
						
					}else{
						$("#selected").find('td').remove().end();
					}
				},
				erro:function(jqXHR,testStatus,errorThrown){
					alert('오류가 발생했습니다');
				}

			});
		} */
	window.onload=function(){
		$("#faq").click(function(){
			console.log("dd");
		})
		$("#cancel").click(function(){
			history.back();
		})
			
		
	};
</script>
</head>
<body>

<div id="csContent">
<form action="/mp/mng/csNoticeUpdate" method="post">
		<h2>공지/FAQ등록</h2>
        <table class="table" id="daeContent">
            <tr>
                <td><label for="" >작 성 자</label></td>
                <td>관 리 자</td>
            </tr>
            <tr>
            	<td><label>글 번 호</label></td>
            	<td><input type="hidden" value="${detail.noticNo}" name="noticNo">${detail.noticNo}</td>
            </tr>
            <tr>
                <td><label>분류</label></td>
                <td><input type="hidden" name="csGbCd" value="${detail.csGbCd}">
			        	공지사항
          		</td>
            </tr>
            <tr>
                <td style="vertical-align: middle;"><label>제목</label></td>
                <td><input type="text" name="sub" value="${detail.sub}" id="text" class="form-control"></td>
            </tr>
            <tr>
                <td><label>내용</label></td>
                <td>
	                <textarea id="editor" name="content" style="resize:none;"></textarea>
	                <script>
					   		 ClassicEditor
					        .create( document.querySelector( '#editor' ),{removePlugins: [ 'ImageUpload' ]
					      })
					        .catch( error => {
					            console.error( error );
					        } );
					 </script>
                </td>
            </tr>
            <tr>
                <td></td>
                <td id="daeButton" >
                   <input class="btn btn-primary" type="submit" value="수정"/>
                   <input class="btn btn-default" id="cancel" type="reset" value="취소">
                </td>
            </tr>
        </table>
</form>
</div>
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>