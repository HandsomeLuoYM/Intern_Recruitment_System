package com.System.service;

import java.util.List;

import com.System.model.User;

public interface IAdminService {

	/**
	 * 查找普通用户
	 * */
	public List<User> findCommonUser();

	
	/**
	 * 根据Id查找用户
	 * */
	public User Idfind(Integer id);

	
	/**
	 * 修改管理员修改资料
	 * */
	public void updateUser(User user);


	/**
	 * 删除管理员删除信息
	 * */
	public void deleteUser(Integer id);


	/**
	 * 查询面试的人
	 * */
	public List<User> findInterviewUser();


	/**
	 * 登记面试分数
	 * */
	public void InteviewScore(Integer userId, Integer interviewScore);


	/**
	 * 登记填空题分数
	 * */
	public void markTest(Integer userId, Integer userScore);
	
}
