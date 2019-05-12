package com.System.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.System.dao.MD5Dao;
import com.System.dao.PersonMapper;
import com.System.model.User;
import com.System.service.IPersonService;

@Service("personService")
public class PersonServiceImpl implements IPersonService {
    
    private PersonMapper personMapper;

    public PersonMapper getUserMapper() {
        return personMapper;
    }
    
    @Autowired
    public void setUserMapper(PersonMapper personMapper) {
        this.personMapper = personMapper;
    }


	/**
	 * 插入用户
	 * */
	public void insertUser(User user) {
		MD5Dao md5Dao = new MD5Dao();
		String PassWord = md5Dao.md5(user.getPassWord());
		user.setPassWord(PassWord);
		if(user.getIsAdmin()!=2) {
			user.setStatus(0);
		}else {
			user.setStatus(2);
		}
		personMapper.insertUser(user);
	}
	
    /**
     * Id查找用户
     * */
	public User IDfind(int id) {
		return personMapper.IDfind(id);
	}

	/**
	 * 更新用户
	 * */
	public void updateUser(User user) {
		personMapper.updateUser(user);
	}
	
	/**
	 * 查找所有用户
	 * */
	public List<User> queryAll() {
		return personMapper.queryAll();
	}

	/**
	 * 用户删除
	 * */
	public void deleteUser(int id) {
		personMapper.deleteUser(id);
	}

	/**
	 * 账号查找
	 * */
	public User accoundFind(Integer account) {
		User user = personMapper.AccountNumberfind(account);
		return user;
	}

	/**
	 * 截取分数段
	 * */
	public void scoreCut(Integer score) {
		List<User> statusperson = personMapper.findStatusperson();	
		for(User user : statusperson) {
			int userScore = user.getScore();
			if(userScore>=score) {
				//通过笔试
				user.setStatus(6);
				personMapper.updateUser(user);
			}else {
				//没有通过笔试
				user.setStatus(5);
				personMapper.updateUser(user);			}
		}				
	}

	/**
	 * 管理员更改自身信息校验原密码
	 * */
	public User checkPassword(Integer id, String original_password) {
		MD5Dao md5Dao = new MD5Dao();
		String MD5PassWord = md5Dao.md5(original_password);
		User user = new User();
		user.setId(id);
		user.setPassWord(MD5PassWord);
		user = personMapper.getUser(user);
		return user;
	}

	/**
	 * 管理员更新自身密码
	 * */
	public void updateAdminPassWord(Integer id, String password) {
		MD5Dao md5Dao = new MD5Dao();
		String MD5PassWord = md5Dao.md5(password);
		User user = new User();
		user.setId(id);
		user.setPassWord(MD5PassWord);
		personMapper.updateUser(user);		
	}
	
	

}