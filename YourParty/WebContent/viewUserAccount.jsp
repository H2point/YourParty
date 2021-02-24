<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>View Account</title>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box
}

body {
    font-family: 'Poppins', sans-serif;
    background-color: aliceblue
}

.wrapper {
    padding: 30px 50px;
    border: 1px solid #ddd;
    border-radius: 15px;
    margin: 10px auto;
    max-width: 600px
}

h4 {
    letter-spacing: -1px;
    font-weight: 400
}

.img {
    width: 70px;
    height: 70px;
    border-radius: 6px;
    object-fit: cover
}

#img-section p,
#deactivate p {
    font-size: 12px;
    color: #777;
    margin-bottom: 10px;
    text-align: justify
}

#img-section b,
#img-section button,
#deactivate b {
    font-size: 14px
}

label {
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 500;
    color: #777;
    padding-left: 3px
}

.form-control {
    border-radius: 10px
}

input[placeholder] {
    font-weight: 500
}

.form-control:focus {
    box-shadow: none;
    border: 1.5px solid #0779e4
}

select {
    display: block;
    width: 100%;
    border: 1px solid #ddd;
    border-radius: 10px;
    height: 40px;
    padding: 5px 10px
}

select:focus {
    outline: none
}

.button {
    background-color: #fff;
    color: #0779e4
}

.button:hover {
    background-color: #0779e4;
    color: #fff
}

.btn-primary {
    background-color: #0779e4
}

.danger {
    background-color: #fff;
    color: #e20404;
    border: 1px solid #ddd
}

.danger:hover {
    background-color: #e20404;
    color: #fff
}

@media(max-width:576px) {
    .wrapper {
        padding: 25px 20px
    }

    #deactivate {
        line-height: 18px
    }
}
.hidden {
    display:none;
}
.button {
    border: 1px solid #333;
    padding: 10px;
    margin: 5px;
    background: #777;
    color: #fff;
    width:75px;
}

.button:hover {
    background: #333;
    cursor: pointer;
}
</style>
</head>
<body>

<div class="wrapper bg-white mt-sm-5">
    <h4 class="pb-4 border-bottom">Account settings</h4>
    <form action="AccountServlet" method="post">
  <!-- <div class="d-flex align-items-start py-3 border-bottom"> <img src="userImage?id_user=${currentUserProfile.id}" class="img" alt="">
        <div class="pl-sm-4 pl-2" id="img-section"> <b>Profile Photo</b>
            <p>Upload a new profile photo</p><input type="file" name="profilePictureUpdate" class="hidden" id="uploadFile"/>
		    <div class="btn btn-primary mr-3" id="uploadTrigger"><i class="fa fa-camera"></i></div>
        </div>
    </div> -->  
    <div class="py-2 border-bottom">
        <div class="row py-2">
        	
            <div class="col-md-6"> <label for="firstnameViewAccount">First Name</label> <input type="text" name="firstnameAccount" class="bg-light form-control" value="${currentUserProfile.first_name}"> </div>
            <div class="col-md-6 pt-md-0 pt-3"> <label for="lastnameViewAccount">Last Name</label> <input type="text" name="lastnameAccount" class="bg-light form-control" value="${currentUserProfile.last_name}"> </div>
        </div>
        <div class="row py-2">
            <div class="col-md-6 pt-md-0 pt-3"> <label for="usernameViewAccount">Username</label> <input type="tel" name="usernameAccount" class="bg-light form-control" value="${currentUserProfile.username}"> </div>
            <div class="col-md-6"> <label for="emailViewAccount">Email Address</label> <input type="text" name="emailAccount" class="bg-light form-control" value="${currentUserProfile.email}"> </div>
        </div>
       
    </div>
     <div class="py-2 border-bottom">
        <div class="row py-2">
            <div class="col-md-6"> <label for="passwordViewAccount">Your Password</label> <input type="text" name="passwordAccount" class="bg-light form-control" value="${currentUserProfile.password}"> </div>
            <div class="col-md-6 pt-md-0 pt-3"> <label for="new_passwordViewAccount">New Password</label> <input type="text" name="new_passwordViewAccount" class="bg-light form-control" > </div>
             <div class="col-md-6 pt-md-0 pt-3"> <label for="confirm_new_passwordViewAccount">Confirm New Password</label> <input type="text" name="confirm_new_passwordViewAccount" class="bg-light form-control"> </div>
        </div>
     
       
    </div>
    <div class="py-2 ">
       
        	<div class="py-3 pb-4 "> <button type="submit" name="updateProfileUser" class="btn btn-primary mr-3">Save Changes</button> </div>
        
    </div>
    </form>
</div>
<script>$("#uploadTrigger").click(function(){
   $("#uploadFile").click();
});</script>
</body>
</html>