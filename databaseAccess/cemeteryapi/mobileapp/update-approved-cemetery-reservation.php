<?php
include 'conn.php'; 
$result=array();
try {
$res_id = $_POST['res_id'];
$lot_id = $_POST['lot_id'];
$cementery_id = $_POST['cementery_id'];
$dcs_id = $_POST['dcs_id'];



$firstqueryResult=$connect->query("UPDATE `tblreservation` SET `res_status`='2' WHERE res_id = '$res_id'");

$secondqueryResult=$connect->query("UPDATE `tbllot` SET `status`='3' WHERE lot_id = '$lot_id' AND cementery_id = '$cementery_id'");

$thirdqueryResult=$connect->query("INSERT INTO `tbllot_deceased`(`dcs_id`, `lot_id`) VALUES ('$dcs_id','$lot_id')");


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
