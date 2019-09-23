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
    	   var mbNo = $(e.relatedTarget).data('mbno');
    	   var gdsStPrice = $(e.relatedTarget).data('st-price');
			$(e.currentTarget).find('input[name="gdsCd"]').val(gdsCd);
			$(e.currentTarget).find('input[name="mbNo"]').val(mbNo);
			$(e.currentTarget).find('input[name="gdsStPrice"]').val(gdsStPrice);
       });


});