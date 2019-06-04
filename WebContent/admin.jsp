<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://bootswatch.com/4/pulse/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>Mini Blog | Blog list</title>
</head>

<body>
  <nav class="navbar navbar-dark bg-primary">
    <div class="container">
      <a class="navbar-brand mb-0 h1" href="index.html">Mini Blog</a>
      <h6 class="mb-0 text-white">Welcome back, Tom</h6>
    </div>
  </nav>

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

  <footer class="bg-light py-4 px-4 fixed-bottom">
    <div class="container">
      <a href="edit.html" class="btn btn-primary px-3 mb-0">Add new post</a>
      <a href="index.html" class="btn btn-outline-primary mb-0 align-self-end px-3">Go back to homepage</a>
    </div>
  </footer>

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