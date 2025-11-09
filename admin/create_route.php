<?php
require "../includes/auth.php";
require "../includes/db.php";


if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $title = $_POST['title'];
    $desc = $_POST['description'];

    $stmt = $pdo->prepare("INSERT INTO routes (title, description) VALUES (?, ?)");
    $stmt->execute([$title, $desc]);

    echo "<p style='color:green;'>✅ Route created successfully!</p>";
}

?>
<link rel="stylesheet" href="/swiftbus/assets/style/style.css">


<h2>Create Bus Route</h2>

<form method="post">
    <input type="text" name="title" placeholder="Route Name (e.g., Downtown to Campus)" required><br><br>
    <textarea name="description" placeholder="Route description"></textarea><br><br>
    <button type="submit">Create Route</button>
</form>

<a href="dashboard.php">⬅ Back to Dashboard</a>
