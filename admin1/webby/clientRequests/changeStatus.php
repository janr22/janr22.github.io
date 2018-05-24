<?php
require("connect.php");
$approveid = explode(",",$_POST['approve']);
$blockid = $_POST['block'];
$sqlApprove = "UPDATE user SET request='approved' WHERE id_no='$approveid[0]'"; 
$sqlBlock = "UPDATE user SET request='blocked' WHERE id_no='$blockid'";


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
