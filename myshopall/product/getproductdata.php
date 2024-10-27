<?php
include '../connection.php';

header('Content-Type: application/json'); // Set content type to JSON

try {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        $rawdata = file_get_contents('php://input');
        $data = json_decode($rawdata, true);
        $adminid = $data['adminid'];

        if (!empty($adminid)) {
            $checkadminid = "SELECT * FROM product WHERE adminid = ?";
            $stmt = $conn->prepare($checkadminid);
            $stmt->bind_param("i", $adminid);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $products = array();

                while ($row = $result->fetch_assoc()) {
                    // Convert image BLOB to base64
                    $row['image'] = base64_encode($row['image']);
                    $products[] = $row;
                }

                echo json_encode(array('success' => true, 'productdata' => $products));
            } else {
                echo json_encode(array('success' => false, 'message' => "No data found for the given adminid."));
            }
        } else {
            echo json_encode(array('success' => false, 'message' => 'adminid is empty.'));
        }
    } else {
        echo json_encode(array('success' => false, 'message' => 'Invalid request method.'));
    }
} catch (Exception $e) {
    echo json_encode(array('error' => true, 'message' => $e->getMessage()));
}

$conn->close();
?>


