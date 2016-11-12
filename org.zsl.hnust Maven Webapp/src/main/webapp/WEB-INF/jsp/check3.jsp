<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>验证</title>  
<script type="text/javascript" src="<c:url value="/Static/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/Static/js/main.js"/>"></script>
<script type="text/javascript">  
    function same(){  
        
        var newpass=$("#newPass").val();
        var userID=$("#userID").val();
/*         alert()
 */        $.ajax({
        	url:"changePass?userID="+userID+"&newPass="+newpass,
        			success:function(data){
        				if(data='1'){
        					alert("密码修改成功，请重新登录。");
        					location.href="showUser";
        				}else{
        					location.href="password";
        				}
        			}
        })
    }  
    function different(){  
        alert("请输入正确的验证码");  
        location.href = "password";  
    }  
    function Notnull(){
    	  alert("不能有空");  
          location.href = "password";  
    }
    function Notequals(){
  	  alert("两次输入的新密码不一致");  
        location.href = "password";  
  }
 	function passNotequals(){
 		alert("原密码不正确")
 		location.href = "password";
 	}
</script>  
</head>  
<body>  
    <%  
/*     String userName = request.getParameter("username");   */ 
   String pass=request.getParameter("pass");
    String newPass = request.getParameter("newPass");  
    String renewPass=request.getParameter("renewPass");
/*  	 int userID=(int)session.getAttribute("userID"); */
    String oldPass=(String)session.getAttribute("oldPass");
    if(pass.equals("")||newPass.equals("")||renewPass.equals("")){
    	 out.println("<script language='javascript'>Notnull();</script>");  
    }
    if(!pass.equals(oldPass)){
   	 out.println("<script language='javascript'>passNotequals();</script>");  
    }
    if(!newPass.equals(renewPass)){
   	 out.println("<script language='javascript'>Notequals();</script>");  
    }
    %>  
    <form id="loginForm" name="loginForm" method="post">  
        <input type="hidden" id="newPass" value=<%=newPass %>  name="newpass">  
        <input type="hidden" id="userID" value=<%=session.getAttribute("userID") %> name="userID">  
    </form>  
    <%  
        String rand = session.getAttribute("code").toString();  
        String input = request.getParameter("code");  
        if(rand.equals(input.toUpperCase())){  
            out.println("<script language='javascript'>same();</script>");  
        }else{  
            out.print("<script language='javascript'>different();</script>");  
        }  
    %>  
      
</body>  
</html>  