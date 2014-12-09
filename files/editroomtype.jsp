<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
request.setCharacterEncoding("UTF-8");
String UserName = request.getParameter ( "username" );

String svalue=null,sname=null; 
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
String sql="select * from roomtype";
ResultSet rs=data.executeQuerydate(sql);
%>
<head>
</head>
<body class="ContentBody">
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<script type="text/javascript"> 
function check(i){
if(i==1){
var chusername=document.getElementById("chusername").value;
var select = document.getElementById("chroomtype");
var chroomtype = select.options[select.selectedIndex].value;
if (chusername.length==0 ) {
alert("请输入需要修改的教室名");
return false;
}

 if ( chroomtype==100 ) {
alert("请输入选择教室类型");
return false;
}
}
if(i==2){
var typename=document.getElementById("typename").value;//密码
if (typename.length==0 ) {
alert("请输入需要修改的教室名");
return false;
}
}
if(i==3){
var select = document.getElementById("deltype");
var deltype = select.options[select.selectedIndex].value;
if (deltype==100 ) {
alert("请选择需要删除的教室类型");
return false;
}
}
}
</script>
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >教室类型管理</th>

  </tr>
<td class="CPanel">
<table width="100%" height="245" border="0" cellspacing="0"  >
<tr style="border:1px solid black; padding:20px; width:100%;">
  <th style="border:1px solid black; padding:20px; width:33%;" align="center" valign="top" cellpadding="0" cellspacing="0" ><h2 align="center">更改教室类型</h2>
    <form id="change1" name="change1" method="post" action="/files/editrt.jsp?username=<%=UserName%>">
    <p>
	<input type="hidden" name="optype" value="changetype"/>
      <label for="chroomlocal">教 &nbsp;  室: </label>
      <input type="text" name="chroomlocal" id="chroomlocal" />
    </p>
    <p>
      <label for="chroomtype">类 &nbsp; 型:</label>
      <select name="chroomtype" id="chroomtype">
	  <option value="100">----------请选择------------</option>
	  <%
	  while(rs.next()){
	  out.println("<option value=\""+ rs.getString(1)+"\">"+rs.getString(2)+"</option>");
	  }
        %>
      </select>
    </p><br/><br/><br/>
							<p>
							<input type="submit" class="btn btn-green big" value="修改" onClick="return check(1)"/> 
							<input type="reset" class="btn btn-green big" value="重置"/> 
						</p>

    </form>
  </th>
  <th style="border:1px solid black; padding:20px; width:33%;"><h2 align="center">添加教室类型</h2>
      <form id="change2" name="change2" method="post" action="/files/editrt.jsp?username=<%=UserName%>">
    <p>
	<input type="hidden" name="optype" value="addtype"/>
      <label for="typename">类型名: </label>
      <input type="text" name="typename" id="typename" />
    </p><br/><br/><br/><br/><br/><br/>
							<p>
							<input type="submit" class="btn btn-green big" value="添加" onClick="return check(2)"/> 
							<input type="reset" class="btn btn-green big" value="重置"/> 
						</p><br/>

    
    </form>
<% ResultSet rs2=data.executeQuerydate(sql); %>
  </th>
  <th style="border:1px solid black; padding:20px; width:33%;" width="33%"><h2 align="center">删除教室类型</h2>
      <form id="change3" name="change3" method="post" action="/files/editrt.jsp?username=<%=UserName%>">
    <p>
		<input type="hidden" name="optype" value="deltype"/>
      <label for="deltype">类 &nbsp; 型:</label>
      <select name="deltype" id="deltype">
	  <option value="100">----------请选择------------</option>
	  <%
	  while(rs2.next()){
	  out.println("<option value=\""+ rs2.getString(1)+"\">"+rs2.getString(2)+"</option>");
	  }
        %>
      </select>
    </p><br/><br/><br/><br/><br/><br/>
							<p>
							<input type="submit" class="btn btn-green big" value="删除" onClick="return check(3)"/> 
							<input type="reset" class="btn btn-green big" value="重置"/> 
						</p>

    </form>
  </th><tr>
</table>
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