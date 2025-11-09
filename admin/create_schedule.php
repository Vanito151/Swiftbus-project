<?php
require "../includes/auth.php";
require "../includes/db.php";

$route_id = $_GET['route'] ?? null;

if (!$route_id) {
    die("No route selected.");
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $time = $_POST['time'];
    $seats = $_POST['seats'];

    $stmt = $pdo->prepare("INSERT INTO schedules (route_id, time_slot, max_seats, available_seats) VALUES (?, ?, ?, ?)");
    $stmt->execute([$route_id, $time, $seats, $seats]);

    echo "<p style='color:green;'>✅ Schedule added successfully!</p>";
}
?>
<link rel="stylesheet" href="/swiftbus/assets/style/style.css">


<h2>Add Schedule for Route #<?= $route_id ?></h2>

<form method="post">
    Time Slot (e.g., 08:00 AM)<br>
    <input type="text" name="time" required><br><br>

    Number of Seats<br>
    <input type="number" name="seats" value="40" required><br><br>

    <button type="submit">Add Schedule</button>
</form>

<a href="dashboard.php">⬅ Back to Dashboard</a>
