<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RESULTS</title>
</head>
<body>
<center>
<h2 style="color:red;"><u><b>Participants Records</b></u></h2>
<table border="8">

<tr>
	<th>Event Name</th>
	<th>Event Location</th>
	<th>Number of Participants</th>
	<th>Event Holder Name</th>
	<th>Duration</th>
	<th>Payment Mode</th>
	<th>Event Type</th>
	<th>Application Status</th>
	<th>Accept</th>
	<th>Deny</th>
</tr> 

<%

Connection c= null;
PreparedStatement pst = null;
ResultSet rst = null;


String Url = "jdbc:mysql://localhost/office";
String Username = "root";
String Pass = "";
String Query = "select * from event";


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	c = DriverManager.getConnection(Url,Username,Pass);
	pst = c.prepareStatement(Query);
	rst = pst.executeQuery();
	while(rst.next()){
		%>
		<tr>
		<td><%=rst.getString("ename")%></td>
		<td><%=rst.getString("eloc")%></td>
		<td><%=rst.getString("nop")%></td>
		<td><%=rst.getString("ehn")%></td>
		<td><%=rst.getString("dur")%></td>
		<td><%=rst.getString("pay")%></td>
		<td><%=rst.getString("et")%></td>
		<td><%=rst.getString("status")%></td>
		<td><a href = "adminAccept.jsp?id=<%=rst.getInt("id") %>"><button>ACCEPT</button></a></td>
		<td><a href = "adminReject.jsp?id=<%=rst.getInt("id") %>"><button>DENY</button></a></td>
		
		
		
<% 
	}

}catch(Exception e){
	e.printStackTrace();
}

%>


</table>
</center>
</body>
</html>