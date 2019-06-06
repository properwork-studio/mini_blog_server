<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="header.jsp"/>

<div class="feature__image">
  <img src="https://fakeimg.pl/800x300/?retina=1&text=images&font=noto" class="w-100">
</div>
<div class="container mt-5 pt-2 d-flex flex-column">
  <h1 class="mb-3">Single post title</h1>
  <h6 class="mb-1 text-muted">single post categories</h6>
  <small class="text-muted">Post published at 2019.05.30</small>
  <div class="post-content my-5">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla metus risus, ultrices sed aliquet at, dapibus sit amet nulla. Vivamus eget nisl tellus. In volutpat arcu non lectus congue, at faucibus lorem commodo. Suspendisse varius dolor et orci iaculis, facilisis faucibus ante porttitor. Vestibulum tincidunt vitae purus eu interdum. Mauris faucibus elit ante, in finibus orci bibendum id. Sed id tellus ut dui pulvinar tincidunt. Quisque laoreet risus nunc. Duis bibendum luctus erat, a placerat turpis cursus et. Aliquam erat volutpat. Donec odio neque, finibus in fringilla nec, porttitor et felis.</p>

    <p>iaculis quis magna sit amet suscipit. Nullam varius tempus vehicula. Praesent aliquam magna justo, ut scelerisque nisi molestie a. Pellentesque sodales, nisi vel vestibulum posuere, neque purus vulputate quam, nec accumsan ante lorem a massa. Donec volutpat vitae neque sit amet iaculis. Vivamus a diam id mi tempor convallis. Sed lobortis tellus non erat ultricies facilisis. Pellentesque nibh nulla, ornare ac lobortis iaculis, laoreet in neque. Praesent elementum elementum neque, at mattis risus accumsan quis. Aliquam hendrerit sodales faucibus.</p>
    
    <p>Donec vitae pharetra metus. Duis tincidunt mi varius, ullamcorper neque quis, feugiat mi. Proin tristique sem a nulla ultricies, nec dapibus dui mollis. Nam ac varius est. Nunc imperdiet turpis eget vehicula convallis. Suspendisse finibus dolor quam, convallis dictum massa hendrerit a. Curabitur maximus arcu sit amet purus consequat, sed lacinia nisi rutrum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    
    <p>Nam malesuada laoreet ligula, quis pellentesque nunc tincidunt non. Vestibulum porta, ex suscipit bibendum semper, ipsum nunc pretium ligula, in auctor felis nisi a metus. Sed ornare massa eu nulla dignissim blandit. Donec ultrices justo nec enim luctus maximus. Ut sollicitudin nisl ac tempor vulputate. Suspendisse at rhoncus lectus. Mauris a venenatis ligula. Nam id felis elit. In viverra elit maximus, vulputate diam vel, tempor libero. Vestibulum tempor leo quis finibus sollicitudin.</p>
  </div>

  <a href="list.html" class="btn btn-outline-primary align-self-end px-3">Back to list</a>

  <hr class="my-5 w-100">

  <div class="more-posts">
    <h3 class="mb-4">More posts...</h3>
    <div class="row">
      <div class="col-md-6">
        <div class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">Post title</h5>
            <h6 class="card-subtitle mb-2 text-muted">Post categories</h6>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="single.html" class="card-link">Read more</a>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">Post title</h5>
            <h6 class="card-subtitle mb-2 text-muted">Post categories</h6>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="single.html" class="card-link">Read more</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  
</div>

<c:import url="footer.jsp"/>