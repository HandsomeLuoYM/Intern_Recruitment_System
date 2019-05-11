package com.System.service;

import java.util.List;

import com.System.model.Exam;

public interface IExamService {
	
	/**
	 * 查询所有题目
	 * */
	List<Exam> qurryAll();

	/**
	 * 插入题目
	 * */
	void insertStem(Exam exam);

	/**
	 * 删除题目
	 * */
	void deleteStem(Integer id);

	/**
	 * 校验答案
	 * */
	int checkAnswer(String id, String value);
}
