package com.System.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.System.dao.CompletionMapper;
import com.System.model.Completion;
import com.System.service.ICompletionService;

@Service("completionService")
public final class CompletionServiceImpl implements ICompletionService{

    private CompletionMapper completionMapper;

	public CompletionMapper getCompletionMapper() {
		return completionMapper;
	}

	@Autowired
	public void setCompletionMapper(CompletionMapper completionMapper) {
		this.completionMapper = completionMapper;
	}

	/**
	 * 查询所有的填空题
	 * */
	public List<Completion> qurryAllCompletion() {
		List<Completion> allCompletion = completionMapper.qurryAllCompletion();
		return allCompletion;
	}
	
	/**
	 * 添加填空题
	 * */
	public void insertCompletion(Completion completion) {
		completionMapper.insertCompletion(completion);
	}

	public void deleteCompletion(Integer id) {
		completionMapper.deleteCompletion(id);
	}

	
}
