<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SIGN UP</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/auth.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<style>
.success
{
    color:green;
}
.error
{
    color:red;
}

</style>

<body>
<%@ include file = "layout.jsp" %>
<div class="signup-form">	
    <form action="register" method="post" enctype="multipart/form-data">
		<h2>Create Account</h2>
		<p class="lead">It's free and hardly takes more than 30 seconds.</p>
		<div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="text" class="form-control" name="first_name" placeholder="First Name" required>
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="text" class="form-control" name="last_name" placeholder="Last Name" required>
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				
				<input id="myuser" type="text" class="form-control" name="username" placeholder="Username" required>
			
				<span id="result"></span>
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
				<input type="email" class="form-control" name="email" placeholder="Email Address" required>
			</div>
        </div>
        
		<div class="form-group">
			<div class="input-group" id="test">
				
				<span class="input-group-addon"><i class="fa fa-lock"></i></span>
				
				<input  type="password"  class="form-control" name="password" placeholder="Password" id="password" required>
				<i class="far fa-eye" id="togglePassword"></i>
				
			</div>
        </div>
		<div class="form-group">
		 	<div class="input-group">
		 		<label class="file">
		 				<span class="input-group-addon"><i class="fa fa-image"></i></span>
					  <input type="file" id="file" aria-label="File browser example"  name="profilepicture">
					  <span class="file-custom"></span>
					</label>
							 		
		 	</div>
		 </div>   
		<div class="form-group">
            <button id="signup" type="submit" class="btn btn-primary btn-block btn-lg">Sign Up</button>
        </div>
		<p class="small text-center">By clicking the Sign Up button, you agree to our <br><a href="#">Terms &amp; Conditions</a>, and <a href="#">Privacy Policy</a>.</p>
    </form>
	<div class="text-center">Already have an account? <a href="login">Login here</a>.</div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script>
const togglePassword = document.querySelector('#togglePassword');
const password = document.querySelector('#password');
togglePassword.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});
</script>
<script>
$(document).ready(function(){
	$('#myuser').change(function(){
		
		var myuser= $('#myuser').val();
		$.ajax({
			type:'POST',
			data:{username:myuser},
			url:'usernamecheck',
			success:function(result){
				result:$('#result').html(result);
				if(result=="username valid")
				{$('#result').removeClass('error')
				    $('#result').addClass('success');
					document.getElementById("signup").disabled = false;
					 
					
				   
				}
				else
				{$('#result').removeClass('success')
				    $('#result').addClass('error');
					document.getElementById("signup").disabled = true;
					
					
				}
				
				
				
			}
		});
		
	});
});
</script>


</html>