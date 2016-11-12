package com.cn.hnust.dao;

import org.apache.ibatis.annotations.Param;

import com.cn.hnust.pojo.User;

public interface IUserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    int login_np(@Param("sname") String sname,@Param("spassword") String spassword);
    
    void sign_np(@Param("sname") String sname,@Param("spassword") String spassword,@Param("wx_id") String wx_id);
    
    int getUserID(@Param("sname") String sname,@Param("spassword") String spassword);
    
    void changePass_ip(@Param("userID") String userID,@Param("spassword") String spassword);
    
    int select_ip(@Param("userID") String userID,@Param("spassword") String spassword);
    
    int login_check(@Param("sname") String sname);
}