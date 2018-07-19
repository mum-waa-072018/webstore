<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="container" style="align-content: center">
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
                        <div style="text-align: center;">
                            <form:errors path="lastName" cssStyle="color : red;" />
                        </div>
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
                        <div style="text-align: center;">
                            <form:errors path="password" cssStyle="color : red;" />
                        </div>
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
                        <div style="text-align: center;">
                            <form:errors path="phone.area" cssStyle="color : red;" />
                        </div>
                        <div class="invalid-feedback">
                            Valid areaCode is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="prefix">Prefix</label>
                        <form:input path="phone.pre" type="text" class="form-control" id="prefix" placeholder=""
                                    value=""
                                    required="true" />
                        <div style="text-align: center;">
                            <form:errors path="phone.pre" cssStyle="color : red;" />
                        </div>
                        <div class="invalid-feedback">
                            Valid prefix is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="number">Number</label>
                        <form:input path="phone.number" type="text" class="form-control" id="number" placeholder=""
                                    value=""
                                    required="true" />
                        <div style="text-align: center;">
                            <form:errors path="phone.number" cssStyle="color : red;" />
                        </div>
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
                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to register</button>
            </form:form>
        </div>
    </div>
</div>

