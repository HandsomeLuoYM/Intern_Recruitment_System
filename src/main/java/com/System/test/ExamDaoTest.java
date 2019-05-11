package com.System.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.System.dao.ExamMapper;
import com.System.model.Exam;

public class ExamDaoTest {

	ApplicationContext applicationcontext;

	@Before
	public void init() {
		// 初始化Spring容器
		applicationcontext = new ClassPathXmlApplicationContext("file:src/main/resources/mybatis-spring.xml");
	}

	@Test
	public void getExamText() {
		ExamMapper examDao = applicationcontext.getBean(ExamMapper.class);
		List<Exam> exams = examDao.queryAllExam();
	    for(Exam exam:exams) {
	    	System.out.println(exam);
	    }
	}

}
