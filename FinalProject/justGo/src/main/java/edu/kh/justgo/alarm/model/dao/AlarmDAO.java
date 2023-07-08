package edu.kh.justgo.alarm.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.justgo.alarm.model.dto.Alarm;

@Repository
public class AlarmDAO {

	@Autowired
	public SqlSessionTemplate sql;

	public int insertAlarm(Alarm alarm) {
		return sql.insert("alarmMapper.insertAlarm", alarm);
	}


	

}
