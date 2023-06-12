package edu.kh.justgo.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.manager.model.dao.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerDAO dao;
	
}
