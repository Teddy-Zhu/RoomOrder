<html>
<jsp:useBean id="data" scope="request" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
String name=request.getParameter("username");
String pass=request.getParameter("password");
String usertype="100";
String temp=request.getParameter("usertype");
try
{
if(temp.equals("1"))
usertype = "2";
else {
if(temp.equals("6"))
usertype = "2";
else usertype=temp;
}
if(temp.equals("100")) response.sendRedirect("./failed.jsp?error=unknown"); ;
String email=request.getParameter("email");
String selinfo=request.getParameter("selfinfo");
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.util.Date currentTime = new java.util.Date();
String str_date = formatter.format(currentTime);
    ResultSet rs=data.executeQuerydate("select * from userbasic where username='"+name+"'");
    if(!rs.next()){
    String sql = "INSERT INTO `userbasic`(`usertype`, `username`, `password`,`selfinfo`,`email`,`regdate`) VALUES ("+usertype+",'"+name+"','"+pass+"','"+selinfo+"','"+email+"','"+str_date+"')";
    int n = data.executeUpdatedate ( sql ); 
	 if(n==1) {
	 String sql2="注册了用户名为"+name+"的用户";
	 data.executeUpdatedate("insert into logs (userid,sqltext,time) VALUES ( (select userid from userbasic where username='"+ name+"'),'"+sql2+"','"+str_date+"')");
	 response.sendRedirect("./success.jsp?username="+ name);}
	 else response.sendRedirect("./failed.jsp?error=unknown");
}else response.sendRedirect("./failed.jsp?error=usererror"); 
}
catch(Exception e)
{
out.println(e);
}
%>
</html>