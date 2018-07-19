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
	
	$(".addToCartBtn").click(function(){
		const productSerialized = $(this).attr("data-product");
		var product = JSON.parse(productSerialized);
		
		var cartItem;
		$.each(cart.items, function(i, item){
			if(product.id == item.product.id) {
				cartItem = item;
			}
		});
		if(cartItem == null) {
			cartItem = {
					product: product,
					quantity: 1,
					cost: product.price
			}
			cart.items.push(cartItem);
		} else {
			cartItem.quantity += 1;
			cartItem.cost += cartItem.product.price;
		} 
		cart.totalCost += cartItem.product.price;
		sessionStorage.setItem("cart", JSON.stringify(cart));
		alert(cartItem.product.title + " added to cart");
	});

});