<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="request" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
request.setCharacterEncoding("UTF-8");
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
int n=data.authenticationadmin(sname,svalue);
if ( n==1){
%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教室预约管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script language=javascript charset="gb2312" src="../js/selfjs.js"></script>
<script language=javascript charset="gb2312" src="../js/WdatePicker.js"></script>
</head>
<body class="ContentBody">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
<tr> <th class="tablestyle_title" >个人信息修改（请先查询后修改）</th></tr>
<td class="CPanel">
						<p>
							<label>用户名:</label>
							<input type="text" id="cxusername" name="cxusername"/>
							<input style="vertical-align:middle" type="button" class="btn btn-green big" value="查询" onclick="query(2,'<%=UserName%>',1)"/>
						</p>		
	 </td>
 </table>
<div class="MainDiv" id="table-c">
</div>
</body>
</html>
<%
} else{%>
<script type="text/javascript"> 
alert("您尚未登陆，请先登陆"); 
window.parent.location.href="../index.jsp"; 
</script> 
<%}
}else     out.println ( "未登录!" );
}catch(Exception e){
out.println(e);
}
%>