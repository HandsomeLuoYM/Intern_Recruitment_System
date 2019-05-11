package com.System.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.System.dao.UserMapper;
import com.System.model.User;

public class userDaoTest {
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
	public void getUserText2() {
		User myuser = new User();
		myuser.setSchoolName("aasdafsa");
		UserMapper userDao = applicationcontext.getBean(UserMapper.class);
		User user = userDao.IDfindUser(2);
		System.out.println(user);
	}
}