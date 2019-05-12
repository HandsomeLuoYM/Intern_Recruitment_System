package com.System.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.System.model.Msg;
import com.System.model.User;
import com.System.service.IAdminService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/adminController")
public class AdminController {

    private IAdminService adminService;

	public IAdminService getAdminService() {
		return adminService;
	}
	
    @Autowired
	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}

    /**
     * 查询分页信息
     * */
	@RequestMapping(value="/PageUser")
	@ResponseBody
	public Msg findCommonUser(@RequestParam(value="pn",defaultValue="1")Integer pn) {
    	//页码pn以及数据数5
    	PageHelper.startPage(pn,5);
    	//紧跟着的一个查询
    	List<User> userPage = adminService.findCommonUser();
    	//包装查询结果,连续显示五页
    	PageInfo page = new PageInfo(userPage,5);			
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 *id查找用户
	 * */
	@RequestMapping(value="/Idfind/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Msg Idfind(@PathVariable("id") Integer id) {
		User user = adminService.Idfind(id);
		return Msg.success().add("user", user);
	}
	
	/**
	 * 修改用户信息
	 * */
	@RequestMapping(value="/updateUser/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateUser(User user) {
		System.out.println(user);
		adminService.updateUser(user);
		return Msg.success();
	}
	
	/**
	 * 管理员删除自身用户
	 * */
	@RequestMapping(value="/deleteUser/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Msg deleteUser(
			@PathVariable("id") Integer id) {
		adminService.deleteUser(id);
		return Msg.success();
	}
	
	/**
	 * 查询面试的人
	 * */
	@RequestMapping(value="/PageInterview")
	@ResponseBody
	public Msg findInterviewUser(@RequestParam(value="pn",defaultValue="1")Integer pn) {
    	//页码pn以及数据数5
    	PageHelper.startPage(pn,5);
    	//紧跟着的一个查询
    	List<User> userPage = adminService.findInterviewUser();
    	//包装查询结果,连续显示五页
    	PageInfo page = new PageInfo(userPage,5);			
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 面试官登记分数
	 * */
	@RequestMapping(value="/RegisterScore")
	@ResponseBody
	public Msg RegisterScore(
			@RequestParam("userId") Integer userId,
			@RequestParam("InterviewScore") Integer InterviewScore
			) {
		System.out.println(userId);
		System.out.println(InterviewScore);
		adminService.InteviewScore(userId,InterviewScore);
		return Msg.success();
	}
	
	/**
	 * 登记填空题的分数，把分数加到用户的笔试成绩上
	 * */
	@RequestMapping(value="markTest",method=RequestMethod.POST)
	@ResponseBody
	public Msg markTest(
			@RequestParam("userScore") Integer userScore,
			@RequestParam("userId") Integer userId			
			) {
		adminService.markTest(userId,userScore);
		return Msg.success();
	}
	
}
