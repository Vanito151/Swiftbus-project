<?php
require "../includes/auth.php";
require "../includes/db.php";
?>

<link rel="stylesheet" href="/swiftbus/assets/style/style.css">

<h2>SwiftBus Admin Dashboard</h2>

<?php
// Get all routes
$routes = $pdo->query("SELECT * FROM routes")->fetchAll();

echo "<a href='create_route.php'>➕ Create New Bus Route</a><br><br>";

foreach($routes as $r){
    echo "<p><b>{$r['title']}</b> 
    <a href='create_schedule.php?route={$r['id']}'>➕ Add Schedule</a></p>";
}

echo "<br><a href='../public/index.php'>🏠 Back to Home</a><br><br>";
echo "<a href='../reports/bookings_report.php'>📊 View Booking Report</a><br><br>";
echo "<a href='../reports/chart_report.php'>📊 View Booking Chart</a><br><br>";
echo "<a href='../public/logout.php'>🚪 Logout</a><br><br>";
?>
