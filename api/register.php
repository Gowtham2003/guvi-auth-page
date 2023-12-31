<?php
session_start();
include 'db.php';

$response = array();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Validate inputs
    if (empty($username) || empty($password)) {
        $response['success'] = false;
        $response['message'] = "Username and password are required.";
    } else {
        // Sanitize inputs
        $name = mysqli_real_escape_string($conn, $name);
        $username = mysqli_real_escape_string($conn, $username);
        $password = mysqli_real_escape_string($conn, $password);
        // check if username already exists
        $sql = "SELECT * FROM users WHERE username = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $response['success'] = false;
            $response['message'] = "Username already exists.";
            $stmt->close();
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        }

        // hash password
        $password = password_hash($password, PASSWORD_DEFAULT);

        // Insert user data into the database
        $sql = "INSERT INTO users (name,username, password) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $name, $username, $password);

        if ($stmt->execute()) {
            // Set user session
            $user_id = $stmt->insert_id;
            $_SESSION['id'] = $user_id;
            $_SESSION['username'] = $username;

            $response['success'] = true;
            $response['message'] = "Registration successful.";
        } else {
            $response['success'] = false;
            $response['message'] = "Registration failed.";
        }

        $stmt->close();
    }
} else {
    $response['success'] = false;
    $response['message'] = "Invalid request method.";
}

header('Content-Type: application/json');
echo json_encode($response);
