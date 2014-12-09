<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
String UserName = request.getParameter ( "username" );
String cxusername = request.getParameter ( "cxusername" );
String usertype = request.getParameter ( "usertype" );
String s_pageNow= request.getParameter ("pageNow");
int pageNow=1,tempn=0,tempsize=0;
if( data.isNullOrEmpty(s_pageNow) ) return ; else { pageNow=Integer.parseInt(s_pageNow);  }
if(usertype.equals("0")) usertype=""; else {usertype=" and userbasic.usertype ="+usertype;}
if(data.isNullOrEmpty(cxusername) || cxusername.equals("0")) cxusername=""; else {cxusername=" and userbasic.username like '%"+cxusername+"%'";}
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
int pageSize=5;
int rowCount=0;//该值从数据库中查询
int pageCount=0;//该值是通过pageSize和rowCount
String sql = "select count(*) from userbasic,usertype WHERE userbasic.usertype=usertype.usertypeid "+ usertype + cxusername;
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
ResultSet temprs=data.executeQuerydate("select count(*) from usertype");
temprs.next();
tempsize=temprs.getInt(1);

String[] statusname = new String[tempsize];
String[] fstatus = new String[tempsize];
temprs=data.executeQuerydate("select * from usertype");
while(temprs.next()){  fstatus[tempn]=temprs.getString(1); statusname[tempn++]=temprs.getString(2);}
String sql2 ="SELECT *  from userbasic,usertype WHERE userbasic.usertype=usertype.usertypeid "+ usertype + cxusername +" order by userid asc limit "+pageSize*(pageNow-1)+","+pageSize;
rs=data.executeQuerydate(sql2);
if(pageNow>pageCount) out.println("<h1>暂无数据</h1>"); else{
%>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" class="selftable" id="selftable">
<tr >
<th width="1000">用户名</th>
<th width="1000">email</th>
<th width="2200">个人简介</th>
<th width="1000">用户类型</th>
<th width="1000">状态</th>
<th width="1000">可借数</th>
<th width="1000">操作</th>
</tr>
<%
int t=0,m=0;
while(rs.next()){
t++;
%>
<tr onmouseover="this.style.color='#FF0000';" onmouseout="this.style.color='#000000';">
<td><label id="a<%=t%>"><%=rs.getString("username")%></label>


<td>
  <input type="text"  id="email<%=t%>" value=<%=rs.getString("email")%> /></td>
<td>	
  <input type="text"  id="selfinfo<%=t%>" value=<%=rs.getString("selfinfo")%> /></td>
<td>

<select id= "usertype<%=t%>">
<%
for(m=0;m<tempsize;m++){
%>
<option value="<%=fstatus[m]%>"  <%if(rs.getString(4).equals(fstatus[m]))out.println("selected");%>><%=statusname[m]%></option>
<%}%>
</select>
 </td>
 <td><select id= "verify<%=t%>">
   <option value="1" <%if(rs.getString("verify").equals("1"))out.println("selected");%>>正常</option>
   <option value="0" <%if(rs.getString("verify").equals("0"))out.println("selected");%>>禁用</option>
 </select>
 </td>       
 <td><input type="text"  id="ordernum<%=t%>" value="<%=rs.getString("ordernum")%>" />
 </td>                                                                                                                                                                                                                                                                                       
<td align="center" valign="middle"><input align="center"  type="button" class="btn btn-green big" value="修改状态" onclick="edituser(<%=t%>,'<%=UserName%>')"/></td>

</tr>
<%}%>
</table>
<p>
<%if(pageNow!=1){%><input align="center"  type="button" class="btn btn-green big" value="上一页" onclick="query(7,<%=(pageNow-1)%>,'<%=UserName%>')"/><%}%>
<%for(int i=1;i<=pageCount;i++){%><input align="center"  type="button" class="btn btn-green big" value="<%=i%>" onclick="query(7,<%=i%>,'<%=UserName%>')"/><%}%>
<%if(pageNow!=pageCount){%><input align="center"  type="button" class="btn btn-green big" value="下一页" onclick="query(7,<%=(pageNow+1)%>,'<%=UserName%>')"/><%}%>
</p></td>
  </tr>  
  </table>
<%}

} else     out.println ( "未登录!" );

}else     out.println ( "未登录!" );
data.disconnect_database();
}catch(Exception e){
out.println(e);
}
%>