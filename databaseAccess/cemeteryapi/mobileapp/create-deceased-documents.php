<?php
include 'conn.php'; 
$result=array();
try {
$dcs_image = $_POST['dcs_image'];
$dcs_description = $_POST['dcs_description'];
$deceased_id = $_POST['deceased_id'];


$queryResult=$connect->query("INSERT INTO `tbldecease_document`( `dd_image`, `dd_description`, `dcs_id`) VALUES ('$dcs_image','$dcs_description','$deceased_id')");


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
