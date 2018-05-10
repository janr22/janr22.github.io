<?php

if(isset($_POST["action"])){
	include("db.php");

	if ($_POST["action"] == 'fetch') {
		$output = '';
		$query = "SELECT * FROM user_details WHERE user_type = 'user' ORDER BY user_name ASC";
		$statement = $connect->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$output .= '
			<table class=" table table boardered table-striped"> 
			<tr>
				<td>Name</td>
				<td>Email</td>
				<td>Status</td>
				<td>Action</td>
			</tr>
		';

		foreach ($result as $row ) {
			$status = '';
			if ($row["user_status"] == 'Active') {
				$status = '<span class="label label-success"> Active</span>';
			}else{
				$status = '<span class="label label-success"> Inactive</span>';
			}
			$output .= '
			<tr>
				<td>'.$row["user_name"].'</td>
				<td>'.$row["user_email"].'</td>
				<td>'.$status.'</td>
				<td><button type="button" name="action" class="btn btn-info btn-xs action" data-user_id="'.$row["user_id"].'" data-user_status='.$row["user_status"].'>Action</button></td>
			</tr>
			';
		}
		$output .= '</table>';
		echo $output;
	}
	if($_POST["action"] == 'change_status'){
		$status='';
		if($_POST['user_status'] == 'Active'){
			$status = 'Inactive';
		}else{
			$status='Active';
		}

		$query = 'UPDATE user_details SET user_status = :user_status WHERE user_id= :user_id';
		$statement = $connect->prepare($query);
		$statement->execute(
			array(
				':user_status'  => $status,
				':user_id'		=> $_POST['user_id']

			)
		);
		$result=$statement->fetchAll();
		if(isset($result)){
			echo '<div class="alert alert-success">User status has been set to <strong>'.$status.'</strong></div>';
		}
	}
}
?>