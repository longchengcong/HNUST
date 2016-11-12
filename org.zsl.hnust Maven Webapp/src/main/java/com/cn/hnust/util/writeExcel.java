package com.cn.hnust.util;
import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import com.cn.hnust.pojo.Flows;
import java.lang.reflect.Field;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class writeExcel 
{

 public void getExcel(String sheetName,OutputStream output,List<Flows> list) 
 {
  HSSFWorkbook wb=new HSSFWorkbook();
  HSSFSheet sheet1=wb.createSheet("sheet1");
  HSSFRow row=sheet1.createRow((short)0);
  HSSFCell cell=row.createCell((short)0);
  
  System.out.println("打印开始"+list.size());
  
  cell.setCellValue("日期");
  row.createCell((short)1).setCellValue("分店名称");
  row.createCell((short)2).setCellValue("销售金额");
  
  
  for(int i=0;i<list.size();i++){
	  row=sheet1.createRow((short)i+1);
	  cell=row.createCell((short)0);
	  row.createCell((short)0).setCellValue(list.get(i).getAddtime());
	  row.createCell((short)1).setCellValue(list.get(i).getStname());
	  row.createCell((short)2).setCellValue(list.get(i).getAllprice());
  }
  
  try   { 
         output.flush(); 
         wb.write(output); 
         output.close();
 }   catch   (IOException   e)   { 
         e.printStackTrace(); 
         System.out.println( "打印完毕"); 
 } 
 }
}

