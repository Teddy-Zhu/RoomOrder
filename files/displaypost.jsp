<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
String UserName = request.getParameter ( "username" );
String roomid=request.getParameter("id");
String status=request.getParameter("status");
if(data.isNullOrEmpty(status)) return ;
if(data.isNullOrEmpty(roomid)) return;
String svalue=null,sname=null; 
try{
if(UserName!=null){
Cookie cookies[]=request.getCookies();
Cookie sCookie=null; 
for(int i=0;i<cookies.length;i++){
sCookie=cookies[i];
if( UserName.equals(sCookie.getName())){
sname=sCookie.getName();
svalue=sCookie.getValue();}}
int n=data.authenticationlogin(sname,svalue);
if ( n==1){
String sql="update roomorderinfo set status=" +status +" where roomid=" + roomid;
int i = data.executeUpdatedate(sql) ;
if(i==1){
java.text.SimpleDateFormat crformatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date crcurrentTime = new java.util.Date();
String crstr_date = crformatter.format(crcurrentTime);
String crsql="更新了预约ID"+roomid+"的预约状态为"+status;
data.executeUpdatedate("insert into logs (userid,sqltext,time) VALUES ( (select userid from userbasic where username='"+ UserName+"'),'"+crsql+"','"+crstr_date+"')");
out.println("修改成功！");} else {out.println("更新失败！");}
}else   out.println ( "未登录!" );
} else{%>
<script type="text/javascript"> 
alert("您尚未登陆，请先登陆"); 
window.parent.location.href="../index.jsp"; 
</script> 
<%}
}
catch(Exception e)
{
out.println(e);
}
%>