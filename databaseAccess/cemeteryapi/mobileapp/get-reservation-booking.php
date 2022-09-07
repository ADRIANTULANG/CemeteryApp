<?php
include 'conn.php'; 
$result=array();
try {
    
$clientID = $_POST['clientID'];


$queryResult=$connect->query("SELECT a.res_id,a.res_status, b.dcs_fname,b.dcs_mname,b.dcs_lname,c.lot_price,d.cm_name
                            FROM tblreservation a LEFT JOIN tbldeceased b 
                            ON a.res_deceased = b.dcs_id 
                            LEFT JOIN tbllot c ON a.res_lot_id = c.lot_id
                            LEFT JOIN tblcementery d ON c.cementery_id = d.cementery_id
                            WHERE a.res_filedby = '$clientID' ORDER BY a.res_id DESC ");

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
