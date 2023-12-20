<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

# Database Connection
$host = "localhost";
$user = "root";
$pass = "";
$db   = "versatile";

$connect = mysqli_connect($host, $user, $pass, $db);

if (mysqli_connect_error()) {
    echo mysqli_connect_error();
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email    = isset($_POST['email']) ? $_POST['email'] : null;
    $password = isset($_POST['pwd']) ? $_POST['pwd'] : null;

    if ($email && $password) {
        $sql    = "SELECT * FROM users WHERE email = '$email' AND pwd = '$password'";
        $result = mysqli_query($connect, $sql);
        
        

        if ($result) {
            $row = mysqli_fetch_assoc($result);

            if ($row) {
                # Start session
                session_start();


                # Set session variables
                $_SESSION['user'] = $email;

                // $resultUser = json_encode($result);

                echo json_encode(['success' => true, 'message' => 'Login successful', 'data' => $row]);
            } else {
                echo json_encode(['success' => false, 'message' => 'Invalid email or password']);
                
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Error executing query']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Email and password are required']);
        

    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);

} 
?>