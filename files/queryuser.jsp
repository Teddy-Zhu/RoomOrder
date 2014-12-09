<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
String UserName = request.getParameter ( "username" );
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
if ( n==0){
%>
<script type="text/javascript"> 
alert("您尚未登陆，请先登陆"); 
window.parent.location.href="../index.jsp"; 
</script> 
<%}
ResultSet rs1=data.executeQuerydate("select * from usertype");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户预约管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script language=javascript charset="gb2312" src="../js/selfjs.js"></script>
<script language=javascript charset="gb2312" src="../js/WdatePicker.js"></script>
</head>
<body class="ContentBody">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >用户管理</th>

  </tr>
        <td align="center" class="CPanel">
  

   
    <input id="cxusername" type="text">
    用户类型
    <select id="usertype" name="usertype">
  <option value="0">不限制</option>
<%while(rs1.next()){
out.println("<option value=\""+ rs1.getString(1)+"\">"+rs1.getString(2)+"</option>");
}%>
</select>
    <input style="vertical-align:middle" type="button" class="btn btn-green big" value="查询" onClick="query(7,1,'<%=UserName%>')"/>
    <br><br>
<div class="table-c" id="table-c"></div>

</body>
</html>
<%
}else     out.println ( "未登录!" );
data.disconnect_database();
}catch(Exception e){
out.println(e);
}
%>