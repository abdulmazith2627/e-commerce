<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Database connection details
$servername = 'localhost';
$username = 'root';
$password = '';
$database = 'shop_all';

try {
    // Create connection
    $conn = new mysqli($servername, $username, $password, $database);

    // Check connection
    if ($conn->connect_error) {
        die('Failed to connect to the database: ' . $conn->connect_error);
    } 
   
} catch (Exception $e) {
   
    echo 'Exception occurred: ' . $e->getMessage();
    exit();
}
?>