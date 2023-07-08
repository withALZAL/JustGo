package edu.kh.justgo.alarm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.justgo.alarm.model.dao.AlarmDAO;
import edu.kh.justgo.alarm.model.dto.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	public AlarmDAO dao;

	
	@Override
	public int insertAlarm(Alarm alarm) {
		return dao.insertAlarm(alarm);
	}
	
	
	
	
}
