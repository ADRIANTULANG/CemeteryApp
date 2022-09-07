<?php
include 'conn.php'; 
$result=array();
try {

$queryResult=$connect->query("SELECT a.dcs_fname,a.dcs_mname,a.dcs_lname,c.lot_latitude,c.lot_longitude,c.cementery_id FROM tbldeceased a LEFT JOIN tbllot_deceased b ON a.dcs_id = b.dcs_id LEFT JOIN tbllot c ON b.lot_id = c.lot_id WHERE b.ld_id is not NULL");

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
