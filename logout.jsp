<%@ page language="java" contentType="text/html;charset=utf-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.Cookie"%>
<%
String UserName = request.getParameter("username");
Cookie deleteNewCookie=new Cookie(UserName,null);
deleteNewCookie.setMaxAge(0);
deleteNewCookie.setPath("/");
response.addCookie(deleteNewCookie);
response.sendRedirect("./index.jsp");
%>
