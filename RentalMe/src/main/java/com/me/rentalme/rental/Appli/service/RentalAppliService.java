package com.me.rentalme.rental.Appli.service;

import java.util.List;

import com.me.rentalme.model.entity.RentalAppliVo;



public interface RentalAppliService {

	List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalList1(RentalAppliVo rentalAppliVo);
	List<RentalAppliVo> rentalList2(RentalAppliVo rentalAppliVo);

}
