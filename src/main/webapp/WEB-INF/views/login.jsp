<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="container">
    <div class="row">
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">User Login</h4>
            <form:form name='f' id="login" action="" method="POST" class="form-signin">
                <%--<img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">--%>
                <%--<c:if test="${param.invalid != null}">--%>
                    <%--<div class="alert alert-danger" cssStyle="color : red;">--%>
                        <%--<p>Invalid username and password.</p>--%>
                    <%--</div>--%>
                <%--</c:if>--%>
                <%--<label for="userName" class="sr-only">UserName</label>--%>
                <%--<form:input path="firstName" type="text" id="userName" class="form-control" placeholder="user name" required="ture" />--%>
                <%--<label for="password" class="sr-only">Password</label>--%>
                <%--<form:input path="password" type="password" id="password" class="form-control" placeholder="Password" required="true" />--%>
                <%--<div class="checkbox mb-3">--%>
                    <%--<label>--%>
                        <%--<input type="checkbox" value="remember-me"> Remember me--%>
                    <%--</label>--%>
                <%--</div>--%>
                <%--<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>--%>
                <%--<table>--%>
                    <%--<tr><td>User:</td><td><input type='text' name='username' value=''></td></tr>--%>
                    <%--<tr><td>Password:</td><td><input type='password' name='password'/></td></tr>--%>
                    <%--<tr><td colspan='2'><input name="submit" type="submit" value="Login"/></td></tr>--%>
                <%--</table>--%>

                <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
                <c:if test="${param.invalid != null}">
                    <div class="alert alert-danger" cssStyle="color : red;">
                        <p>Invalid username and password.</p>
                    </div>
                </c:if>
                <label for="userName" class="sr-only">UserName</label>
                <input type="text" id="userName" name='username' class="form-control"
                            placeholder="user name" required="ture" />
                <label for="password" class="sr-only">Password</label>
                <input type="password" id="password" name='password' class="form-control"
                            placeholder="Password" required="true" />
                <%--<div class="checkbox mb-3">--%>
                    <%--<label>--%>
                        <%--<input type="checkbox" value="remember-me"> Remember me--%>
                    <%--</label>--%>
                <%--</div>--%>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form:form>
        </div>
    </div>
</div>
