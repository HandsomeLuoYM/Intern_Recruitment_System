package com.System.dao;

import java.util.List;

import com.System.model.User;

public interface AdminMapper {

	
	/**
	 * 查找普通用户
	 * */
	List<User> findCommonUser();

	
	/**
	 * 根据Id查找用户
	 * */
	User Idfind(Integer id);


	/**
	 * 编辑管理员修改资料
	 * */
	void updateUser(User user);


	/**
	 * 删除管理员删除信息
	 * */
	void deleteUser(Integer id);


	/**
	 * 找在面试的人
	 * */
	List<User> findInterviewUser();



}
