<?php
include 'conn.php'; 
$result=array();
try {
$ClientFirstName = $_POST['ClientFirstName'];
$ClientMiddlename = $_POST['ClientMiddlename'];
$ClientLastname = $_POST['ClientLastname'];
$email = $_POST['email'];
$ClientImage = $_POST['ClientImage'];
$username = $_POST['username'];
$password = $_POST['password'];
$userttype = "3";
$status = "1";



$queryResult=$connect->query("INSERT INTO `tblclient`(`ClientFirstName`,`ClientMiddlename`,`ClientLastname`,`email`, `ClientImage`) VALUES ('$ClientFirstName','$ClientMiddlename','$ClientLastname','$email','$ClientImage')");
 
$last_id =$connect->insert_id;

$newqueryResult=$connect->query("INSERT INTO `tbluseraccount`( `username`, `password`, `userID`, `usertypeID`, `status`) VALUES ('$username','$password','$last_id','$userttype','$status')");

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
