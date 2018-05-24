<?php
require("connect.php");
$approveid = explode(",",$_POST['approve']);
$blockid = $_POST['block'];
$sqlApprove = "UPDATE service_provider SET request='approved' WHERE id='$approveid[0]'"; 
$sqlBlock = "UPDATE service_provider SET request='blocked' WHERE id='$blockid'";


if(isset($approveid[1])){
$sql = mysqli_query($conn,$sqlApprove);

if($sql){
echo " success approve";
    header("location: home.php");
}else{
echo "failed";
}
}else{
$sql = mysqli_query($conn,$sqlBlock);


if($sql){
echo "Success block";
    header("location: home.php");
}else{
echo "Failed block";
}
}
?>
