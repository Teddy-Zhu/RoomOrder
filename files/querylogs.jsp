<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
String UserName = request.getParameter ( "username" );
String s_pageNow= request.getParameter ("pageNow");
int pageNow=1;
if( !data.isNullOrEmpty(s_pageNow) ) { pageNow=Integer.parseInt(s_pageNow);  }
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
int pageSize=10;
int rowCount=0;//该值从数据库中查询
int pageCount=0;//该值是通过pageSize和rowCount
String sql = "select count(*) from logs";
    ResultSet rs= data.executeQuerydate ( sql ); //返回查询结果
if(rs.next()){
rowCount=rs.getInt(1);
}
//计算pageCount
if(rowCount%pageSize==0){
pageCount=rowCount/pageSize;
}else{
pageCount=rowCount/pageSize+1;
}
String sql2 ="select * from userbasic,logs where logs.userid =  userbasic.userid order by id asc limit "+pageSize*(pageNow-1)+","+pageSize;
rs=data.executeQuerydate(sql2);
if(pageNow>pageCount) out.println("<h1>暂无数据</h1>"); else{
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教室预约管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script language=javascript charset="gb2312" src="../js/selfjs.js"></script>
<script language=javascript charset="gb2312" src="../js/WdatePicker.js"></script>
<script language=javascript>
function reload(username,pageNow){

window.location.href="../files/querylogs.jsp?username="+username+"&pageNow="+pageNow;
}
</script>
</head>
<body class="ContentBody">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >预约选择(请先查询后在发起预约)</th>
  </tr>
  <td align="center" class="CPanel">

<table class="table-c" id="table-c">
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" class="selftable" id="selftable">
<tr >
<th width="1000">ID</th>
<th width="1000">用户名</th>
<th width="3200">操作信息</th>
<th width="1000">时间</th>
</tr>
<%
int t=0,m=0;
while(rs.next()){
%>
<tr onmouseover="this.style.color='#FF0000';" onmouseout="this.style.color='#000000';">
<td><%=rs.getString("id")%></td>
<td><%=rs.getString("userbasic.username")%></td>
<td><nobr><%=rs.getString("sqltext")%></nobr></td>
<td><nobr><%=rs.getString("time")%></nobr></td>
</tr>
<%}%>
</table>
<p>    
<%if(pageNow!=1){%><input align="center"  type="button" class="btn btn-green big" value="上一页" onclick="reload(<%=UserName%>,<%=pageNow-1%>)"/><%}%>
<%for(int i=1;i<=pageCount;i++){%><input align="center"  type="button" class="btn btn-green big" value="<%=i%>" onclick="reload(<%=UserName%>,<%=i%>)"/><%}%>
<%if(pageNow!=pageCount){%><input align="center"  type="button" class="btn btn-green big" value="下一页" onclick="reload(<%=UserName%>,<%=pageNow+1%>)"/><%}%>
</p>
</table>
</td>
  </table>
</div>
</body>
</html>  
  
<%}

} else     out.println ( "未登录!" );

}else     out.println ( "未登录!" );
data.disconnect_database();
}catch(Exception e){
out.println(e);
}
%>