$(document).ready(function(){

	// Extra credit (1) copy billing to shipping
	$('#sameshipbill').change(function(){
	    if($(this).prop("checked")){
	    	$("#sname").val($("#bname").val());
	    	$("#semail").val($("#bemail").val());
	    	$("#stelephone").val($("#btelephone").val());
	    	$("#saddress").val($("#baddress").val());
	    	$("#szipcode").val($("#bzipcode").val());
	    	$("#scity").val($("#bcity").val());
	    	$("#sstate").val($("#bstate").val());
	    }
	});

	$("#place_order").click(function(e){

		e.preventDefault();
		//  1. CHECK NAME
		if ( $("#sname").val() == "" || $("#bname").val() == "")
		{
			alert( "Please enter your Shipping/Billing name." );
			return false;
		}
 
 		// 2. CHECK EMAIL
		var semail = $("#semail").val();
		var bemail = $("#bemail").val();
		if ( !checkEmail(semail) || !checkEmail(bemail) )
		{
			alert( "Please enter a valid Shipping/Billing email." );
			return false;
		}

		// 3. CHECK PHONE NUMBER
		var sphone = $("#stelephone").val();
		var bphone = $("#btelephone").val();
		if ( sphone == "" || !$.isNumeric( sphone ) || bphone == "" || ! $.isNumeric( bphone ) )
		{
			alert( "Please enter your Shipping/Billing phone number correctly." );
			return false;
		}

		// 4. An Address has been entered
		var saddress = $("#saddress").val();
		var baddress = $("#baddress").val();
		if ( saddress == "" || baddress == "")
		{
			alert( "Please enter your Shipping/Billing address." );
			return false;
		}

		// 5. A city has been entered
		var scity = $("#scity").val();
		var bcity = $("#bcity").val();
		if ( scity == "" || bcity == "")
		{
			alert( "Please enter your Shipping/Billing city." );
			return false;
		}

		// 6. A state has been entered
		var sstate = $("#sstate").val();
		var bstate = $("#bstate").val();
		if ( sstate == "" || bstate == "")
		{
			alert( "Please select your Shipping/Billing state." );
			return false;
		}

		// 7. A valid zipcode has been entered
		var szipcode = $("#szipcode").val();
		var bzipcode = $("#bzipcode").val();
		if ( szipcode == "" || szipcode.length != 5 || !$.isNumeric(szipcode) || bzipcode == "" || bzipcode.length != 5 || !$.isNumeric(bzipcode) )
		{
			alert( "Please select a valid Shipping/Billing zipcode (5 numeric digits)" );
			return false;
		}

		window.location.href = "/orders";
		return false; 
		
		function checkEmail(e){
			eVal = 0
			for ( i = 0; i < e.length; i++ ) 	{
				cE = e.charAt( i )
				if ( cE == "@" ) {
					if ( i >= e.length - 4 ) {
						return false
					}
					eVal++
					for ( j = i; j < e.length; j++ ) {
						cE = e.charAt( j )
						if ( cE == "." )
							eVal++
					}
				}
			}
			if ( eVal != 2 ) {
				return false
			}

			return true
		}
	});
});