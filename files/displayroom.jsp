<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
String UserName = request.getParameter ( "username" );
String roomlocal = request.getParameter ( "roomlocal" );
String roomtype = request.getParameter ( "roomtype" );
String s_pageNow= request.getParameter ("pageNow");
int pageNow=1,tempn=0,tempsize=0;
if( data.isNullOrEmpty(s_pageNow) ) return ; else { pageNow=Integer.parseInt(s_pageNow);  }
if(roomtype.equals("0")) roomtype=""; else {roomtype=" and roombasicinfo.roomtype ="+roomtype;}
if(data.isNullOrEmpty(roomlocal) || roomlocal.equals("0")) roomlocal=""; else {roomlocal=" and roombasicinfo.roomlocal like '%"+roomlocal+"%'";}
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
int rowCount=0;
int pageCount=0;
String sql = "select count(*) from `roombasicinfo`,roomtype WHERE roombasicinfo.roomtype=roomtype.roomtype "+ roomtype + roomlocal;
    ResultSet rs= data.executeQuerydate ( sql ); 
if(rs.next()){
rowCount=rs.getInt(1);
}

if(rowCount%pageSize==0){
pageCount=rowCount/pageSize;
}else{
pageCount=rowCount/pageSize+1;
}

ResultSet temprs=data.executeQuerydate("select count(*) from roomtype");
temprs.next();
tempsize=temprs.getInt(1);
 String[] statusname = new String[tempsize];
 String[] fstatus = new String[tempsize];
 temprs=data.executeQuerydate("select * from roomtype");
while(temprs.next()){  fstatus[tempn]=temprs.getString(1); statusname[tempn++]=temprs.getString(2);}
String sql2 ="SELECT *  from roombasicinfo,roomtype WHERE roombasicinfo.roomtype=roomtype.roomtype "+ roomtype + roomlocal +" order by roomlocal asc limit "+pageSize*(pageNow-1)+","+pageSize;
rs=data.executeQuerydate(sql2);
if(pageNow>pageCount) out.println("<h1>暂无数据</h1>"); else{
%>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" class="selftable" id="selftable">
<tr >
<th width="1000">教室</th>
<th width="1000">座位数</th>
<th width="2200">考试人数</th>
<th width="1000">教室类型</th>
<th width="1000">操作</th>
</tr>
<%
int t=0,m=0;
while(rs.next()){
t++;
%>
<tr onmouseover="this.style.color='#FF0000';" onmouseout="this.style.color='#000000';">
<td><label id="a<%=t%>"><%=rs.getString("roomlocal")%></label></td>

<td>
  <input type="text"  id="roomcount<%=t%>" value=<%=rs.getString("roomcount")%> /></td>
<td>	
  <input type="text"  id="examecount<%=t%>" value=<%=rs.getString("examecount")%> /></td>
  <td>
<select id= "roomtype<%=t%>">
<%
for(m=0;m<tempsize;m++){
%>
<option value="<%=fstatus[m]%>"  <%if(rs.getString("roombasicinfo.roomtype").equals(fstatus[m]))out.println("selected=\"selected\"");%>><%=statusname[m]%></option>
<%}%>
</select>
</td>    

     
                
				
<td align="center" valign="middle"><input align="center"  type="button" class="btn btn-green big" value="修改" onclick="editroominfo(<%=t%>,'<%=UserName%>')"/></td>

</tr>
<%}%>
</table>
<p>
<%if(pageNow!=1){%><input align="center"  type="button" class="btn btn-green big" value="上一页" onclick="query(5,<%=(pageNow-1)%>,'<%=UserName%>')"/><%}%>
<%for(int i=1;i<=pageCount;i++){%><input align="center"  type="button" class="btn btn-green big" value="<%=i%>" onclick="query(5,<%=i%>,'<%=UserName%>')"/><%}%>
<%if(pageNow!=pageCount){%><input align="center"  type="button" class="btn btn-green big" value="下一页" onclick="query(5,<%=(pageNow+1)%>,'<%=UserName%>')"/><%}%>
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