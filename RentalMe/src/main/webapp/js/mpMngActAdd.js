	      function goodsSelect(classifi){
	         $.ajax({
	            url:'searchCode',
	            type:'POST',
	            dataType:'json',
	            data : {param:classifi},
	            success:function(result){
//	                alert(result);
	               //select box 초기화
	               $('#goods').find('option').remove().end().append('<option value="">상품을 선택</option>');
	               //option 추가
	               $.each(result, function(i){
		               console.log(result[i]);
		               if(result[i]=='에어컨'){
	                  $('#goods').append('<option name="goods" value="'+11+'">'+result[i]+'</option>');}
		               if(result[i]=='냉난방기'){
	                  $('#goods').append('<option name="goods" value="'+12+'">'+result[i]+'</option>');}
		               if(result[i]=='냉장고'){
	                  $('#goods').append('<option name="goods" value="'+13+'">'+result[i]+'</option>');}
		               if(result[i]=='TV'){
	                  $('#goods').append('<option name="goods" value="'+14+'">'+result[i]+'</option>');}
		               if(result[i]=='세탁기'){
	                  $('#goods').append('<option name="goods" value="'+15+'">'+result[i]+'</option>');}
		               if(result[i]=='빨래건조기'){
	                  $('#goods').append('<option name="goods" value="'+16+'">'+result[i]+'</option>');}
		               if(result[i]=='정수기'){
	                  $('#goods').append('<option name="goods" value="'+17+'">'+result[i]+'</option>');}
		               if(result[i]=='공기청정기'){
	                  $('#goods').append('<option name="goods" value="'+18+'">'+result[i]+'</option>');}
		               if(result[i]=='복합기/프린터'){
	                  $('#goods').append('<option name="goods" value="'+19+'">'+result[i]+'</option>');}
		               if(result[i]=='커피머신'){
	                  $('#goods').append('<option name="goods" value="'+21+'">'+result[i]+'</option>');}
		               if(result[i]=='제습기'){
	                  $('#goods').append('<option name="goods" value="'+22+'">'+result[i]+'</option>');}
		               if(result[i]=='드라이어'){
	                  $('#goods').append('<option name="goods" value="'+23+'">'+result[i]+'</option>');}
		               if(result[i]=='빔프로젝터'){
	                  $('#goods').append('<option name="goods" value="'+24+'">'+result[i]+'</option>');}
		               if(result[i]=='컴퓨터/노트북'){
	                  $('#goods').append('<option name="goods" value="'+25+'">'+result[i]+'</option>');}
		               if(result[i]=='무선스피커'){
	                  $('#goods').append('<option name="goods" value="'+26+'">'+result[i]+'</option>');}
		               if(result[i]=='비데'){
	                  $('#goods').append('<option name="goods" value="'+27+'">'+result[i]+'</option>');}
		               if(result[i]=='면도기'){
	                  $('#goods').append('<option name="goods" value="'+28+'">'+result[i]+'</option>');}
		               if(result[i]=='음식물처리기'){
	                  $('#goods').append('<option name="goods" value="'+29+'">'+result[i]+'</option>');}
		               if(result[i]=='제빙기'){
	                  $('#goods').append('<option name="goods" value="'+31+'">'+result[i]+'</option>');}
		               if(result[i]=='전자레인지'){
	                  $('#goods').append('<option name="goods" value="'+32+'">'+result[i]+'</option>');}
		               if(result[i]=='에어프라이어'){
	                  $('#goods').append('<option name="goods" value="'+33+'">'+result[i]+'</option>');}
		               if(result[i]=='오븐'){
	                  $('#goods').append('<option name="goods" value="'+34+'">'+result[i]+'</option>');}
		               if(result[i]=='오븐'){
	                  $('#goods').append('<option name="goods" value="'+35+'">'+result[i]+'</option>');}
		               if(result[i]=='침대(매트리스+프레임)'){
	                  $('#goods').append('<option name="goods" value="'+41+'">'+result[i]+'</option>');}
		               if(result[i]=='침대'){
	                  $('#goods').append('<option name="goods" value="'+42+'">'+result[i]+'</option>');}
		               if(result[i]=='쇼파'){
	                  $('#goods').append('<option name="goods" value="'+43+'">'+result[i]+'</option>');}
		               if(result[i]=='책상'){
	                  $('#goods').append('<option name="goods" value="'+44+'">'+result[i]+'</option>');}
		               if(result[i]=='악기'){
	                  $('#goods').append('<option name="goods" value="'+51+'">'+result[i]+'</option>');}
		               if(result[i]=='명품'){
	                  $('#goods').append('<option name="goods" value="'+52+'">'+result[i]+'</option>');}
		               if(result[i]=='귀금속'){
	                  $('#goods').append('<option name="goods" value="'+53+'">'+result[i]+'</option>');}
		               if(result[i]=='침실패키지'){
	                  $('#goods').append('<option name="goods" value="'+61+'">'+result[i]+'</option>');}
		               if(result[i]=='주방패키지'){
	                  $('#goods').append('<option name="goods" value="'+62+'">'+result[i]+'</option>');}
		               if(result[i]=='욕실패키지'){
	                  $('#goods').append('<option name="goods" value="'+63+'">'+result[i]+'</option>');}
		               if(result[i]=='기타패키지'){
	                  $('#goods').append('<option name="goods" value="'+64+'">'+result[i]+'</option>');}
		                  
	               });
	              
	            },
	            erro:function(jqXHR, textStatus, errorThrown){
	               alert('오류가 발생했습니다');
	               
	            }
	            
	         });
	      }
	      /* function selectGoods(String num){
				console.log("hihi"+num);
		  }  */
	 		/* function selectGoods(gooo){
				console.log('dd'+gooo);
		 	}   */
					 	var gdsCdarr=new Array();			//경매상품번호 배열
					  	var gdsNmarr=new Array();			//상품명 배열
					 	var brandNmarr=new Array();			//브랜드명 배열
					 	var modelNmarr=new Array();			//모델명 배열
					 	//var gdsCdDetailarr=new Array(); 	//상세상품번호 배열
					 	
						var gdsCd; 			//상품 번호
						var gdsNm; 			//상품명
						var brandNm;		//브랜드명
						var modelNm;		//모델명
						var gdsCdDetail 	//상세코드
						var test;
						
						String.prototype.replaceAt=function(index, character) {
						    return this.substr(0, index) + character + this.substr(index+character.length);
						}
	      window.onload=function(){
					$('#cancel').click(function(){
							window.history.back();
					})
						
		         $('#modalBtn').click(function(){
		         
			       $.ajax({
					url:'searchList',
					type:'GET',
					data:{'param':$("#goods option:selected").val()},
					
					success:function(result){
						
						var goodsList=result;
						
						//console.log(goodsList);
						$('#goodsTable').find('tr').remove().end().append('<tr><td></td></tr>')
						$.each(goodsList,function(index,goods){
							/* console.log('브랜드'+goods.brandNm);
							console.log('모델넘버'+goods.modelNm);
							console.log('상품넘버'+goods.gdsNm);
							console.log('상품코드'+goods.gdsCd); */
							
						 	/* if(gooo.equals("")){
								$('#goodsTable').append('<tr><td>해당 상품이 없습니다</td></tr>');
							}   */ 
							
							gdsCdarr.push(goods.gdsCd);//상세상품번호 push
							gdsNmarr.push(goods.gdsNm);//상품명 push
							modelNmarr.push(goods.modelNm);//모델명 push
							brandNmarr.push(goods.brandNm);//브랜드명 push
							//console.log(gdsCdarr[gdsCdarr.length-1]);
							console.log('한 사이클');
							gdsCdDetail=gdsCdarr[gdsCdarr.length-1];
							gdsNm=gdsNmarr[gdsNmarr.length-1];
							brandNm=brandNmarr[brandNmarr.length-1];
							modelNm=modelNmarr[modelNmarr.length-1];
							console.log(gdsCdDetail);
							console.log(gdsNm);
							
							
							/* gdsCdDetail=goods.gdsCd;
							gdsNm=goods.gdsNm;
							brandNm=goods.brandNm;
							modelNm=goods.modelNm; */
							
							gdsCd=gdsCdDetail.replaceAt(0,"3");
							gdsCdarr.push(gdsCd);
							console.log('상품번호:'+gdsCdarr[gdsCdarr.length-1]);
							gdsCd=gdsCdarr[gdsCdarr.length-1];
							//console.log("바뀐 숫자"+gdsCd);
							
							//console.log(gdsCdarr);
							//gdsCdarr.push(goods.gdsCd);
							/* console.log('-----start-----');
							console.log(gdsNm);
							console.log(brandNm);
							console.log(modelNm);
							console.log('----end-----'); */
							
							$('#goodsTable').append('<tr><td style="text-align:left;"><input type="hidden" id="goodsBtn" style="border:none" name="gdsCd" value='+gdsCd+'><input type="hidden" id="goodsBtn" style="border:none" name="gdsNm" value='+gdsNm+'><input type="hidden" id="goodsBtn" style="border:none" name="brandNm" value='+brandNm+'><input type="hidden" id="goodsBtn" style="border:none" name="modelNm" value='+modelNm+'><a id="listname" onclick="selectGoods(\''+gdsCd+'\',\''+modelNm+'\',\''+gdsNm+'\',\''+brandNm+'\',\''+gdsCdDetail+'\');">'+gdsNm+'</a></td></tr>');
							
						});
					},
					erro:function(jqXHR,testStatus,errorThrown){
						alert('오류가 발생했습니다');
					}
			     }); 
				   
		  });
			
			$('#selectOne').click(function(){
				$('#myModal').modal('hide');
			})
			

		  } 
		 function selectGoods(gdsCd,modelNm,gdsNm,brandNm,gdsCdDetail){
			
					 
			
						/* console.log('select'+gdsNm);
						console.log('select'+modelNm);
						console.log('select'+brandNm); */ 
						
						document.getElementById('gdsCd').setAttribute('value',gdsCd);
					 	document.getElementById('gdsNm').setAttribute('value',gdsNm);
						document.getElementById('gdsCdDetail').setAttribute('value',gdsCdDetail)
						document.getElementById('brandNm').setAttribute('value',brandNm); 
						document.getElementById('modelNm').setAttribute('value',modelNm); 
		}
		