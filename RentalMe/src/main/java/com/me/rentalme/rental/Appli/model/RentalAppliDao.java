package com.me.rentalme.rental.Appli.model;

import java.util.List;

import com.me.rentalme.model.entity.RentalAppliVo;



public interface RentalAppliDao {

	List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalMenuList(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalOptionList(RentalAppliVo rentalAppliVo, String option);
	List<RentalAppliVo> rentalBestList(RentalAppliVo rentalAppliVo);
	
	List<RentalAppliVo> rentalGdsList(RentalAppliVo rentalAppliVo);

}
