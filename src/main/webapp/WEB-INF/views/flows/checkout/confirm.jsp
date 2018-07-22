<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="cart" value="${order.cart}" />
<div class="row">
	<div class="col-md-6">
		<h2>Your cart</h2>
		<table>
			<thead>
				<tr>
					<td>Product</td>
					<td>Quantity</td>
					<td>Cost</td>
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
				<tr>
					<td><b>Total</b></b></td>
					<td></td>
					<td><b>${cart.totalCost}</b></td>
				</tr>
			</tbody>
		</table>
		<h3>Shipping Details</h3>
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
		<a href="${flowExecutionUrl}&_eventId_shipping"
			class="btn btn-secondary"> Edit Shipping Details </a>

	</div>
	<div class="col-md-6">
		<h3>Billing Details</h3>
		<h4>Card</h4>
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
		<h4>Address</h4>
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
		<a href="${flowExecutionUrl}&_eventId_billing"
			class="btn btn-secondary">Edit Billing Details</a>
	</div>
</div>

<a href="${flowExecutionUrl}&_eventId_home" class="btn btn-secondary">Go
	back home</a>
<a href="${flowExecutionUrl}&_eventId_save" class="btn btn-primary">Confirm
	order</a>
