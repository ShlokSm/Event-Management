<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*"%>
<%
Connection c= null;
PreparedStatement pst = null;
String Url = "jdbc:mysql://localhost/office";
String Username = "root";
String Pass = "";
try{
	

	Class.forName("com.mysql.cj.jdbc.Driver");
	c = DriverManager.getConnection(Url,Username,Pass);
	String id = request.getParameter("id");
	String accept = "EVENT ALLOTED.";
	String deny = "EVENT APPLICATION REJECTED";
	String Query = "update event set status = ? where id = ?";
	pst = c.prepareStatement(Query);
	pst.setString(1,accept);
	pst.setInt(2,Integer.parseInt(id));
	pst.executeUpdate();
	response.sendRedirect("admin.jsp");
}catch(Exception e){
e.printStackTrace();
}
%>