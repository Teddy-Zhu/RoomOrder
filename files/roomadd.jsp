<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
 request.setCharacterEncoding("UTF-8");
String UserName = request.getParameter ( "username" );
String roomlocal = request.getParameter ( "roomlocal" );
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

<%

ResultSet rs=data.executeQuerydate("select * from roomtype");
if(rs.next()){
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CContent">
<tr> <th class="tablestyle_title" >添加教室</th></tr>
<td class="CPanel">
<form id="form" method="post" action="addroom.jsp">
<%
if(n==1) {
%>
<div style="width:300px; margin-left:50;margin-top:5">
<input class="require"  name="loginusername" id="loginusername" type="hidden" value="<%=UserName%>">
<%
}
%>	<p>
							<label class="required" for="roomlocal">教室名称:</label>
						  <input name="roomlocal" type="text" id="roomlocal" value=<%=roomlocal%>>
		  </p>
						<p>
						  <label class="required" for="roomcount">教室座位数：</label>
                          <input name="roomcount" type="text" id="roomcount">
	      </p>
			<p>
						  <label class="require" for="examecount">考试座位数：</label>
						  <input name="examecount" type="text" id="examecount">
		  </p>
						<p>
						  <label class="require" for="roomtype">教室类型:</label>
						  <select name="roomtype" id="roomtype">
						    <option value="100">----------请选择------------</option>
						    <%
							 out.println("<option value=\""+ rs.getString(1)+"\">"+rs.getString(2)+"</option>");
	  while(rs.next()){
	  out.println("<option value=\""+ rs.getString(1)+"\">"+rs.getString(2)+"</option>");
	  }
        %>
					      </select>
						  </p>
						  <input name="提交" type="submit" class="btn btn-green big" value="提交"/>
						  <input name="重置" type="reset" class="btn btn-green big"  value="重置"/>
						
</div>
</form>	
	 </td>
 </table>
 
<%
if(n==2) {
%>

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