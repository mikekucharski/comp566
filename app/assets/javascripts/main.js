$(document).ready(function(){
	$(document).on("click", "#checkout", function(){

		var cart = {};

		var total = 0.0;
		$(".product").each(function(){
			var id = $(this).find(".id").html().trim();
			var price = $(this).find(".price").html().trim();
			var stock = $(this).find(".stock").html().trim();
			var quantity = $(this).find(".item-counter").val().trim();
			var title = $(this).find(".caption h3").html().trim();

			price = parseFloat(price);
			stock = parseInt(stock);
			quantity = parseInt(quantity);

			if(!$.isNumeric(quantity) ) { // check for Numeric quantities only
				alert("You must select a numeric quantity for quantity!");
				return;
			}
			if(quantity > 10) { // check for quantity less than max
				alert("You can only buy 10 of an item at a time!");
				return;
			}
			if(quantity > stock) { // check for large enough stock
				console.log(quantity);
				console.log(stock);
				alert("There is only "+stock+" of "+title+" remaning in stock!");
				return;
			}
			if(quantity > 0) { // if user wants a product, add to "cart" and tally up cost
				total += (quantity * price);
				cart[id] = quantity;
			}
		});

		if(Object.keys(cart).length <= 0) { // check cart isnt empty
			alert("You didn't select any items to purchase!");
			return;
		}
		var balance = $("#balance").html().trim();
		if(total > balance) { 
			alert("Sorry, you don't have a big enough balance for this purchase!");
			return;
		}

		$.ajax({
	    type: 'POST',
	    url: "/orders",
	    data: {"cart": cart},
	    dataType: "json",
	    success: function(res){
	    	if(res.success)	{
	    		console.log(res);
	    		window.location.href = "/checkout";
	    	}else{
	    		alert("A server-side error has occured during AJAX!");
	    	}
	    },
	    error: function (xhr, ajaxOptions, thrownError) {
        console.log(xhr.status);
        console.log(thrownError);
        alert("A server-side error has occured!");
      }
		}); // end AJAX
	}); // end onClick()

	$(document).on("click", "#addBalance", function(){
		window.location.href = "/replenish"
	});

	$(document).on("click", "#restock", function(){
		window.location.href = "/restock"
	});

}); // end ready()