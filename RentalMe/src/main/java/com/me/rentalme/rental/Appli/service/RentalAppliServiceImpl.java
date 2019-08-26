package com.me.rentalme.rental.Appli.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.me.rentalme.model.entity.RentalAppliVo;
import com.me.rentalme.rental.Appli.model.RentalAppliDao;

@Service
public class RentalAppliServiceImpl implements RentalAppliService {

	@Inject
	RentalAppliDao rentalAppliDao;
	
	@Override
	public List<RentalAppliVo> rentalList1(String gdsSclassCd) {
		System.out.println("hty222");
		return rentalAppliDao.rentalOptionList(gdsSclassCd);
	}




}
