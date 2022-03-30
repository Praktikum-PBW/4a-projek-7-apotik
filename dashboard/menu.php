<?php
if(isset($_GET['page'])){
    include '../lib/koneksi.php';
    $page = $_GET['page'];

    switch($page){
        case 'daftar':
            include 'datauser/daftar.php';
            break;
        case 'daftar_user':
            include 'datauser/store.php';
            break;
        case 'delete_user':
            include 'datauser/delete.php';
            break;
        case 'edit_user':
            include 'datauser/edit.php';
            break;
        case 'update_user':
            include 'datauser/update.php';
            break;
        case 'data':
            include 'datauser/datauser.php';
            break;
        case 'home':
            include 'home.php';
            break;
        default:
            echo"halaman tidak ditemukan";
            break;
    }
}else{
    include 'home.php';
}
?>