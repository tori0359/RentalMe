package com.me.rentalme.rental.Appli.model;

import java.util.List;

import com.me.rentalme.model.entity.RentalAppliVo;



public interface RentalAppliDao {

	List<RentalAppliVo> rentalOptionList(String gdsSclassCd);

}
