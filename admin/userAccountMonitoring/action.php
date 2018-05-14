<?php

if(isset($_POST["action"])){
	include('db.php');

	if ($_POST["action"] == 'fetch') {
		$output = '';
		$query = "SELECT * FROM users WHERE user = 'member' OR user ='seviceprovider' ORDER BY username ASC";
		$statement = $connect->prepare($query);
		$statement->execute();
		$result = $statement->fetchAll();
		$output .= '
			<table class=" table table boardered table-striped"> 
			<tr>
				<td>Username</td>
				<td>Email</td>
                <td>Type</td>
				<td>Status</td>
				<td>Action</td>
			</tr>
		';

		foreach ($result as $row ) {
			$status = '';
			if ($row["status"] == 'Active') {
				$status = '<span class="label label-success"> Active</span>';
			}else{
				$status = '<span class="label label-success"> Inactive</span>';
			}
			$output .= '
			<tr>
				<td>'.$row["username"].'</td>
				<td>'.$row["email"].'</td>
                <td>'.$row["user"].'</td>
				<td>'.$status.'</td>
				<td><button type="button" name="action" class="btn btn-info btn-xs action" data-id="'.$row["id"].'" data-status='.$row["status"].'>Action</button></td>
			</tr>
			';
		}
		$output .= '</table>';
		echo $output;
	}
	if($_POST["action"] == 'change_status'){
		$status='';
		if($_POST['status'] == 'Active'){
			$status = 'Inactive';
		}else{
			$status='Active';
		}

		$query = 'UPDATE users SET status = :status WHERE id= :id';
		$statement = $connect->prepare($query);
		$statement->execute(
			array(
				':status'  => $status,
				':id'		=> $_POST['id']

			)
		);
		$result=$statement->fetchAll();
		if(isset($result)){
			echo '<div class="alert alert-success">User status has been set to <strong>'.$status.'</strong></div>';
		}
	}
}
?>