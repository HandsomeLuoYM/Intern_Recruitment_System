package com.System.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.System.dao.AdminMapper;
import com.System.model.User;

public class AdminDaoTest {
	ApplicationContext applicationcontext;

	@Before
	public void init() {
		// 初始化Spring容器
		applicationcontext = new ClassPathXmlApplicationContext("file:src/main/resources/mybatis-spring.xml");
	}

	@Test
	public void getExamText() {
		AdminMapper adminDao = applicationcontext.getBean(AdminMapper.class);
		List<User> UserList = adminDao.findCommonUser();
	    for(User user:UserList) {
	    	System.out.println(user);
	    }
	}
}
