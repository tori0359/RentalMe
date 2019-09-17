$(function(){
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
							'lengthMenu' 	: '_MENU_',								//lengthMenu에 표기되는 언어 _MENU_ 는 변수로 사용
							'zeroRecords' 	: '조회된 데이터가 없습니다.',			//데이터가 0건일 때 테이블에 보여지는 문구
							'info'			: '_PAGE_ to _PAGES_ page of _TOTAL_',	//페이지정보에 표기되는 언어 _PAGE_, _PAGES_,_TOTAL_ 는 변수로 사용됨
							'infoEmpty'		: '',									//데이터가 0건일때 페이지정보의 문구
							'infoFiltered'  : '',									//검색시 페이지정보에 표기되는 문구
							'paginate'		: {										//페이징 보여줄 문구
									            first:      "<<",
									            previous:   "<",
									            next:       ">",
									            last:       ">>"
					        				},
						}
			
	});
});