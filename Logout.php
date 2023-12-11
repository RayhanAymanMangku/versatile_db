<?php
session_start(); // Memulai sesi PHP, diperlukan untuk menggunakan session_destroy().

session_destroy(); // Menghancurkan (mengakhiri) sesi PHP, yang mencakup menghapus semua data sesi yang terkait dengan pengguna saat ini.

header('Location:  http://localhost:3000/dashboard'); // Perhatikan bahwa tidak ada spasi setelah 'Location' dan sebelum ':'
?>

