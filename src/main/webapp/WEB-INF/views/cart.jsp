<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
				<br />
				<br />				
				<div>
					<span id="loadingMessage"></span>
					<button id="checkoutBtn" class="btn btn-primary">Checkout</button>
				</div>
			</div>
		</form>
	</div>
	<script src="<spring:url value='/resource/js/cart.js' />"></script>
</div>