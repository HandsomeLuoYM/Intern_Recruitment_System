package com.System.service;

import java.util.List;

import com.System.model.Completion;

public interface ICompletionService {

	/**
	 * 查询所有的填空题
	 * */
	List<Completion> qurryAllCompletion();

	
	/**
	 * 添加填空题
	 * */
	void insertCompletion(Completion completion);

	/**
	 * 删除操作
	 * */
	void deleteCompletion(Integer id);
	
	
}
