package edu.kh.justgo.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.manager.model.dao.DashboardDAO;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Autowired
	public DashboardDAO dao;
	

}
