$(function(){
	/////////////////////////////////////////
	//중고상품 등록
            var cnt=0;
            var sel_files = [];
                $("#imgfile").on("change", handleImgsFilesSelect);
                
                $('input[type=radio]').not($('.mclass1')).parents('label').hide();
                
                $("#category").change(function(){
                	$('input[type=radio]').parents('label').show();
                	if(($('#category').val())=="10"){
                		$('input[type=radio]').not($('.mclass1')).parents('label').hide();
                	}else if(($('#category').val())=="20"){
                		$('input[type=radio]').not($('.mclass2')).parents('label').hide();
                	}else if(($('#category').val())=="30"){
                		$('input[type=radio]').not($('.mclass3')).parents('label').hide();
                	}else if(($('#category').val())=="40"){
                		$('input[type=radio]').not($('.mclass4')).parents('label').hide();
                	}else if(($('#category').val())=="50"){
                		$('input[type=radio]').not($('.mclass5')).parents('label').hide();
                	}else if(($('#category').val())=="60"){
                		$('input[type=radio]').not($('.mclass6')).parents('label').hide();
                	}
                	
                });
                
                //가격: 숫자만 입력
                $("#price").on("keyup", function() { 
                    $(this).val($(this).val().replace(/[^0-9]/g,"")); 
                }).on("focusout", function(){
                    $(this).val($(this).val().replace(/[^0-9]/g,""));
                });
                
                $('#submit_btn').click(function(){
                    if($('#sub').val()=="" || $('#price').val()=="" || $('#explain').val()==""){
                        alert('꼭 써주세요');
                        return false;
                    }
                });
                
///////////////////////////////////
                //나의 상점//
            		$('#myUsedReview').hide();
            		$('.tab:first-child').addClass('active');
            		var who;	// 클릭한 탭이 누군지
            		$('.tab').eq(0).click(function(e){
            			e.preventDefault();
            			who=$(this);
            			removeCls(who);
            			showList();
            		});
            		$('.tab').eq(1).click(function(e){
            			e.preventDefault();
            			who=$(this);
            			removeCls(who);
            			showReview();
            		});
            		$('.myUsedLt').mouseenter(function(){
            			$(this).children('li').css('background-color','#f0fbfc');
            			$(this).children('li').css('cursor','pointer');
            		});
            		$('.myUsedLt').mouseleave(function(){
            			$(this).children('li').css('background-color','white');
            		});
            		$('.myUsedLt').not('.used_del').click(function(){
            			console.log('상세정보');
            		});

                //나의 상점//
        ////////////////////////////////
                	
		////////////////////////////////
		//중고 디테일//
		$('.cmtContent:nth-child(odd)').hide();
		$('.secretCmt').hide();
		$('#storeReviewList').hide();
		
		for(var i=0; i<$('.secretCmt').length; i++){
			if($('.secretCmt').eq(i).text()==2){
				if($('.secretCmt').eq(i).next().text()==$('#hiddenMyId').text()){
					
				}else{
					$('.secretCmt').eq(i).parent().next().show();
					$('.secretCmt').eq(i).parent().remove();
					i--;
				}
			}			
		}
		
		
		for(var i=0; i<$('.item').length; i++){
			if($('.item img').eq(i).attr('src')==""){
				$('.item img').eq(i).parent('.item').remove();
			}
		} 
		
		var price1=$('.used_price1').text();
		$('.used_price1').text(numberWithCommas(price1)+'원');
		
		$('.insertReple').click(function(){
			$('#repleId').text($(this).prev().prev().prev().text());
			$('#repleCnt').text($(this).prev().text());
		});
		
		//중고 디테일//
		////////////////////////////////
                
});
 
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////

		//중고상품등록 함수//
        function handleImgsFilesSelect(e) {
        	var imgCnt = document.getElementById("imgfile");
        	if(imgCnt.files.length>4){
        		alert('5개 이상 선택할 수 없습니다.');
        		$('#imgfile').val("");
        		$('img').remove();
        		return false;
        	}
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            $('img').remove();
            cnt=0;
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_files.push(f);
 
                var reader = new FileReader();
                reader.onload = function(e) {
                    var main_img_html = "<img width='398' height='198' src=\"" + e.target.result + "\" />";
                    var img_html = "<img width='98' height='98' src=\"" + e.target.result + "\" />";
                    if(cnt==0){
                        $("#used_main_img").append(main_img_html);
                    }else if(cnt==1){
                        $("#sub_img1").append(img_html);
                    }else if(cnt==2){
                        $("#sub_img2").append(img_html);
                    }else if(cnt==3){
                        $("#sub_img3").append(img_html);
                    }else{
                        alert("최대 4개까지 가능합니다");
                        cnt--;
                    }
                    cnt++;
                    
                    
                }
                reader.readAsDataURL(f);
            });
        }
//중고상품등록 함수//
        
        
//나의 상점 함수//
    	function removeCls(who){
    		$('.tabs').find('li').removeClass('active');
    		who.addClass('active');
    	}
    	function showList(){ //탭조작
    		$('#myUsedReview').hide();
    		$('#myUsedList').show();
    		$('#storeReviewList').hide();
    		$('#bigInfo').show();
    	}
    	function showReview(){ //탭조작
    		$('#myUsedList').hide();
    		$('#myUsedReview').show();
    		$('#storeReviewList').show();
    		$('#bigInfo').hide();
    	}
//나의 상점 함수//
    	

	//숫자 3자리 콤마 함수//
	function numberWithCommas(x) { //숫자 3자리 콤마
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	//숫자 3자리 콤마 함수//	