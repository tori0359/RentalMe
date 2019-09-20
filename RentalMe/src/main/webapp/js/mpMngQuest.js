$(function(){
	$('.updateGo').click(function(){		 
		 Swal.fire({
			  title: '처리하시겠습니까?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '확인',
			  cancelButtonText: '취소'
			}).then((result) => {
			    if (result.value) {

					   var check=$(this).parent().find('.itNo').val();
					    console.log(check);
					   $.ajax({
						    url : "/mp/mng/quest/update",
						    type : "post",
						    data : { questNo : check},
						    success : function(){
							   Swal.fire({
								   position: 'top-middle',
								   type: 'success',
								   title: '정상적으로 확인되었습니다.',
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