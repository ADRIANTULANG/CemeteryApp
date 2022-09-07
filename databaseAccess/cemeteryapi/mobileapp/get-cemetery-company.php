<?php
include 'conn.php'; 
$result=array();
try {
// $username = $_POST['username'];
// $password = $_POST['password'];

$queryResult=$connect->query("SELECT `cementery_id` as id, `cm_name` as name, `cm_longitude` as longitude, `cm_latitude` as latitude, `c_description` as companyDescription, `cm_email`, `cm_contactno` as contactNumber, `cm_address` as address, `cem_image` as image FROM `tblcementery`");

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
