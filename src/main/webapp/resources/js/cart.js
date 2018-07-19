$(document).ready(function() {
	
	var cart;
	var serializedCart = sessionStorage.getItem("cart");
	
	if(serializedCart == null) {
		cart = {
				items: [],
				totalCost: 0
		}
	} else {
		cart = JSON.parse(serializedCart);
	}
	
	showCart();
	
	function showCart() {
		$("#cartItemsCount").html(cart.items.length);
		$("#cartItems").html("");
		if(cart.items.length == 0) {
			$("#cartItems").append($(
					'<li class="list-group-item d-flex justify-content-between lh-condensed">' +
		            '<div><h6 class="my-0">Please add some products</h6></div></li>'
			));
			
			$("#checkoutBtn").attr("disabled", "disabled").on("click", function() {
			    return false; 
			}).css("pointer-events", "none").css("cursor", "default").css("opacity", 0.25);
		} else {
			$.each(cart.items, function(i, cartItem) {
				$("#cartItems").append($(
						'<li class="list-group-item d-flex justify-content-between lh-condensed">' +
			            '<div><h6 class="my-0">' + cartItem.product.title + '</h6>' +
			            '<small class="text-muted">Quantity: ' + cartItem.quantity + '</small></div>' +
			            '<div><div class="text-muted">$'+ cartItem.cost + '</div><span data-productid="'+ cartItem.product.id +'" class="removeProduct btn btn-danger btn-sm">remove</span></div></li>'
				));
			})
			
			$("#cartItems").append($(
					'<li class="list-group-item d-flex justify-content-between">' +
		            '<span>Total (USD)</span>' +
		            '<strong>$' + cart.totalCost +'</strong></li>'
			));
			
			$("#checkoutBtn").removeAttr("disabled").off("click");
		}
	}
	
	$(".removeProduct").click(function(){
		const productId = $(this).attr("data-productid");
		
		$.each(cart.items, function(i, cartItem) {
			if(cartItem.product.id == productId) {
				cart.items.splice(i, 1);
				cart.totalCost -= cartItem.cost;
				console.log(cart);
				sessionStorage.setItem("cart", JSON.stringify(cart));
				showCart();
			}
		});
	}); 
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	const contextRoot = "/" + window.location.pathname.split( '/' )[1];
	
	$("#checkoutBtn").click(function () {
		productId = $(this).attr("data-id");
		
		$.ajax({
			url: contextRoot + "/cart",
			type: "post",
			dataType: "json",
			contentType: "application/json",
			data: sessionStorage.getItem("cart"),
			beforeSend: function(request) {
			    request.setRequestHeader(header, token);
			},
			success: function(cart) {
//				console.log("success");
				location.href = contextRoot + "/checkout?cartId=" + cart.id;
			},
			error: function(error) {
				alert("Failed to checkout, try again later");
				console.log(error);
			}
		});
		
		return false;
	});

});