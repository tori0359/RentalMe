$(function(){
	$('.gdsLink').click(function(){
		var link=$(this).parent().find('.hiddenCd').val().substring(2,12);
		window.location.href='/act/admin/10'+link;
	});	 
	
	$('#choosedel').click(function(){
		 var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
			   var checkArr = new Array();
			   
			   $("input[class='chBox']:checked").each(function(){
			    checkArr.push($(this).attr("data-actNum"));
			   });
			    
			   $.ajax({
				    url : "/mp/mng/deleteList",
				    type : "post",
				    data : { chbox : checkArr},
				    success : function(){
				    	location.href = "/mp/mng/actList";
			    	}
			   });
		  } 
	 });
	
});

function checkAll(){
    if( $("#allCheck").is(':checked') ){
      $("input[name=chBox]").prop("checked", true);
    }else{
      $("input[name=chBox]").prop("checked", false);
    }
}