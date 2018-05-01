<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>


<body>
<div class="col-md-4 col-md-offset-4">
<h1 class="text-center">Login Form</h1>

<form id="LoginForm">
<div class="form-group">
<input class="form-control" name="username" type ="text">
</div>

<div class="form-group">
<input class="form-control" name="password" type="password">
</div>

<div class="form-group">
<input class="btn btn-info" type="submit" value="Login">
</div>

<div class="form-group">
<div id="response"></div>
</div>

</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).on("submit","#LoginForm",function(event){
			event.preventDefault();
			
			$.ajax({
				type:"POST",
				url:"do_login.php",
				data:$(this).serialize(),
				success: function(response){

					if(response == "success"){
						$("#response").html("<div class='alert alert-success'>Login success</div>");
						$("#response.alert").slideDown("slow");
					}
					if(response == "error"){
						$("#response").html("<div class='alert alert-warning'>User Password is incorrect</div>");
						$("#response.alert").slideDown("slow");
					}
					if(response == "nouser"){
						$("#response").html("<div class='alert alert-warning'>Email is not register	</div>");
						$("#response.alert").slideDown("slow");
					}

				}
			});
		});
	});
</script>
</body>
</html>