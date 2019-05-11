package com.System.service;

import java.util.List;

import com.System.model.User;

public interface IPersonService {

    /**
     * 加载全部的person
     * @return
     */
    List<User> queryAll();
    
    /**
     * 添加用户
     * */
    void insertUser(User user);
    
    /**
     * id查找用户
     * */
    User IDfind(int id);
    
    /**
     * 更新用户信息
     * */
    void updateUser(User user);

    /**
     * 删除用户
     * */
    void deleteUser(int id);

    /**
     * 根据账号查找用户信息
     * */
	User accoundFind(Integer account);

	/**
	 * 分数段截取
	 * */
	void scoreCut(Integer score);

	/**
	 * 校验超级管理员密码
	 * */
	User checkPassword(Integer id, String original_password);

	/**
	 * 管理员更新自身密码
	 * */
	void updateAdminPassWord(Integer id, String password);
    
}