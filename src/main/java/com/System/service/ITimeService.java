package com.System.service;

import java.util.List;

import com.System.model.Time;

public interface ITimeService {
    /**
     * 加载类型时间段
     */
    List<Time> queryAllTime(int type);
    
    /**
     * 插入时间段
     * */
    int insertTime(Time time);
    
    /**
     * 报名选择时间段
     * */
	void enterExam(Integer id);
	
	/**
	 * 删除用户时若用户已报名笔试就人数减一
	 * */
	void deleteUser(Integer id);
	
	/**
	 * 用户表格信息完善
	 * */
	Time userTime(int id);
}
