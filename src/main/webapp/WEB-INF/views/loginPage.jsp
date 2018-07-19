<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Signin</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link rel="stylesheet" href="src="<spring:url value='/resource/css/signin.css' />">
</head>

<body class="text-center">
<div class="container">
    <div class="row">
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">User Login</h4>
            <form:form modelAttribute="user" id="login" action="/loginPage" method="post" class="form-signin">
                <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
                <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
                <label for="userName" class="sr-only">UserName</label>
                <form:input path="firstName" type="text" id="userName" class="form-control" placeholder="user name" required="ture" />
                <label for="password" class="sr-only">Password</label>
                <form:input path="password" type="password" id="password" class="form-control" placeholder="Password" required="true" />
                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
<%--&lt;%&ndash;<link rel="stylesheet"&ndash;%&gt;--%>
   <%--&lt;%&ndash;href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">&ndash;%&gt;--%>
<%--&lt;%&ndash;<title>Products</title>&ndash;%&gt;--%>
<%--</head>--%>
<%--<body>--%>
   <%--<section>--%>
      <%--<div class="jumbotron">--%>
         <%--<div class="container">--%>
            <%--<h1>Welcome to Web Store!</h1>--%>
            <%--<p>The one and only amazing web store</p>--%>
         <%--</div>--%>
      <%--</div>--%>
   <%--</section>--%>
   <%--<div class="container">--%>
      <%--<div class="row">--%>
         <%--<div class="col-md-4 col-md-offset-4">--%>
            <%--<div class="panel panel-default">--%>
               <%--<div class="panel-heading">--%>
                  <%--<h3 class="panel-title">Please sign in</h3>--%>
               <%--</div>--%>
               <%--<div class="panel-body">--%>
<%--<c:url var="loginUrl" value="/login" />--%>
                  <%--<form action="${loginUrl}" method="post" class="form-horizontal">--%>
                     <%----%>
                     <%--<c:if test="${param.error != null}">--%>
                        <%--<div class="alert alert-danger">--%>
                           <%--<p>Invalid username and password.</p>--%>
                        <%--</div>--%>
                     <%--</c:if>--%>
                     <%----%>
                     <%--<c:if test="${param.logout != null}">--%>
                        <%--<div class="alert alert-success">--%>
                           <%--<p>You have been logged out successfully.</p>--%>
                        <%--</div>--%>
                     <%--</c:if>--%>
                     <%----%>
                     <%--<c:if test="${param.accessDenied != null}">--%>
                        <%--<div class="alert alert-danger">--%>
                           <%--<p>Access Denied: You are not authorised! </p>--%>
                        <%--</div>--%>
                     <%--</c:if>--%>
                     <%----%>
                     <%--<div class="input-group input-sm">--%>
                        <%--<label class="input-group-addon" for="username"><i--%>
                           <%--class="fa fa-user"></i></label> <input type="text" class="form-control"--%>
                           <%--id="userId" name="userId" placeholder="Enter Username"--%>
                           <%--required>--%>
                     <%--</div>--%>
                     <%--<div class="input-group input-sm">--%>
                        <%--<label class="input-group-addon" for="password"><i--%>
                           <%--class="fa fa-lock"></i></label> <input type="password"--%>
                           <%--class="form-control" id="password" name="password"--%>
                           <%--placeholder="Enter Password" required>--%>
                     <%--</div>--%>

                     <%--<div class="form-actions">--%>
                        <%--<input type="submit"--%>
                           <%--class="btn btn-block btn-primary btn-default" value="Log in">--%>
                     <%--</div>--%>
                  <%--</form>--%>
               <%--</div>--%>
            <%--</div>--%>
         <%--</div>--%>
      <%--</div>--%>
   <%--</div>--%>
<%--</body>--%>
