package com.me.rentalme.cs.service;


import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.cs.dao.CsDao;
import com.me.rentalme.cs.entity.CsVo;

public interface CsService {
	
	List<CsVo> csList() throws SQLException;
	CsVo csDetail(String faqNo) throws SQLException; 
}
