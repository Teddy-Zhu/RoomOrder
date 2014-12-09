<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
String UserName = request.getParameter ( "username" );
String enable = request.getParameter ( "enable" );
String date = request.getParameter ( "date" );
String roomtype = request.getParameter ( "roomtype" );
String yyusername = request.getParameter ( "yyusername" );
String lendtime = request.getParameter ( "lendtime" );
String sqdate = request.getParameter ( "sqdate" );
String s_pageNow= request.getParameter ("pageNow");
int pageNow=1,tempn=0,tempsize=0;
if( data.isNullOrEmpty(s_pageNow) ) return ; else { pageNow=Integer.parseInt(s_pageNow);  }
if(!data.isNullOrEmpty(yyusername))  yyusername= " and roomorderinfo.userid = (select userid from userbasic where username ='"+yyusername+"') ";
if(enable.equals("0")) enable=""; else {enable=" and roomorderinfo.status="+enable;}
if(roomtype.equals("0")) roomtype=""; else {roomtype=" and roombasicinfo.roomtype ="+roomtype;}
if(lendtime.equals("0")) lendtime=""; else {lendtime=" and roomorderinfo.lendtime ="+lendtime;}
if(!data.isNullOrEmpty(sqdate))  sqdate=" and roomorderinfo.sqdate ='"+sqdate +"'";
if(!data.isNullOrEmpty(date))  date=" and sqdate='"+date+"'";
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
String sql = "select count(*) from roomorderinfo,roombasicinfo where roomorderinfo.roomlocal=roombasicinfo.roomlocal and roomid > 0"+ yyusername + enable + date + roomtype +lendtime + sqdate;
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
ResultSet temprs=data.executeQuerydate("select count(*) from statustype");
temprs.next();
tempsize=temprs.getInt(1);
 String[] statusname = new String[tempsize];
 String[] fstatus = new String[tempsize];
 temprs=data.executeQuerydate("select status,statusname from statustype");
while(temprs.next()){  fstatus[tempn]=temprs.getString(1); statusname[tempn++]=temprs.getString(2);}
String sql2 ="SELECT * FROM roomorderinfo ,classtimetype ,statustype ,userbasic,roombasicinfo WHERE roomorderinfo.roomlocal=roombasicinfo.roomlocal and roomorderinfo.userid =  userbasic.userid AND roomorderinfo.lendtime =  classtimetype.lendtime AND roomorderinfo.status =  statustype.status "+yyusername+date+ enable + roomtype +lendtime + sqdate +" order by roomid asc limit "+pageSize*(pageNow-1)+","+pageSize;
rs=data.executeQuerydate(sql2);
if(pageNow>pageCount) out.println("<h1>暂无数据</h1>"); else{
%>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" class="selftable" id="selftable">
<tr >
<th width="1000">ID</th>
<th width="1000">教室</th>
<th width="1000">租借人</th>
<th width="2200">租借原因</th>
<th width="1000">租借日期</th>
<th width="1000">租借时间</th>
<th width="1000">申请时间</th>
<th width="1000">是否审核</th>
<th width="1000">操作</th>
</tr>
<%
int t=0,m=0;
while(rs.next()){
t++;
%>
<tr onmouseover="this.style.color='#FF0000';" onmouseout="this.style.color='#000000';">
<td><label id="a<%=t%>"><%=rs.getString("roomid")%></label></td>
<td><%=rs.getString("roomlocal")%></td>
<td><%=rs.getString("username")%></td>
<td><%=rs.getString("orderfor")%></td>
<td><nobr><%=rs.getString("lenddate")%></nobr></td>
<td><nobr><%=rs.getString("realtime")%></nobr></td>
<td><nobr><%=rs.getString("sqdate")%></nobr></td>
<td>
<select id= "b<%=t%>">
<%
for(m=0;m<tempsize;m++){
%>
<option value="<%=fstatus[m]%>"  <%if(rs.getString("statusname").equals(statusname[m]))out.println("selected=\"selected\"");%>><%=statusname[m]%></option>
<%}%>
</select>
</td>         
                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
<td align="center" valign="middle"><input align="center"  type="button" class="btn btn-green big" value="修改状态" onclick="display('<%=UserName%>',<%=t%>)"/></td>

</tr>
<%}%>
</table>
<p>
<%if(pageNow!=1){%><input align="center"  type="button" class="btn btn-green big" value="上一页" onclick="query(3,<%=(pageNow-1)%>,'<%=UserName%>')"/><%}%>
<%for(int i=1;i<=pageCount;i++){%><input align="center"  type="button" class="btn btn-green big" value="<%=i%>" onclick="query(3,<%=i%>,'<%=UserName%>')"/><%}%>
<%if(pageNow!=pageCount){%><input align="center"  type="button" class="btn btn-green big" value="下一页" onclick="query(3,<%=(pageNow+1)%>,'<%=UserName%>')"/><%}%>
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