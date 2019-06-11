<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://bootswatch.com/4/pulse/bootstrap.min.css">
    <link rel="stylesheet" href="./css/style.css">
    <style>
    	<%@ include file="./css/style.css" %>
    </style>
    <title>Mini Blog | Admin Login</title>
</head>
<body>
  <div class="landing__container">
    <div class="landing__form">
      <h3 class="text-center">Welcome back author...</h3>
      <h6 class="text-center">If you are nobody, then go back to our <a href="/FinalProject">homepage</a> to read our blog!</h6>
      <hr class="my-4 w-100">
      <%
      	if(request.getParameter("login_error")!=null) {
      		String loginError = (String)request.getParameter("login_error");
          	System.out.println(loginError);
      	
      		if(loginError.equals("true")) { %>
      	<div class="alert alert-dismissible alert-danger">
	        <button type="button" class="close" data-dismiss="alert">&times;</button>
	        <strong>Oh snap!</strong>
	        <p class="mb-0">Username or password incorrect!</p>
	      </div>
      	<%} }
      %>
      <form action="toLogin" class="d-flex flex-column" method="post">
        <div class="form-group row">
          <label for="username" class="col-sm-2 col-form-label">Username</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username">
          </div>
        </div>
        <div class="form-group row">
          <label for="password" class="col-sm-2 col-form-label">Password</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
            <small class="form-text text-muted">If you forget your password, say goodbye to all your posts...</small>
          </div>
        </div>
        <button type="submit" class="btn btn-outline-primary align-self-end px-5">Sign in</button>
        <p class="text-right mt-3">If you want to join us, please <a href="signup">Sign up</a> NOW!</p>
      </form>
    </div>
  </div>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>