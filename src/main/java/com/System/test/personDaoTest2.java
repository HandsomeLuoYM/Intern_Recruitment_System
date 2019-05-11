package com.System.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.System.dao.PersonMapper;
import com.System.model.User;

public class personDaoTest2 {

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
	public void getPersonText() {
		PersonMapper personDao = applicationcontext.getBean(PersonMapper.class);
//		Person AddPerson = new Person("杨逍",35);
		List<User> Allperson = personDao.queryAll();
//		int count = personDao.insertPerson(AddPerson);
//		System.out.println(count);
		for (User person : Allperson) {
			System.out.println(person.toString());
		}
	}

	@Test
	public void getPersonText2() {
		PersonMapper personDao = applicationcontext.getBean(PersonMapper.class);
		List<User> Allperson = personDao.queryAll();
		for(User person : Allperson)
		System.out.println(person);
	}
}


