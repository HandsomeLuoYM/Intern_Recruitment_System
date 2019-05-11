
package com.System.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.System.model.Msg;
import com.System.model.User;
import com.System.service.IUserService;

@Controller
@RequestMapping("/userController")
public class UserController {

	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}
	
	@Autowired
	public void setUserService(IUserService UserService) {
		this.userService = UserService;
	}
	
	/**
	 * 登录操作
	 * 
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Msg login(@RequestParam(value = "AccountNumber") String AccountNumber,
			@RequestParam(value = "password") String PassWord) {
		User user = userService.login(AccountNumber, PassWord);
		if (user != null) {
			int isAdmin = user.getIsAdmin();
			if (isAdmin == 1) {

				return Msg.success().add("user", user).add("IsAdmin", isAdmin);
			} else {
				return Msg.success().add("user", user).add("IsAdmin", isAdmin);
			}
		} else {
			return Msg.fail().add("PassWord", PassWord).add("AccountNumber", AccountNumber).add("type", "error");
		}
	}

	

	/**
	 * 用户注册账号
	 * 
	 */
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	@ResponseBody
	public Msg InsertUser(User user,@RequestParam("picturePath")String picturePath) {
		user.setPicture(picturePath);
		int AccountNumber = userService.insertUser(user);
		return Msg.success().add("AccountNumber", AccountNumber);
	}
	
	
	/**
	 * 上传图片
	 * @throws IOException 
	 * @throws IllegalStateException 
	 * 
	 */
	@RequestMapping(value = "/ChangePicture", method = RequestMethod.POST)
	@ResponseBody
	public Msg InsertUser(MultipartFile pictureFile) throws Exception {
		
		String picturePath="/pic/nopicture.jpg";
		
    	if(pictureFile!=null && pictureFile.getOriginalFilename()!=null && pictureFile.getOriginalFilename().length()>0) {
        	//图片新名字
        	String newName = UUID.randomUUID().toString();
        	  	
        	//图片旧名字
        	String oldName = pictureFile.getOriginalFilename();
        		
        	//旧名字后缀
        	String sux = oldName.substring(oldName.lastIndexOf("."));
        	 	
        	//新文件，新建本地文件流
        	File file = new File("D:\\picture\\"+ newName + sux);
        	
        	picturePath="/pic/"+ newName + sux;
        	
        	//写入本地磁盘
        	pictureFile.transferTo(file);	
    	}  	
		return Msg.success().add("picturePath", picturePath);

	}

	/**
	 * Id查找角色信息
	 * 
	 */
	@RequestMapping(value = "/IDfindUser/{id}", method = RequestMethod.GET)
	@ResponseBody
	// 声明Id是从路径中取出的
	public Msg IDfind(@PathVariable("id") Integer id) {
		User user = userService.IDfindUser(id);
		return Msg.success().add("user", user);
	}

	
	/**
	 * 更新角色数据
	 * 
	 */
	@RequestMapping(value = "/updateUser/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Msg updateUser(User user) {
//		System.out.println(user);
		userService.updateUser(user);
		return Msg.success().add("update_User", user);
	}

	
	/**
	 * 报名时插入个人简介
	 * 
	 * */
	@RequestMapping(value = "/enroll/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Msg enroll(User user) {
		userService.enroll(user);
		return Msg.success();
	}

	/**
	 * 用户报名时间段
	 * */
	@RequestMapping(value="/enterExam",method=RequestMethod.POST)
	@ResponseBody
	public Msg enterExam(
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "timeId") String timeId,
			@RequestParam(value = "examType") int examType
			) {		
		userService.enterExam(userId,timeId,examType);		
		return Msg.success();
	}
	
	/**
	 * 笔试结束后改变状态和登记分数
	 * */
	@RequestMapping(value="/overExam",method=RequestMethod.POST)
	@ResponseBody	
	public Msg overExam(
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "score") Integer Score
			) {
		userService.RegistrationScore(userId,Score);
		return Msg.success();		
	}
	
	/**
	 * 更改头像
	 * */
	@RequestMapping(value="/updatePicture/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Msg updatePicture(@PathVariable("id")Integer id,@RequestParam(value="picturePath") String picturePath) {
		System.out.println(id);
		System.out.println(picturePath);
		userService.updatePicture(id,picturePath);
		return Msg.success();
	}
	
}
