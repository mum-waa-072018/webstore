<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

	<form:form method="POST" modelAttribute="billingInfo">
		
		<h2>Payment Card Details</h2>
		<div>
			<form:label path="card.name">
				<spring:message code="Label.Card.Name" text="Name" />: 
			</form:label>
			<form:input path="card.name" />
		</div>
		<div>
			<form:errors path="card.name" />
		</div>
		
		<div>
			<form:label path="card.number">
				<spring:message code="Label.Card.Number" text="Number" />: 
			</form:label>
			<form:input path="card.number" />
		</div>
		<div>
			<form:errors path="card.number" />
		</div>
		
		<div>
			<form:label path="card.ccv">
				<spring:message code="Label.Card.CCV" text="CCV" />: 
			</form:label>
			<form:input path="card.ccv" />
		</div>
		<div>
			<form:errors path="card.ccv" />
		</div>
		
		<h2>Billing Address Details</h2>
		<div>
			<form:label path="billingAddress.street">
				<spring:message code="Label.Address.Street" text="Street" />: 
			</form:label>
			<form:input path="billingAddress.street" />
		</div>
		<div>
			<form:errors path="billingAddress.street" />
		</div>
		
		<div>
			<form:label path="billingAddress.city">
				<spring:message code="Label.Address.City" text="City" />: 
			</form:label>
			<form:input path="billingAddress.city" />
		</div>
		<div>
			<form:errors path="billingAddress.city" />
		</div>
		
		<div>
			<form:label path="billingAddress.state">
				<spring:message code="Label.Address.State" text="State" />: 
			</form:label>
			<form:input path="billingAddress.state" />
		</div>
		<div>
			<form:errors path="billingAddress.state" />
		</div>
		
		<div>
			<form:label path="billingAddress.zipCode">
				<spring:message code="Label.Address.ZipCode" text="ZipCode" />: 
			</form:label>
			<form:input path="billingAddress.zipCode" />
		</div>
		<div>
			<form:errors path="billingAddress.zipCode" />
		</div>
		
		<button type="submit" name="_eventId_shipping">
			Previous - Shipping
		</button>
		<button type="submit" name="_eventId_confirm">
			Next - Confirm
		</button>
	</form:form>
	<a href="${flowExecutionUrl}&_eventId_home">Home</a>
