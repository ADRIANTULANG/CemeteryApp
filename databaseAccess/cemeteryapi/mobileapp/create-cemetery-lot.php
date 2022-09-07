<?php
include 'conn.php'; 
$result=array();
try {
    
$lot_type = "1";
$lot_longitude = $_POST['lot_longitude'];
$lot_latitude = $_POST['lot_latitude'];
$cementery_id = $_POST['cementery_id'];
$status = "1";
$lot_price = $_POST['lot_price'];
$lot_description = $_POST['lot_description'];


$queryResult=$connect->query("INSERT INTO `tbllot`( `lot_type`, `lot_longitude`, `lot_latitude`, `cementery_id`, `status`, `lot_price`, `lot_description`) VALUES ('$lot_type','$lot_longitude','$lot_latitude','$cementery_id','$status','$lot_price','$lot_description')");

// while($fetchData=$queryResult->fetch_assoc()){
// $result[]=$fetchData;
// }
$result = array(

	'success' => true, 'message' => 'Success'

);
} catch (Exception $e) {
	$result = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($result);
?>
