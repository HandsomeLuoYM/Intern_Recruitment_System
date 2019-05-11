
package com.System.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.System.model.Msg;
import com.System.model.User;
import com.System.service.IPersonService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/personController")
public class PersonController {
    
    private IPersonService personService;
    
    public IPersonService getPersonService() {
        return personService;
    }

    @Autowired
    public void setPersonService(IPersonService personService) {
        this.personService = personService;
    }
    
    /**
     * 分页查询
     * */   
    @RequestMapping("/PageUser")    
    @ResponseBody    
    public Msg getPersonWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model) {
    	//页码pn以及数据数5
    	PageHelper.startPage(pn,5);
    	//紧跟着的一个查询
    	List<User> userPage = personService.queryAll();
    	//包装查询结果,连续显示五页
    	PageInfo page = new PageInfo(userPage,5);		
    	return Msg.success().add("pageInfo",page);     	    	
    }
 
    /**
     * 角色增加
     * 
     * */
    @RequestMapping(value="/insertUser",method=RequestMethod.POST)
    @ResponseBody    
    public Msg InsertPerson(User user
    		){   	
    	//1.为超级管理员  2.为普通用户  3.为笔试官  4.为面试官   5.删除管理员    6.修改管理员 7.查看管理员
    	personService.insertUser(user);
    	return Msg.success();
    }
    
    /**
     *Id查找角色信息 
     * 
     * */
    @RequestMapping(value="/IDfind/{id}",method=RequestMethod.GET)
    @ResponseBody    
    //声明Id是从路径中取出的
    public Msg IDfind(@PathVariable("id")Integer id){
    	User user =  personService.IDfind(id);
    	return Msg.success().add("Id_find_user", user);
    } 
    
    
    /**
     * 更新角色数据
     * 
     * */
    @RequestMapping(value="/updateUser/{id}",method=RequestMethod.POST)
    @ResponseBody    
    public Msg updatePerson(User user){  
    	personService.updateUser(user);
    	return Msg.success();
    }
    
    /**
     * 删除数据(单条或者多条)
     * 
     * */
    @RequestMapping(value="/deleteUser/{ids}",method=RequestMethod.POST)
    @ResponseBody    
    public Msg deletePerson(@PathVariable("ids")String ids){  	
    	if(ids.contains("-")) {
    		String[] str_ids = ids.split("-");
    		for(String str_id : str_ids) {
        		Integer id = Integer.parseInt(str_id);
           	 	personService.deleteUser(id);
    		}
    	}else {
    		Integer id = Integer.parseInt(ids);
       	 	personService.deleteUser(id);
    	}
     	return Msg.success();
    }
    
    /**
     * 查询账号
     * 
     * */
    @RequestMapping(value="/accountFind/{account}",method=RequestMethod.POST)
    @ResponseBody
    public Msg accoundFind(@PathVariable("account")Integer account) {
    	User user = personService.accoundFind(account);
    	if(user!=null) {
        	return Msg.success().add("type","Ok");
    	}else {
    		return Msg.success().add("type", "No");
    	}
    }
      
    /**
     * 分数段截取
     * */
    @RequestMapping(value="/scoreCut",method=RequestMethod.POST)
    @ResponseBody
    public Msg scoreCut(@RequestParam("score") Integer score) {
    	personService.scoreCut(score);
		return Msg.success(); 	
    }
    
    /**
     * 管理员信息修改
     * */
    @RequestMapping(value="/adminUpdate/{id}",method=RequestMethod.POST)
    @ResponseBody
    public Msg adminUpdate(
    		@PathVariable("id")Integer id,
    		User user
    		) {
    	user.setId(id);
    	personService.updateUser(user);
		return Msg.success();    	
    }
    
    /**
     * 修改密码时第一次输入密码的确认
     * */
    @RequestMapping(value="/adminConfirmPassword/{id}",method=RequestMethod.POST)
    @ResponseBody
    public Msg adminConfirmPassword(
    		@PathVariable("id")Integer id,
    		@RequestParam("original_password") String original_password
    		) {
    	User user = personService.checkPassword(id,original_password);
		if(user!=null) {
			return Msg.success().add("type", "success");    	
		}else {
			return Msg.fail().add("type", "error");    	
		}
    }
    
    /**
     * 管理员更改保存密码
     * */
    @RequestMapping(value="/adminSavePassword/{id}",method=RequestMethod.POST)
    @ResponseBody
    public Msg adminSavePassword(
    		@PathVariable("id")Integer id,
    		@RequestParam("password")String password
    		) {
    	personService.updateAdminPassWord(id,password);
    	return Msg.success();
    }
    
    
}