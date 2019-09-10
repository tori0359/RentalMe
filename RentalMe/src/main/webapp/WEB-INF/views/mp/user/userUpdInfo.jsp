<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
		#title2{
	   		font-size: 15pt;
	   		font-weight: bolder;
	   		font-family: "nanumB";
	   		margin: 60px 0 50px 0;
	   }
	 
	   .delete_btn2{
	   		background-color: #4d4d4d;
	   		color:white;
	   		height:30px;
	   		font-family: "nanumB";
	   		font-weight: border;	
	   		width:90px;	
	   }
	   
	   #update:hover{
	   		color:white;
	   }
	   
	
	   
	   #infobtn{
	  		width:360px;
	  		height:30px;
	   		margin:0px auto;
	   		float:right;
	   }
	   
	   #infodiv{
	   		padding-bottom:30px;
	   }
	   
	    .delete_btn1{
	   		background-color: #D8D8D8;
	   		height:30px;
	   		font-family: "nanumB";	
	   		font-weight: border;	
	   }
	   #info{
      	width:93%;
      	margin: 20px auto;
      	border:7px solid #E6E6E6;
      	padding: 15px;
      }
      
      #info p{
      	line-height:20px;
      	font-family:"nanumB";
      }
      .titlediv{
            height:40px;
      }
      .pw-chk{
      		color:red;
      		font-family:"nanumB";
      		font-weight: bolder;
      		font-size:10pt;
      		margin-left:110px;
      		padding:5px;
      }
      .table tr{
      		font-family:"nanumB";
      }
 
</style>
<script type="text/javascript">

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    window.onload=function(){
    	var regexPw = 
    		RegExp(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/); //비밀번호 정규식(8~20자 영문소문자,대문자,숫자,특수문자 사용가능)
    	$('#pw-success').hide();
		$('#pw-danger').hide();
		$('#pw-danger2').hide();
		$('#pw-notsuccess').hide();

    	
		//1. 현재 비밀번호 중복체크
		//1-1. 같은지 - 입력하신 비밀번호가 현재 비밀밀번호와 같습니다.
		//1-2. 다른지 - 다음단계
		//2. 변경비밀번호 비밀번호확인 체크
		//2-1. 비밀번호 정규화 체크
		//2-2. 같으면 : 비밀번호가 일치합니다. 띄우고 비밀번호 변경 버튼 활성화 
		//2-3. 다르면 : 비밀번호가 일치하지않습니다. 띄우고 비밀번호 변경 버튼 비활성화
		
		//현재비밀번호 입력란
		$('#inputPw').focus(function(){
			$('#pw-success').hide();
			$('#pw-danger').hide();
			$('#pw-notsuccess').hide();
		}).blur(function(){
			//현재 비밀번호
			var inputPw = $('#inputPw').val();

			//공백이 아니면
			if($('#inputPw').val() != ""){
				
				$.ajax({
					url:"checkPw",
					type: "post",
					data: { "userPw" : inputPw},
					success : function(data){
						var msg = data;
						
						if(msg == 'equals'){
							$('#pw-success').show();
						}else{
							$('#pw-notsuccess').show();
						}
					}				
				});
			}else{
				//공백이면 메시지 추가
				return false;
			}
		});

		//비밀번호 변경 버튼 비활성화로 초기화
		$('#pwchange').attr('disabled', true);

		//신규비밀번호
	  	$('#newpw, #newpwre').focus(function(){
	    	//비밀번호 메시지를 가려준다.
	        $('#pw-success').hide();
	        $('#pw-danger').hide();
	        $('#pw-danger2').hide();
	        
	    }).blur(function(){//비밀번호, 비밀번호확인 포커스가 외부에 있을 경우
	    	//비밀번호 또는 비밀번호 확인의 값이 공백이 아닐경우
	        if($('#newpw').val()!="" || $('#newpwre').val()!=""){
		        
	        	//비밀번호, 비밀번호확인 정규식 체크
	        	if(regexPw.test($('#newpw').val()) || regexPw.test($('#newpwre').val())){
		        	
		        	//비밀번호와 비밀번호확인의 값이 같을 경우 "비밀번호가 일치합니다." 메시지 출력
		            if($('#newpw').val()==$('#newpwre').val()){
		                $('#pw-success').show();
		                $('#pw-danger').hide();
		                $('#pw-danger2').hide();
		                $('#pwchange').attr('disabled', false);
		                
		            } else {//비밀번호와 비밀번호확인의 값이 같지 않을 경우 "비밀번호가 다릅니다." 메시지 출력
		                $('#pw-success').hide();
		                $('#pw-danger').show();
		                $('#pw-danger2').hide();
		                $('#pwchange').attr('disabled', true);
		            }
	        	}else{
	        		//정규식 체크가 맞지 않는 경우 - "8~20자 영문+숫자+특수문자 조합하여 입력해주세요." 메시지 출력
	                $('#pw-success').hide();
	                $('#pw-danger').hide();
	                $('#pw-danger2').show();
	        	}
	        }
		});
		 
    	$('#update').click(function(){
			alert("수정되었습니다!");
       	}); 
    	




    	
    	
		$('#pwchange').click(function(){
       		var newpw = $('#newpw').val();
           	
			$.ajax({
				url:"changePw",
				type: "post",
				data: { "userPw" : newpw},
				success : function(){
					alert("비밀번호가 변경되었습니다!");
				}
			});
        });

     } 


    
