package com.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.PlayDTO;
import com.service.PlayService;

@Controller
public class PlayController {

	@Autowired
	PlayService service;
	
	@RequestMapping(value="/")
	public ModelAndView Main() {
		List<PlayDTO> list = service.PlayUserList(); 
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.setViewName("PlayHome");
		
		return mav;
	}
	
	@RequestMapping(value="/PlayJoin_page")
	public String PlayJoin() {
		return "PlayJoin";
	}
	
	@RequestMapping(value="/UserDetail")
	public ModelAndView UserDetail(@RequestParam HashMap<String, Object> name_id_map) {
		List<PlayDTO> list = service.UserDetail(name_id_map);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.setViewName("UserDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/PlayJoin" ,method=RequestMethod.POST)
	public @ResponseBody String PlayJoin(@RequestBody PlayDTO pdto) {
		
		String CheckResult = null;
		int CheckIdCount = service.CheckId(pdto);
		int CheckEmailCount = service.CheckEmail(pdto);
		
		if(CheckIdCount == 1) {
			CheckResult = "ID overlap";
		}else if(CheckEmailCount == 1) {
			CheckResult = "Email overlap";
		}
		else {
			CheckResult = "possibility";
			service.PlayJoin(pdto);
		}
		
		return CheckResult;
	}
	

	@RequestMapping(value="/IDCheckButton" ,method=RequestMethod.POST)
	public @ResponseBody String ID_Check_Button(@RequestBody PlayDTO pdto) {
		
		String CheckResult = null;
		int CheckIdCount = service.CheckId(pdto);
		
		if(CheckIdCount == 1) {
			CheckResult = "overlap";
		}
		else {
			CheckResult = "possibility";
		}
		
		return CheckResult;
	}
	
	@RequestMapping(value="/EMAILCheckButton" ,method=RequestMethod.POST)
	public @ResponseBody String Email_Check_Button(@RequestBody PlayDTO pdto) {
		
		String CheckResult = null;
		int CheckEmailCount = service.CheckEmail(pdto);
		
		if(CheckEmailCount == 1) {
			CheckResult = "overlap";
		}
		else {
			CheckResult = "possibility";
		}
		
		return CheckResult;
	}
}
