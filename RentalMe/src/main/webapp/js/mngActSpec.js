$(function(){
	   // 구매 모달
       $('#myModal').on('shown.bs.modal', function (e) {
    	   var gdsCd = $(e.relatedTarget).data('gds-cd');
    	   var odrNo = $(e.relatedTarget).data('odr-no');
			$(e.currentTarget).find('input[name="crudGbCd"]').val("UUAC");
			$(e.currentTarget).find('input[name="odrGbCd"]').val("30");
			$(e.currentTarget).find('input[name="gdsCd"]').val(gdsCd);
			$(e.currentTarget).find('input[name="odrNo"]').val(odrNo);
       });

   	   // 구매 모달
       $('#myModal2').on('shown.bs.modal', function (e) {
    	   var gdsCd = $(e.relatedTarget).data('gds-cd');
			$(e.currentTarget).find('input[name="gdsCd"]').val(gdsCd);
       });

});