</script>
<jsp:include page="../../template/headerMp.jsp"></jsp:include>
</head>
<body>
	
	<div class="titlediv">
       <p id="title2">나의 정보</p>
     </div>
     <form action="/mp/updInfo" method="post">
     <div id="infodiv">
     <div class="hr" style="height:3px; background-color: black;"></div>
     <div id="info">
     <p>
	     <c:if test="${empty userVo.userNM}">
	     	${loginUserId} 님의 개인정보입니다.
	     </c:if>
	     <c:if test="${!empty userVo.userNM }">
	     	${userVo.userNM} 님의 개인정보입니다.
	     </c:if>
     </p>
     </div>
     <table class="table">
     	<tr>
     		<th class="active" style="text-align: center">이름</th>
     		<td><p>※ 마이페이지에서 이름으로 보고싶다면 이름을 설정해주세요.</p>
     		<input style="width:300px;" type="text" name="userNM" value="${userVo.userNM}" placeholder="이름을 입력해주세요">
     		</td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">아이디</th>
     		<td><input style="width:300px;" type="text" readonly="readonly" value="${loginUserId}">
     		<input type="hidden" name="mbNo" value="${loginMbNo}"/>
     		</td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">이메일</th>
     		<td><input style="width:300px;" type="text" readonly="readonly" name="email" value="${userVo.email}"></td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">연락처</th>
     		<td><input style="width:300px;" type="text" readonly="readonly" name="email" value=""></td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">비밀번호 변경</th>
     		<td>
     			<div>
     				<p>※ 최소 8자 ~ 최대 20자 이내로 입력합니다.</p>
     				<p>※ 반드시 영문,숫자,특수문자가 1자리 이상 포함되어야 합니다.</p>
     				
     			</div>
	     		<div>
	     			<label for="pw">현재 비밀번호</label>
	     			
	     			<input style="margin-left:32px;" type="text" name="inputPw" id="inputPw">
	     			<div style="color: #04B404;" class="pw-chk" id="pw-success">비밀번호가 일치합니다</div>
	     			<div class="pw-chk" id="pw-notsuccess">현재 비밀번호와 일치하지 않습니다.</div>
	     		</div>
	     		<div>
	     			<label for="newpw">신규 비밀번호</label>
	     			<input style="margin-left:32px;" type="text" name="newpw" id="newpw"> 
	     			<div class="pw-chk" id="pw-danger">비밀번호가 다릅니다</div>
	     			<div class="pw-chk" id="pw-danger2">8~20자 영문+숫자+특수문자 조합하여 입력해주세요.</div>
	     		
	     		</div>
	     		<div>
	     			<label for="newpwre">신규 비밀번호 확인</label>
	     			<input style="margin-left:4px;" type="text" name="newpwre" id="newpwre">
	     			<button type="button" class="delete_btn1 btn" id="pwchange">비밀번호 변경</button><br>
	     		</div>
				
     			<script>
     			
     			

     			</script>
     		
     		</td>
     	</tr>
     	<tr>
     		<th class="active" style="text-align: center">배송지</th>
     		<td>
				<input style="width:300px;" type="text" id="sample6_address" name="addr" value="${userVo.addr}">
				<button type="button" class="delete_btn1 btn" onclick="sample6_execDaumPostcode()">주소 검색</button><br>
				<input style="width:300px;" type="text" id="sample6_detailAddress" name="addrDetail" value="${userVo.addrDetail}">
     		</td>
     		
     	</tr>
     </table>
     </div>
     <div id="infobtn">
	     <button type="submit" id="update" class="delete_btn2 btn">확인</button>
     </div>
     </form>
      
      
</body>
<jsp:include page="../../template/footerMp.jsp"></jsp:include>
</html>