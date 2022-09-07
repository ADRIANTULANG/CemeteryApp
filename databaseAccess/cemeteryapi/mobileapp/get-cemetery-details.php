<?php
include 'conn.php'; 
$result=array();
try {
    
$cementery_id = $_POST['cementery_id'];

$queryResult=$connect->query("SELECT * FROM `tblcementery` WHERE cementery_id = '$cementery_id'");

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
