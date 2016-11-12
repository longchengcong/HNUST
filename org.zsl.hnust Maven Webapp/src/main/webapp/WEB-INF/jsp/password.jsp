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


  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>修改密码</title>
  
	<link rel="stylesheet" type="text/css" href="<c:url value="/Static/css/easyui.css"/>">
<script type="text/javascript" src="<c:url value="/Static/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/Static/js/jquery.easyui.min.js"/>"></script>


<link rel="stylesheet" href="<c:url value="/Static/flowcss/style.css"/>">
<link href="<c:url value="/Static/css/style.css"/>" rel="stylesheet">

<script type="text/javascript" src="<c:url value="/Static/js/menu.js"/>"></script>
<script type="text/javascript" src="<c:url value="/Static/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/Static/js/main.js"/>"></script>

<script type="text/javascript">
    function refresh() {
        //IE存在缓存,需要new Date()实现更换路径的作用
         document.getElementById("image").src="/HNUST/user/image?"+new Date();
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
    	    <div><img src="<c:url value="/Static/img/psb.png"/>" width="20px" height="20px"/></div>
    	    <div><span>欢迎你</span></div>
          <div>  <span>admin（广东华丰药业有限公司）</span></div>
            </div>

        <ul>
          <li><a href="/HNUST/user/index">功能菜单</a></li>
          <li><a href="/HNUST/user/index">流向查询</a></li>
          <li><a href="/HNUST/user/index">安全中心</a></li>
          <li><a href="/HNUST/user/password">密码修改</a></li>
          <li><a href="/HNUST/user/showUser">退出</a></li>
        </ul>
      </div>
    </div>
    <div class="overlay"></div>
  </header>

  <div id="content">
    <div>
      <div>修改密码</div>
      <div>
     	  	<div id="cd-signup" class="is-selected"> <!-- 注册表单 -->
				<form class="cd-form" action="/HNUST/user/check3" method="post">

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-username">原密码</label>
						<input class="full-width has-padding has-border" id="change_pass" type="password" placeholder="输入原密码" name="pass">
					</p>

					<p class="fieldset">
					<label class="image-replace cd-password" for="new_pass">新密码</label>
						<input class="full-width has-padding has-border" id="signup-password" type="password" placeholder="输入新密码" name="newPass">
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">确认新密码</label>
						<input class="full-width has-padding has-border" id="renew_pass" type="password"  placeholder="确认新密码" name="renewPass">
					</p>

          <p class="fieldset">
            <label class="image-replace cd-password" for="signin-password">验证码</label>
            <input class="full-width has-padding has-border" id="code" type="text"  placeholder="输入验证码" maxlength="4" name="code">
              <img id="image" border="0"  onclick="refresh()" src="/HNUST/user/image" title="点击更换图片"/>
          </p>

					<p class="fieldset">
						<input class="full-width2" type="submit" value="修改密码">
					</p>
				</form>
			</div>
        
        
    </div>
</div><!-- @end #pgcontainer -->
</body>
</html>
