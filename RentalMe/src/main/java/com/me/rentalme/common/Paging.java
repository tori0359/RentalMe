package com.me.rentalme.common;

/**
* 페이징 공통 클래스
* 
* @author 황인준
* @version ver1.0
* 등록일자 : 2019.09.06
*/
public class Paging {

	private int 	listSize 		= 10; 		//목록   갯수
	private int 	rangeSize 		= 10;		//페이지 범위
	private int 	page;						//현재   페이지
	private int 	range;						//현재   페이지범위
	private int 	totalListCnt;				//게시물 총갯수
	private int 	pageCnt;					//전체   페이지수
	private int 	startPage;					//시작   페이지
	private int 	startListNum;				//게시판 시작번호
	private int 	endPage;					//끝	 페이지
	private boolean prev;						//이전   버튼 값
	private boolean next;						//다음   버튼 값
	
	/*getter setter*/
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getTotalListCnt() {
		return totalListCnt;
	}
	public void setTotalListCnt(int totalListCnt) {
		this.totalListCnt = totalListCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getstartListNum() {
		return startListNum;
	}
	public void setstartListNum(int startListNum) {
		this.startListNum = startListNum;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	/**
	* 페이지 정보 
	* 
	* @param  int page  - 현재페이지 (없으면 기본값 : 1) 
	* @param  int range - 현재범위 (없으면 기본값 : 1) 
	* @param  int totalListCnt - 게시물 총갯수
	* @return 
	* @author 황인준
	* 등록일자 : 2019.09.06
	*/
	public void pageInfo(int page, int range, int totalListCnt) {
		this.page 			= page;				//현재페이지
		this.range 			= range;			//현재페이지범위
		this.totalListCnt 	= totalListCnt;		//게시물총갯수
		
		//전체페이지 수
		this.pageCnt = (int)Math.ceil((double)totalListCnt/listSize);
		
		//시작 페이지(각 페이지 범위의 시작 번호) - 1,6,11,...
		this.startPage = (range-1)*rangeSize+1;
		
		//마지막 페이지 - 5,10,15,...
		this.endPage = range * rangeSize;
		
		//게시판 시작번호(mysql limit을 사용하기 위한 공식)
		this.startListNum = (page - 1) * listSize;
		
		//이전 버튼 상태
		this.prev = range  == 1 ? false : true;
		
		//다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		
		if(this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
	
	
	
	
	

	
}
