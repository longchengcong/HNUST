package com.cn.hnust.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.zsl.testmybatis.TestMyBatis;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONCreator;
import com.cn.hnust.pojo.Flows;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.FlowsService;
import com.cn.hnust.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	private static Logger logger = Logger.getLogger(UserController.class);
	@Resource
	private UserService userService;
	@Resource
	private FlowsService fs;
	@RequestMapping("/showUser")
	public String showUser(HttpServletRequest request,Model model){
/*		int userId = Integer.parseInt(request.getParameter("id"));
		User user = this.userService.getUserById(userId);
		model.addAttribute("user", user);*/
		return "showUser";
	}
	@RequestMapping(value="/image")
	public ModelAndView image(HttpServletRequest request, HttpServletResponse response,Model model){
	return new ModelAndView("image");
	}
	@RequestMapping(value="/check2")
	public ModelAndView check2(HttpServletRequest request, HttpServletResponse response,Model model){
	return new ModelAndView("check2");
	}
	@RequestMapping(value="/check")
	public ModelAndView check(HttpServletRequest request, HttpServletResponse response,Model model){
	return new ModelAndView("check");
	}
	@RequestMapping(value="/check3")
	public ModelAndView check3(HttpServletRequest request, HttpServletResponse response,Model model){
	return new ModelAndView("check3");
	}
	@RequestMapping(value="/userlogin")
	@ResponseBody
	public int userlogin(String username,String pass,String wx_id,HttpSession hs){
		int i=userService.login_np(username,pass);
		
		if (i==1) {
			int id=userService.getUserID(username,pass);
			hs.setAttribute("userID", id);
			hs.setAttribute("oldPass", pass);
		}
		
		return i;
	}
	@RequestMapping(value="/checklogin")
	@ResponseBody
	public Integer checklogin(String username){

		 Integer result=userService.login_check(username);
		return result;
	}
	@RequestMapping(value="/userSign")
	@ResponseBody
	public int userSign(String username,String pass,String wx_id){
//		wx_id="456";
		userService.sign_np(username,pass,wx_id);
		int i=userService.login_np(username,pass);
		return i;
	}
	@RequestMapping(value="/password")
	public ModelAndView passowrd(HttpServletRequest request, HttpServletResponse response,Model model){
		return new ModelAndView("password");
	}
	
	@RequestMapping(value="/changePass")
	@ResponseBody
	public int changePass(String userID,String newPass){
		userService.changePass_ip(userID,newPass);
		int i=userService.select_ip(userID,newPass);
		return i;
	}
	@RequestMapping(value="/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response,Model model,HttpSession session){
		String sname=String.valueOf(session.getAttribute("userID")) ;
		List<Flows> list=fs.flowlist(null,null,sname);
		session.setAttribute("flowlist", list);
		return new ModelAndView("flowlist");
	//return new ModelAndView("flowlist");
	}
	@RequestMapping(value="/download")
	public ModelAndView download(HttpServletRequest request, HttpServletResponse response,Model model){
		return new ModelAndView("download");
	}
	@RequestMapping(value="/exit")
	public ModelAndView exit(HttpServletRequest request, HttpServletResponse response,Model model,HttpSession session){
		session.invalidate(); 
		return new ModelAndView("showUser");
	}
}
