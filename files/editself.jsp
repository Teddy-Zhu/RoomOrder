<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
 <%
String UserName = request.getParameter ( "loginusername" );
String CXUserName = request.getParameter ( "cxusername" );
if(data.isNullOrEmpty(UserName)) UserName=CXUserName;
String svalue=null,sname=null; 
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String email=request.getParameter("email");
String selfinfo=request.getParameter("selfinfo");
if(data.isNullOrEmpty(selfinfo)) selfinfo=""; else selfinfo = new String(selfinfo.getBytes("ISO-8859-1"), "UTF-8");
try{
if(UserName!=null){
Cookie cookies[]=request.getCookies();
Cookie sCookie=null; 
for(int i=0;i<cookies.length;i++){
sCookie=cookies[i];
if( UserName.equals(sCookie.getName())){
sname=sCookie.getName();
svalue=sCookie.getValue();}}
int n=data.authenticationlogin(sname,svalue);
if ( n==1){
String sql = "select * from userbasic WHERE username='"+CXUserName+"' and password='"+oldpassword+"'";
    ResultSet rs= data.executeQuerydate ( sql ); //返回查询结果
%>
<body class="ContentBody">
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >操作结果</th>

  </tr>
<td class="CPanel">

<h1>
<%
if(rs.next()){
String oldemail= rs.getString("email");
if(!data.isNullOrEmpty(newpassword) && !newpassword.equals(oldpassword)){
data.executeUpdatedate("update userbasic set password='"+newpassword+"' where username='"+CXUserName+"'");out.println("密码修改成功！");
} 
if(!data.isNullOrEmpty(email) && !email.equals(oldemail)){
data.executeUpdatedate("update userbasic set email='"+email+"' where username='"+CXUserName+"'");out.println("邮箱修改成功！");
}
if(data.isNullOrEmpty(newpassword) && email.equals(oldemail) ){
out.println("你未作任何修改！");
} else {if(newpassword.equals(oldpassword)&& email.equals(oldemail)) out.println("操作成功");
}
data.executeUpdatedate("update userbasic set selfinfo='"+selfinfo+"' where username='"+CXUserName+"'");
java.text.SimpleDateFormat crformatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date crcurrentTime = new java.util.Date();
String crstr_date = crformatter.format(crcurrentTime);
String crsql="更新了用户"+CXUserName+"的基本信息.";
data.executeUpdatedate("insert into logs (userid,sqltext,time) VALUES ( (select userid from userbasic where username='"+ UserName+"'),'"+crsql+"','"+crstr_date+"')");

}else { out.println("原密码错误！");}
data.disconnect_database();
%>
</h1>
	 </td>
  </tr>
  </table>

</div>
</body>

<%
}else   out.println ( "未登录!" );
} else{%>
<script type="text/javascript"> 

alert("您尚未登陆，请先登陆"); 
window.parent.location.href="../index.jsp"; 
</script> 
<%}
}
catch(Exception e)
{
out.println(e);
}
%>