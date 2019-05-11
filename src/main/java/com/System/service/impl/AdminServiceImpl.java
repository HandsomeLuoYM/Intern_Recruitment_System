package com.System.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.System.dao.AdminMapper;
import com.System.model.User;
import com.System.service.IAdminService;
import com.System.util.EmailUtil;

@Service("adminService")
public class AdminServiceImpl implements IAdminService{

	private AdminMapper adminMapper;

	public AdminMapper getAdminMapper() {
		return adminMapper;
	}

    @Autowired
	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}

	/**
	 * 查询所有结构
	 * */
	public List<User> findCommonUser() {
		List<User> UserList = adminMapper.findCommonUser();
		return UserList;
	}

	/**
	 * Id查找用户
	 * */
	public User Idfind(Integer id) {
		User user = adminMapper.Idfind(id);
		return user;
	}

	/**
	 * 更新数据
	 * */
	public void updateUser(User user) {
		adminMapper.updateUser(user);
	}

	/**
	 * 删除用户
	 * */
	public void deleteUser(Integer id) {
		adminMapper.deleteUser(id);
	}

	/**
	 * 查找通过笔试的用户
	 * */
	public List<User> findInterviewUser() {
		List<User> UserList = adminMapper.findInterviewUser();
		return UserList;
	}

	/**
	 * 登记面试分数
	 * */
	public void InteviewScore(Integer userId, Integer interviewScore) {
		User user = adminMapper.Idfind(userId);
		user.setInterviewScore(interviewScore);
		user.setStatus(8);
		try {
			EmailUtil.SendEmail(user.getStudentName(), user.getEmail(), interviewScore);
		} catch (Exception e) {
			e.printStackTrace();
		}
		adminMapper.updateUser(user);
	}

	/**
	 * 登记填空题的分数
	 * */
	public void markTest(Integer userId, Integer userScore) {
		User user = new User();
		user = adminMapper.Idfind(userId);
		user.setScore(user.getScore()+userScore);
		adminMapper.updateUser(user);
	}
}
