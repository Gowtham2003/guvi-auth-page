<?php
// $host = 'localhost';
// $username = 'alpha';
// $password = '';
// $database = 'guvi';

// Read environment variables
$host = $_SERVER['HTTP_DB_HOST'] ?? 'localhost';
$username = $_SERVER['HTTP_DB_USERNAME'] ?? 'alpha';
$password = $_SERVER['HTTP_DB_PASSWORD'] ?? '';
$database = $_SERVER['HTTP_DB_DATABASE'] ?? 'guvi';
$port = $_SERVER['HTTP_DB_PORT'] ?? 3306;

if (!$host || !$username || !$database) {
    die("One or more environment variables not set.");
}

// Create a connection to the database
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to execute prepared statement with binding and returning results
function executeStatement($query, $params = array())
{
    global $conn;

    $stmt = $conn->prepare($query);

    if ($stmt === false) {
        die("Error in preparing statement: " . $conn->error);
    }

    if (!empty($params)) {
        $paramTypes = '';
        foreach ($params as $param) {
            if (is_int($param)) {
                $paramTypes .= 'i';
            } elseif (is_double($param)) {
                $paramTypes .= 'd';
            } else {
                $paramTypes .= 's';
            }
        }
        array_unshift($params, $paramTypes);

        call_user_func_array(array($stmt, 'bind_param'), $params);
    }

    if ($stmt->execute() === false) {
        die("Error in executing statement: " . $stmt->error);
    }

    $result = $stmt->get_result();
    $stmt->close();

    return $result;
}
