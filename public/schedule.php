<?php
session_start();
require "../includes/db.php";

$route_id = $_GET['route'] ?? null;

if(!$route_id) die("Route not selected.");

$route = $pdo->prepare("SELECT * FROM routes WHERE id=?");
$route->execute([$route_id]);
$route = $route->fetch();

$schedules = $pdo->prepare("SELECT * FROM schedules WHERE route_id=?");
$schedules->execute([$route_id]);
$schedules = $schedules->fetchAll();
?>
<link rel="stylesheet" href="/swiftbus/assets/style/style.css">

<h2>Schedules for: <?= $route['title'] ?></h2>

<?php
if(empty($schedules)){
    echo "<p>No schedules found.</p>";
} else {
    foreach($schedules as $s){
        echo "<form method='post' action='book.php'>
        Time: {$s['time_slot']} | Seats: {$s['available_seats']}<br>
        <input type='hidden' name='schedule_id' value='{$s['id']}'>
        <button ".($s['available_seats'] <= 0 ? 'disabled' : '').">Book</button>
        </form><br>";
    }
}
?>

<a href='index.php'>⬅ Back</a>
