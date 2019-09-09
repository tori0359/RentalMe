package com.me.rentalme.act.service;

import java.sql.SQLException;
import java.util.List;

import com.me.rentalme.model.entity.ActVo;
import com.me.rentalme.model.entity.RentalAppliVo;

public interface ActService {

	List<RentalAppliVo> actList() throws SQLException;

	List<RentalAppliVo>  actEndList() throws SQLException;

	List<RentalAppliVo> actDetail(RentalAppliVo rentalAppliVo, String gdsCdDetail) throws SQLException;

	Object actDetailAuction(String gdsCdDetail);


}
