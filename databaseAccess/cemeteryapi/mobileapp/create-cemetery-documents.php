<?php
include 'conn.php'; 
$result=array();
try {
$cd_image = $_POST['cd_image'];
$cd_description = $_POST['cd_description'];
$cementery_id = $_POST['cementery_id'];


$queryResult=$connect->query("INSERT INTO `tblcementery_document`( `cd_image`, `cd_description`, `cementery_id`) VALUES ('$cd_image','$cd_description','$cementery_id')");


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
