package com.System.service;

import com.System.model.User;

public interface IUserService {
	   
	/**
	 * 注册用户
	 * */
    int insertUser(User User);
    
    /**
     * 根据Id查找用户信息
     * */
    User IDfindUser(int id);
    
    /**
     * 更改用户信息
     * */
    void updateUser(User User);

    /**
     * 登录
     * */
	User login(String accountNumber, String passWord);
	
	/**
	 * 报名笔试
	 * */
	void enroll(User user);

	/**
	 * 参加笔试
	 * */
	void enterExam(String userId, String timeId, int examType);

	/**
	 * 注册分数
	 * */
	void RegistrationScore(Integer userId, Integer score);

	/**
	 * 更改头像
	 * */
	void updatePicture(Integer id, String picturePath);
	
}
