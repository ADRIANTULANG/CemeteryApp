<?php
include 'conn.php'; 
$result=array();
try {
    
$ClientID = $_POST['ClientID'];


$queryResult=$connect->query("SELECT * FROM `tblclient` WHERE ClientID = '$ClientID'");

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
