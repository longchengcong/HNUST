<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zh-CN">
<head>

    <base href="<%=basePath%>">

<style type="text/css">

</style>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>流向查询</title>
  <!--
	<link rel="stylesheet" type="text/css" href="css/app-rt1.css">
	-->
	<!-- <link rel="stylesheet" type="text/css" href="css/demo.css"> -->
  <!-- <link rel="stylesheet" type="text/css" href="css/icon.css"> -->

	<link rel="stylesheet" type="text/css" href="<c:url value="/Static/css/easyui.css"/>">
	<link rel="stylesheet" href="<c:url value="/Static/css/datetime/normalize3.0.2.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/Static/css/datetime/style.css?v=7"/>" />
	<link href="<c:url value="/Static/css/datetime/mobiscroll.css"/>" rel="stylesheet" />
	<link href="<c:url value="/Static/css/datetime/mobiscroll_date.css"/>" rel="stylesheet" />
<script type="text/javascript" src="<c:url value="/Static/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/Static/js/jquery.easyui.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/Static/flowcss/style.css"/>">
<script type="text/javascript" src="<c:url value="/Static/js/menu.js"/>"></script>
<script src="<c:url value="/Static/js/mobiscroll_date.js"/>" charset="gb2312"></script> 
<script src="<c:url value="/Static/js/mobiscroll.js"/>"></script>
<script type="text/javascript">
$(function () {
	if('${sessionScope.userID }'==""){
		var ss='${sessionScope.flowlist }';
		location.href='user/showUser';
	}
	if('${sessionScope.flowlist }'=="[]"){
		alert('无数据')
	}
	var currYear = (new Date()).getFullYear();	
	var opt={};
	opt.date = {preset : 'date'};
	opt.datetime = {preset : 'datetime'};
	opt.time = {preset : 'time'};
	opt.default = {
		theme: 'android-ics light', //皮肤样式
		display: 'modal', //显示方式 
		mode: 'scroller', //日期选择模式
		dateFormat: 'yyyy-mm-dd',
		lang: 'zh',
		showNow: true,
		nowText: "今天",
		startYear: currYear - 50, //开始年份
		endYear: currYear + 10 //结束年份
	};

	$("#starttime").mobiscroll($.extend(opt['date'], opt['default']));
	$("#endtime").mobiscroll($.extend(opt['date'], opt['default']));

});
</script>
<script type="text/javascript">

/* $(document).ready(function(){  
	$("tr:odd").css("background-color","#eeeeee");
	$("tr:even").css("background-color","#ffffff"); 
	var d = new Date();
	var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
	$("#starttime").datebox("setValue", str);
	$("#endtime").datebox("setValue", str);
	


 	if(typeof(st)=="NaN"||typeof(et)=="NaN"){
		location.href="flows/flowlist?stime=null&time=null";
	} 
});*/
function selects(){
	var starttime=$("#starttime").val();
	var endtime=$("#endtime").val();
	var sname=$("#sname").val();
	var dname=$("#dname").val();
	if(starttime==null||endtime==null||starttime==""||endtime==""){
		alert('请选择日期');
		return;
	}
	$.ajax({
		url:"flows/flowlistajax?stime="+starttime+"&etime="+endtime,
		success:function(data){
			if(data.length==0){
			}else{
				data = eval("("+data+")");
				$(".msg").remove();
				$("#appends").remove();
				$("#tab").append("<tr id='appends' style='text-align: center;height: 25px;'><td style='width: 50%'>分店名称</td><td style='width: 50%'>销售金额</td></tr>");
				for(var i=0;i<data.length;i++){
					if(i%2==0){
						$("#tab").append("<tr class='msg' style='text-align: center;background-color: rgb(255, 255, 255);height: 20px;    font-size: 25px;'><td>"+data[i].stname+"</td><td>"+data[i].allprice+"</td></tr>");
						
					}else{
						$("#tab").append("<tr class='msg' style='text-align: center;background-color: rgb(238, 238, 238);height: 20px;    font-size: 25px;'><td>"+data[i].stname+"</td><td>"+data[i].allprice+"</td></tr>");
	
					}
										
				}
			}

		}
	})
	
}
</script>
	<script type="text/javascript">
		function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10); 	
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
	</script>
