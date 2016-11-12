package com.cn.hnust.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.cn.hnust.pojo.Flows;
import com.cn.hnust.service.FlowsService;

@Controller
@RequestMapping("/flows")
public class FlowController {
	private static Logger logger = Logger.getLogger(FlowController.class);
	@Resource
	private FlowsService fs;
	@RequestMapping(value="/flowlist")
	public ModelAndView flowlist(String stime,String etime,HttpSession session){
		String sname=String.valueOf(session.getAttribute("userID")) ;
		List<Flows> list=fs.flowlist(stime,etime,sname);
		session.setAttribute("flowlist", list);
		return new ModelAndView("flowlist");
		//return JSON.toJSONString(list);
	}
	@RequestMapping(value="/flowlistajax")
	@ResponseBody
	public String flowlistajax(String stime,String etime,HttpSession session){
		String sname=String.valueOf(session.getAttribute("userID")) ;
		List<Flows> list=fs.flowlist(stime,etime,sname);
		if(list.size()!=0){
			session.setAttribute("flowlist", list);
		}
		return JSON.toJSONString(list);
	}
	/*@RequestMapping(value="/image")
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
	@RequestMapping(value="/userlogin")
	@ResponseBody
	public int userlogin(String username,String pass,String wx_id){
		int i=userService.login_np(username,pass);
		return i;
	}
	@RequestMapping(value="/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response,Model model){
	return new ModelAndView("flowlist");
	}*/
}
