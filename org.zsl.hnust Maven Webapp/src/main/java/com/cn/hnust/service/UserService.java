package com.cn.hnust.service;


import org.apache.ibatis.annotations.Param;

import com.cn.hnust.pojo.User;

public interface UserService {
	public User getUserById(int userId);
	public int login_np(String sname,String spassword);
	public void sign_np(String sname,String spassword,String wx_id);
	public int getUserID(String sname,String spassword);
	public void changePass_ip(String userID,String spassword);
	public int select_ip(String userID,String spassword);
	int login_check(String sname);
}
