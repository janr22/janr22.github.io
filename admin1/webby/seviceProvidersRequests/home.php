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
        $sql = mysqli_query($conn,"SELECT * from service_provider WHERE request='Pending'");
        
        if($sql->num_rows > '0'){
            
			echo "<table class='table table-striped table-bordered table-hover id='dataTables-example';>";
 			
			echo "
			
                
            <tr>
				<td>ID</td>
				<td>Username</td>
                <td>Email</td>
				<td>Firstname</td>
				<td>Lastname</td>
                <td>Address</td>
                <td>Contact Number</td>
                <td>image</td>
                <td>Password</td>
				<td>Request</td>
				<td>approval</td>
			</tr>
				";
            
            while($row = mysqli_fetch_assoc($sql)){
                	$id =$row['id'];
                    $username=$row['username'];
                    $email=$row['email'];                 
					$first_name=$row['first_name'];
					$last_name=$row['last_name'];
                    $address=$row['address'];
                    $contact=$row['contact'];
                    $image=$row['image'];  
                    $password  =$row['password'];
					$request=$row['request'];
                
                
                echo"
                <tr>
                
                    <td>$id</td>
                    <td>$username</td>
                    <td>$email </td>
					<td>$firs_tname</td>
					<td>$last_name</td>
                    <td>$address</td>
                    <td>$contact</td>
					<td>$image</td>	
					<td>$password</td>
                    <td>$request</td>
                    <td><form action='changeStatus.php' method='POST'>
                    <button class='btn-primary' value='$id,approved' name='approve'>Approved</button>
                    <button class='btn-danger' value='$id,blocked' name='block'>Block</button>
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
