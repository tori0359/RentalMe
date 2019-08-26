package com.me.rentalme.cs.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.me.rentalme.cs.entity.CsVo;

public interface CsService {
	
	void getList(Model model) throws SQLException;
	
	void add(CsVo bean) throws SQLException;
	void edit(CsVo bean) throws SQLException;
	void delete(int num) throws SQLException;
	
}
