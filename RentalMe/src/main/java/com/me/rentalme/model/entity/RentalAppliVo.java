package com.me.rentalme.model.entity;

import java.sql.Date;
import java.util.List;

public class RentalAppliVo {
	
	private String gdsCd        ;		// 상품코드
	private String gdsLclassCd  ;		// 상품대분류코드
	private String gdsMclassCd  ;		// 상품중분류코드
	private String gdsSclassCd  ;		// 상품소분류코드
	private String gdsNm        ;		// 상품명
	private String brandNm      ;		// 브랜드명
	private String modelNm      ;		// 모델명
	private String gdsGbCd      ;		// 상품구분코드
	private String gdsGbNm		;		// 상품구분명
	private String gdsStsCd     ;		// 상품상태코드
	private String delYn        ;		// 삭제여부
	private String gdsLclassNm  ; 		// 상품소분류명
	private String gdsMclassNm  ; 		// 상품소분류명
	private String gdsSclassNm  ; 		// 상품소분류명
	private String gubunCd		;		// 전체메뉴구분코드(10의 단위 전체메뉴)
	private int cnt				;		// 카운트
	private int totGrdSum		;		// 토탈등급합계
	private double totGrdAvg	;		// 토탈등급평균
	private String img1			;		// 이미지경로1
	private String img2			;		// 이미지경로2
	private String img3			;		// 이미지경로3
	private String img4			;		// 이미지경로4
	private String img5			;		// 이미지경로5
	private String img6			;		// 이미지경로6
	private String img7			;		// 이미지경로7
	private String img8			;		// 이미지경로8
	private String img9			;		// 이미지경로9
	private String img10		;		// 이미지경로10
	private String img11		;		// 이미지경로11
	private String img12		;		// 이미지경로12
	private int gdsPrice		;		// 상품가격
	private String sortGbCd		;		// 정렬구분코드
	private Date regDt			;		// 등록일자
	private int gdsStPrice		;		// 경매초기값
	
	/* RequestParm session 사용 변수 */
	private String sts               ;
	private String search            ;
	private String searchPriceSt     ;
	private String searchPriceEd     ;
	private String sort              ;
	private List<String> brandNm2	 ;
	
	/* 디테일 */
	private String agreeTerm    ;		// 계약기간
	private String deliverCost  ;		// 배송비용
	private String instalCost   ;		// 설치비용 
	private String asCondition  ;		// AS조건 
	
	/* 상담 */
	private String questNm;				// 상담자이름
	private String hp;					// 상담자휴대전화번호
	private String email;				// 상담자이메일
	
	/* 리턴코드 */
	private String rtnCd;				// 리턴결과값코드
	private String rtnMsg;				// 리턴메시지
	
	private String homeCd;				// 홈 링크코드
	
	/* 리뷰 */
	private int rnk;					// 게시물 랭크차순 번호
	private String gdsReviewNo;			// 상품리뷰번호
	private String content;				// 내용
	private int grade;					// 점수
	private String userNm;				// 사용자이름
	private String gdsReviewDt;			// 상품리뷰일자
	
	/* 장바구니 */
	private String mbNo;				// 회원번호
	private int odrQty;					// 주문수량
	
	/* 결제하기 */
	private int totOdrAmt;				// 토탈주문금
	private String crudGbCd;			// CRUD구분코드
	private String odrGbCd;				// 주문구분코드
	private String payGbCd;				// 결제구분코드
	private String seq;					// 일련번호
	
	/* 구매확정 or 반품 */
	private String odrNo;				// 주문번호
	
	private int startListNum;
	private int listSize;
	
