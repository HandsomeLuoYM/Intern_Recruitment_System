package com.System.dao;
import java.util.List;

import com.System.model.User;

public interface PersonMapper {
    /**
     * 插入一条记录
     * @param person
     * @return 
     */
    int insertUser(User user);
    
    /**
     * 查询账号是否存在
     * 
     * */
    User AccountNumberfind(int account);
    
    /**
     *  查询所有
     * @return
     */
    List<User> queryAll();
    
    /**
     * 按学号查询信息
     * */
    User IDfind(int id);
    
    
    /**
     * 更新数据
     * */
    int updateUser(User user);
    
    /**
     * 删除数据
     * */
    int deleteUser(int id);
    
    /**
     * 动态查找
     * */
    User getUser(User user);
    
    /**
     * 查找已经笔试的同学
     * */
    List<User> findStatusperson();
    

    
}