<?php
include 'conn.php'; 
$result=array();
try {
$res_id = $_POST['res_id'];

$firstqueryResult=$connect->query("UPDATE `tblreservation` SET `res_status`='3' WHERE res_id = '$res_id'");

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
