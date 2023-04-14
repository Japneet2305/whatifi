<?php
// Fetch form data
$songName = $_POST['songName'];
$userName = $_POST['userName'];

// Perform database connection
$servername = ""; // Replace with your database server name
$username = "root"; // Replace with your database username
$password = "5boron6carbon"; // Replace with your database password
$dbname = "spotifyproject"; // Replace with your database name

$conn = new mysqli($servername, $username, $password, $dbname);

// Check for database connection errors
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Perform database query
// Replace with your own query logic
// $query = "SELECT  FROM  WHERE song_name = '$songName' AND user_name = '$userName'";
$query = "SELECT * FROM Top_Songs;";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    // Fetch recommendation data
    $row = $result->fetch_assoc();
    $recommendedSong = $row['recommended_song'];

    // Prepare JSON response
    $response = array('song' => $recommendedSong, 'user' => $userName);
    echo json_encode($response);
} else {
    // No recommendation found
    echo "No recommendation found";
}

// Close database connection
$conn->close();
?>
