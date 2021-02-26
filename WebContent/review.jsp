<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

	<link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/reservationForm.css">
<style>

 
    table { border: 0; }
    table td { padding: 5px; }
   
</style>
</head>
<body style="background-color:#7b57573b !important;">

<section  style="padding-left:27%;padding-top:5%">
<div align="center" class="rev" style="width:60%;padding-top:10%;padding-bottom:5% ; border-style:solid;border-width: 5px 5px;">
    <h1>Please Review Before Paying</h1>
    <hr class="new1">
    <form action="execute_payment" method="post">
    <table>
        <tr>
            <td colspan="2"><b>Transaction Details:</b></td>
            <td> 
                <input type="hidden" name="paymentId" value="${param.paymentId}" />
                <input type="hidden" name="PayerID" value="${param.PayerID}" />
            </td>
        </tr>
        <tr>
            <td>Description:</td>
            <td>${transaction.description}</td>
        </tr>
        <tr>
            <td>Total:</td>
            <td>${transaction.amount.total} MAD</td>
        </tr>
        <tr><td><br/></td></tr>

        <tr>
            <td colspan="2" align="center">
                <input type="submit" class="btn btn-primary" value="Pay Now" />
            </td>
        </tr>    
    </table>
    </form>
</div>
</section>
</body>
</html>