<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp"/>

<div class="jumbotron jumbotron-fluid mb-2">
  <div class="container">
    <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
    <hr class="my-4">
    <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
    <a class="btn btn-primary btn-lg mt-4" href="about" role="button">Learn more</a>
  </div>
</div>

<div class="container d-flex flex-column">
  <h1 class="my-5">All Posts</h1>
  <div class="post-list">
  	<c:forEach var="post" items="${listAllPosts}">
  		<div class="card mb-3">
	      <div class="card-body">
	        <h5 class="card-title">${post.postTitle}</h5>
	        <h6 class="card-subtitle mb-2 text-muted">${post.postCategories}</h6>
	        <p class="card-text">${post.postContent.substring(0,10)}</p>
	        <a href="single?post_id=${post.postID}" class="card-link">Read more</a>
	      </div>
	    </div>
  	</c:forEach>
  </div>

  <nav class="align-self-center mt-4">
    <ul class="pagination">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
</div>

<c:import url="footer.jsp"/>