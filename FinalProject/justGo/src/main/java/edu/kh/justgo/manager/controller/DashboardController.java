package edu.kh.justgo.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.justgo.manager.model.service.DashboardService;

@Controller
@RequestMapping("/manager")
@SessionAttributes({ "loginMember" })
public class DashboardController {
	
	@Autowired
	public DashboardService service;

}
