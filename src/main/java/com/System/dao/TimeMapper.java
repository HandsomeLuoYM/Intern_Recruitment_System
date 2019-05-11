package com.System.dao;

import java.util.List;

import com.System.model.Time;

public interface TimeMapper {
	/**
	 * 查询所有笔试时间
	 * */
	List<Time> queryAllTime(int type);

	/**
	 * 插入时间段
	 * */
	int insertTime(Time time);
	
	/**
	 * 根据Id查询时间段信息
	 * */
	Time Idfind(int id);
	
	/**
	 * 时间段增加报名人数
	 * */
	void updateTime(Time time);
}
