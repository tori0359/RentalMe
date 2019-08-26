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
	public List<RentalAppliVo> rentalPath(RentalAppliVo rentalAppliVo) {
		return rentalAppliDao.rentalPath(rentalAppliVo);
	}
	
	@Override
	public List<RentalAppliVo> rentalList1(RentalAppliVo rentalAppliVo) {
		return rentalAppliDao.rentalMenuList(rentalAppliVo);
	}

	@Override
	public List<RentalAppliVo> rentalList2(RentalAppliVo rentalAppliVo) {
		return rentalAppliDao.rentalOptionList(rentalAppliVo);
	}





}
