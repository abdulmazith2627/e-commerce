<?php
include '../connection.php'; 

try {
    // Check if the request method is GET
    if ($_SERVER['REQUEST_METHOD'] == 'GET') {
        
        $getdata = "SELECT * FROM product";
        $runondatabase = $conn->query($getdata);
        
        if ($runondatabase->num_rows > 0) {
            $productData = array(); // Initialize an array to hold all product data
            
            // Fetch all rows from the result set
            while ($row = $runondatabase->fetch_assoc()) {
                $row['image'] = base64_encode($row['image']);
                $productData[] = $row; // Append each row to the array
            }

            echo json_encode(array('getdata' => true, 'productdata' => $productData));
        } else {
            echo json_encode(array('getdata' => false));
        }
    } else {
        echo json_encode(array('request' => false));
    }
} catch (Exception $e) {
    // Return any errors encountered
    echo json_encode(array('success' => false, 'error' => $e->getMessage()));
}

// Close the database connection
$conn->close();
?>
