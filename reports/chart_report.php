<?php
require "../includes/auth.php";
require "../includes/db.php";


// Get data for chart
$data = $pdo->query("
SELECT r.title, COUNT(b.id) AS total
FROM routes r
LEFT JOIN schedules s ON r.id = s.route_id
LEFT JOIN bookings b ON b.schedule_id = s.id
GROUP BY r.id
")->fetchAll();

$labels = [];
$values = [];

foreach($data as $d){
    $labels[] = $d['title'];
    $values[] = $d['total'];
}
?>

<link rel="stylesheet" href="/swiftbus/assets/style/style.css">


<h2>📊 SwiftBus Booking Chart</h2>

<canvas id="myChart" width="400" height="200"></canvas>

<script src="../assets/js/chart.min.js"></script>
<script>
const labels = <?= json_encode($labels); ?>;
const values = <?= json_encode($values); ?>;

new Chart(document.getElementById('myChart'), {
    type: 'bar',
    data: {
        labels: labels,
        datasets: [{
            label: 'Number of Bookings',
            data: values
        }]
    }
});
</script>

<br>
<a href="../admin/dashboard.php">⬅ Back to Dashboard</a>
