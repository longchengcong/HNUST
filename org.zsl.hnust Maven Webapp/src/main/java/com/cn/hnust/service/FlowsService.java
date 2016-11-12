package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.Flows;

public interface FlowsService {
	public List<Flows> flowlist(String stime,String etime,String sname);
}
