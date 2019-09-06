//이전버튼 이벤트
function prevEvent(page, range, rangeSize){
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = "/mp/mng/used?page="+page+"&range="+range;
	location.href = url;
}

//페이지 번호 클릭
function pageChange(page, range, rangeSize, searchType, keyword) {
	var url = "/mp/mng/used?page="+page+"&range="+range;
	location.href = url;	
}

//다음 버튼 이벤트
function nextEvent(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;

	var url = "/mp/mng/used?page="+page+"&range="+range;
	location.href = url;
}



