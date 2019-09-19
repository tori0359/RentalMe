$(function(){
	  
	// 입금확인 모달
    $('#myModal').on('shown.bs.modal', function (e) {
	 	var odrNo = $(e.relatedTarget).data('odr-no');
	 	$(e.currentTarget).find('input[name="crudGbCd"]').val("UUOC");
	 	$(e.currentTarget).find('input[name="odrGbCd"]').val("10");
		$(e.currentTarget).find('input[name="odrNo"]').val(odrNo);
		//$(e.currentTarget).find('input[name="odrStsGbCd"]').val("PC");
    });

	// 반품확인 모달
    $('#myModal2').on('shown.bs.modal', function (e) {
		var odrNo = $(e.relatedTarget).data('odr-no');
		$(e.currentTarget).find('input[name="crudGbCd"]').val("UURC");
		$(e.currentTarget).find('input[name="odrGbCd"]').val("10");
		$(e.currentTarget).find('input[name="odrNo"]').val(odrNo);
		//$(e.currentTarget).find('input[name="odrStsGbCd"]').val("PC");
    });		
});
/**************************/
/**** 전역변수 선언시작 ***/
/**************************/
function getPost(mode){
	var theForm=document.frmSubmit;
	if(mode == "ord"){
		theForm.method="post";
		theForm.action="/mp/mng/update";
	}else if(mode == "rtn"){
		theForm.method="post";
		theForm.action="/mp/mng/cart/update";
	}
	theForm.submit();
}
/**************************/
/**** 전역변수 선언끝 *****/
/**************************/