package com.cn.hnust.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cn.hnust.pojo.Flows;

public interface IFlowDao {
	 List<Flows> flowslist(@Param("stime") String stime,@Param("etime") String etime,@Param("sname") String sname);
}
