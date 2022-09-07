<?php
include 'conn.php'; 
$result=array();
try {
    
$cementery_id = $_POST['cementery_id'];

$queryResult=$connect->query("SELECT a.res_id,a.res_lot_id,a.res_status,b.dcs_fname,b.dcs_mname,b.dcs_lname,b.sched_of_burial,b.dcs_id,c.lot_longitude,c.lot_latitude,c.lot_price,b.dcs_civil_status,b.dcs_age,b.dcs_gender, b.dcs_address, b.dcs_do_birth, b.dcs_do_death FROM `tblreservation` a LEFT JOIN tbldeceased b 
    ON a.res_deceased = b.dcs_id LEFT JOIN tbllot c
    ON a.res_lot_id = c.lot_id WHERE c.cementery_id = '$cementery_id'");

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
