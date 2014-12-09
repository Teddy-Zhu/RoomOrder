<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
<h1>
 <%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
java.util.Date currentTime = new java.util.Date();//得到当前系统时间
String str_date = formatter.format(currentTime); //将日期时间格式化 
String UserName = request.getParameter ( "username" );
String xzlendtime=request.getParameter("xzlendtime");
String roomlocal=request.getParameter("roomlocal");
String lendfor=request.getParameter("lendfor");
lendfor=java.net.URLDecoder.decode(lendfor, "UTF-8");
String lenddate=request.getParameter("data");
if(data.isNullOrEmpty(lenddate))  {out.println("请选择日期"); return;}
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
ResultSet loginrz=data.executeQuerydate("select * from userbasic where username='"+UserName+"' and ordernum>0");
if(loginrz.next()){
String sql="select *  from roomorderinfo where roomlocal='"+roomlocal+"'  and lendtime = (select lendtime from classtimetype where realtime ='"+xzlendtime+"')  and lenddate = '"+lenddate+"' and  (status =1 or status = 2)";
ResultSet Rs = data.executeQuerydate(sql) ;
if(Rs.next()) {out.println("<h1>对不起您申请的教室已被预约！请重新选择</h1>");return;}
String sql2="INSERT into roomorderinfo(roomlocal,userid,orderfor,lenddate,lendtime,sqdate) values('"+roomlocal+"',(select userid from userbasic where username='"+UserName+"'),'"+lendfor+"','"+lenddate+"',(select lendtime from classtimetype where realtime='"+xzlendtime+"'),'"+str_date+"')";
int j= data.executeUpdatedate(sql2);
int k= data.executeUpdatedate("update userbasic set ordernum=ordernum-1 where username='"+UserName+"'");
if(j==1 && k==1) {
java.text.SimpleDateFormat crformatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date crcurrentTime = new java.util.Date();
String crstr_date = crformatter.format(crcurrentTime);
String crsql="添加了教室"+roomlocal+"的教室预约申请.";
data.executeUpdatedate("insert into logs (userid,sqltext,time) VALUES ( (select userid from userbasic where username='"+ UserName+"'),'"+crsql+"','"+crstr_date+"')");
out.println("<h1>申请成功,进入审核阶段，你可以在界面查询审核情况。</h1>");
} else {out.println("<h1>申请失败！请重新尝试申请或者联系管理员！</h1>");return ;}
} else out.println("<h2>您暂时不能申请更多的教室了！<br/>你可以先取消预约的教室。<br/>或者联系管理员添加更多预约教室的权限。</h2>");

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