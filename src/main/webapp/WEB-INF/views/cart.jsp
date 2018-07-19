<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart ${cart.id}</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<spring:url value='/resource/js/cart.js' />"></script>
 <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <!-- ... -->
</head>
<body>
	<div class="container">


		<div class="col-md-4 order-md-2 mb-4">
			<h4 class="d-flex justify-content-between align-items-center mb-3">
				<span class="text-muted">Your cart</span> <span id="cartItemsCount"
					class="badge badge-secondary badge-pill"></span>
			</h4>
			<ul id="cartItems" class="list-group mb-3">

			</ul>

			<form class="card p-2">
				<div class="input-group justify-content-between">
					<a href="<spring:url value='/products' />" class="btn btn-secondary">Products</a>
					<button id="checkoutBtn" class="btn btn-primary">Checkout</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>