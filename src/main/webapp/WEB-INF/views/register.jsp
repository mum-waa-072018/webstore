<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Created by IntelliJ IDEA.
  User: leo
  Date: 7/18/18
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>User Register page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

    <!-- Bootstrap core CSS -->
    <link href="../../../../dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="src="<spring:url value='/resource/css/form-validation.css' />">

</head>

<body class="bg-light">

<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <h2>User Registration</h2>
        <p class="lead">Please fill in all your user information listed bellow and submit to register.</p>
    </div>

    <div class="row">

        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">User Registration</h4>


            <form:form modelAttribute="user" id="addUser" action="/users/user" method="post" class="needs-validation" >
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">First name</label>
                        <form:input type="text" path="firstName" class="form-control" id="firstName" placeholder=""
                                    value="" required="true" />
                        <div style="text-align: center;">
                            <form:errors path="firstName" cssStyle="color : red;" />
                        </div>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Last name</label>
                        <form:input path="lastName" type="text" class="form-control" id="lastName" placeholder="" value=""
                                    required="true" />
                        <div class="invalid-feedback">
                            Valid last name is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password">Password</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <form:input path="password" type="password" class="form-control" id="password"
                                    required="true" />
                        <div class="invalid-feedback" style="width: 100%;">
                            Your password is required.
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="areaCode">Area Code</label>
                        <form:input type="text" path="phone.area" class="form-control" id="areaCode" placeholder=""
                                    value="" required="true" />
                        <div class="invalid-feedback">
                            Valid areaCode is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="prefix">Prefix</label>
                        <form:input path="phone.pre" type="text" class="form-control" id="prefix" placeholder=""
                                    value=""
                                    required="true" />
                        <div class="invalid-feedback">
                            Valid prefix is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="number">Number</label>
                        <form:input path="phone.number" type="text" class="form-control" id="number" placeholder=""
                                    value=""
                                    required="true" />
                        <div class="invalid-feedback">
                            Valid number is required.
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label for="street">Street</label>
                        <form:input class="form-control" path="address.street" id="street" required="true"></form:input>
                        <div class="invalid-feedback">
                            Valid street is required.
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="city">City</label>
                        <form:input class="form-control" path="address.city" id="city" required="true"></form:input>
                        <div class="invalid-feedback">
                            Valid city name is required.
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="state">State</label>
                        <form:input class="form-control" path="address.state" id="state" required="true"></form:input>
                        <div class="invalid-feedback">
                            Valid state is required.
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label for="zip">Zip Code</label>
                        <form:input class="form-control" path="address.zipCode" id="zip" required="true"></form:input>
                        <div class="invalid-feedback">
                            Valid zip is required.
                        </div>
                    </div>
                </div>

                <div class="row" style="display: none">

                </div>


                <%--<div class="mb-3">--%>
                    <%--<label for="email">Email <span class="text-muted">(Optional)</span></label>--%>
                    <%--<input type="email" class="form-control" id="email" placeholder="you@example.com">--%>
                    <%--<div class="invalid-feedback">--%>
                        <%--Please enter a valid email address for shipping updates.--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="mb-3">--%>
                    <%--<label for="address">Address</label>--%>
                    <%--<input type="text" class="form-control" id="address" placeholder="1234 Main St" required>--%>
                    <%--<div class="invalid-feedback">--%>
                        <%--Please enter your shipping address.--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="mb-3">--%>
                    <%--<label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>--%>
                    <%--<input type="text" class="form-control" id="address2" placeholder="Apartment or suite">--%>
                <%--</div>--%>

                <%--<div class="row">--%>
                    <%--<div class="col-md-5 mb-3">--%>
                        <%--<label for="country">Country</label>--%>
                        <%--<select class="custom-select d-block w-100" id="country" required>--%>
                            <%--<option value="">Choose...</option>--%>
                            <%--<option>United States</option>--%>
                        <%--</select>--%>
                        <%--<div class="invalid-feedback">--%>
                            <%--Please select a valid country.--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-4 mb-3">--%>
                        <%--<label for="state">State</label>--%>
                        <%--<select class="custom-select d-block w-100" id="state" required>--%>
                            <%--<option value="">Choose...</option>--%>
                            <%--<option>California</option>--%>
                        <%--</select>--%>
                        <%--<div class="invalid-feedback">--%>
                            <%--Please provide a valid state.--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-3 mb-3">--%>
                        <%--<label for="zip">Zip</label>--%>
                        <%--<input type="text" class="form-control" id="zip" placeholder="" required>--%>
                        <%--<div class="invalid-feedback">--%>
                            <%--Zip code required.--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<hr class="mb-4">--%>
                <%--<div class="custom-control custom-checkbox">--%>
                    <%--<input type="checkbox" class="custom-control-input" id="same-address">--%>
                    <%--<label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>--%>
                <%--</div>--%>
                <%--<div class="custom-control custom-checkbox">--%>
                    <%--<input type="checkbox" class="custom-control-input" id="save-info">--%>
                    <%--<label class="custom-control-label" for="save-info">Save this information for next time</label>--%>
                <%--</div>--%>
                <%--<hr class="mb-4">--%>

                <%--<h4 class="mb-3">Payment</h4>--%>

                <%--<div class="d-block my-3">--%>
                    <%--<div class="custom-control custom-radio">--%>
                        <%--<input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>--%>
                        <%--<label class="custom-control-label" for="credit">Credit card</label>--%>
                    <%--</div>--%>
                    <%--<div class="custom-control custom-radio">--%>
                        <%--<input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>--%>
                        <%--<label class="custom-control-label" for="debit">Debit card</label>--%>
                    <%--</div>--%>
                    <%--<div class="custom-control custom-radio">--%>
                        <%--<input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>--%>
                        <%--<label class="custom-control-label" for="paypal">Paypal</label>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="row">--%>
                    <%--<div class="col-md-6 mb-3">--%>
                        <%--<label for="cc-name">Name on card</label>--%>
                        <%--<input type="text" class="form-control" id="cc-name" placeholder="" required>--%>
                        <%--<small class="text-muted">Full name as displayed on card</small>--%>
                        <%--<div class="invalid-feedback">--%>
                            <%--Name on card is required--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-6 mb-3">--%>
                        <%--<label for="cc-number">Credit card number</label>--%>
                        <%--<input type="text" class="form-control" id="cc-number" placeholder="" required>--%>
                        <%--<div class="invalid-feedback">--%>
                            <%--Credit card number is required--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="row">--%>
                    <%--<div class="col-md-3 mb-3">--%>
                        <%--<label for="cc-expiration">Expiration</label>--%>
                        <%--<input type="text" class="form-control" id="cc-expiration" placeholder="" required>--%>
                        <%--<div class="invalid-feedback">--%>
                            <%--Expiration date required--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-3 mb-3">--%>
                        <%--<label for="cc-expiration">CVV</label>--%>
                        <%--<input type="text" class="form-control" id="cc-cvv" placeholder="" required>--%>
                        <%--<div class="invalid-feedback">--%>
                            <%--Security code required--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to register</button>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>


