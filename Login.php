<?php
# Login
include "./KoneksiDB.php"; 

session_start();

if (isset($_POST['next'])) {

    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $email    = htmlspecialchars($_POST['email']);
        $password = htmlspecialchars($_POST['pwd']);

        if (!empty($email) && !empty($password)) {

            // Validasi login di database, contoh:
            $sql = "SELECT * FROM users WHERE email='$email' AND pwd='$password'";
            $result = mysqli_query($connect, $sql);

            if (mysqli_num_rows($result) > 0) {
                $_SESSION['email'] = $email;
                header('Location: http://localhost:3000/dashboard'); // Pindah ke DashboardPage.jsx jika login berhasil
            } else {
                echo "Invalid email or password!";
            }

        } else {
            echo "Your email and password not filled!";
        }
    }
} else {
    header('Location: http://localhost:3000/home');
}
?>