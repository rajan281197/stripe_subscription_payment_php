<?php 
// Include configuration file  
require_once 'dbconfig.php'; 
?>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script src="https://js.stripe.com/v2/"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<div class="panel">
<div class="panel-heading">
<h3 class="panel-title">Plan Subscription with Stripe</h3>
    <form action="payment.php" method="POST" id="paymentFrm">
        
            
			
            <!-- Plan Info -->
            <div>
                <b>Select Plan:</b>
                <select class="form-control" name="subscr_plan" id="subscr_plan">
                    <?php foreach($plans as $id=>$plan){ ?>
                        <option value="<?php echo $id; ?>"><?php echo $plan['name'].' [$'.$plan['price'].'/'.$plan['interval'].']'; ?></option>
                    <?php } ?>
                </select>
            </div>
        
        <div class="panel-body">
            <!-- Display errors returned by createToken -->
            <div class="card-errors"></div>
			
            <!-- Payment form -->
            <div class="form-group">
                <label>NAME</label>
                <input type="text" name="name" id="name" class="form-control"placeholder="Enter name" required="" autofocus="">
            </div>

            <div class="form-group">
                <label>First Name</label>
                <input type="text" name="first_name" id="first_name" class="form-control"placeholder="Enter Firstname" required="" autofocus="">
            </div>

            <div class="form-group">
                <label>Last name</label>
                <input type="text" name="last_name" id="last_name" class="form-control"placeholder="Enter Lastname" required="" autofocus="">
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" id="password" class="form-control"placeholder="Enter password" required="" autofocus="">
            </div>

            <div class="form-group">
                <label>Phone number</label>
                <input type="text" name="phone" id="phone" class="form-control"placeholder="Enter phonenumber" required="" autofocus="">
            </div>

            
            <div class="form-group">
                <label>EMAIL</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter email" required="">
            </div>
            <div class="form-group">
                <label>CARD NUMBER</label>
                <input type="text" name="card_number" id="card_number" class="form-control" placeholder="1234 1234 1234 1234" maxlength="16" autocomplete="off" required="">
            </div>
            <div class="row">
                <div class="left">
                    <div class="form-group">
                        <label>EXPIRY DATE</label>
                        <div class="col-1">
                            <input type="text" class="form-control" name="card_exp_month" id="card_exp_month" placeholder="MM" maxlength="2" required="">
                        </div>
                        <div class="col-2">
                            <input type="text" class="form-control" name="card_exp_year" id="card_exp_year" placeholder="YYYY" maxlength="4" required="">
                        </div>
                    </div>
                </div>
                <div class="right">
                    <div class="form-group">
                        <label>CVC CODE</label>
                        <input type="text" class="form-control" name="card_cvc" id="card_cvc" placeholder="CVC" maxlength="3" autocomplete="off" required="">
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-success" id="payBtn">Submit Payment</button>
        </div>
    </form>
</div>
</div>
<script>
// Set your publishable key
Stripe.setPublishableKey('<?php echo STRIPE_PUBLISHABLE_KEY; ?>');
 
// Callback to handle the response from stripe
function stripeResponseHandler(status, response) {
    if (response.error) {
        // Enable the submit button
        $('#payBtn').removeAttr("disabled");
        // Display the errors on the form
        $(".payment-status").html('<p>'+response.error.message+'</p>');
    } else {
        var form$ = $("#paymentFrm");
        // Get token id
        var token = response.id;
        // Insert the token into the form
        form$.append("<input type='hidden' name='stripeToken' value='" + token + "' />");
        // Submit form to the server
        form$.get(0).submit();
    }
}
 
$(document).ready(function() {
    // On form submit
    $("#paymentFrm").submit(function() {
        // Disable the submit button to prevent repeated clicks
        $('#payBtn').attr("disabled", "disabled");
		
        // Create single-use token to charge the user
        Stripe.createToken({
            number: $('#card_number').val(),
            exp_month: $('#card_exp_month').val(),
            exp_year: $('#card_exp_year').val(),
            cvc: $('#card_cvc').val()
        }, stripeResponseHandler);
		
        // Submit from callback
        return false;
    });
});
</script>