<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:import url="header.jsp"/>
	
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/demo?useSSL=false&serverTimezone=CST" user="root" password="lomo81818" />
	<sql:query var="rs_post" dataSource="${db}">
		SELECT * from Posts LIMIT 5;
	</sql:query>
	
    <div class="jumbotron jumbotron-fluid mb-2">
      <div class="container">
        <h1 class="display-4">Here's a strange medium!</h1>
        <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
        <hr class="my-4">
        <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
        <a class="btn btn-primary btn-lg mt-4" href="about.jsp" role="button">Learn more</a>
      </div>
    </div>

    <div class="container d-flex flex-column">
      <h1 class="my-5">Recent Posts</h1>
      <div class="post-list">
      	<c:forEach var="post" items="${rs_post.rows}">
      		<div class="card mb-3">
	          <div class="card-body">
	            <h5 class="card-title">${post.post_title}</h5>
	            <h6 class="card-subtitle mb-2 text-muted">${post.post_categories}</h6>
	            <p class="card-text">${post.post_content.substring(0,10)}...</p>
	            <a href="single.jsp?post_id=${post.post_id}" class="card-link">Read more</a>
	          </div>
	        </div>
      	</c:forEach>
      </div>
      <a href="list.jsp" class="btn btn-outline-primary mb-4 align-self-end px-3">See all posts</a>
    </div>

<c:import url="footer.jsp"/>