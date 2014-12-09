<jsp:useBean id="data" scope="page" class="Datebase.DataBase"/>
<jsp:setProperty name="data" property="*"/>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%
try{
ResultSet rs=data.executeQuerydate("select * from usertype where power<>1");
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=gbk" />
<title>Admin</title>
<!-- Favicons --> 
<link rel="shortcut icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="apple-touch-icon" HREF="img/favicons/apple.png" />
<!-- Main Stylesheet --> 
<link rel="stylesheet" href="css/style.css" type="text/css" />

<!-- Your Custom Stylesheet --> 
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<!--swfobject - needed only if you require <video> tag support for older browsers -->
<script src="http://libs.baidu.com/jquery/1.4.4/jquery.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>
<!-- jQuery tooltips -->
<script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>
<!-- Superfish navigation -->
<script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>
<script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>
<!-- jQuery form validation -->
<script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>
<!-- jQuery popup box -->
<script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>

<!-- Internet Explorer Fixes --> 
<!--[if IE]>
<link rel="stylesheet" type="text/css" media="all" href="css/ie.css"/>
<script src="js/html5.js"></script>
<![endif]-->
<!--Upgrade MSIE5.5-7 to be compatible with MSIE8: http://ie7-js.googlecode.com/svn/version/2.1(beta3)/IE8.js -->
<!--[if lt IE 8]>
<script src="js/IE8.js"></script>
<![endif]-->
<script type="text/javascript">
function check(){
var username=document.getElementById("username").value;//密码
var password=document.getElementById("password").value;//第一次密码
var repassword=document.getElementById("repassword").value;
var email=document.getElementById("email").value;
if (password.length==0 || username.length==0 || repassword.length==0) {
alert("请输入完整的注册条件！");
return false;
}
if(!(password==repassword)){
alert("两次密码输入不一致，请重新输入");
return false;
}
return true;
}
</script>
</head>
<body>
	<!-- Header -->
	<header id="top">
		<div class="wrapper-login">
			<!-- Title/Logo - can use text instead of image -->
			<div id="title"><img SRC="img/logo.png" alt="Administry" /><!--<span>Administry</span> demo--></div>
			<!-- Main navigation -->
			<nav id="menu">
				<ul class="sf-menu">
					<li><a href="index.jsp">登陆</a></li>
					<li class="current"><a href="register.jsp">注册</a></li>
				</ul>
			</nav>
			<!-- End of Main navigation -->
			<!-- Aside links -->
			<aside><b>中文</b> &middot; <a href="#">English</a></aside>
			<!-- End of Aside links -->
		</div>
	</header>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper-login"></div>
	</div>
	<!-- End of Page title -->
	
	<!-- Page content -->
	<div id="page">
		<!-- Wrapper -->
		<div class="wrapper-login">
				<!-- Login form -->
				<section class="full">					
					
					<h3>注册用户</h3>
					
					<div class="box box-info">欢迎使用南航金城教室预约系统</div>

					<form id="regform" method="post" action="./regpost.jsp">
						<p>
						<label class="required" for="usertype">选择您的身份:</label>
					    <select name="usertype" id="usertype">
						<option value="100">------------------------请选择---------------------</option>
						<% while(rs.next()){%>
						<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
						<%}%>
                        </select>
                        <p>

						<p>
							<label class="required" for="username">用户名:</label><br/>
							<input type="text" id="username" class="full" value="" name="username"/>
						</p>
						
						<p>
							<label class="required" for="password">密码:</label><br/>
							<input type="password" id="password" class="full" value="" name="password"/>
						</p>
						
						<p>
							<label class="required" for="repassword">确认密码:</label><br/>
							<input type="password" id="repassword" class="full" value="" name="repassword"/>
						</p>
						
						<p>
							<label class="required" for="email">Email:</label><br/>
                            <input type="text" id="email" class="full2" value="" name="email"/>
						</p>
						
						<p>
						<input type="submit" class="btn btn-green big" value="注册" onclick="return check()"/> <input type="reset" class="btn btn-green big" value="重置"/>
						</p>
						<div class="clear">&nbsp;</div>

					</form>

				</section>
				<!-- End of login form -->
				
		</div>
		<!-- End of Wrapper -->
	</div>
	<!-- End of Page content -->

	<!-- Page footer -->
	<footer id="bottom">
		<div class="wrapper-login">
			<p>Copyright &copy; 2014 <b></p>
		</div>
	</footer>
	<!-- End of Page footer -->

<!-- User interface javascript load -->

<script src="js/emailAutoComplete.js"></script>
<script>$(".full2").mailAutoComplete();</script>
<script type="text/javascript" SRC="js/administry.js"></script>
</body>
</html>
<%
data.disconnect_database();
}catch(Exception e){
out.println(e);
}
%>