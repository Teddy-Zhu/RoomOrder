<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="request" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
<h1>
 <%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间
String str_date = formatter.format(currentTime); //将日期时间格式化 
String UserName = request.getParameter ( "username" );
String roomid=request.getParameter("roomid");
if(data.isNullOrEmpty(roomid))  {out.println("没有操作的ID"); return;}
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
String sql="select * from roomorderinfo,statustype,userbasic where roomorderinfo.userid=userbasic.userid and roomorderinfo.status=statustype.status and roomid='"+roomid+"' and statusname='审核中'";
ResultSet rs=data.executeQuerydate(sql);
if(rs.next()){
String sql2="update roomorderinfo set status=(select status from statustype where statusname='已失效') where roomid="+roomid;
int tmpn=data.executeUpdatedate(sql2);
if(tmpn==1) {
java.text.SimpleDateFormat crformatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date crcurrentTime = new java.util.Date();
String crstr_date = crformatter.format(crcurrentTime);
String crsql="取消了ID为"+roomid+"的预约";
data.executeUpdatedate("insert into logs (userid,sqltext,time) VALUES ( (select userid from userbasic where username='"+ UserName+"'),'"+crsql+"','"+crstr_date+"')");
data.executeUpdatedate("update userbasic set ordernum=ordernum+1 where username='"+UserName+"'");
out.println ( "<h1>已成功取消预约!</h1>" );
} else out.println ( "<h1>操作失败!</h1>" );
} else out.println ( "<h1>操作失败!</h1>" );

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
</h1>