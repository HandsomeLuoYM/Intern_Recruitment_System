package com.System.dao;

import com.System.model.User;

public interface UserMapper {  
    
    /**
     * 查询账号是否存在
     * 
     * */
    User AccountNumberfind(int account);
    
    /**
     * 按学号查询信息
     * */
    User IDfindUser(int id);
    
    /**
     * 插入信息
     * */
    int insertUser(User user);
    
    /**
     * 更新数据
     * */
    int updateUser(User user);
    
    
    /**
     * 用户登录
     * 
     * */
	User login(User user);
    
	
	/**
	 * 报名笔试是更新数据
	 * */
	void enterExam(User user);

	/**
	 * 登记分数+改变状态
	 * 
	 * */
	void RegistrationScore(User user);
}
