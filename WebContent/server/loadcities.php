<?php
function utf8ize($mixed) {
    if (is_array($mixed)) {
        foreach ($mixed as $key => $value) {
            $mixed[$key] = utf8ize($value);
        }
    } else if (is_string ($mixed)) {
        return utf8_encode($mixed);
    }
    return $mixed;
}


header('Content-Type: application/json');
error_reporting(E_ALL);
ini_set('display_errors', 1);
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "realestate";

$query = htmlspecialchars($_GET["q"]);

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname, 3307);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT * FROM city WHERE name like '%".$query."%'";
$result = $conn->query($sql);

$return_arr = array(); 


	while($row = $result->fetch_assoc()){
		$getId = $row['id']; 
		$getCityName = $row['name']; 			
		$getPostcode = $row['postcode']; 			
		$return_arr[] = array('id' => $getId, 'name' => $getCityName, 'postcode' => $getPostcode);
	}

echo json_encode(utf8ize($return_arr),JSON_FORCE_OBJECT);

$conn->close();
?>