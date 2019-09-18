//이전버튼 이벤트
function prevEvent(path ,page, range, rangeSize){
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = path+"?page="+page+"&range="+range;
	location.href = url;
}

//페이지 번호 클릭
function pageChange(path ,page, range, rangeSize, searchType, keyword) {
	var url = path+"?page="+page+"&range="+range+"&searchType="+searchType+"&keyword="+keyword;
	location.href = url;
}

//다음 버튼 이벤트
function nextEvent2(path ,page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;

	var url = path+"?page="+page+"&range="+range;
	location.href = url;
}


/* 신규 렌탈 페이징 추가.. 황태연 */
//이전버튼 이벤트
function prevEvent2(path ,page, range, rangeSize){
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	var url = vMasterLoc+"&sort="+vSort+"&page="+page+"&range="+range;
	location.href = url;
}

//페이지 번호 클릭
function pageChange2(path ,page, range, rangeSize, searchType, keyword) {
	var url = vMasterLoc+"&sort="+vSort+"&page="+page+"&range="+range;
	location.href = url;	
}

//다음 버튼 이벤트
function nextEvent(path ,page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;

	var url = vMasterLoc+"&sort="+vSort+"&page="+page+"&range="+range;
	location.href = url;
}


