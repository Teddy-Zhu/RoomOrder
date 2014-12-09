

<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
<html>
<head>
   <title>登录</title>

   <meta http-equiv="pragma" content="no-cache">
   <meta http-equiv="cache-control" content="no-cache">
   <meta http-equiv="expires" content="0">
   <!--
<link rel="stylesheet" type="text/css" href="styles.css">
-->




   <%
   String url="";
    //获取用户名
    String sUserName = request.getParameter ( "username" );
    //获取密码
    String sPasswd = request.getParameter ( "password" );
try
{
    String sql = "select * from userbasic,usertype where userbasic.usertype=usertype.usertypeid and username='" + sUserName + "' and password = '" + sPasswd + "' and verify=1" ;
    ResultSet rs = data.executeQuerydate ( sql ); //返回查询结果
    //如果记录集非空，表明有匹配的用户名和密码，登陆成功
    if ( rs.next ( ) )
    {
	if(rs.getInt("power")==1) url="adminmain";else url="main";
	  String temp="";
    		   int j;
    	      for(int i=0;i<15;i++) {
    	          j = (int)(10*(Math.random()));
    	          temp=temp+j;
    	      }
     Cookie cookie=new Cookie(sUserName, temp); 
     cookie.setMaxAge(-1);   
     response.addCookie(cookie); 
     String sql2 = "UPDATE `userbasic` SET `cookies`="+temp+" where username='" + sUserName+ "' and password = '" + sPasswd + "'";
     data.executeUpdatedate ( sql2 ); 
     response.sendRedirect("./"+url+".jsp?username="+sUserName);
    } else
    //否则登录失败
    {
	 response.sendRedirect("./failed.jsp?error=login");
    }
    data.disconnect_database();
}
	catch(Exception e)
{
out.println(e);
}
   %>
   </head>
   <body>
   <div align=center>
</body>
</html>