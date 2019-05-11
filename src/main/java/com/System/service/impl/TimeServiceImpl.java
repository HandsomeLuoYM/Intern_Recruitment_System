package com.System.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.System.dao.TimeMapper;
import com.System.model.Time;
import com.System.service.ITimeService;

@Service("timeService")
public class TimeServiceImpl implements ITimeService {

	private TimeMapper timeMapper;

	public TimeMapper getTimeMapper() {
		return timeMapper;
	}

	@Autowired
	public void setTimeMapper(TimeMapper timeMapper) {
		this.timeMapper = timeMapper;
	}

	public List<Time> queryAllTime(int type) {
		List<Time> queryAllTime = timeMapper.queryAllTime(type);
		return queryAllTime;
	}

	public int insertTime(Time time) {
		int account = timeMapper.insertTime(time);
		return account;
	}

	public void enterExam(Integer id) {
		Time time = timeMapper.Idfind(id);
		time.setNow_number(time.getNow_number() + 1);
		timeMapper.updateTime(time);
	}

	public void deleteUser(Integer id) {
		if (id != 0) {
			Time time = timeMapper.Idfind(id);
			time.setNow_number(time.getNow_number() - 1);
			timeMapper.updateTime(time);
		}
	}

	public Time userTime(int id) {		
		return timeMapper.Idfind(id);
	}

}
