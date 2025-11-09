<?php
$host = 'localhost';
$db = 'swiftbus';
$user = 'root'; 
$pass = ''; // empty password for XAMPP default

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database Connection Failed: " . $e->getMessage());
}
?>

<link rel="stylesheet" href="/swiftbus/assets/style/style.css">
