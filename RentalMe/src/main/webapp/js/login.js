 $(function(){
    $('#pw_find').hide();
    $('#id_email_find').hide();
    $('#pw_email_find').hide();
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
    
	//모달화면에서 에러메시지 초기화
    $('#email-danger').hide();
    $('#empty-danger').hide();
    $('#noEmail-danger').hide();
    
	//아이디/비밀번호찾기 form 초기화 
    $("#id_pw_find").on("hidden.bs.modal", function(){
    	//등록된 이메일 form 초기화
        $("#inputEmail").val("");
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
    		    	//부모창 막기
    		    	$("html, body").addClass("not_scroll");
    	
    		    	$.ajax({
    		            type: 'GET',
    		            url: 'emailFindId',
    		            data: {'email' : $('#inputEmail').val()},
    		            dataType: 'json',
    		            success: function(data) {
    		            	var infoList = data;
    		            	if(infoList.length > 0){
    		            		//등록된 이메일이 있을 경우 계정정보 찾기 창을 닫고 결과창을 보여준다.
    		            		$('#id_pw_find').modal('hide');
    		            		
    		            		//아이디 찾기 결과 값 초기화
    		            		$('#find_id_body').empty();
    		            		
    		            		$.each(infoList, function(index, info){
    		            			// hij0359@gmail.com, htyeon91g@gmail.com
    		            			$('#find_id_body').append('<div class="row">')
    		            							  .append(	'<div class="col-md-2"></div>')
    		            							  .append(	'<div class="col-md-4">아이디</div>')
    		            							  .append(	'<div class="col-md-4">'+info.userId+'</div>')
    		            							  .append(	'<div class="col-md-2"></div>')
    		            							  .append('</div>')
    		            							  .append('<div class="row">')
    		            							  .append(	'<div class="col-md-2"></div>')
    		            							  .append(	'<div class="col-md-4">가입일자</div>')
    		            							  .append(	'<div class="col-md-4">'+info.joinDt+'</div>')
    		            							  .append(	'<div class="col-md-2"></div>')
    		            							  .append('</div>')
    		            							  .append('<div class="row">')
    		            							  .append(		'<div style="margin:3px 2px 3px 134px; width:200px height:50px;><button type="button" id="useId'+index+'" class="btn btn-primary">아이디 사용</button>')
    		            							  .append(		'<button type="button" id="findPw'+index+'"class="btn btn-info">비밀번호 찾기</button></div>')
    		            							  .append('</div>')
    		            		});
    		            	
    		            		$('.col-md-4').css('text-align','center').css('border','1px solid black');
    		            		
    		            		$('#find_id_modal').modal('show');
    		            	}else{
    		            		//등록된 이메일이 없을 경우 메시지를 보여준다.
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
    

   
});
 

 
