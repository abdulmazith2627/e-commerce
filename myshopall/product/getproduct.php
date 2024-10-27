<?php

include '../connection.php';

try {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Get the raw data from the request
        $rawdata = file_get_contents('php://input');
        $data = json_decode($rawdata, true);

        $image = $data['image'];
        $name = $data['name'];
        $price = $data['price'];
        $decription = $data['decription'];
        $adminid = $data['adminid'];
        $offer = $data['offer'];

        $shirtcolor = $data['shirtcolor'];
        $size = $data['size'];
        $gender  = $data['gender'];
        $delivery = $data['delivery'];
        $fabric  = $data['fabric'];
        $sleeve  = $data['sleeve'];

        // Ensure required fields are not empty
        if (!empty($name) && !empty($price) && !empty($decription) && !empty($adminid)) {
            // Base64 decode the image
            $imageData = base64_decode($image);

            // Prepare SQL statement to insert into the database
            $stmt = $conn->prepare("INSERT INTO product (image, name, price, decription, adminid, offer,shirtcolor,size,gender,delivery,fabric,sleeve) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)");
            $stmt->bind_param('ssssssssssss', $imageData, $name, $price, $decription, $adminid, $offer,$shirtcolor,$size,$gender,$delivery,$fabric,$sleeve);

            // Execute the statement
            if ($stmt->execute()) {
                echo json_encode(array("success" => true));
            } else {
                echo json_encode(array("success" => false, "error" => $stmt->error));
            }

            $stmt->close();
        } else {
            echo json_encode(array("empty" => false, "error" => "Missing required fields"));
        }
    } else {
        echo json_encode(array("request" => false, "error" => "Invalid request method"));
    }
} catch (Exception $e) {
    echo json_encode(array("error" => false, "error" => $e->getMessage()));
}

$conn->close();
?>
