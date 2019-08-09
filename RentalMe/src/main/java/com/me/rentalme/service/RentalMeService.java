package com.me.rentalme.service;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.RentalMeVo;

public interface RentalMeService {
	
	List<RentalMeVo> list() throws SQLException;
}
