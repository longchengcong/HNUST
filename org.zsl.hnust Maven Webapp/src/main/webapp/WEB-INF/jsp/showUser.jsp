<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>登录窗口</title>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
</style>
<link href="<c:url value="/Static/css/style.css"/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/Static/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/Static/js/main.js"/>"></script>

<script type="text/javascript">
    function refresh1() {
        //IE存在缓存,需要new Date()实现更换路径的作用
        document.getElementById("image1").src="/HNUST/user/image?"+new Date();
    }
    function refresh2() {
        document.getElementById("image2").src="/HNUST/user/image?"+new Date();
    }
    function checksname(){
    	var sname=$("#signin-username").val();
        $.ajax({
    		url:"/HNUST/user/checklogin?username="+sname,
    		success:function(data){
    			if(data==1){
    	    		$("#csname").html("");
    	    		$("#csname").html("用户名可登录");
    			}else{
    	    		$("#csname").html("");
    	    		$("#csname").html("用户名不存在");
    			}
    		}
    	}); 
    	
    }
    function checkpw(){
/*     	var pw=$("#signin-password").val();
    	if (pw.length===0 || (/\d/.test(pw) && /[a-zA-Z]/.test(pw) && /^[a-zA-Z0-9]+$/.test(pw))) {
    		$("#csname").html("");
    		$("#csname").html("用户名可以使用");
    	}else{ 
    		$("#csname").html("不符合");
    	} */
/*     	$.ajax({
    		url:"",
    		success:function(){
    			
    		}
    	}); */
    }
</script>

</head>

<body>


	<div class="demo">
		<nav class="main_nav">
			<ul>
				<li><a class="cd-signin" href="#0">登录</a></li>
				<li><a class="cd-signup" href="#0">注册</a></li>
			</ul>
		</nav>
	</div>

	<div class="cd-user-modal is-visible">
		<div class="cd-user-modal-container">
			<ul class="cd-switcher">
				<li><a href="#0">用户登录</a></li>
				<li><a href="#0">注册新用户</a></li>
			</ul>

			<div id="cd-login" class="is-selected"> <!-- 登录表单 -->
				<form class="cd-form" action="/HNUST/user/check" method="post">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signin-username">用户名</label>
						<input class="full-width has-padding has-border" id="signin-username" type="text" placeholder="输入用户名" name="username" onmouseout="checksname()">
						<div id=csname>用户名:6-16字符(A-Z,a-z,0-9)</div>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">密码</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="输入密码" name="password" onmouseout="checkpw()"/>
						<div id=cspw>密码:6-16字符(A-Z,a-z,0-9)</div>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">验证码</label>
						<input class="full-width has-padding has-border" id="signin-code" type="text"  placeholder="输入验证码" maxlength="4" name="code">
						<img id="image1" border="0"  onclick="refresh1()" src="/HNUST/user/image" title="点击更换图片"/>
					</p>


					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">记住登录状态</label>
					</p>

					<p class="fieldset">
						<input class="full-width2" type="submit" value="登 录">
					</p>
				</form>
			</div>



			<div id="cd-signup"> <!-- 注册表单 -->
				<form class="cd-form" action="/HNUST/user/check2" method="post">

					<p class="fieldset">
						<img src="<c:url value="/Static/img/psb.png"/>" width="20px" height="20px">
						cai。还没注册的话，赶紧注册吧！
					</img>
						<!-- <p>hi,cai。还没注册的话，赶紧注册吧！</p> -->
					</p>

					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">用户名</label>
						<input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="输入用户名" name="username">
					</p>

					<p class="fieldset">
					<label class="image-replace cd-password" for="signup-password">输入密码</label>
						<input class="full-width has-padding has-border" id="signup-password" type="password" placeholder="输入密码" name="password">
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">确认密码</label>
						<input class="full-width has-padding has-border" id="signup-repassword" type="password"  placeholder="确认密码" name="pass">
					</p>

          <p class="fieldset">
            <label class="image-replace cd-password" for="signin-password">验证码</label>
            <input class="full-width has-padding has-border" id="signup-code" type="text"  placeholder="输入验证码" maxlength="4" name="code">
              <img id="image2" border="0"  onclick="refresh2()" src="/HNUST/user/image" title="点击更换图片"/>
          </p>

					<!-- <p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">我已阅读并同意 <a href="#0">用户协议</a></label>
					</p> -->

					<p class="fieldset">
						<input class="full-width2" type="submit" value="注册新用户">
					</p>
				</form>
			</div>

			<a href="#0" class="cd-close-form">关闭</a>
		</div>
	</div>
<!-- <div style="text-align:center;">
</div> -->
</body>
</html>

