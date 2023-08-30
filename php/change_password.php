<?php
session_start();
include 'db.php';

$response = array();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $currentPassword = $_POST['currentPassword'];
    $newPassword = $_POST['newPassword'];

    // Validate inputs
    if (empty($currentPassword) || empty($newPassword)) {
        $response['success'] = false;
        $response['message'] = "Current password and new password are required.";
    } else {
        // You should perform proper validation and sanitization

        $user_id = $_SESSION['id'];

        // Get current password from the database
        $sql = "SELECT password FROM users WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        // Verify current password
        if (!password_verify($currentPassword, $row['password'])) {
            $response['success'] = false;
            $response['message'] = "Current password is incorrect.";
            $stmt->close();
            header('Content-Type: application/json');
            echo json_encode($response);
            exit;
        }

        // Update password in the database (plain text for demonstration purposes)
        $sql = "UPDATE users SET password = ? WHERE id = ?";
        $stmt = $conn->prepare($sql);
        // Hash new password
        $newPassword = password_hash($newPassword, PASSWORD_DEFAULT);
        $stmt->bind_param("si", $newPassword, $user_id);

        if ($stmt->execute()) {
            $response['success'] = true;
            $response['message'] = "Password changed successfully.";
        } else {
            $response['success'] = false;
            $response['message'] = "Failed to change password.";
        }

        $stmt->close();
    }
} else {
    $response['success'] = false;
    $response['message'] = "Invalid request method.";
}

header('Content-Type: application/json');
echo json_encode($response);
