<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
request.setCharacterEncoding("UTF-8");
String UserName = request.getParameter ( "username" );
String optype = request.getParameter ( "optype" );
String crsql=null;
if(data.isNullOrEmpty(optype)) return;
String svalue=null,sname=null,chaname=null,chusername=null,chusertype=null,deltype = null,typename=null; 
int oprs=0;ResultSet rs=null;
try{
if(!data.isNullOrEmpty(UserName)){
Cookie cookies[]=request.getCookies();
Cookie sCookie=null; 
for(int i=0;i<cookies.length;i++){
sCookie=cookies[i];
if( UserName.equals(sCookie.getName())){
sname=sCookie.getName();
svalue=sCookie.getValue();}}
int n=data.authenticationadmin(sname,svalue);
if ( n==1){
if(optype.equals("changetype")){
chusername = request.getParameter ( "chusername" );
chusertype = request.getParameter ( "chusertype" );
rs=data.executeQuerydate("select usertypename from usertype where usertypeid="+chusertype);
if(rs.next()) chaname=rs.getString(1);
oprs=data.executeUpdatedate("update userbasic set usertype='"+ chusertype+"' where username='"+chusername+"'");
crsql="更改了用户"+chusername+"的类型为"+ chusertype;
}
if(optype.equals("addtype")){
typename = new String(request.getParameter("typename").getBytes("ISO-8859-1"), "UTF-8");
if(data.isNullOrEmpty(typename)) return;
oprs=data.executeUpdatedate("INSERT into usertype(usertypename) values('"+typename+"')");
crsql="添加了用户类型"+typename;
}
if(optype.equals("deltype")){
deltype = request.getParameter ( "deltype" );
oprs=data.executeUpdatedate("delete from usertype where usertypeid="+deltype);
crsql="删除了了用户类型ID为"+deltype+"的类型";
}
if(oprs==1){
java.text.SimpleDateFormat crformatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date crcurrentTime = new java.util.Date();
String crstr_date = crformatter.format(crcurrentTime);
data.executeUpdatedate("insert into logs (userid,sqltext,time) VALUES ( (select userid from userbasic where username='"+ UserName+"'),'"+crsql+"','"+crstr_date+"')");
}
%>
<body class="ContentBody">
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >操作结果</th>

  </tr>
<td class="CPanel">

<h1><% if(oprs==1 && optype.equals("changetype")) out.println("更改用户'"+chusername+"'的类型为'"+chaname+"'成功"); else {
if(oprs==1 && optype.equals("addtype")) out.println("添加用户类型'"+typename+"'成功"); else { 
if(oprs==1 && optype.equals("deltype"))  out.println("删除用户类型'"+deltype+"'成功"); else out.println("操作失败！");}}
%>
</h1>
	 </td>
  </tr>
  
  
  
  
  </table>

</div>
</body>

<%
data.disconnect_database();
}}}catch(Exception e){
out.println(e);
}
%>