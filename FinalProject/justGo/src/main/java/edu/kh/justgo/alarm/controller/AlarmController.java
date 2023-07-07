package edu.kh.justgo.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.kh.justgo.alarm.model.service.AlarmService;

@Controller
public class AlarmController {
	
	@Autowired
	public AlarmService service;

	
	
	
}
