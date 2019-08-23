            var cnt=0;
            var sel_files = [];
	        $(function(){ 
                $("#imgfile").on("change", handleImgsFilesSelect);
                
                $("#category").change(function(){
                	if($(this).val().equals("10")){
                		$('intput[type=radio]').not($('.mclass1')).hide();
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
            });
 
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