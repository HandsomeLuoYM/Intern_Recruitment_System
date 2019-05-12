package com.System.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.System.dao.ExamMapper;
import com.System.model.Exam;
import com.System.service.IExamService;

@Service("examService")
public class ExamServiceImpl implements IExamService{

    private ExamMapper examMapper;

	public ExamMapper getExamMapper() {
		return examMapper;
	}

    @Autowired
	public void setExamMapper(ExamMapper examMapper) {
		this.examMapper = examMapper;
	}

    /**
     * 查询所有的选择题
     * */
	public List<Exam> qurryAll() {
		return examMapper.queryAllExam();
	}

	/**
	 * 添加选择题
	 * */
	public void insertStem(Exam exam) {
		examMapper.insertStem(exam);
	}

	/**
	 * 删除选择题
	 * */
	public void deleteStem(Integer id) {
		examMapper.deleteStem(id);
	}

	/**
	 * 校验答案
	 * */
	public int checkAnswer(String id, String value) {
		int stem_id = Integer.parseInt(id);
		Exam Stem = examMapper.Idfind(stem_id);
		String answer = Stem.getRightOption();
		if(answer.contains("，")&value.contains("-")) {
			String[] stem_values = answer.split("，");
			String[] user_values = value.split("-");
			if(user_values.length==stem_values.length) {
				Arrays.sort(stem_values);
				Arrays.sort(user_values);
				if(Arrays.equals(stem_values,user_values)) {
					return Stem.getScore();
				}else {
					return 0;
				}
			}else {
				return 0;			
			}
		}else {
			if(answer.equals(value)) {
				return Stem.getScore();
			}else {
				return 0;
			}
		}
	}

}
