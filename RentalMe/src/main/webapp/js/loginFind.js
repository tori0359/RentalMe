 $(function(){
	 //등록된 이메일로 아이디 찾기
	 $('#id_find_btn').click(function(){
		var email = $('#id_email_find input').val();
		alert(email);
		var param = {"email":email};
		
    	$.ajax({
    		url: 'email/findId',
    		type:'POST',
    		data: {"email":email},
    		success:function(){
    			
    		},
    		error:function(request, status, error){
    			alert("code="+request.status+", message="+request.responseText+", error="+error)
    		}
        }); 
			
	 });
});
 