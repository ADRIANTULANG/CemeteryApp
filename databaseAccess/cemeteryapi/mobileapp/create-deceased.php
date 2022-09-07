<?php
include 'conn.php'; 
$result=array();
try {
$dcs_fname = $_POST['dcs_fname'];
$dcs_lname = $_POST['dcs_lname'];
$dcs_mname = $_POST['dcs_mname'];
$dcs_civil_status = $_POST['dcs_civil_status'];
$dcs_age = $_POST['dcs_age'];
$dcs_gender = $_POST['dcs_gender'];
$dcs_address = $_POST['dcs_address'];
$dcs_do_birth = $_POST['dcs_do_birth'];
$dcs_do_death = $_POST['dcs_do_death'];
$sched_of_burial = $_POST['sched_of_burial'];
$lot_id = $_POST['lot_id'];
$clientID = $_POST['clientID'];
$status = "0";
$reservationStatus = "1";

$queryResult=$connect->query("INSERT INTO `tbldeceased`(`dcs_fname`, `dcs_lname`, `dcs_mname`, `dcs_civil_status`, `dcs_age`,`dcs_gender`, `dcs_address`, `dcs_do_birth`, `dcs_do_death`, `sched_of_burial`, `status`) VALUES ('$dcs_fname','$dcs_lname','$dcs_mname','$dcs_civil_status','$dcs_age','$dcs_gender','$dcs_address','$dcs_do_birth','$dcs_do_death','$sched_of_burial','$status')");
 
$last_id =$connect->insert_id;

$newqueryResult=$connect->query("INSERT INTO `tblreservation`( `res_status`, `res_deceased`, `res_lot_id`, `res_filedby`) VALUES ('$reservationStatus','$last_id','$lot_id','$clientID')");

// while($fetchData=$queryResult->fetch_assoc()){
// $result[]=$fetchData;
// }
$result = array(

	'success' => true, 'message' => 'Success', 'deceasedID' => $last_id

);
} catch (Exception $e) {
	$result = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($result);
?>
