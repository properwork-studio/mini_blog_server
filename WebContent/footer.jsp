<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <c:choose>
    	<c:when test="${isAdminPage}">
    		<footer class="bg-light py-4 px-4 fixed-bottom">
			    <div class="container d-flex">
			      <a href="new" class="btn btn-primary px-3 mb-0 mr-2">Add new post</a>
			      <a href="profile" class="btn btn-primary px-4 mb-0">Edit profile</a>
			      <a href="/FinalProject" class="btn btn-outline-primary mb-0 px-3 ml-auto">Go back to homepage</a>
			    </div>
			  </footer>
    	</c:when>
    	<c:otherwise>
    		<footer class="bg-light p-4 mt-5">
		      <div class="container my-4">
		      	<%
		    		String username = (String)session.getAttribute("currentUserName");
		        	if(username != null && !username.equals("")) {
		        		out.print("<p class=\"text-center mb-1\">If you want to logout, <a href=\"logout\">here to go</a></p>");
		        	} else {
		        		out.print("<p class=\"text-center mb-1\">If you're author, please login <a href=\"login\">here</a></p>");
		        	}
		        %>
		        <p class="text-center">See more about those author, please check out the <a href="about">about us</a> page</p>
		      </div>
		    </footer>
    	</c:otherwise>
    </c:choose>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>