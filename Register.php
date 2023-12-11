<?php
# Table Users
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

$host = "localhost";
$user = "root";
$pass = "";
$db   = "versatile";

$connect = mysqli_connect($host, $user, $pass, $db);

if (mysqli_connect_error()) {
    echo mysqli_connect_error();
    exit();

} else if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Memastikan kunci (key) ada dalam array $_POST sebelum mengaksesnya
    //var_dump($_POST);

    $username = isset($_POST['username']) ? $_POST['username'] : null;
    $email    = isset($_POST['email']) ? $_POST['email'] : null;
    $password = isset($_POST['pwd']) ? $_POST['pwd'] : null;
    
    //var_dump($username, $email, $password);
    if ($username && $email && $password) {
        $sql1 = "INSERT INTO users(username, email, pwd) VALUES('$username', '$email', '$password')";
        $q1   = mysqli_query($connect, $sql1);
        if ($q1) {
            echo "Berhasil registrasi data user baru!";
        } else {
            echo "Gagal registrasi data user baru!";
        }
        $connect->close();
    } else {
        echo "Pastikan semua data terisi!";
    }
} else {
    echo "Metode pengiriman data tidak valid!";
}
?>

