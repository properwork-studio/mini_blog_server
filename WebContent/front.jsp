<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.util.List" %>
<c:import url="header.jsp"/>

    <div class="jumbotron jumbotron-fluid mb-2">
      <div class="container">
        <h1 class="display-4">Here's a strange medium!</h1>
        <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
        <hr class="my-4">
        <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
        <a class="btn btn-primary btn-lg mt-4" href="about" role="button">Learn more</a>
      </div>
    </div>

    <div class="container d-flex flex-column">
      <h1 class="my-5">Recent Posts</h1>
      <div class="post-list">
      	<c:if test="${indexListPosts != null }">
      		<c:forEach var="post" items="${indexListPosts}">
	      		<div class="card mb-3">
		          <div class="card-body">
		            <h5 class="card-title">${post.postTitle}</h5>
		            <h6 class="card-subtitle mb-2 text-muted">${post.postCategories}</h6>
		            <p class="card-text">${post.postContent.substring(0,40)}...</p>
		            <a href="post?post_id=${post.postID}" class="card-link">Read more</a>
		          </div>
		        </div>
	      	</c:forEach>
      	</c:if>
      	<c:if test="${indexListPosts == null}">
      		<h3 class="my-5 text-center">Have no posts yet or something is wrong....</h3>
      	</c:if>
      </div>
      <a href="list" class="btn btn-outline-primary mb-4 align-self-end px-3">See all posts</a>
    </div>

<c:import url="footer.jsp"/>