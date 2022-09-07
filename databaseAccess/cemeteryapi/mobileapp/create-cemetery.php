<?php
include 'conn.php'; 
$result=array();
try {
$cm_name = $_POST['cm_name'];
$cm_longitude = $_POST['cm_longitude'];
$cm_latitude = $_POST['cm_latitude'];
$c_description = $_POST['c_description'];
$cm_email = $_POST['cm_email'];
$cm_address = $_POST['cm_address'];
$cem_image = $_POST['cem_image'];
$username = $_POST['username'];
$password = $_POST['password'];
$userttype = "2";
$status = "1";



$queryResult=$connect->query("INSERT INTO `tblcementery`(`cm_name`, `cm_longitude`, `cm_latitude`, `c_description`, `cm_email`, `cm_address`, `cem_image`) VALUES ('$cm_name','$cm_longitude','$cm_latitude','$c_description','$cm_email','$cm_address','$cem_image')");
 
$last_id =$connect->insert_id;

$newqueryResult=$connect->query("INSERT INTO `tbluseraccount`( `username`, `password`, `userID`, `usertypeID`, `status`) VALUES ('$username','$password','$last_id','$userttype','$status')");

// while($fetchData=$queryResult->fetch_assoc()){
// $result[]=$fetchData;
// }
$result = array(

	'success' => true, 'message' => 'Success', 'last_id'=> $last_id

);
} catch (Exception $e) {
	$result = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($result);
?>
