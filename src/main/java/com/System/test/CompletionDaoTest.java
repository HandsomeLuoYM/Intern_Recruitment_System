package com.System.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.System.dao.CompletionMapper;
import com.System.model.Completion;

public class CompletionDaoTest {

	ApplicationContext applicationcontext;

	@Before
	public void init() {
		// 初始化Spring容器
		applicationcontext = new ClassPathXmlApplicationContext("file:src/main/resources/mybatis-spring.xml");
	}

	@Test
	public void getAnswerText() {
		CompletionMapper completionDao = applicationcontext.getBean(CompletionMapper.class);
		List<Completion> completionList = completionDao.qurryAllCompletion();
		for(Completion completion:completionList) {
	    	System.out.println(completion);
	    }
	}
	
}
