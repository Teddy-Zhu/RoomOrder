<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
String UserName = request.getParameter ( "loginusername" );
String roomlocal = request.getParameter ( "roomlocal" );
String svalue=null,sname=null; 
String roomcount=request.getParameter("roomcount");
String examecount=request.getParameter("examecount");
String roomtype = request.getParameter ("roomtype");
try{
if(UserName!=null){
Cookie cookies[]=request.getCookies();
Cookie sCookie=null; 
for(int i=0;i<cookies.length;i++){
sCookie=cookies[i];
if( UserName.equals(sCookie.getName())){
sname=sCookie.getName();
svalue=sCookie.getValue();}}
int n=data.authenticationadmin(sname,svalue);
if ( n==1){
%>
<body class="ContentBody">
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >操作结果</th>

  </tr>
<td class="CPanel">

<h1>
<%
    ResultSet rs= data.executeQuerydate ( "select roomlocal from roombasicinfo where roomlocal='"+roomlocal+"'" ); //返回查询结果
	if(rs.getRow()==0)
	{
	String sql="insert into roombasicinfo (roomlocal,roomcount,examecount,roomtype) VALUES  ('"+roomlocal+"',"+roomcount+","+examecount+","+roomtype+")";

	int sqs=data.executeUpdatedate(sql);
	if(sqs==1){
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();
String str_date = formatter.format(currentTime);
String sql2="添加了教室"+roomlocal;
     data.executeUpdatedate("insert into logs (userid,sqltext,time) VALUES ( (select userid from userbasic where username='"+ UserName+"'),'"+sql2+"','"+str_date+"')");
	 out.println ( "添加成功!" );} else out.println(("添加失败!")
		}
		else
out.println ( "添加失败!" );

%>
</h1>
	 </td>
  </tr>
  </table>

</div>
</body>

<%
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