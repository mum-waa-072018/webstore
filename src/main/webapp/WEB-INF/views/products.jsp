<%@ include file="template/header.jspf"%>
    <main role="main">  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Products</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<link rel="stylesheet" href="<spring:url value='/resource/js/holder.min.js' />">
  <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="<spring:url value='/resource/js/product.js' />"></script>
</head>
<body>
	<header>      
      <div class="navbar navbar-dark bg-dark box-shadow">
        <div class="container d-flex justify-content-between">
          <a href="#" class="navbar-brand d-flex align-items-center">
          	<img width="30" height="30" id="logo" alt="logo" src="<spring:url value='/resource/images/logo.png' />">            
            <strong>Lightning - Fast & Influential</strong>
          </a>
          <span class="navbar-brand d-flex align-items-right">
          	<a href="?language=en" ><spring:message code="label.lang.en" /></a> &nbsp;||&nbsp;
          	<a href="?language=fr" ><spring:message code="label.lang.fr" /></a>&nbsp;||&nbsp; 
          	<a href="?language=de" ><spring:message code="label.lang.de" /></a>
          </span>
        </div>
      </div>
      
    </header>
    <main role="main">
      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Lightning Store</h1>
          <p class="lead text-muted">Welcome to our store! View our broad variety of products below and add them to your cart to buy. </p>
          <p>
            <a id="viewCart" href="<spring:url value='/cart' />" class="btn btn-primary my-2">View your cart - <span id="cartItemsCount"></span> item(s)</a>
          </p>
        </div>
      </section>
      <div class="album py-5 bg-light">
        <div class="container">
          <div class="row">
	          <c:forEach items="${products}" var="product">          
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
	                <div class="card-body">
	                <p class="card-text">${product.title}</p>
	                  <p class="card-text">${product.description}</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="btn-group">
	                      <%--<button type="button" class="btn btn-sm btn-outline-secondary">View Details</button>--%>
	                      <button type="button" class="btn btn-sm btn-outline-secondary addToCartBtn" 
	                      	data-product='{"id":${product.id}, "title":"${product.title}", "description":"${product.description}", "condition":"${product.conditions}", "price":${product.price}, "quantity":${product.quantity}}' >
	                      	<spring:message code="product.addToCart" /></button>
                          <button type="button" class="btn btn-sm btn-outline-secondary" onclick="contact()"><spring:message code="product.contactSeller" /></button>
	                    </div>
	                    <small class="text-muted"><spring:message code="product.currency" />${product.price} </small>
	                  </div><br>
	                  <small id="addedToCartNotification${product.id}" class="addToCartBtn text-success">...</small>
	                </div>
	              </div>
	            </div>
	            </c:forEach>
          </div>
        </div>
      </div>
    </main>
<%@ include file="template/footer.jspf"%>   