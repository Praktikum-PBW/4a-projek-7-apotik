<?php
if (isset($_POST['tambah'])) {
    $nama = $_POST['nama_lengkap'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $status = $_POST['status'];

    $password = sha1($password);

    $query = mysqli_query($koneksi, "INSERT INTO user VALUES(null,'$nama','$username','$password','$status')");

    if ($query) {
        header("Location: index.php?page=home");
    } else {
        echo "Gagal";
    }
}
