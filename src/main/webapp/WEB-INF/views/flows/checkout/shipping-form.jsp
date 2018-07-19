<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shipping Details</title>
<link rel="stylesheet" type="text/css"
	href="<spring:url value='/resource/css/cart.css'/>" />
</head>
<body>
	<div class="heading">
		<h2>Shipping Details</h2>
	</div>

	<div class="container">

		<a href="${flowExecutionUrl}&_eventId_home" class="home">Home</a>

		<form:form method="POST" modelAttribute="order.shippingAddress">
			<div class="form-input">
				<form:label path="street">
					<spring:message code="Label.Address.Street" text="Street" />: 
				</form:label>
				<form:input path="street" />
				<div>
					<form:errors class="error" path="street" />
				</div>
			</div>

			<div class="form-input">
				<form:label path="city">
					<spring:message code="Label.Address.City" text="City" />: 
				</form:label>
				<form:input path="city" />
				<div>
					<form:errors class="error" path="city" />
				</div>
			</div>

			<div class="form-input">
				<form:label path="state">
					<spring:message code="Label.Address.State" text="State" />: 
				</form:label>
				<form:input path="state" />
				<div>
					<form:errors class="error" path="state" />
				</div>
			</div>

			<div class="form-input">
				<form:label path="zipCode">
					<spring:message code="Label.Address.ZipCode" text="ZipCode" />: 
				</form:label>
				<form:input path="zipCode" />
				<div>
					<form:errors class="error" path="zipCode" />
				</div>
			</div>

			<button type="submit" name="_eventId_billing" class="btn btn-primary">Next
				- Billing Info</button>
		</form:form>
	</div>
</body>
</html>