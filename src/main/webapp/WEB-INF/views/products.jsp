<%@ include file="template/header.jspf"%>    
    <main role="main">      
      <div class="album py-5 bg-light">
        <div class="container">
          <div class="row">
	          <c:forEach items="${products}" var="product">          
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
	                <div class="card-body">
	                <p class="card-text">${product.title}</p>
	                  <p class="card-text">${product.description}</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="btn-group">
	                      <%--<button type="button" class="btn btn-sm btn-outline-secondary">View Details</button>--%>
	                      <button type="button" class="btn btn-sm btn-outline-secondary addToCartBtn" 
	                      	data-product='{"id":${product.id}, "title":"${product.title}", "description":"${product.description}", "condition":"${product.conditions}", "price":${product.price}, "quantity":${product.quantity}}' >
	                      	<spring:message code="product.addToCart" /></button>
                          <button type="button" class="btn btn-sm btn-outline-secondary" onclick="contact()"><spring:message code="product.contactSeller" /></button>
	                    </div>
	                    <small class="text-muted"><spring:message code="product.currency" />${product.price} </small>
	                  </div><br>
	                  <small id="addedToCartNotification${product.id}" class="addToCartBtn text-success">...</small>
	                </div>
	              </div>
	            </div>
	            </c:forEach>
          </div>
        </div>
      </div>
    </main>
<%@ include file="template/footer.jspf"%>   