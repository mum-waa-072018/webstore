<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<form:form method="POST" modelAttribute="billingInfo">
	<div class="row">
		<div class="col-md-6">
			<div class="col-md-8">
				<h2>Billing Address Details</h2>
				<div>
					<div class="form-group">
						<form:label for="street" path="billingAddress.street">
							<spring:message code="Label.Address.Street" text="Street" />
						</form:label>
						<form:input id="street" path="billingAddress.street"
							class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="billingAddress.street" />
						</small>
					</div>

					<div class="form-group">
						<form:label for="city" path="billingAddress.city">
							<spring:message code="Label.Address.City" text="City" />
						</form:label>
						<form:input id="city" path="billingAddress.city"
							class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="billingAddress.city" />
						</small>
					</div>

					<div class="form-group">
						<form:label for="state" path="billingAddress.state">
							<spring:message code="Label.Address.State" text="State" />
						</form:label>
						<form:input id="state" path="billingAddress.state"
							class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="billingAddress.state" />
						</small>
					</div>

					<div class="form-group">
						<form:label for="zipCode" path="billingAddress.zipCode">
							<spring:message code="Label.Address.ZipCode" text="ZipCode" />
						</form:label>
						<form:input id="zipCode" path="billingAddress.zipCode"
							class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="billingAddress.zipCode" />
						</small>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="col-md-8">
				<h2>Payment Card Details</h2>
				<div class="form-group">
					<form:label for="name" path="card.name">
						<spring:message code="Label.Card.Name" text="Name" />
					</form:label>
					<form:input id="name" path="card.name" class="form-control" />
					<small class="form-text text-danger"> <form:errors
							path="card.name" />
					</small>
				</div>

				<div class="form-group">
					<form:label for="number" path="card.number">
						<spring:message code="Label.Card.Number" text="Number" />
					</form:label>
					<form:input id="number" path="card.number" class="form-control" />
					<small class="form-text text-danger"> <form:errors
							path="card.number" />
					</small>
				</div>

				<div class="form-group">
					<form:label for="ccv" path="card.ccv">
						<spring:message code="Label.Card.CCV" text="CCV" />
					</form:label>
					<form:input id="ccv" path="card.ccv" class="form-control" />
					<small class="form-text text-danger"> <form:errors
							path="card.ccv" />
					</small>
				</div>
				<div class="d-flex justify-content-between">
					<button type="submit" name="_eventId_shipping"  class="btn btn-secondary">
						Previous - Shipping
					</button>
					<button type="submit" name="_eventId_confirm"  class="btn btn-primary">
						Next - Confirmation
					</button>
				</div>
			</div>
		</div>
	</div>

	<a href="${flowExecutionUrl}&_eventId_home" class="btn btn-secondary">
		Go back home
	</a>
	
</form:form>
