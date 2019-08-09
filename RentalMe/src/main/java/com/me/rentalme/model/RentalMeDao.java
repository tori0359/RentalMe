package com.me.rentalme.model;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.RentalMeVo;

public interface RentalMeDao {
	
	List<RentalMeVo> selectAll() throws SQLException;
	
}
