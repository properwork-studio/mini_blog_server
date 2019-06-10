<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test DB Connection</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo?useSSL=false&serverTimezone=CST" user="root" password="lomo81818" />
	<sql:query var="rs" dataSource="${db}">
		SELECT * from Users;
	</sql:query>
	<sql:query var="rs_post" dataSource="${db}">
		SELECT * from Posts;
	</sql:query>
	<div class="container mt-5">
	<img src="img/nat-8.jpg">
		<h1 class="display-4 mb-4">Users Table</h1>
		<table class="table mb-5">
		  <thead>
		    <tr>
		      <th scope="col">user ID</th>
		      <th scope="col">username</th>
		      <th scope="col">password</th>
		      <th scope="col">email</th>
		      <th scope="col">nickname</th>
		      <th scope="col">introduction</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var="table" items="${rs.rows}">
		  		<tr>
			      <th scope="row">${table.user_id}</th>
			      <td>${table.username}</td>
			      <td>${table.user_password}</td>
			      <td>${table.email}</td>
			      <td>${table.nickname}</td>
			      <td>${table.introduction}</td>
			    </tr>
		  	</c:forEach>
		  </tbody>
		</table>
		<hr class="my-5">
		<h1 class="display-4 mb-4">Posts Table</h1>
		<table class="table mb-5">
		  <thead>
		    <tr>
		      <th scope="col">post ID</th>
		      <th scope="col">Post Title</th>
		      <th scope="col">Post Categories</th>
		      <th scope="col">Post Content</th>
		      <th scope="col">Author</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var="table_post" items="${rs_post.rows}">
		  		<sql:query var="rs_author" dataSource="${db}">
					SELECT nickname from Users where user_id=${table_post.author_id};
				</sql:query>
		  		<tr>
			      <th scope="row">${table_post.post_id}</th>
			      <td>${table_post.post_title}</td>
			      <td>${table_post.post_categories}</td>
			      <td>${table_post.post_content}</td>
			      <c:forEach var="row_author" items="${rs_author.rows}">
			      	<td>${row_author.nickname}</td>
			      </c:forEach>
			    </tr>
		  	</c:forEach>
		  </tbody>
		</table>
	</div>
	
</body>
</html>