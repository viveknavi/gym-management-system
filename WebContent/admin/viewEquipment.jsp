<%@ page import="com.gym.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Equipment</title>
<%@ include file="allCss.jsp"%>

</head>
<body>
	<%@ include file="navbar.jsp"%>
	<span style="color: red"><h4 style="margin-top: 10px" class="pl-3">Welcome
		</span>:
	<span style="color: blue"> Admin
		</h4>
	</span>
	<br>
	<br>
	<%
		String msg = request.getParameter("msg");
		if ("deleted".equals(msg)) {
	%>
	<script>
		alert("Deleted Successfully..");
		window.location.assign("viewEnquiry.jsp");
	</script>
	<%
		}
	%>
	<div class="container mt-5">
		<h1 class="text-success text-center"></h1>


		<h4 class="text-center text-danger">View Equipment</h4>
		<br> <br>
		
		<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="https://qph.cf2.quoracdn.net/main-qimg-9f69a805985bcaa5b12fde8828d111db" alt="First slide"
					width="100" height="575">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="https://media.istockphoto.com/id/1142733293/vector/fitness-cardio-and-muscle-building-machines-equipments-set-at-gym.jpg?s=1024x1024&w=is&k=20&c=qURGUQkFTBf4gSRvRh16uRZpXmM9VdHRUZnNFhCgvlY=" alt="Second slide"
					width="100" height="575">
			</div>
			
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<div class="container-fluid back-img"></div>

		<table class="table table-bordered" id="example">
			<thead style="background-color: #d7ccc8">
				<tr>
					<th>S.No</th>
					<th>Equipment Name</th>
					<th>Price</th>
					<th>Unit</th>
					<th>Purchase Date</th>
					<th>Description</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					try {
						Connection con = ConnectionProvider.getCon();
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from equipment");
						int i = 0;
						while (rs.next()) {
							i++;
				%>
				<td><%=i%></td>
				<td><%=rs.getString("ename")%></td>
				<td><%=rs.getString("price")%></td>
				<td><%=rs.getString("unit")%></td>
				<td><%=rs.getString("purchasedate")%></td>
				<td><%=rs.getString("description")%></td>
				<td><a href="editEquipment.jsp?id=<%=rs.getString("id")%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i></a> <a
					href="deleteEquipment.jsp?id=<%=rs.getString("id")%>"
					class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a></td>
				</tr>
				<%
					}
					} catch (Exception e) {
						System.out.println(e);
					}
				%>
			</tbody>
		</table>

	</div>
	

</body>
</html>