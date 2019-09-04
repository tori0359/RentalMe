package com.me.rentalme.model.entity;

import java.sql.Date;

public class ActVo {
   
   private String gdsCd; //상품코드
   private int gdsStPrice; //상품 시작가격
   private int unitPrice;   //응찰단위가격
   private String actStTime;   //경매시작시간
   private String actEdTime;   //경매종료시간
   private String actReTime; //경매남은시간
   private String content; //내용
   private String gdsCdDetail;  //상품코드 상세
   private String currentPrice; //현재 경매가
   private String GdsLclassCd; //상품대분류코드
   private String GdsMclassCd; //상품중분류코드
   private String GdsSclassCd; //상품소분류코드
   private String actStsCd;  //경매 상태코드
   private String gdsNm;    //상품명
   private String brandNm;    //브랜드명
   private String modelNm;    //모델명
   private String gdsGbCd;    //상품구분코드
   private String gdsStsCd; //상품상태코드
   private String delYn;    //삭제여부
   private String img1;     // 이미지1
   private String img2;     // 이미지2
   private String img3;     // 이미지3
   private String img4;     // 이미지4
   private String chgId;  
   private Date cghDt;
   private String regId;  //작성아이디
   private Date regDt;      //등록날짜
   public String getGdsCd() {
      return gdsCd;
   }
   public void setGdsCd(String gdsCd) {
      this.gdsCd = gdsCd;
   }
   public int getGdsStPrice() {
      return gdsStPrice;
   }
   public void setGdsStPrice(int gdsStPrice) {
      this.gdsStPrice = gdsStPrice;
   }
   public int getUnitPrice() {
      return unitPrice;
   }
   public void setUnitPrice(int unitPrice) {
      this.unitPrice = unitPrice;
   }
   public String getActStTime() {
      return actStTime;
   }
   public void setActStTime(String actStTime) {
      this.actStTime = actStTime;
   }
   public String getActEdTime() {
      return actEdTime;
   }
   public void setActEdTime(String actEdTime) {
      this.actEdTime = actEdTime;
   }
   public String getActReTime() {
      return actReTime;
   }
   public void setActReTime(String actReTime) {
      this.actReTime = actReTime;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getGdsCdDetail() {
      return gdsCdDetail;
   }
   public void setGdsCdDetail(String gdsCdDetail) {
      this.gdsCdDetail = gdsCdDetail;
   }
   public String getCurrentPrice() {
      return currentPrice;
   }
   public void setCurrentPrice(String currentPrice) {
      this.currentPrice = currentPrice;
   }
   public String getGdsLclassCd() {
      return GdsLclassCd;
   }
   public void setGdsLclassCd(String gdsLclassCd) {
      GdsLclassCd = gdsLclassCd;
   }
   public String getGdsMclassCd() {
      return GdsMclassCd;
   }
   public void setGdsMclassCd(String gdsMclassCd) {
      GdsMclassCd = gdsMclassCd;
   }
   public String getGdsSclassCd() {
      return GdsSclassCd;
   }
   public void setGdsSclassCd(String gdsSclassCd) {
      GdsSclassCd = gdsSclassCd;
   }
   public String getActStsCd() {
      return actStsCd;
   }
   public void setActStsCd(String actStsCd) {
      this.actStsCd = actStsCd;
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
   public String getImg1() {
      return img1;
   }
   public void setImg1(String img1) {
      this.img1 = img1;
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
   public String getChgId() {
      return chgId;
   }
   public void setChgId(String chgId) {
      this.chgId = chgId;
   }
   public Date getCghDt() {
      return cghDt;
   }
   public void setCghDt(Date cghDt) {
      this.cghDt = cghDt;
   }
   public String getRegId() {
      return regId;
   }
   public void setRegId(String regId) {
      this.regId = regId;
   }
   public Date getRegDt() {
      return regDt;
   }
   public void setRegDt(Date regDt) {
      this.regDt = regDt;
   }
   @Override
   public String toString() {
      return "ActVo [gdsCd=" + gdsCd + ", gdsStPrice=" + gdsStPrice + ", unitPrice=" + unitPrice + ", actStTime="
            + actStTime + ", actEdTime=" + actEdTime + ", actReTime=" + actReTime + ", content=" + content
            + ", gdsCdDetail=" + gdsCdDetail + ", currentPrice=" + currentPrice + ", GdsLclassCd=" + GdsLclassCd
            + ", GdsMclassCd=" + GdsMclassCd + ", GdsSclassCd=" + GdsSclassCd + ", actStsCd=" + actStsCd
            + ", gdsNm=" + gdsNm + ", brandNm=" + brandNm + ", modelNm=" + modelNm + ", gdsGbCd=" + gdsGbCd
            + ", gdsStsCd=" + gdsStsCd + ", delYn=" + delYn + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3
            + ", img4=" + img4 + ", chgId=" + chgId + ", cghDt=" + cghDt + ", regId=" + regId + ", regDt=" + regDt
            + "]";
   }
   
   

   
   
}