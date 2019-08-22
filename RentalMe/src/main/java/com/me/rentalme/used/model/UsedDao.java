package com.me.rentalme.used.model;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.UsedVo;

public interface UsedDao {
	List<UsedVo> selectAll() throws SQLException;
}
