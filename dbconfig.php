<?php 
// Subscription plans 
$plans = array( 
    '1' => array( 
        'name' => 'Weekly Subscription', 
        'price' => 25, 
        'interval' => 'week' 
    ), 
    '2' => array( 
        'name' => 'Monthly Subscription', 
        'price' => 80, 
        'interval' => 'month' 
    ), 
    '3' => array( 
        'name' => 'Yearly Subscription', 
        'price' => 850, 
        'interval' => 'year' 
    ) 
); 
 
//Currency code
$currency = "usd";  
 
// Stripe API configuration  
define('STRIPE_API_KEY', 'sk_test_51KZDsECmcY6YAasU0oodBPbRKsUDWKoQXjBWq2v7bd7Z8pU5jcMaWL1mSteXHFwHDdVWHsqoIcrGPVApwPSCc46b009FtPWdQm');  //STRIPE_API_KEY – Specify the API Secret key.
define('STRIPE_PUBLISHABLE_KEY', 'pk_test_51KZDsECmcY6YAasUMqCupS1LP28FEMIiLIpodwF1V78VMesPVrDaljgEszlLCRVsh64c6QwfKxTrP6Vs0yiKQmXB00kZpma8se'); //STRIPE_PUBLISHABLE_KEY – Specify the API Publishable key.
  
// Database configuration  
define('DB_HOST', 'localhost'); 
define('DB_USERNAME', 'root'); 
define('DB_PASSWORD', 'Creole@123'); 
define('DB_NAME', 'stripe_subscription');
 
// Connect with the database  
$db = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);  
  
// Display error if failed to connect  
if ($db->connect_errno) {  
    printf("Connect failed: %s\n", $db->connect_error);  
    exit();  
}
 