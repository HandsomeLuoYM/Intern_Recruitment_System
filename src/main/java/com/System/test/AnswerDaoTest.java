package com.System.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.System.dao.AnswerMapper;
import com.System.model.Answer;

public class AnswerDaoTest {
	ApplicationContext applicationcontext;

	@Before
	public void init() {
		// 初始化Spring容器
		applicationcontext = new ClassPathXmlApplicationContext("file:src/main/resources/mybatis-spring.xml");
	}

	@Test
	public void getAnswerText() {
		AnswerMapper answerDao = applicationcontext.getBean(AnswerMapper.class);
		List<Answer> answerList = answerDao.qurryAllAnswer();
		for(Answer answer:answerList) {
	    	System.out.println(answer);
	    }
	}
}
