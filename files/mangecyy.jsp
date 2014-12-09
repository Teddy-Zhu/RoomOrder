<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
request.setCharacterEncoding("UTF-8");
String UserName = request.getParameter ( "username" );
String lenddata = request.getParameter ( "data" );
String lendtime = request.getParameter ( "lendtime" );
String roomtype = request.getParameter ( "roomtype" );
String s_pageNow= request.getParameter ("pageNow");
int pageNow=1,pageSize=5;
if(data.isNullOrEmpty(lenddata)) return;
if(data.isNullOrEmpty(lendtime) || lendtime.equals("0")) lendtime=""; else {lendtime=" and classtimetype.lendtime="+lendtime;}
if(data.isNullOrEmpty(roomtype) || roomtype.equals("0")) roomtype=""; else {roomtype=" and roombasicinfo.roomtype="+roomtype;}
if( data.isNullOrEmpty(s_pageNow) ) return ; else { pageNow=Integer.parseInt(s_pageNow);  }
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

//查询得到rowCount
String sql1="select count(*) from roomorderinfo where userid=(select userid from userbasic where username='"+UserName+"')";
ResultSet rs=data.executeQuerydate(sql1) ;
//计算pageCount
if(rowCount%pageSize==0){
pageCount=rowCount/pageSize;
}else{
pageCount=rowCount/pageSize+1;
}
//查询出需要显示的记录
if(pageNow>pageCount) out.println("<h1>暂无数据</h1>"); else{
%>
<table class="selftable" width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<th width="1000">ID</th>
<th width="1000">教室</th>
<th width="2200">租借原因</th>
<th width="1000">租借日期</th>
<th width="1000">租借时间</th>
<th width="1000">申请日期</th>
<th width="1000">状态</th>
<th width="1000">管理员备注</th>
<th width="1000">操作</th>
</tr>

<%
String sql4="select * from roomorderinfo where username='"+UserName+"' " + lendtime + roomtype;
rs=data.executeQuerydate(sql4);
String temp="";int t=1;
rs.next();
temp=rs.getString(1);
%>
<tr onmouseover="this.style.color='#FF0000';this.style.fontWeight='bold';" onmouseout="this.style.color='#000000';this.style.fontWeight='normal';">
<td><label id="a1"><%=rs.getString(1)%></label></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td>
<select id="xzlendtime1">
 <option value="<%=rs.getString(7)%>"><%=rs.getString(8)%></option>
 <%
while(rs.next()){
if(rs.getString(1).equals(temp)){
%> 
<option value="<%=rs.getString(7)%>"><%=rs.getString(8)%></option>
<%
}else{
temp=rs.getString(1);
%>
</select>
</td>
<td align="center" valign="middle"><input align="center"  type="button" class="btn btn-green big" value="预约" onclick="yuyue(<%=t%>,'<%=UserName%>')"/></td>
</tr>
<tr onmouseover="this.style.color='#FF0000';this.style.fontWeight='bold';" onmouseout="this.style.color='#000000';this.style.fontWeight='normal';">
<td><label id="a<%t++;out.print(t);%>"><%=rs.getString(1)%></label></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td>
<select id="xzlendtime<%=t%>">
     <option value="<%=rs.getString(7)%>"><%=rs.getString(8)%></option>
<%
	 }
}
%>
</select>
</td>
if(rs.getString)
<td align="center" valign="middle"><input align="center"  type="button" class="btn btn-green big" value="取消预约" onclick="yuyue(<%=pageSize%>,'<%=UserName%>')"/></td>
</tr>
</table>
<p>
<%if(pageNow!=1){%><input align="center"  type="button" class="btn btn-green big" value="上一页" onclick="query(1,<%=(pageNow-1)%>,'<%=UserName%>')"/><%}%>
<%for(int i=1;i<=pageCount;i++){%><input align="center"  type="button" class="btn btn-green big" value="<%=i%>" onclick="query(1,<%=i%>,'<%=UserName%>')"/><%}%>
<%if(pageNow!=pageCount){%><input align="center"  type="button" class="btn btn-green big" value="下一页" onclick="query(1,<%=(pageNow+1)%>,'<%=UserName%>')"/><%}%>
</p></td>
  </tr>  
  </table>
<%}
data.disconnect_database();
}}}catch(Exception e){
out.println(e);
}
%>