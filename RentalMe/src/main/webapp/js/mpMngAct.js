$(function(){
	$('.gdsLink').click(function(){
		var link=$(this).parent().find('.hiddenCd').val().substring(2,12);
		window.location.href='/act/admin/10'+link;
	});	 
	
	$('#choosedel').click(function(){
		 Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			    if (result.value) {
					   var checkArr = new Array();
					   
					   $("input[class='chBox']:checked").each(function(){
					    checkArr.push($(this).attr("data-actNum"));
					   });
					    
					   $.ajax({
						    url : "/mp/mng/deleteList",
						    type : "post",
						    data : { chbox : checkArr},
						    success : function(){
							   Swal.fire({
								   position: 'top-middle',
								   type: 'success',
								   title: '정상적으로 삭제되었습니다.',
								   showConfirmButton: false,
							       timer: 1500
							   })
						       setTimeout('location.reload()',1500)
					    	}
					   });		    	
			    }
			})
	 });
	
});

function checkAll(){
    if( $("#allCheck").is(':checked') ){
      $("input[name=chBox]").prop("checked", true);
    }else{
      $("input[name=chBox]").prop("checked", false);
    }
}