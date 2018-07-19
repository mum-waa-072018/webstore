<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirm Checkout</title>
</head>
<body>
	<h1>Confirm Checkout</h1>
	
	<c:set var="cart" value="${order.cart}" />
	<h2>Cart ${cart.id} Total cost: ${cart.totalCost}</h2>
	<table>
		<thead>
			<tr>
				<td>Product</td>
				<td>Quantity</td>
				<td>Total cost</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cartItem" items="${cart.items}">
				<tr>
					<td>${cartItem.product.title}</td>
					<td>${cartItem.quantity}</td>
					<td>${cartItem.cost}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<h2>Shipping Details</h2>
	<c:set var="shippingAddress" value="${order.shippingAddress}" />
	<a href="${flowExecutionUrl}&_eventId_shipping">Edit Shipping
		Details</a>
	<p>
		<spring:message code="Label.Address.Street" text="Street" />
		: ${shippingAddress.street}
	</p>
	<p>
		<spring:message code="Label.Address.City" text="City" />
		: ${shippingAddress.city}
	</p>
	<p>
		<spring:message code="Label.Address.State" text="State" />
		: ${shippingAddress.state}
	</p>
	<p>
		<spring:message code="Label.Address.ZipCode" text="ZipCode" />
		: ${shippingAddress.zipCode}
	</p>


	<h2>Billing Details</h2>
	<c:set var="billingInfo" value="${order.billingInfo}" />
	<a href="${flowExecutionUrl}&_eventId_billing">Edit Billing Details</a>
	<h3>Card</h3>
	<p>
		<spring:message code="Label.Card.Name" text="Name" />
		: ${billingInfo.card.name}
	</p>
	<p>
		<spring:message code="Label.Card.Number" text="Number" />
		: ${billingInfo.card.number}
	</p>
	<p>
		<spring:message code="Label.Card.CCV" text="CVV" />
		: ${billingInfo.card.ccv}
	</p>
	<h3>Address</h3>
	<p>
		<spring:message code="Label.Address.Street" text="Street" />
		: ${billingInfo.billingAddress.street}
	</p>
	<p>
		<spring:message code="Label.Address.City" text="City" />
		: ${billingInfo.billingAddress.city}
	</p>
	<p>
		<spring:message code="Label.Address.State" text="State" />
		: ${billingInfo.billingAddress.state}
	</p>
	<p>
		<spring:message code="Label.Address.ZipCode" text="ZipCode" />
		: ${billingInfo.billingAddress.zipCode}
	</p>

	<a href="${flowExecutionUrl}&_eventId_home">Home</a>
	<a href="${flowExecutionUrl}&_eventId_success">Confirm</a>
</body>
</html>