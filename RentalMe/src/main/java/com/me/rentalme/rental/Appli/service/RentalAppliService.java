package com.me.rentalme.rental.Appli.service;

import java.util.List;

import com.me.rentalme.model.entity.RentalAppliVo;



public interface RentalAppliService {

	List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalMenu(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalOption(RentalAppliVo rentalAppliVo, String option);
	List<RentalAppliVo> rentalBest(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalGds(RentalAppliVo rentalAppliVo, String sortGbCd);
	
	List<RentalAppliVo> rentalGrade(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalGdsDetail(RentalAppliVo rentalAppliVo);
	int rentalGdsQuest(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalReview(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalReviewCnt(RentalAppliVo rentalAppliVo);
	int rentalGdsCart(RentalAppliVo rentalAppliVo);
	
	
	
	

}
