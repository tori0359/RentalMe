package com.me.rentalme.mp.mng.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.me.rentalme.mp.mng.service.MngService;

@Controller
@RequestMapping("/mp/mng/quest")
public class MngQuestController {
	
	@Inject
	MngService mngService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String getMngQuestList(Model model) throws SQLException {
		model.addAttribute("alist", mngService.selectQuestList());
		return "mp/manager/mngQuestList";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String getMngQuestUpdate(Model model, @RequestParam("questNo") String questNo) throws SQLException {
		System.out.println(questNo);
		mngService.updateQuest(questNo);
		return "redirect:/mp/mng/quest";
	}
}
