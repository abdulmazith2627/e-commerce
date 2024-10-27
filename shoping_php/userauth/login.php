<?php
include '../connection.php';

try {
    if($_SERVER["REQUEST_METHOD"]=='POST'){

        $rawdata = file_get_contents('php://input');
        $data = json_decode($rawdata, true);
        $email = $data['email'];
        $password = $data['password'];

        if(!empty($email) && !empty($password)) {
            if(filter_var($email, FILTER_VALIDATE_EMAIL)) {

                $checkemail = "SELECT * FROM users WHERE email='$email'";
                $runondatabase = $conn->query($checkemail);

                if($runondatabase->num_rows > 0) {
                    $row = $runondatabase->fetch_assoc();
                    $store_password = $row['password'];

                    if(password_verify($password, $store_password)) {
                        unset($row['password']); // Remove password before sending to Flutter
                        echo json_encode(array('loginemail' => true, 'php_userdata' => $row));
                    } else {
                        echo json_encode(array('loginemail' => false, 'php_userdata' => 'Email or password incorrect'));
                    }
                } else {
                    echo json_encode(array("register_now" => true));
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
    
} catch (Exception $e) {
    echo json_encode(array("error" => $e->getMessage()));
}
?>
