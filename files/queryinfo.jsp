<%@ page language="java" contentType="text/html;charset=utf-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%
String UserName = request.getParameter ( "username" );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>教室预约管理系统</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />


</head>

<body class="ContentBody">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >查询教室预约情况</th>

  </tr>
<td class="CPanel">
	  						<form id="query" method="post" action="query.jsp?username=<%=UserName%>">
						<p>
							<label class="required" for="roomlocal">教室地点:</label><br/>
							<input type="text" id="roomlocal" class="full" value="例如:A1N101" name="roomlocal"/>
						</p>
						
						<p>
							<input type="submit" class="btn btn-green big" value="查询"/> 
						</p>

					</form>

	 </td>
  </tr>
  
  
  
  
  </table>

</div>
</body>
</html>
