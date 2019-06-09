<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="com.lauren.miniblog.model.*, java.sql.Blob" %>
<c:import url="header.jsp"/>


<div class="feature__image">
	<%
		Post post = (Post)session.getAttribute("current");
		Blob image = post.getPostImage();
		if(image != null) {
			out.print("<img src=\"showPostImage\" class=\"w-100\">");
		} else {
			out.print("<img src=\"https://fakeimg.pl/800x300/?retina=1&text=images&font=noto\" class=\"w-100\">");
		}
	%>
</div>
<div class="container mt-5 pt-2 d-flex flex-column">
  <h1 class="mb-3">${currentPost.postTitle}</h1>
  <h6 class="mb-1 text-muted">${currentPost.postCategories}</h6>
  <small class="text-muted">Post published at 2019.05.30</small>
  <div class="post-content my-5">
  	${currentPost.postContent}
  </div>

  <a href="list" class="btn btn-outline-primary align-self-end px-3">Back to list</a>

  <hr class="my-5 w-100">

  <div class="more-posts">
    <h3 class="mb-4">More posts...</h3>
    <div class="row">
      <div class="col-md-6">
		<c:if test="${previousPost != null}">
      		<div class="card mb-3">
	          <div class="card-body">
	            <h5 class="card-title">${previousPost.postTitle}</h5>
	            <h6 class="card-subtitle mb-2 text-muted">${previousPost.postCategories}</h6>
	            <p class="card-text">${previousPost.postContent.substring(0,10)}</p>
	            <a href="post?post_id=${previousPost.postID}" class="card-link">Read more</a>
	          </div>
	        </div>
		</c:if>
      </div>
      <div class="col-md-6">
		  <c:if test="${nextPost != null}">
      		<div class="card mb-3">
	          <div class="card-body">
	            <h5 class="card-title">${nextPost.postTitle}</h5>
	            <h6 class="card-subtitle mb-2 text-muted">${nextPost.postCategories}</h6>
	            <p class="card-text">${nextPost.postContent.substring(0,10)}</p>
	            <a href="post?post_id=${nextPost.postID}" class="card-link">Read more</a>
	          </div>
	        </div>
		  </c:if>
      </div>
    </div>
  </div>
  
</div>

<c:import url="footer.jsp"/>