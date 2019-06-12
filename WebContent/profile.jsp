<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp"/>

	<form action="updateProfile" class="mt-5" enctype="multipart/form-data" method="post">
      <div class="container">
        <h4 class="mb-0">Add something to let everyone knows you better<br>Or not...</h4>
        <hr class="mt-4 mb-5">
        <div class="row">
          <div class="col-sm-4 profile__image">
          	<c:if test="${currentUserProfile.userImage == null}">
          		<img src="https://fakeimg.pl/150x100/?retina=1&text=images&font=noto" class="mb-3">
          	</c:if>
          	<c:if test="${currentUserProfile.userImage != null}">
          		<img src="showUserImage?user_id=${currentUserProfile.userID}" class="mb-3">
          	</c:if>
          </div>
          <div class="col-sm-8">
            <div class="form-group row">
              <label for="username" class="col-sm-2 col-form-label">Username</label>
              <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="username" name="username" value="${currentUserProfile.username}">
              </div>
            </div>
            <div class="form-group row">
              <label for="email" class="col-sm-2 col-form-label">E-mail</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" id="email" name="email" value="${currentUserProfile.email}">
              </div>
            </div>
            <div class="form-group row">
              <label for="nickname" class="col-sm-2 col-form-label">Nickname</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="nickname" name="nickname" value="${currentUserProfile.nickname}">
                <small class="form-text">This will be used as your author name</small>
              </div>
            </div>
            <div class="form-group row">
          <label for="image" class="col-sm-2 col-form-label">Feature Image</label>
          <div class="col-sm-10">
            <input type="file" class="form-control-file" id="image" name="image" placeholder="Upload your feature image..." required>
          </div>
        </div>
          </div>
        </div>
        <hr class="my-3 w-100">
        <div class="form-group">
          <h6 class="mb-3 mt-3">Write something about you...</h6>
          <textarea id="editor" name="introduction" class="form-control" rows="8" placeholder="Here goes again...">${currentUserProfile.introduction}</textarea>
        </div>
        <footer class="bg-light p-4 mt-5 fixed-bottom">
          <div class="container d-flex flex-column">
            <div class="btn-group align-self-end mb-0">
              <a href="admin" class="btn btn-outline-primary px-4 mr-2">Cancel</a>
              <button type="submit" class="btn btn-primary px-4">Save it</button>
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