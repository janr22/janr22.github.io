<? php session_start();
include ("dbconfig.php");

if(isset($_POST["username"])){
	$username= $_POST["username"];
}
if(isset($_POST["password"])){
	$password=$_POST["password"];
}

$query = "SELECT * FROM `user` WHERE useremail= '".$username."'";

$result = $db_con->query($query);

$total_rows = $result->rowCount();

if($total_rows > 0){

while($row = $result->fetch(PDO::FETCH_ASSOC)){
	if($row['password'] == md5($password)){
		$_SESSION['logged_user_id'] = $row['id'];
		echo "success'"
	}else{
		echo "error";
	}
}
}else{
	echo "no user";
}

?>