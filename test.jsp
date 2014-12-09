<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="request" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
<h1>用户信息列表</h1>
<%
//定义四个分页会用到的变量
int pageSize=3;
int pageNow=1;//默认显示第一页
int rowCount=0;//该值从数据库中查询
int pageCount=0;//该值是通过pageSize和rowCount
//接受用户希望显示的页数（pageNow）
String s_pageNow=request.getParameter("pageNow");
if(s_pageNow!=null){
//接收到了pageNow
pageNow=Integer.parseInt(s_pageNow);
}
//查询得到rowCount

String sql = "select count(*) from userbasic";
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
//查询出需要显示的记录
rs=data.executeQuerydate("select * from userbasic limit "+pageNow*(pageNow-1)+","+pageSize);
%>
<%=pageCount%>
<%
if(pageNow>pageCount) out.println("暂无数据"); else{
%>
<table border="1">
<tr><td>用户ID</td><td>用户名字</td><td>密码</td><td>电邮</td><td>级别</td></tr>
<%
while(rs.next()){
%>

<tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td></tr>
<%}%>
</table>
<%
//上一页
if(pageNow!=1){
out.println("<a href=test.jsp?pageNow="+(pageNow-1)+">上一页</a>");
}
//显示超链接
for(int i=1;i<=pageCount;i++){
out.println("<a href=test.jsp?pageNow="+i+">["+i+"]</a>");
}
//下一页
if(pageNow!=pageCount){
out.println("<a href=test.jsp?pageNow="+(pageNow+1)+">下一页</a>");
}
}
data.disconnect_database();
%>