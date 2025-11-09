<?php
require "../includes/auth.php";
require "../includes/db.php";


echo "<h2>SwiftBus Booking Report</h2>";

// Get booking counts per route
$routes = $pdo->query("
SELECT r.title, COUNT(b.id) AS total_bookings
FROM routes r
LEFT JOIN schedules s ON r.id = s.route_id
LEFT JOIN bookings b ON b.schedule_id = s.id
GROUP BY r.id
")->fetchAll();

foreach($routes as $r){
    echo "<p><b>{$r['title']}</b> — {$r['total_bookings']} bookings</p>";
}

// Show user details per route when clicked
if(isset($_GET['route'])){
    $route_id = $_GET['route'];

    echo "<h3>Users who booked this route:</h3>";

    $users = $pdo->prepare("
        SELECT u.username, u.email, s.time_slot, b.booking_time 
        FROM bookings b
        JOIN users u ON b.user_id = u.id
        JOIN schedules s ON b.schedule_id = s.id
        WHERE s.route_id = ?
    ");
    $users->execute([$route_id]);
    $users = $users->fetchAll();

    foreach($users as $u){
        echo "<p>
            User: {$u['username']} ({$u['email']})<br>
            Time Slot: {$u['time_slot']}<br>
            Booked at: {$u['booking_time']}
        </p>";
    }
}

echo "<br><a href='../admin/dashboard.php'>⬅ Back to Dashboard</a>";