</head>

<body>
<div id="pgcontainer">
  <header>
    <div id="navbar">
      <a  class="menubtn">menu</a>
      <p>广东华丰药业有限公司</p>
      <!-- use captain icon for toggle menu -->
      <div id="hamburgermenu">

        <div>
    	    <div><img src="we" /></div>
    	    <div><span>欢迎你</span></div>
          <div>  <span>（广东华丰药业有限公司）</span></div>
            </div>

        <ul>
          <li><a href="#">功能菜单</a></li>
          <li><a href="#">流向查询</a></li>
          <li><a href="#">安全中心</a></li>
          <li><a href="/HNUST/user/password">密码修改</a></li>
          <li><a href="/HNUST/user/exit">退出</a></li>
        </ul>
      </div>
    </div>
    <div class="overlay"></div>
  </header>

  <div id="content">
    <div>
      <div>查询</div>
      <div>
        <div style="        margin-top: 5%;
    text-align: center;">
        <label><span>起始日期</span>
        <input style="width: 107px;
margin: 0;
padding: 0px 4px;
border: 1px solid rgb(180, 180, 180);
border-radius: 10px;
width: 141px;
font-size: 14px;
height:24px;
text-align: left;" id="starttime" readonly  class="input" placeholder="请填写起始日期"
        >
        
	</label>
        </div>
        <div style="    margin-top: 2%;
    text-align: center;">
        <label><span>截止日期</span><input style="width: 107px;width: 107px;
margin: 0;
padding: 0px 4px;
border: 1px solid rgb(180, 180, 180);
border-radius: 10px;
width: 141px;
font-size: 14px;
height:24px;
text-align: left;" type="text" readonly  class="input" placeholder="请填写截止日期"
         name=endtime id=endtime ></label>
        </div>
                
        <div style="    margin-left: 2px;
    margin-top: 20px;"><input type="button" value="查询" onclick="selects()" style="margin: 0;
    padding: 0px 4px;
    border: 1px solid #FFB7B7;
    border-radius: 13px;
    width: 78px;
    height: 25px;
    font-size: 16px;
    text-align: center;"/></div>
        <div style="
    margin-top: -25px;
    float: right;"><input type="button" value="导出" onclick="document.location='/HNUST/user/download'" style="margin: 0;
    padding: 0px 4px;
    border: 1px solid #FFB7B7;
    border-radius: 13px;
    width: 78px;
    height: 25px;
    font-size: 16px;
    text-align: center;"/></div>

      </div>
    </div>
    
</div><!-- @end #pgcontainer -->
<div style="    padding-top: 10px;
    background-color: white;
    border-radius: 12px;
    padding-bottom: 278px;
    overflow: scroll;
    width: 100%;
    height: 400px;">
       <table id='tab' border="1px solid #eeeeee" style="    width: 100%;
    max-width: 100%;
    margin-bottom: 21px;background-color: transparent;border-collapse: collapse;
    border-spacing: 0;">
	    		<tr id='appends' style="text-align: center;height: 15px;">
	    			<td style="width: 50%">分店名称</td>
	    			<td style="width: 50%">销售金额</td>
<!-- 	    			<td style="width: 35%">时间</td> -->
	    		</tr>
	    		<c:forEach items="${sessionScope.flowlist }" var="list" varStatus="status">
					<tr class='msg' style="text-align: center;height: 25px;    font-size: 20px;">
	    			<td>${list.stname }</td>
	    			<td>${list.allprice }</td>
<%-- 	    			<td>${list.addtime }</td> --%>
	    			</tr>
				</c:forEach>
	    	</table>
        </div>
</body>
</html>
