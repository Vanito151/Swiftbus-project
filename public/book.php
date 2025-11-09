<?php
session_start();
require "../includes/db.php";


if(!isset($_SESSION['user_id'])){
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$schedule_id = $_POST['schedule_id'];

// Lock schedule seat count
$pdo->beginTransaction();

$stmt = $pdo->prepare("SELECT available_seats FROM schedules WHERE id=? FOR UPDATE");
$stmt->execute([$schedule_id]);
$data = $stmt->fetch();

if($data['available_seats'] > 0){
    // insert booking
    $pdo->prepare("INSERT INTO bookings (user_id, schedule_id) VALUES (?,?)")
        ->execute([$user_id, $schedule_id]);

    // reduce seat
    $pdo->prepare("UPDATE schedules SET available_seats = available_seats - 1 WHERE id=?")
        ->execute([$schedule_id]);

    $pdo->commit();
    echo "✅ Seat booked successfully!<br><a href='index.php'>Back to Home</a>";
} else {
    $pdo->rollBack();
    echo "❌ No seats left.<br><a href='index.php'>Back to Home</a>";
}
