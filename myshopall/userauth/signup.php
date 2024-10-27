<?php
include "../connection.php";

try {
   
   if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      // Get the raw data from the request body
      $rawdata = file_get_contents('php://input');
      $data = json_decode($rawdata, true);
  
      // Extract data
      $email = $data['email'];
      $password = password_hash($data['password'], PASSWORD_DEFAULT);
      $username = $data['username'];
  
      // Validate input
      if (!empty($email) && !empty($password) && !empty($username)) {
          if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
              // Check if email already exists
              $checkemail = "SELECT * FROM users WHERE email = '$email'";
              $runondatabase = $conn->query($checkemail);
              
              if ($runondatabase->num_rows > 0) {
                  echo json_encode(array("already_register" => true));
              } else {
                  // Insert user data
                  $adduser = "INSERT INTO users (email, password, username) VALUES ('$email', '$password', '$username')";
                  if ($conn->query($adduser) === TRUE) {
                      echo json_encode(array("success" => true));
                  } else {
                      echo json_encode(array("success" => false, "error" => $conn->error));
                  }
              }
          } else {
              echo json_encode(array("email_validate" => false));
          }
      } else {
          echo json_encode(array("userdetail" => false));
      }
  } else {
      echo json_encode(array("request" => false));
  }
  


} 


catch (Exception $e) {
   echo "Something went wrong!";
}




?>