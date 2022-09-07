<?php

$connect = new mysqli("localhost","u802369894_obrm","Obrm2022","u802369894_obrm_db");


if($connect){
	$result=array();
    try {
    $image = $_FILES['image']['name'];
    $name = $_POST['name'];
    $imagePath = 'obrm/assets/images/'.$image;
    $tmp_name = $_FILES['image']['tmp_name'];
    
    move_uploaded_file($tmp_name,$imagePath);
    
    $result = array(
    
    	'success' => true, 'message' => 'Success'
    
    );
    } catch (Exception $e) {
    	$result = array(
    
            'success' => false, 'message' => 'Error. Please try again. ' . $e
    
        );
    }
    echo json_encode($result);
}else{
	
	echo "connection failed";
	exit();
}

