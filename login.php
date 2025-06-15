<?php 
$host = 'localhost'; 
$db = 'kino'; 
$user = 'root'; 
$pass = ''; 
$conn = new mysqli($host, $user, $pass, $db); 
if ($conn->connect_error) { 
    http_response_code(500);
     echo json_encode(["error" => "Błąd połączenia z bazą"]); 
exit; 
} 
$data = json_decode(file_get_contents("php://input"), true); 
$login = $conn->real_escape_string($data['login']); 
$password = $conn->real_escape_string($data['password']); 
$sql = "SELECT * FROM Uzytkownicy WHERE login = '$login' AND haslo = '$password'"; 
$result = $conn->query($sql); 
if ($row = $result->fetch_assoc()) { 
    echo json_encode(["success" => true, "rola" => $row["rola"]]); 
    } else { 
        echo json_encode(["success" => false]); 
        } 
$conn->close(); 
?>