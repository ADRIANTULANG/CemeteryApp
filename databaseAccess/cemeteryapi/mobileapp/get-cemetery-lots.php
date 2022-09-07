<?php
include 'conn.php'; 
$result=array();
try {
$cemeteryID = $_POST['cemeteryID'];


$queryResult=$connect->query("SELECT * FROM `tbllot` a WHERE a.cementery_id = '$cemeteryID' ORDER BY lot_id DESC");

while($fetchData=$queryResult->fetch_assoc()){
$result[]=$fetchData;
}
$data = array(

	'success' => true, 'data'=> $result, 'message' => 'Success'

);
} catch (Exception $e) {
	$data = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($data);
?>
