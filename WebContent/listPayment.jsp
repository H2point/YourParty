<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>



<%@ include file = "layout.jsp" %>
<%@ include file = "sidenav.jsp" %>

<div class="main">


  <br>
  <br>
   <div class="row main" >
   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
   <table class="table">
    <thead>
      <tr>
        <th>Owner card</th>
        <th>Name of event</th>
        <th>total</th>
        <th>Delete</th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${paymentList}" var="p">
      <tr>
        <td>${p.ownerCard}</td>
        <td>${p.evenementName}</td>
        <td>${p.total} </td>
        
        
        
        <td>
         <form action="Paiement" method="GET">
         <div class="form-group">
             <input name="id" type="hidden" class="form-control" value="${p.id_paiement}">
          </div>
           
             <button name="deletePayment" style="border: none;background:transparent;" data-toggle="tooltip" title="Trash" class="pd-setting-ed"><i class="fa fa-trash-o" style="font-size:20px;color:red" aria-hidden="true"></i></button></a>
		</form>  
        </td>
      </tr>      
      </c:forEach>
      
      
    </tbody>
  </table>
   </div>
   </div>

    
</div>

</body>
</html>