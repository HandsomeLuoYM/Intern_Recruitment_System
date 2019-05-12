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

	/**
	 * 返回所有需要的时间段（笔试/面试）
	 * */
	public List<Time> queryAllTime(int type) {
		List<Time> queryAllTime = timeMapper.queryAllTime(type);
		return queryAllTime;
	}

	/**
	 * 添加时间段
	 * */
	public int insertTime(Time time) {
		int account = timeMapper.insertTime(time);
		return account;
	}

	/**
	 * 报名时间段，人数减一
	 * */
	public void enterExam(Integer id) {
		Time time = timeMapper.Idfind(id);
		time.setNow_number(time.getNow_number() + 1);
		timeMapper.updateTime(time);
	}

	/**
	 * 删除时间段
	 * */
	public void deleteUser(Integer id) {
		if (id != 0) {
			Time time = timeMapper.Idfind(id);
			time.setNow_number(time.getNow_number() - 1);
			timeMapper.updateTime(time);
		}
	}

	/**
	 * 查询用户的时间段
	 * */
	public Time userTime(int id) {		
		return timeMapper.Idfind(id);
	}

}
