<?php
session_start();
require "../includes/db.php";
?>

<link rel="stylesheet" href="/swiftbus/assets/style/style.css">

<?php
echo "<h2>Welcome to SwiftBus Booker</h2>";

// get all routes
$routes = $pdo->query("SELECT * FROM routes")->fetchAll();

if(empty($routes)){
    echo "<p>No routes available yet.</p>";
} else {
    foreach($routes as $r) {
        echo "<p>
        <b>{$r['title']}</b><br>
        <a href='schedule.php?route={$r['id']}'>View Schedules</a>
        </p>";
    }
}

if(isset($_SESSION['is_admin']) && $_SESSION['is_admin'] == 1){
    echo "<br><a href='../admin/dashboard.php'>🔧 Admin Dashboard</a>";
}

echo "<br><br><a href='logout.php'>Logout</a>";
?>
