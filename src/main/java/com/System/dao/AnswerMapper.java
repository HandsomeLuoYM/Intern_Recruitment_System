package com.System.dao;

import java.util.List;

import com.System.model.Answer;

public interface AnswerMapper {

	/**
	 * 查询所有回答
	 * */
	List<Answer> qurryAllAnswer();

	/**
	 * 插入填空题和内容
	 * */
	void insertAnswer(Answer userAnswer);

	/**
	 * 改变题的状态
	 * */
	void ChangeStatus(Integer id);
	
}
