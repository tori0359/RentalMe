package com.me.rentalme.rental.Appli.model;

import java.util.List;

import com.me.rentalme.model.entity.RentalAppliVo;



public interface RentalAppliDao {

	List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalMenuList(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalOptionList(RentalAppliVo rentalAppliVo, String option);
	List<RentalAppliVo> rentalBestList(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalGdsList(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalGdsList2(RentalAppliVo rentalAppliVo);
	
	List<RentalAppliVo> rentalGrade(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalGdsListDetail(RentalAppliVo rentalAppliVo);
	int rentalGdsQuest(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalReview(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalReviewCnt(RentalAppliVo rentalAppliVo);
	

}
