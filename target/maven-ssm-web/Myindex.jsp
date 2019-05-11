<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>插入信息</title>
</head>
<script>
function $sel(id,tabname){
    if(id!="" && tabname!=""){
        var tem_obj=document.getElementById(id);
        return tem_obj.getElementsByTagName(tabname);
      }else if(id!=""){
        return document.getElementById(id);
      }else{
        return document.getElementsByTagName(tabname);
      }	
}
//验证用户名格式
function isname(obj){
  var reg=/^[\u4e00-\u9fa5]{2,4}$/;
  if(!reg.test(obj.value)){
    alert("请正确填写姓名！姓名为两到四个汉字。");
    obj.value="";
  }
}
function init(){
    $sel("UserName","").onblur=function(){
        isname(this);
      }
}
</script>
<body onload="init()">
<form id="PersonInformation">
<table  align="center" >
     <tr>
         <td>用户名：</td>
         <td> <input type="text" id="UserName" name="UserName" /> </td>
     </tr>
     <tr>
         <td> 年龄： </td>
         <td> <input type="Password" id="PassWord1" name="PassWord1" /> </td>
     </tr>
     <tr>
         <td></td>
         <td><font color="red"> ${error }</font> </td>
     </tr>
     <tr>
         <td><button type="button" onclick="find('personController/showPerson')" id="insertPerson">确认</button></td>
         <td></td>
     </tr>
</table>
</form>
     <script type="text/javascript">
        function find(url){
        	xmlhttp=new XMLHttpRequest();
        	xmlhttp.open('Post',url,true);
        	xmlhttp.send();
        	xmlhttp.onreadystatechange=state_change;
        }
        
        function state_change(){
        	if(xmlhttp.readyState==4 && xmlhttp.status==200){
        		alert(xmlhttp.responseText);
        	}
        }
     </script>
</body>
</html>
