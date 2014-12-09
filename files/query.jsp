<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>教室预约管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">



</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody">
  <form action="" method="post" enctype="multipart/form-data" name="fom" id="fom" target="sypost" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >查询教室预约情况</th>

  </tr>
<td class="CPanel">
 <%
String UserName = request.getParameter ( "username" );
String ROOMLOCAL = request.getParameter ( "roomlocal" );
try {
if(UserName!=null){
Cookie cookies[]=request.getCookies();
Cookie sCookie=null; 
String svalue=null,sname=null; 
for(int i=0;i<cookies.length;i++){
sCookie=cookies[i];
if( UserName.equals(sCookie.getName())){
sname=sCookie.getName();
svalue=sCookie.getValue();
}
}
Class.forName ( "org.gjt.mm.mysql.Driver" ).newInstance ( );
String url = "jdbc:mysql://localhost:3306/roomorder";
Connection connection = DriverManager.getConnection ( url, "root","zt123456" );
String sql = "select * from userbasic WHERE username='"+sname+"' and cookies='"+svalue+"'";
Statement stmt = connection.createStatement ( );
ResultSet rs = stmt.executeQuery ( sql ); //返回查询结果

if ( rs.next ()){
if(ROOMLOCAL.equals("all")) sql = "select * from roombasicinfo,roomorderinfo,roomtype where roombasicinfo.roomlocal = roomorderinfo.roomlocal and roomtype.roomtype = roombasicinfo.roomtype"; else sql= "select * from roombasicinfo,roomorderinfo,roomtype WHERE roombasicinfo.roomlocal = roomorderinfo.roomlocal and roomtype.roomtype = roombasicinfo.roomtype and roomorderinfo.roomlocal='"+ ROOMLOCAL +"'";
rs = stmt.executeQuery ( sql );
if ( rs.next ()){
out.println("<table border=\"1\"><tr><td>roomlocal&nbsp;&nbsp;</td><td>roomcount 总计座位数&nbsp;&nbsp;</td><td>roomtype 教室种类&nbsp;&nbsp;</td><td>examcount 试考人数&nbsp;&nbsp;</td><td>roomid&nbsp;&nbsp;</td><td>roomlocal 用户位置 例A1102&nbsp;&nbsp;</td><td>userid 预约者的id&nbsp;&nbsp;</td><td>orderfor 租借原因&nbsp;&nbsp;</td><td>roomtype&nbsp;&nbsp;</td><td>roomtypename&nbsp;&nbsp;</td></tr>");
do {
for(int i=1;i<=10;i++){
if(i==5) i++;
if(i == 1) out.print("<tr>");
out.println ( "<td>"+rs.getString(i)+"</td>" );
if(i == 11) out.print("</tr>");
}
} while (rs.next());

out.println("</table>");
rs.close ( );
stmt.close ( );
connection.close ( );
}else {out.println ( "未找到" );} 


}else {out.println ( "请先登录！" );}


}else {out.println ( "请先登录！" );}	


}
	catch(Exception e)
{
out.println(e);
}
%>
</div>
</form>
</body>
</html>
