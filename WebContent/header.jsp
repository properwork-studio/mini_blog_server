<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://bootswatch.com/4/pulse/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <style>
    	<%@ include file="./css/style.css" %>
    </style>
    <title>Mini Blog</title>
</head>
<body>
    <nav class="navbar navbar-dark bg-primary">
      <div class="container">
        <a class="navbar-brand mb-0 h1 mr-auto" href="/FinalProject">Mini Blog</a>
        <%
        	String username = (String)session.getAttribute("currentUserName");
        	if(username != null && !username.equals("")) {
        		out.print("<h6 class=\"mb-0 text-white\">Welcome back, <a class=\"text-white\" href=\"admin\">" + username + "</a></h6>");
        		out.print("<a href=\"login.jsp\" class=\"btn btn-outline-secondary px-3 mb-0 ml-3\">Logout</a>");
        	}
        %>
      </div>
    </nav>