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
/*         loginForm.action = "UserLogin";  
        loginForm.submit(); */
        var username=$("#username").val();
        var pass=$("#pass").val();
        $.ajax({
        	url:"userlogin?username="+username+"&pass="+pass,
        	success:function(data){
        		if(data=='1'){
        			location.href = "index";
        		}else{
        			location.href = "showUser"; 
        		}
        	}
        });
    } 
    function Notnull(){
  	  alert("不能有空");  
        location.href = "showUser";  
  }
    function different(){  
        alert("请输入正确的验证码");  
        location.href = "showUser";  
    }  
</script>  
</head>  
<body>  
    <%  
    String userName = request.getParameter("username");  
    String password = request.getParameter("password");  
    if(userName.equals("")||password.equals("")){
   	 out.println("<script language='javascript'>Notnull();</script>");  
   }
    %>  
    
    <form id="loginForm" name="loginForm" method="post">  
        <input type="hidden" id="username" value=<%=userName %>  name="username">  
        <input type="hidden" id="pass" value=<%=password %> name="pass">  
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