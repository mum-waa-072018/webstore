<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title><tiles:insertAttribute name="title" /></title>

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<link rel="stylesheet" href="src="<spring:url value='/resource/css/signin.css' />">

<script
   src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.1/angular.min.js"></script>

<script src="/webstore/resources/js/controllers.js"></script>


</head>

<body>

<section class="container">
   <div class="pull-right" style="padding-right: 50px">
      <a href="<c:url value="/users/logout" />">Logout</a>
   </div>
</section>

   <header>
   <div class="navbar navbar-dark bg-dark box-shadow">
      <div class="container d-flex justify-content-between">
         <a href="#" class="navbar-brand d-flex align-items-center">
            <img width="30" height="30" id="logo" alt="logo" src="<spring:url value='/resource/images/logo.png' />">
            <strong>Lightning - Fast & Influential</strong>
         </a>
         <span class="navbar-brand d-flex align-items-right">
          	<a href="?language=en" ><spring:message code="label.lang.en" /></a> &nbsp;||&nbsp;
          	<a href="?language=cn" ><spring:message code="label.lang.cn" /></a> &nbsp;||&nbsp;
          	<a href="?language=fr" ><spring:message code="label.lang.fr" /></a> &nbsp;||&nbsp;
          	<a href="?language=de" ><spring:message code="label.lang.de" /></a>
          </span>
      </div>
   </div>

   </header>


   <div class="container">
      <div class="jumbotron">
         <div class="header">
            <ul class="nav nav-pills pull-right">
               <tiles:insertAttribute name="navigation" />
            </ul>
         </div>

         <h1>
            <tiles:insertAttribute name="heading" />
         </h1>
         <p>
            <tiles:insertAttribute name="tagline" />
         </p>
      </div>

      <div class="header">
         <tiles:insertAttribute name="content" />
      </div>

      <div class="footer">
         <tiles:insertAttribute name="footer" />
      </div>

   </div>
</body>
</html>
