<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
</head>
<body>
<table  align="center" >
     <tr>
         <td>用户名：</td>
         <td> <input type="text" id="UserName" name="UserName" /> </td>
     </tr>
     <tr>
         <td> 密码： </td>
         <td> <input type="password" id="PassWord" name="PassWord"/>  </td>
     </tr>
     <tr>
         <td>记住密码</td>
         <td> <input type="checkbox" id="remember" name="remember" value="remember-me" /> </td>
     </tr>
     <tr>
         <td></td>
         <td><font color="red"> ${error }</font> </td>
     </tr>
     <tr>
         <td><input type="submit" value="登录"  ></td>
         <td><a  href="#">注册</a></td>
     </tr>
</table>
</body>
</html>