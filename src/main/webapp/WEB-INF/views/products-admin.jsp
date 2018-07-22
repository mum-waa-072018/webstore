<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Products</title>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="<spring:url value='/resource/css/admin.css' />">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>	
	<div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Manage <b>Products</b></h2>
					</div>
					<div class="col-sm-4">
						<a href="#addProductModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
					</div>
					<div class="col-sm-2">
					<a href="../login">Logout</a>
					</div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
						<th>Color</th>
                        <th>Condition</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${products}" var="product">  
                    <tr>
                        <td>${product.title}</td>
                        <td>${product.description}</td>
						<td>${product.color}</td>
                        <td>${product.conditions}</td>
                        <td>${product.price}</td>
                        <td>${product.quantity }</td>
                        <td>
                            <a href="#editProductModal"  class="editProductModal" data-id="${product.id}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                        </td>
                    </tr>
                   </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
	<!-- Add Modal HTML -->
	<div id="addProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<form:form modelAttribute="product" id="addProduct">
					<div class="modal-header">						
						<h4 class="modal-title">Add New Product</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="error-msg form-group" style="display: none;">
						</div>					
						<div class="form-group">
							<label>Product Title</label>
							<form:input id="title" path="title"  class="form-control"  required="required" />
						</div>
						<div class="form-group">
							<label>Product Description</label>						
							<form:textarea path="description" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<label>Color</label>
							<form:input path="color" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<label>Condition</label>
							<form:input path="conditions" class="form-control" required="required"/>
						</div>
											
						<div class="form-group">
							<label>Price</label>
							<form:input path="price" class="form-control" required="required"/>
						</div>
						
						<div class="form-group">
							<label>Quantity</label>
							<form:input path="quantity" class="form-control" required="required"/>
						</div>
						
											
					</div>
					<div class="modal-footer">
						<input type="button" class="cancel btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" id="add" class="btn btn-success" value="Add">
						
					</div>
				</form:form>
			</div>
		</div>
	</div> 
	<!-- Edit Modal HTML -->
	<div id="editProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content" >
				<form:form modelAttribute="product" id="editProduct">
					<div class="modal-header">						
						<h4 class="modal-title">Edit Product</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="error-msg form-group" style="display: none;">
						</div>
						
						<form:hidden  path="id" id="id" />										
						<div class="form-group">
							<label>Product Title</label>
							<form:input id="title" path="title"  class="form-control"  required="required" />
						</div>
						<div class="form-group">
							<label>Product Description</label>						
							<form:textarea path="description" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<label>Color</label>
							<form:input path="color" class="form-control" required="required"/>
						</div>
						<div class="form-group">
							<label>Condition</label>
							<form:input path="conditions" class="form-control" required="required"/>
						</div>
											
						<div class="form-group">
							<label>Price</label>
							<form:input path="price" class="form-control" required="required"/>
						</div>
						
						<div class="form-group">
							<label>Quantity</label>
							<form:input path="quantity" class="form-control" required="required"/>
						</div>				
					</div>
					<div class="modal-footer">
						<input type="button" class="cancel btn btn-default" data-dismiss="modal" value="Cancel">
						
						<input type="submit" class="btn btn-info" id="edit" value="Save">
					</div>
				</form:form>
			</div>
		</div>
	</div>
<%@ include file="template/footer.jspf"%>