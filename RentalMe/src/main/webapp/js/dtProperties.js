$(function(){	
	
	var path 	= window.location.pathname;
	
	var sort   = '';
	
	//주문관리인경우
	if(path == '/mp/mng/list'){
		sort =  [ [ 1, "desc" ] ];
	}
	
	if(path == '/mp/mng/userList'){
		sort =  [ [ 0, "asc" ] ];
	}
	
	if(path == '/mp/mng/csFaqList'){
		sort =  [ [ 0, "desc" ] ];
	}
	
	$('#dt').DataTable({
		/*기본 속성 적용*/
		'paging' 		: true,					//페이징 사용 여부
		'ordering' 		: true,					//컬럼 클릭 시 정렬 적용 여부
		'info' 			: true,					//페이지 상태 정보 적용 여부
		'filter' 		: true,					//검색 필터 적용여부
		'lengthChange '	: true,					//셀렉트박스 목록갯수 적용여부
		'stateSave'		: false,				//새로고침 시에 현재 페이지 적용 여부
		'pagingType'	: 'simple_numbers',		//페이징 타입(numbers, simple, simple_numbers, full, full_numbers, first_last_numbers)
		
		/*스크롤 적용*/
		//'scrollX '		: false,				//x축 스크롤 사용여부
		//'scrollY '		: '0px',			//y축 스크롤 크기
		//'scrollCollapse': false,				//y축 스크롤 사용여부(사용하면 paging은 false 해야 한다.)
		
		/*언어변경*/
		'language'		: {
							'lengthMenu' 	: '_MENU_개씩 보기',					//lengthMenu에 표기되는 언어 _MENU_ 는 변수로 사용
							'zeroRecords' 	: '일치하는 데이터가 없습니다.',		//필터링된 데이터와 맞는 단어가 없는 경우 보여지는 문구
							'info'			: '_PAGE_ - _PAGES_ / _TOTAL_건',		//페이지정보에 표기되는 언어 _PAGE_, _PAGES_,_TOTAL_ 는 변수로 사용됨
							'infoEmpty'		: '0건',								//데이터가 0건일때 페이지정보의 문구
							'infoFiltered'  : '(_MAX_건의 데이터에서 필터링 됨)',	//검색시 페이지정보에 표기되는 문구(_MAX_)
							'search'		: '검색 : ',							//필터링 타이틀
							'emptyTable'	: '조회된 데이터가 없습니다.',			//데이터가 0건일 때 테이블에 보여지는 문구
							'loadingRecords': '로딩중...',							//데이터 로딩중 보여질 문구
							'processing'	: '잠시만 기다려 주세요...',			//로딩중 보여질 문구
							'paginate'		: {										//페이징 보여줄 문구
									            first:      "<<",
									            previous:   "<",
									            next:       ">",
									            last:       ">>"
					        				},
						},
		
						
		/* 테이블 컬럼 표시 설정 */
	    // 표시 건수를 10건 단위로 설정
	    lengthMenu		: [ 10, 20, 30 ],
					 
	    // 기본 표시 건수 설정
	    displayLength	: 10,
	    
	    //컬럼을 보여줄것인지 설정
	    columnDefs		: [
	        				{ 
	        					targets: 0, visible: true 
	        				}
	        			],
	        			
	    /* 테이블에 버튼 추가*/
//	    dom				: '<"top"lf>rt<"bottom"ip>'	//보여지는 순서
//	    buttons			: [
//	        'excel'
//	    ]
	        			
	    order			: sort
	        			
	});
});