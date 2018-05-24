<?php
	ob_start();
	session_start();
	require('connect.php');


	
?>
<!DOCTYPE html>
<html>
<head>
<title>Welcome<?php echo "$userRow[firstname]"; ?></title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="style.css" type="text/css" />
</head>
<body>

	

	<div id="wrapper">
	<div class="container">
    	<div class="page-header">
		<br>
    	<h2><center><b>Approve Request</b></center></h2>
    	</div>
			
			<?php
        $sql = mysqli_query($conn,"SELECT * from user WHERE request='Pending'");
        
        if($sql->num_rows > '0'){
            
			echo "<table class='table table-striped table-bordered table-hover id='dataTables-example';>";
 			
			echo "
			
                
            <tr>
				<td>ID</td>
				<td>Username</td>
                <td>Password</td>
				<td>Firstname</td>
				<td>Lastname</td>
                <td>Contact Number</td>
				<td>Address</td>
                <td>Email</td>
				<td>Request</td>
				<td>approval</td>
			</tr>
				";
            
            while($row = mysqli_fetch_assoc($sql)){
                	$id_no =$row['id_no'];
                    $user_name=$row['user_name'];
                    $password  =$row['password'];
					$firstname=$row['firstname'];
					$lastname=$row['lastname'];
                    $contact_num=$row['contact_num'];
                    $address=$row['address'];
					$email=$row['email'];  
					$request=$row['request'];
                
                
                echo"
                <tr>
                
                    <td>$id_no</td>
                    <td>$user_name</td>
                    <td>$password </td>
					<td>$firstname</td>
					<td>$lastname</td>
                    <td>$contact_num</td>
                    <td>$address</td>
					<td>$email</td>	
					<td>$request</td>
                    <td><form action='changeStatus.php' method='POST'>
                    <button class='btn-primary' value='$id_no,approved' name='approve'>Approved</button>
                    <button class='btn-danger' value='$id_no,blocked' name='block'>Block</button>
                    </form>
                    </td>
                    
                </tr>    
                
                
                
                
                ";
            }
        }
?>
    <script src="assets/jquery-1.11.3-jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
