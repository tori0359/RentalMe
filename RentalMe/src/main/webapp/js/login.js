 $(function(){
    $('#pw_find').hide();
    $('#id_email_find').hide();
    $('#pw_email_find').hide();
    $('#find_pw_modal').hide();
    $('#id_find_btn').prop('disabled', true);
    
    $('#pw_tab').click(function(){
        $('#id_tab').prop('disabled', false);
        $('#pw_tab').prop('disabled', true);
        $('#id_find_btn').hide();
        $('#pw_find_btn').show();
        $('#id_find').hide();
        $('#pw_find').show();
    });
    $('#id_tab').click(function(){
        $('#pw_tab').prop('disabled', false);
        $('#id_tab').prop('disabled', true);
        $('#id_find_btn').show();
        $('#pw_find_btn').hide();
        $('#pw_find').hide();
        $('#id_find').show();
    });
    
    $('#find_cellphone').click(function(){
        $('#id_email_find').hide();
        $('#id_cellphone_find').show();
        $('#pw_cellphone_find').show();
        $('#pw_email_find').hide();
    });
    $('#find_email').click(function(){
        $('#id_email_find').show();
        $('#id_cellphone_find').hide();
        $('#pw_cellphone_find').hide();
        $('#pw_email_find').show();
    });                
    
    /*회원가입 - 경로이동*/
    $('#pw_find_btn').click(function(){
        $('#id_pw_find').modal('hide');
    });
    $('#signup').click(function(){
    	location.href='join/signup';
    });
    
    /*비밀번호 유효성 체크 메시지*/
    $('#userPw').focus(function(){
    	$('#errCheck-danger').hide();
    });
    
    /* 아이디/비밀번호 찾기 */    
	var regexEmail = 
		RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); //이메일 정규식(영문+숫자@영문+숫자가 아닐경우)
	
	var setEmail = '';
    
	//모달화면에서 에러메시지 초기화
    $('#email-danger').hide();
    $('#empty-danger').hide();
    $('#noEmail-danger').hide();
    

    
	//아이디/비밀번호찾기 form 초기화 
    $("#find_id_modal").on("hidden.bs.modal", function(){
    	//등록된 이메일 form 초기화
        $("#inputEmail").val("");
        
        //등록된 핸드폰으로 찾기 form 초기화
        $('id_cellphone_find').val('');
    });
    
    //등록된 이메일로 아이디 찾기 (이메일 정규식 체크) 
    $('#inputEmail').focus(function(){
    	$('#email-danger').hide();
    	$('#empty-danger').hide();
    	$('#noEmail-danger').hide();
    	$('#id_find_btn').prop('disabled', true);
    }).blur(function(){
    	if($('#inputEmail').val()!=""){
    		if(regexEmail.test($('#inputEmail').val())){//이메일 정규식 체크에서 정상일경우 패스
    			$('#email-danger').hide();
    			$('#id_find_btn').prop('disabled', false);
    			
    		    $('#id_find_btn').click(function(){
    		    	//부모창의 스크롤을 막는다.
    		    	$("html, body").addClass("not_scroll");
    		    	
    		    	setEmail = $('#inputEmail').val();
    	
    		    	$.ajax({
    		            type: 'GET',
    		            url: 'emailFindId',
    		            data: {'email' : $('#inputEmail').val()},
    		            dataType: 'json',
    		            success: function(data) {
    		            	var infoList = data;
    		            	
    		            	//1) 등록된 이메일이 있는 경우
    		            	if(infoList.length > 0){
    		            		//1. 계정정보 찾기 창을 닫는다.
    		            		$('#id_pw_find').modal('hide');
    		            		
    		            		//2. 아이디 찾기 결과 값 초기화
    		            		$('#find_id_body').empty();
    		            		
    		            		//3. 아이디 찾기 결과 모달 - json으로 받아온 데이터 바인딩
    		            		$.each(infoList, function(index, info){
    		            			$('#find_id_body').append('<div class="row">')
    		            							  .append(	'<div class="col-md-2"></div>')
    		            							  .append(	'<div class="col-md-4">아이디</div>')
    		            							  .append(	'<div class="userId col-md-4" id="userId">'+info.userId+'</div>')
    		            							  .append(	'<div class="col-md-2"></div>')
    		            							  .append('</div>')
    		            							  .append('<div class="row">')
    		            							  .append(	'<div class="col-md-2"></div>')
    		            							  .append(	'<div class="col-md-4">가입일자</div>')
    		            							  .append(	'<div class="col-md-4">'+info.joinDt+'</div>')
    		            							  .append(	'<div class="col-md-2"></div>')
    		            							  .append('</div>')
    		            							  .append('<div class="row">')
    		            							  .append(		'<div style="margin:3px 2px 3px 134px; width:200px height:50px;><a type="button" href="/login?userId='+info.userId+'" class="useId btn btn-primary">아이디 사용</a>')
    		            							  .append(		'<button type="button" id="'+info.userId+'" class="findPw btn btn-info">비밀번호 찾기</button></div>')
    		            							  .append('</div>');
    		            		});
    		            		
    		            		

    		            		$('.col-md-4').css('text-align','center').css('border','1px solid black');
    		            		
    		            		//4. 아이디 찾기 결과 모달을 보여준다.
    		            		$('#find_id_modal').modal('show');
    		            		
    		            	}else{
    		            		//2) 등록된 이메일이 없을 경우 메시지를 보여준다.
    		            		$('#noEmail-danger').show();
    		            		return false;
    		            	}
    		            	
    		                //아이디찾기 결과 모달이 닫히면 html 초기화
    		                $("#find_id_modal").on("hidden.bs.modal", function(){
    		                	$("#find_id_body").html("");
    		                	$("html, body").removeClass("not_scroll");
    		                });
    		                

    		            },
                		error:function(request, status, error){
                			alert("code="+request.status+", message="+request.responseText+", error="+error)
                		}
    		           
    		        });
    		    });
    		}else{
    			$('#email-danger').show();
    		}
    	}else{
    		$('#empty-danger').show();
    	}
    });
    //!modal
    
    
    /* 아이디찾기 결과 버튼 이벤트 */
    //1) 아이디 사용 버튼을 눌렀을 때(append로 html 작성시 이 방법으로 넘겨줘야 데이터가 동작한다.) - 1. 동작 이벤트 2. 선택자 3. function()
    $(document).on("click", ".useId", function () {
    	//로그인페이지로 이동
    	window.location = $(this).attr('href');
    });
    
    //2) 비밀번호찾기 버튼을 눌렀을 때
    $(document).on("click", ".findPw", function () {
    	//1. 아이디찾기 결과 모달을 닫는다.
    	$('#find_id_modal').modal('hide');
    	
    	//2. 아이디/비밀번호찾기 모달을 연다.
    	$('#id_pw_find').modal('show');
    	
    	//3. 비밀번호 찾기 탭으로 이동
        $('#id_tab').prop('disabled', false);
        $('#pw_tab').prop('disabled', true);
        $('#id_find_btn').hide();
        $('#pw_find_btn').show();
        $('#id_find').hide();
        $('#pw_find').show();
        
        //4. 사용자아이디, 입력한 이메일 바인딩
        $('#pwUserId').val($(this).attr('id'));
        $('#pwInputEmail').val(setEmail);
    });
    /* // 아이디찾기 결과 버튼 이벤트 */
    
    var pwMsg =  $('#pwMsg').val();
    if(pwMsg == "notEmpty"){
    	$('#find_pw_modal').modal('show');
    }else if(pwMsg == "empty"){
    	alert('입력하신 정보가 존재하지 않습니다.');
    	$('#id_pw_find').modal('hide');
    	return false;
    }
    
  //비밀번호 변경 이벤트
    $('#pw_change_btn').click(function(){	
    	var pw1 		= $('#pw1').val();
    	var pw2 		= $('#pw2').val();
    	
    	var pwId 		= $('#pwId').val();
    	var pwEmail 	= $('#pwEmail').val();
    	
    	if(pw1 != "" && pw2 != ""){		//빈값이 아니었을 경우
	    	if(pw1 == pw2){				//비밀번호 입력값이 같은 경우
	    		$.ajax({
		            type: 'POST',
		            url: 'changePw',
		            data: {'userPw' : pw1
		            	  ,'userId' : pwId
		            	  ,'email'  : pwEmail},
		            success: function() {
		            	alert('정상적으로 변경되었습니다.');
		            	$('#find_pw_modal').modal('hide');
		            },
		            error:function(request, status, error){
	        			alert("code="+request.status+", message="+request.responseText+", error="+error)
	        		}
	    		});
	    	}else{						//비밀번호 입력값이 다른 경우
	    		alert('비밀번호 입력값이 다릅니다.');
	    		return false;
	    	}
    	}else{
    		alert('빈값은 입력할 수 없습니다.');
    		return false;
    	}
    });
    
    
});
 
 
