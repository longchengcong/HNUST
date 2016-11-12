package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IFlowDao;
import com.cn.hnust.pojo.Flows;
import com.cn.hnust.service.FlowsService;
@Service("flowsService")
public class FlowsServiceimpl implements FlowsService {
	@Autowired
	private IFlowDao fs;
	@Override
	public List<Flows> flowlist(String stime, String etime,String sname) {
		// TODO Auto-generated method stub
		return fs.flowslist(stime, etime,sname);
	}

}
