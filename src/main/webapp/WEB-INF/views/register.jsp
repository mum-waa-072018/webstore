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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Register Page</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<spring:url value="/js/ajax.js"/>"></script>
    <style type="text/css">@import url(css/main.css);</style>
    <style type="text/css">@import url(css/rest.css);</style>
</head>
<body>

<form:form action="users/user"  method="post" >
    <fieldset>
        <legend>User Registration</legend>
    </fieldset>
    <p>
        <label for="firstName">First Name: </label>
        <input type="text" id="firstName" name="firstName" >
    </p>
    <p>
        <label for="lastName">Last Name: </label>
        <input type="text" id="lastName" name="lastName" >
    </p>
    <p>	<input type="button" value="Add Phone" onclick="make_visible('formInput');return false;"> </p>

    <div id=phones>
        Phones :
        <c:forEach var="phone" items="${employee.phones}">
            <tr><td>&nbsp;</td><td>
                    ${phone}
            </td></tr>
        </c:forEach>
    </div>

    <p id="buttons">
        <input id="submit" type="submit"   value="Register User">
    </p>
</form:form>

</div>

<div id="formInput" style="display:none" >

    <h3 align="center">Phone</h3>


    <form:form id="phoneForm" commandName="phone" >


        <table>
            <tr><td colspan="2"><form:errors path="*" cssStyle="color : red;"/></td></tr>

            <tr><td>Number : </td>
                <td><form:input path="area" cssStyle='width:3em'  />
                    <form:input path="pre" cssStyle='width:3em'  />
                    <form:input path="number" cssStyle='width:4em'  />

                </td></tr>

            <tr><td colspan="2"><input type="button" value="Submit" onclick="phoneSubmit();return false;"></td></tr>

        </table>
    </form:form>
    <h4 align="center">
        <a href="#" onclick="make_hidden('formInput'); make_hidden('result');resetForm('phoneForm');"> <b>EXIT</b> </a>
    </h4>

</div>


</body>
</html>
