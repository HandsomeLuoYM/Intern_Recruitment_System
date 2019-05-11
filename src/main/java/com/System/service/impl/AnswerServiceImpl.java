package com.System.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.System.dao.AnswerMapper;
import com.System.model.Answer;
import com.System.service.IAnswerService;

@Service("answerService")
public class AnswerServiceImpl implements IAnswerService{

	AnswerMapper answerMapper;
	
	public AnswerMapper getAnswerMapper() {
		return answerMapper;
	}
	
    @Autowired
	public void setAnswerMapper(AnswerMapper answerMapper) {
		this.answerMapper = answerMapper;
	}

	/**
	 * 查询用户回答问题的情况
	 * */
	public List<Answer> qurryAllAnswer() {
		List<Answer> qurryAllAnswer = answerMapper.qurryAllAnswer();
		return qurryAllAnswer;
	}

	/**
	 * 插入用户填空的内容
	 * */
	public void insertAnswer(String content, String problem, Integer userId, Integer score) {
		Answer UserAnswer = new Answer();
		UserAnswer.setContent(content);
		UserAnswer.setCompletion(problem);
		UserAnswer.setStatus(1);
		UserAnswer.setUserId(userId);
		UserAnswer.setScore(score);
		answerMapper.insertAnswer(UserAnswer);
	}

	public List<Answer> qurryAll() {
		List<Answer> answerList = answerMapper.qurryAllAnswer();
		return answerList;
	}

	/**
	 * 改变题的状态
	 * */
	public void ChangeStatus(Integer id) {
		answerMapper.ChangeStatus(id);
	}

	
	
}
