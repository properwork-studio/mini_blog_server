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
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jodit/3.1.39/jodit.min.css">
  <script src="//cdnjs.cloudflare.com/ajax/libs/jodit/3.1.39/jodit.min.js"></script>
  <title>Mini Blog | Edit post</title>
</head>

<body>
  <nav class="navbar navbar-dark bg-primary mb-5">
    <div class="container">
      <a class="navbar-brand mb-0 h1" href="index.html">Mini Blog</a>
    </div>
  </nav>

	<c:if test="${currentPost != null}">
		<form action="update" method="post" enctype="multipart/form-data">
	</c:if>
	<c:if test="${currentPost == null}">
		<form action="add" method="post" enctype="multipart/form-data">
	</c:if>
      <div class="container">
      	<c:if test="${currentPost != null}">
			<h3 class="my-5">Now edit - ${currentPost.postTitle}</h3>
		</c:if>
		<c:if test="${currentPost == null}">
			<h3 class="my-5">Add a new post</h3>
		</c:if>
        <div class="form-group row">
          <label for="title" class="col-sm-2 col-form-label">Title</label>
          <div class="col-sm-10">
          	<c:if test="${currentPost != null}">
				<input type="text" class="form-control" id="title" name="post_title" placeholder="Enter the post title" value="${currentPost.postTitle}">
				<input type="hidden" name="post_id" value="${currentPost.postID}">
			</c:if>
			<c:if test="${currentPost == null}">
				<input type="text" class="form-control" id="title" name="post_title" placeholder="Enter the post title">
			</c:if>
          </div>
        </div>
        <div class="form-group row">
          <label for="categorie" class="col-sm-2 col-form-label">Categories</label>
          <div class="col-sm-10">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Heroic" id="heroic" name="post_categories" checked>
              <label class="form-check-label" for="heroic">Marvel/DC</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Action" id="action" name="post_categories">
              <label class="form-check-label" for="action">Action</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Horror" id="horror" name="post_categories">
              <label class="form-check-label" for="horror">Horror</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Comedy" id="comedy" name="post_categories">
              <label class="form-check-label" for="comedy">Comedy</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Fiction" id="fiction" name="post_categories">
              <label class="form-check-label" for="fiction">Fiction</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Romance" id="romance" name="post_categories">
              <label class="form-check-label" for="romance">Romance</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="Animate" id="animate" name="post_categories">
              <label class="form-check-label" for="animate">Animate</label>
            </div>
          </div>
        </div>
        <div class="form-group row">
          <label for="image" class="col-sm-2 col-form-label">Feature Image</label>
          <div class="col-sm-10">
            <input type="file" class="form-control-file" id="image" name="post_image" placeholder="Upload an feature image for your post...">
          </div>
        </div>
        <hr class="my-3 w-100">
        <div class="form-group">
          <h6 class="mb-3 mt-3">Here's where your content goes...</h6>
          <c:if test="${currentPost != null}">
				<textarea id="editor" name="post_content" value="${currentPost.postContent}">${currentPost.postContent}</textarea>
				<script>var editor = new Jodit('#editor');</script>
			</c:if>
			<c:if test="${currentPost == null}">
				<textarea id="editor" name="post_content"></textarea>
          		<script>var editor = new Jodit('#editor');</script>
			</c:if>
        </div>
        <footer class="bg-light p-4 mt-5 fixed-bottom">
          <div class="container d-flex flex-column">
            <div class="btn-group align-self-end mb-0">
              <a href="admin" class="btn btn-outline-primary px-4 mr-2">Cancel</a>
              <button type="submit" class="btn btn-primary px-4">Post it</button>
            </div>
          </div>
        </footer>
      </div>
    </form>
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
</body>

</html>