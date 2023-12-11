<?php
# Check if session has started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

# Check if user is logged in
if (isset($_SESSION['user'])) {
    echo json_encode(['success' => true, 'message' => 'User is logged in', 'user' => $_SESSION['user']]);
} else {
    echo json_encode(['success' => false, 'message' => 'User is not logged in']);
}

?>






