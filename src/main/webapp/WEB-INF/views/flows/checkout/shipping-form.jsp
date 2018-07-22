<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="container mb-4">
	<div class="col-md-4">
		
		<form:form method="POST" modelAttribute="shippingAddress">
			<div class="form-group">
				<form:label for="street" path="street">
					<spring:message code="Label.Address.Street" text="Street" />
				</form:label>
				<form:input id="street" path="street" class="form-control" />
				<small class="form-text text-danger">
					<form:errors path="street" />
				</small>
			</div>

			<div class="form-group">
				<form:label for="city" path="city">
					<spring:message code="Label.Address.City" text="City" />
				</form:label>
				<form:input id="city" path="city" class="form-control" />
				<small class="form-text text-danger">
					<form:errors path="city" />
				</small>
			</div>

			<div class="form-group">
				<form:label for="state" path="state">
					<spring:message code="Label.Address.State" text="State" />
				</form:label>
				<form:input id="state" path="state" class="form-control" />
				<small class="form-text text-danger">
					<form:errors path="state" />
				</small>
			</div>

			<div class="form-group">
				<form:label for="zipCode" path="zipCode">
					<spring:message code="Label.Address.ZipCode" text="ZipCode" />
				</form:label>
				<form:input id="zipCode" path="zipCode" class="form-control" />
				<small class="form-text text-danger">
					<form:errors path="zipCode" />
				</small>
			</div>
			<div class="d-flex justify-content-between">
				<a href="${flowExecutionUrl}&_eventId_home" class="btn btn-secondary">
					Go back home
				</a>
				<button type="submit" name="_eventId_billing" class="btn btn-primary">
					Next - Billing Info
				</button>
			</div>
		</form:form>
	</div>
</div>