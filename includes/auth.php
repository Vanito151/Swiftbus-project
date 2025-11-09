<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: /swiftbus/public/login.php");
    exit();
}
?>

<link rel="stylesheet" href="/swiftbus/assets/style/style.css">
