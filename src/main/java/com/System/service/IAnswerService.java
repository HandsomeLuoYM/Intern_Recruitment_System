package com.System.service;

import java.util.List;

import com.System.model.Answer;

public interface IAnswerService {

	/**
	 * 查询所有填空的
	 * */
	List<Answer> qurryAllAnswer();

	/**
	 * 插入用户填空题
	 * */
	void insertAnswer(String content, String problem,  Integer userId, Integer score);

	/**
	 * 查询未改的填空题，可以批改试卷
	 * */
	List<Answer> qurryAll();

	/**
	 * 改变题的状态
	 * */
	void ChangeStatus(Integer id);
	
}
