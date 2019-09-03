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
	public List<RentalAppliVo> rentalMenu(RentalAppliVo rentalAppliVo) {
		return rentalAppliDao.rentalMenuList(rentalAppliVo);
	}

	@Override
	public List<RentalAppliVo> rentalOption(RentalAppliVo rentalAppliVo, String option) {
		return rentalAppliDao.rentalOptionList(rentalAppliVo, option);
	}

	@Override
	public List<RentalAppliVo> rentalBest(RentalAppliVo rentalAppliVo) {
		return rentalAppliDao.rentalBestList(rentalAppliVo);
	}

	@Override
	public List<RentalAppliVo> rentalGds(RentalAppliVo rentalAppliVo, String sortGbCd) {
		if(sortGbCd.equals("1")) {
			// ·»Å» Á¤·Ä ÀÎ±â¼ø : 1
			rentalAppliVo.setSortGbCd("1");
			return rentalAppliDao.rentalGdsList2(rentalAppliVo);
		} else if(sortGbCd.equals("2")) {
			// ·»Å» Á¤·Ä ÃÖ½Å¼ø : 2
			rentalAppliVo.setSortGbCd("2");
			return rentalAppliDao.rentalGdsList(rentalAppliVo);
		} else if(sortGbCd.equals("3")) {
			// ·»Å» Á¤·Ä ³·Àº°¡°Ý¼ø : 3
			rentalAppliVo.setSortGbCd("3");
			return rentalAppliDao.rentalGdsList(rentalAppliVo);
		} else if(sortGbCd.equals("4")) {
			// ·»Å» Á¤·Ä ³ôÀº°¡°Ý¼ø : 4
			rentalAppliVo.setSortGbCd("4");
			return rentalAppliDao.rentalGdsList(rentalAppliVo);
		} else if(sortGbCd.equals("5")) {
			// ·»Å» Á¤·Ä ÆÇ¸Å·®¼ø : 5
			rentalAppliVo.setSortGbCd("5");
			return rentalAppliDao.rentalGdsList2(rentalAppliVo);
		} else {
			// ·»Å» Á¤·Ä ¸®ºä¸¹Àº¼ø : 6
			rentalAppliVo.setSortGbCd("6");
			return rentalAppliDao.rentalGdsListDetail(rentalAppliVo);
		}
	}

	
	@Override
	public List<RentalAppliVo> rentalGrade(RentalAppliVo rentalAppliVo) {
		return rentalAppliDao.rentalGrade(rentalAppliVo);
	}
	
	@Override
	public List<RentalAppliVo> rentalGdsDetail(RentalAppliVo rentalAppliVo) {
		return rentalAppliDao.rentalGdsListDetail(rentalAppliVo);
	}


}
