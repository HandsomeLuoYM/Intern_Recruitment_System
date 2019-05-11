package com.System.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.System.dao.MD5Dao;
import com.System.dao.UserMapper;
import com.System.model.User;
import com.System.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService{

    private UserMapper userMapper;

    public UserMapper getUserMapper() {
        return userMapper;
    }
    
    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }


	/**
	 * 插入用户
	 * */
	public int insertUser(User user) {
		int account = (int)((Math.random()*9+1)*100000);
		while(userMapper.AccountNumberfind(account)!=null) {
			account = (int)((Math.random()*9+1)*100000);
		}
		MD5Dao md5Dao = new MD5Dao();
		String PassWord = md5Dao.md5(user.getPassWord());
		user.setPassWord(PassWord);
		user.setAccountNumber(account);
		userMapper.insertUser(user);
		return account;
	}
    /**
     * Id查找用户
     * */
	public User IDfindUser(int id) {
		return userMapper.IDfindUser(id);
	}

	/**
	 * 更新用户
	 * */
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}
	
    /**
     * 登录操作
     * */
	public User login(String accountNumber, String passWord) {
		int account = Integer.parseInt(accountNumber);		
		MD5Dao md5Dao = new MD5Dao();
		String MD5PassWord = md5Dao.md5(passWord);
		User user = new User(account,MD5PassWord);
		user= userMapper.login(user);
		return user;
	}
	
	/**
	 * 报名时插入
	 * */
	public void enroll(User user) {
		user.setStatus(2);
		userMapper.updateUser(user);
	}
	
	/**
	 * 报名时间段(笔试+面试)操作
	 * */
	public void enterExam(String userId, String timeId, int examType) {
		User user = new User();
		if(examType==1) {
			user.setStatus(3);
		}else {
			user.setStatus(7);
		}
		user.setTimeId(Integer.parseInt(timeId));
		user.setId(Integer.parseInt(userId));
		userMapper.enterExam(user);
	}


	/**
	 * 登记分数+改变状态
	 * 
	 * */
	public void RegistrationScore(Integer userId, Integer score) {		
		User user = new User();
		user.setId(userId);
		user.setScore(score);
		userMapper.RegistrationScore(user);
	}

	/**
	 * 更改头像
	 * */
	public void updatePicture(Integer id, String picturePath) {
		User user = new User();
		user.setId(id);
		user.setPicture(picturePath);
		userMapper.updateUser(user);
	}
	
	
}
