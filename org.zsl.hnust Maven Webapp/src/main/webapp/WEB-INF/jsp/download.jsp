<%@ page contentType="application/vnd.ms-excel" language="java" 
import="java.util.*,com.cn.hnust.util.writeExcel,com.cn.hnust.pojo.Flows" pageEncoding="UTF-8"%>

<%
response.setHeader("Content-Disposition","attachment;filename=data.xls");//指定下载的文件名
response.setContentType("application/vnd.ms-excel"); 
writeExcel we=new writeExcel();
List<Flows> list=(List<Flows>)session.getAttribute("flowlist");
we.getExcel("data.xls",response.getOutputStream(),list);
%>