	public String getGdsCd() {
		return gdsCd;
	}
	public void setGdsCd(String gdsCd) {
		this.gdsCd = gdsCd;
	}
	public String getGdsLclassCd() {
		return gdsLclassCd;
	}
	public void setGdsLclassCd(String gdsLclassCd) {
		this.gdsLclassCd = gdsLclassCd;
	}
	public String getGdsMclassCd() {
		return gdsMclassCd;
	}
	public void setGdsMclassCd(String gdsMclassCd) {
		this.gdsMclassCd = gdsMclassCd;
	}
	public String getGdsSclassCd() {
		return gdsSclassCd;
	}
	public void setGdsSclassCd(String gdsSclassCd) {
		this.gdsSclassCd = gdsSclassCd;
	}
	public String getGdsNm() {
		return gdsNm;
	}
	public void setGdsNm(String gdsNm) {
		this.gdsNm = gdsNm;
	}
	public String getBrandNm() {
		return brandNm;
	}
	public void setBrandNm(String brandNm) {
		this.brandNm = brandNm;
	}
	public String getModelNm() {
		return modelNm;
	}
	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}
	public String getGdsGbCd() {
		return gdsGbCd;
	}
	public void setGdsGbCd(String gdsGbCd) {
		this.gdsGbCd = gdsGbCd;
	}
	public String getGdsStsCd() {
		return gdsStsCd;
	}
	public void setGdsStsCd(String gdsStsCd) {
		this.gdsStsCd = gdsStsCd;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getGdsLclassNm() {
		return gdsLclassNm;
	}
	public void setGdsLclassNm(String gdsLclassNm) {
		this.gdsLclassNm = gdsLclassNm;
	}
	public String getGdsMclassNm() {
		return gdsMclassNm;
	}
	public void setGdsMclassNm(String gdsMclassNm) {
		this.gdsMclassNm = gdsMclassNm;
	}
	public String getGdsSclassNm() {
		return gdsSclassNm;
	}
	public void setGdsSclassNm(String gdsSclassNm) {
		this.gdsSclassNm = gdsSclassNm;
	}
	public String getGubunCd() {
		return gubunCd;
	}
	public void setGubunCd(String gubunCd) {
		this.gubunCd = gubunCd;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getTotGrdSum() {
		return totGrdSum;
	}
	public void setTotGrdSum(int totGrdSum) {
		this.totGrdSum = totGrdSum;
	}
	public double getTotGrdAvg() {
		return totGrdAvg;
	}
	public void setTotGrdAvg(double totGrdAvg) {
		this.totGrdAvg = totGrdAvg;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}
	public String getSortGbCd() {
		return sortGbCd;
	}
	public void setSortGbCd(String sortGbCd) {
		this.sortGbCd = sortGbCd;
	}
	public String getSts() {
		return sts;
	}
	public void setSts(String sts) {
		this.sts = sts;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearchPriceSt() {
		return searchPriceSt;
	}
	public void setSearchPriceSt(String searchPriceSt) {
		this.searchPriceSt = searchPriceSt;
	}
	public String getSearchPriceEd() {
		return searchPriceEd;
	}
	public void setSearchPriceEd(String searchPriceEd) {
		this.searchPriceEd = searchPriceEd;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public List<String> getBrandNm2() {
		return brandNm2;
	}
	public void setBrandNm2(List<String> brandNm2) {
		this.brandNm2 = brandNm2;
	}
	public String getGdsGbNm() {
		return gdsGbNm;
	}
	public void setGdsGbNm(String gdsGbNm) {
		this.gdsGbNm = gdsGbNm;
	}
	public String getAgreeTerm() {
		return agreeTerm;
	}
	public void setAgreeTerm(String agreeTerm) {
		this.agreeTerm = agreeTerm;
	}

	public String getAsCondition() {
		return asCondition;
	}
	public void setAsCondition(String asCondition) {
		this.asCondition = asCondition;
	}
	public String getDeliverCost() {
		return deliverCost;
	}
	public void setDeliverCost(String deliverCost) {
		this.deliverCost = deliverCost;
	}
	public String getInstalCost() {
		return instalCost;
	}
	public void setInstalCost(String instalCost) {
		this.instalCost = instalCost;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	public String getImg4() {
		return img4;
	}
	public void setImg4(String img4) {
		this.img4 = img4;
	}
	public String getImg5() {
		return img5;
	}
	public void setImg5(String img5) {
		this.img5 = img5;
	}
	public String getImg6() {
		return img6;
	}
	public void setImg6(String img6) {
		this.img6 = img6;
	}
	public String getImg7() {
		return img7;
	}
	public void setImg7(String img7) {
		this.img7 = img7;
	}
	public String getImg8() {
		return img8;
	}
	public void setImg8(String img8) {
		this.img8 = img8;
	}
	public String getImg9() {
		return img9;
	}
	public void setImg9(String img9) {
		this.img9 = img9;
	}
	public String getImg10() {
		return img10;
	}
	public void setImg10(String img10) {
		this.img10 = img10;
	}
	public String getImg11() {
		return img11;
	}
	public void setImg11(String img11) {
		this.img11 = img11;
	}
	public String getImg12() {
		return img12;
	}
	public void setImg12(String img12) {
		this.img12 = img12;
	}
	public String getQuestNm() {
		return questNm;
	}
	public void setQuestNm(String questNm) {
		this.questNm = questNm;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRtnCd() {
		return rtnCd;
	}
	public void setRtnCd(String rtnCd) {
		this.rtnCd = rtnCd;
	}
	public String getHomeCd() {
		return homeCd;
	}
	public void setHomeCd(String homeCd) {
		this.homeCd = homeCd;
	}
	public String getGdsReviewNo() {
		return gdsReviewNo;
	}
	public void setGdsReviewNo(String gdsReviewNo) {
		this.gdsReviewNo = gdsReviewNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getGdsReviewDt() {
		return gdsReviewDt;
	}
	public void setGdsReviewDt(String gdsReviewDt) {
		this.gdsReviewDt = gdsReviewDt;
	}
	public int getRnk() {
		return rnk;
	}
	public void setRnk(int rnk) {
		this.rnk = rnk;
	}
	public String getMbNo() {
		return mbNo;
	}
	public void setMbNo(String mbNo) {
		this.mbNo = mbNo;
	}
	public int getOdrQty() {
		return odrQty;
	}
	public void setOdrQty(int odrQty) {
		this.odrQty = odrQty;
	}

	public int getTotOdrAmt() {
		return totOdrAmt;
	}

	public void setTotOdrAmt(int totOdrAmt) {
		this.totOdrAmt = totOdrAmt;
	}
	public String getCrudGbCd() {
		return crudGbCd;
	}
	public void setCrudGbCd(String crudGbCd) {
		this.crudGbCd = crudGbCd;
	}
	public String getOdrGbCd() {
		return odrGbCd;
	}
	public void setOdrGbCd(String odrGbCd) {
		this.odrGbCd = odrGbCd;
	}
	public String getPayGbCd() {
		return payGbCd;
	}
	public void setPayGbCd(String payGbCd) {
		this.payGbCd = payGbCd;
	}
	public String getRtnMsg() {
		return rtnMsg;
	}
	public void setRtnMsg(String rtnMsg) {
		this.rtnMsg = rtnMsg;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public int getStartListNum() {
		return startListNum;
	}
	public void setStartListNum(int startListNum) {
		this.startListNum = startListNum;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public String getOdrNo() {
		return odrNo;
	}
	public void setOdrNo(String odrNo) {
		this.odrNo = odrNo;
	}
	public int getGdsStPrice() {
		return gdsStPrice;
	}
	public void setGdsStPrice(int gdsStPrice) {
		this.gdsStPrice = gdsStPrice;
	}

}
