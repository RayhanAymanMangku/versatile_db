<?php
include "/KoneksiDB.php"; 

session_start(); // Memulai sesi PHP, diperlukan untuk menggunakan $_SESSION

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ambil data dari formulir pembelian tiket
    $jmlhTiketDibeli = $_POST['jmlhTiketDibeli'];
    $tglBooking = $_POST['tglBooking'];
    $tiketID = $_POST['tiketID'];
    $destinasiID = $_POST['destinasiID'];

    // Validasi data (Anda mungkin ingin menambahkan validasi lebih lanjut)
    if (empty($jmlhTiketDibeli) || empty($tglBooking) || empty($tiketID) || empty($destinasiID)) {
        echo json_encode(['message' => 'Semua field harus diisi']);
        exit;
    }

    // Simpan informasi pembelian tiket ke tabel `detail_transaksi`
    $stmt = $conn->prepare("INSERT INTO detail_transaksi (jmlhTiketDibeli, tglBooking, tiketID, destinasiID) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssii", $jmlhTiketDibeli, $tglBooking, $tiketID, $destinasiID);

    if ($stmt->execute()) {
        // Jika penyimpanan berhasil, tampilkan informasi pembelian tiket
        $transaksiID = $stmt->insert_id;
        echo json_encode(['message' => 'Pembelian tiket berhasil. Transaksi ID: ' . $transaksiID]);
    } else {
        echo json_encode(['message' => 'Gagal melakukan pembelian tiket']);
    }

    // Tutup statement dan koneksi
    $stmt->close();
    $conn->close();
} else {
    // Jika bukan metode POST, kirim respons error
    echo json_encode(['message' => 'Metode request tidak valid']);
}
?>
