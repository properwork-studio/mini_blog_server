<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp"/>

  <div class="container d-flex flex-column mt-5">
    <!-- <h5 class="mt-5 mb-2 text-right">Welcome back Tom</h5> -->
    <h2 class="mb-5">Here's all your posts</h2>
    
    <table class="table mb-5">
      <thead class="thead-light">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Title</th>
          <th scope="col">Categories</th>
          <th scope="col">Published Date</th>
          <th scope="col" class="text-center">Operation</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>Post title</td>
          <td>post category1, post category2</td>
          <td>2019.05.30</td>
          <td class="text-center">
            <a href="edit.html" class="mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></a>
            <a href="" data-toggle="modal" data-target="#deleteConfirm"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
          </td>
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Post title</td>
          <td>post category2, post category3</td>
          <td>2019.05.27</td>
          <td class="text-center">
            <a href="edit.html" class="mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></a>
            <a href="" data-toggle="modal" data-target="#deleteConfirm"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
          </td>
        </tr>
        <tr>
          <th scope="row">3</th>
          <td>Post title</td>
          <td>post category1, post category3</td>
          <td>2019.05.20</td>
          <td class="text-center">
            <a href="edit.html" class="mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></a>
            <a href="" data-toggle="modal" data-target="#deleteConfirm"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
          </td>
        </tr>
        <tr>
          <th scope="row">4</th>
          <td>Post title</td>
          <td>post category2, post category3</td>
          <td>2019.05.15</td>
          <td class="text-center">
            <a href="edit.html" class="mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></a>
            <a href="" data-toggle="modal" data-target="#deleteConfirm"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
          </td>
        </tr>
        <tr>
          <th scope="row">5</th>
          <td>Post title</td>
          <td>post category1, post category3</td>
          <td>2019.05.01</td>
          <td class="text-center">
            <a href="edit.html" class="mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></a>
            <a href="" data-toggle="modal" data-target="#deleteConfirm"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
          </td>
        </tr>
        <tr>
          <th scope="row">6</th>
          <td>Post title</td>
          <td>post category2, post category3</td>
          <td>2019.04.29</td>
          <td class="text-center">
            <a href="edit.html" class="mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></a>
            <a href="" data-toggle="modal" data-target="#deleteConfirm"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
          </td>
        </tr>
        <tr>
          <th scope="row">7</th>
          <td>Post title</td>
          <td>post category1, post category2</td>
          <td>2019.04.20</td>
          <td class="text-center">
            <a href="edit.html" class="mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></a>
            <a href="" data-toggle="modal" data-target="#deleteConfirm"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
          </td>
        </tr>
        <tr>
          <th scope="row">8</th>
          <td>Post title</td>
          <td>post category1, post category3</td>
          <td>2019.04.17</td>
          <td class="text-center">
            <a href="edit.html" class="mr-3"><i class="fa fa-pencil" aria-hidden="true"></i></a>
            <a href="" data-toggle="modal" data-target="#deleteConfirm"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
          </td>
        </tr>
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
  
  <div class="modal fade" id="deleteConfirm" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmLabel"
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
          Are you sure you want to delete this customer?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">Close</button>
          <a href="#" class="btn btn-primary btn-lg">Delete</a>
        </div>
      </div>
    </div>
  </div>

  <c:import url="footer.jsp"/>