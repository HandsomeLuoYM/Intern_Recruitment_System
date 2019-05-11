package com.System.dao;

import java.util.List;

import com.System.model.Exam;

public interface ExamMapper {
	
	/**
	 * 添加题目
	 * */
	int insertStem(Exam exam);
	
	
	/**
	 * 查找所有题目
	 * */
	List<Exam> queryAllExam();

	/**
	 * 删除题目
	 * */
	void deleteStem(Integer id);
	
	/**
	 * 根据Id查找题目
	 * */
	Exam Idfind(int id);
	
}
