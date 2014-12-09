<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="request" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
 request.setCharacterEncoding("UTF-8");
String UserName = request.getParameter ( "username" );
String CXUserName = request.getParameter ( "cxusername" );
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
if(data.isNullOrEmpty(CXUserName)) CXUserName=UserName;
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
<%
ResultSet rs=data.executeQuerydate("select * from userbasic where username = '"+ CXUserName +"'");
if(rs.next()){
%>
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
<tr> <th class="tablestyle_title" >个人信息</th></tr>
<td class="CPanel">
<form id="form" method="post" action="editself.jsp">
<%
if(n==1) {
%>
<div style="width:300px; margin-left:20;margin-top:5">
<input class="require"  name="loginusername" id="loginusername" type="hidden" value="<%=UserName%>">
<%
}
%>
						<p>
							<label class="required" for="cxusername">用 户 名:</label>
						  <input name="cxusername" type="text" id="cxusername" value="<%=CXUserName%>" readonly="true">
						  </p>
						<p>
						  <label class="required" for="oldpassword">原 密 码:</label>

						  <input name="oldpassword" type="password" id="oldpassword" value="<%if(n==1)out.println(rs.getString("password"));%>">
						    </p>
						<p>
						  <label class="require" for="newpassword">新 密 码:</label>
						  <input name="newpassword" type="password" id="newpassword">
						  </p>
						<p>
						  <label class="require" for="repassword">确认密码:</label>
						  <input name="repassword" type="password" id="repassword" >
						  </p>

                        <p>
						  <label class="required" for="email">email :</label>
						  <input name="email" type="text" id="email" value="<%=rs.getString("email")%>"><br/><br/>
						<label class="require" for="info">个人简介:</label><br/>
						<textarea  name="selfinfo" id="selfinfo" cols="45" rows="5"></textarea>
						</p>
							 <input name="提交" type="submit" class="btn btn-green big" onclick="return checkLogin()" value="提交"/><input name="重置" type="reset" class="btn btn-green big"  value="重置"/>
						  <br/>
						  <br/>
						</div>
					</form>	
	 </td>
 </table>
 
<%
if(n==2) {
%>
</div>
</body>
</html>
<%
}
}else out.println("不存在此用户，请确认用户名是否正确！");
} else{%>
<script type="text/javascript"> 
alert("您尚未登陆，请先登陆"); 
window.parent.location.href="../index.jsp"; 
</script> 
<%}
}else     out.println ( "未登录!" );
%>

<%
}catch(Exception e){
out.println(e);
}
%>