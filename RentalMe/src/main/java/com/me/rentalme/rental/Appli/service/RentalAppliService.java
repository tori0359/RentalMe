package com.me.rentalme.rental.Appli.service;

import java.util.List;

import com.me.rentalme.model.entity.RentalAppliVo;



public interface RentalAppliService {

	List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalMenu(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalOption(RentalAppliVo rentalAppliVo, String option);
	List<RentalAppliVo> rentalBest(RentalAppliVo rentalAppliVo);
	
	List<RentalAppliVo> rentalGds(RentalAppliVo rentalAppliVo, String sortGbCd);

}
