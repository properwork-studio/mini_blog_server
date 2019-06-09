<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.lauren.miniblog.model.*, java.sql.Blob" %>
<c:import url="header.jsp"/>

<div class="jumbotron jumbotron-fluid mb-2">
  <div class="container">
    <h1 class="display-4">Here's a strange medium!</h1>
    <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
    <hr class="my-4">
    <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
  </div>
</div>

<div class="container d-flex flex-column">
  <h1 class="my-5">About this blog</h1>
  <div class="about-content">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec blandit lectus sit amet rutrum pellentesque. Integer at elementum eros, non varius dolor. Phasellus venenatis massa sit amet ipsum tristique, vitae eleifend massa fermentum. Ut faucibus lacinia mi, sit amet pharetra ex egestas vitae. Nunc dictum dictum ipsum. Etiam ultrices cursus nulla ut tempor. Aliquam pellentesque enim mi, vel semper ante dictum ut.</p>

    <p>interdum auctor augue, vitae dictum nulla tincidunt sit amet. Donec nibh enim, sagittis dictum augue vel, ullamcorper volutpat leo. Donec eu libero in metus blandit eleifend vel maximus leo. Nullam convallis justo sed justo gravida, non euismod nibh rhoncus. Fusce sed nibh augue. Duis aliquet fringilla arcu, at dapibus purus maximus in. Mauris id lacus ac est cursus lacinia vel a elit. Proin at sodales ipsum, sed tincidunt mauris. Duis vitae tristique ex. Sed aliquet arcu in elit rutrum auctor. Quisque et feugiat diam. Aenean lobortis felis dui, nec semper nisl pretium non. Proin viverra felis quis sem aliquet, sit amet blandit lorem commodo. Integer vulputate bibendum nisl, quis fringilla quam facilisis porttitor.</p>
  </div>
  <div class="authors-content mt-5 mb-5">
    <h2 class="mb-5">All the authors</h2>
    <div class="card-deck">
    	<c:forEach var="user" items="${listAllUsers}">
    		<div class="card">
    		<c:if test="${user.getUserImage() != null}">
    			<img src="showUserImage?user_id=${user.userID}" class="card-img-top">
    		</c:if>
    		<c:if test="${user.getUserImage() == null}">
    			<img src="https://fakeimg.pl/200x100/?retina=1&text=images&font=noto" class="card-img-top">
    		</c:if>
	        <div class="card-body">
	          <h5 class="card-title">${user.nickname}</h5>
	          <p class="card-text">${user.introduction}</p>
	          <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	        </div>
	      </div>
    	</c:forEach>
    </div>
  </div>
  <a href="list" class="btn btn-outline-primary mb-4 align-self-end px-3">See all posts</a>
</div>

<c:import url="footer.jsp"/>