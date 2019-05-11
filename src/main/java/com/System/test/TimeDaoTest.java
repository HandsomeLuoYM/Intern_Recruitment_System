package com.System.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.System.dao.TimeMapper;
import com.System.model.Time;

public class TimeDaoTest {
	/**
	 * Mybait整合Spring的传统Dao的开发方式
	 * 
	 */
	ApplicationContext applicationcontext;

	@Before
	public void init() {
		// 初始化Spring容器
		applicationcontext = new ClassPathXmlApplicationContext("file:src/main/resources/mybatis-spring.xml");
	}

	@Test
	public void getTimeText2() {
		TimeMapper timeDao = applicationcontext.getBean(TimeMapper.class);
		List<Time> times = timeDao.queryAllTime(1);
	    for(Time time:times) {
	    	System.out.println(time);
	    }
	}

	@Test
	public void getTimeText() {
		TimeMapper timeDao = applicationcontext.getBean(TimeMapper.class);
		Time time = timeDao.Idfind(1);
	    System.out.println(time);
	}
}