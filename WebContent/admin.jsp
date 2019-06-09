<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp"/>

  <div class="container d-flex flex-column mt-5">
    <!-- <h5 class="mt-5 mb-2 text-right">Welcome back Tom</h5> -->
    <h2 class="mb-5">Here's all your posts</h2>
    
    <table class="table mb-5">
      <thead class="thead-light">
        <tr>
          <th scope="col">Post ID</th>
          <th scope="col">Title</th>
          <th scope="col">Categories</th>
          <th scope="col">Content</th>
          <th scope="col" class="text-center">Operation</th>
        </tr>
      </thead>
      <tbody>
      	<c:forEach var="post" items="${listAdminPosts}">
      		<tr>
	          <th scope="row">${post.postID}</th>
	          <td>${post.postTitle}</td>
	          <td>${post.postCategories}</td>
	          <td>${post.postContent.substring(0,10)}...</td>
	          <td class="text-center">
	            <a href="edit?post_id=${post.postID}" class="mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></a>
	            <a href="" data-toggle="modal" data-target="#deleteConfirm-${post.postID}"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
	          </td>
	        </tr>
      	</c:forEach>
      </tbody>
    </table>
    <div class="align-self-center">
      <ul class="pagination">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&lt;</span>
          </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&gt;</span>
          </a>
        </li>
      </ul>
    </div>
  </div>
  
  <c:forEach var="deletePost" items="${listAdminPosts}">
	  <div class="modal fade" id="deleteConfirm-${deletePost.postID}" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmLabel"
	    aria-hidden="true">
	    <div class="modal-dialog" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title" id="deleteConfirmLabel">Are You Sure?</h5>
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
	          </button>
	        </div>
	        <div class="modal-body">
	          Are you sure you want to delete the post <b>"${deletePost.postTitle}"</b>?
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">Close</button>
	          <a href="delete?post_id=${deletePost.postID}" class="btn btn-primary btn-lg">Delete</a>
	        </div>
	      </div>
	    </div>
	  </div>
  </c:forEach>

  <c:import url="footer.jsp"/>