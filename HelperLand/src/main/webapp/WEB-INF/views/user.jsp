<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/user.css" />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="icon" type="image/x-icon"
	href="/images/white-logo-transparent-background.png">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet'>
<title>Services History</title>
</head>
<body>
	<section id="header">
		<div class="header" id="topheader">
			<nav class="navbar navbar-expand-lg navbar-light py-2"
				style="background-color: #525252;">
				<a class="navbar-brand" href="homepage.html"> <img
					src="<c:url value="/resources/images/white-logo-transparent-background.png" />"
					style="width: 73px; height: 54px;">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse text-left"
					id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item">
							<div class="nav-btn-blue">
								<a class="nav-link" href="bookservice">Book now</a>
							</div>
						</li>
						<li class="nav-item">
							<div class="nav-btnn">
								<a class="nav-link" href="price.html">Prices & services</a>
							</div>
						</li>
						<li class="nav-item">
							<div class="nav-btnn text-white">
								<a class="nav-link" href="#">Warranty</a>
							</div>
						</li>
						<li class="nav-item">
							<div class="nav-btnn">
								<a class="nav-link" href="#">Blog</a>
							</div>
						</li>
						<li class="nav-item">
							<div class="nav-btnn">
								<a class="nav-link" href="contactUs.html">Contact</a>
							</div>
						</li>

					</ul>
				</div>
				<div class="d-flex mx-auto">
					<div class="vertical-line"></div>
					<img class="notification-icon" style="height: 40px"
						src="<c:url value="/resources/images/icon-notification.png" />">
					<div class="vertical-line"></div>
				</div>
				<div class="profile-dropedown">
					<a class="nav-link  dropdown-toggle text-decoration-none"
						id="navbarDropdownMenuLink-4" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"><i
						class="fa fa-user"></i> <img
						src="<c:url value="/resources/images/forma-1-1-1.png" />"> </a>
					<div
						class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav"
						aria-labelledby="navbarDropdownMenuLink-4">
						<span style="padding-left: 15px;">Welcome,<br>
						<strong style="padding-left: 15px;">First Customer</strong></span>
						<div class="devider-line"></div>
						<a class="dropdown-item text-color-nav text-decoration-none"
							href="#">My Dashboard</a> <a
							class="dropdown-item text-color-nav text-decoration-none"
							onclick="openCity(event, 'mySettings')" href="#">My Settings</a>
						<a class="dropdown-item text-color-nav text-decoration-none"
							href="logout">Log out</a>
					</div>
				</div>
				<a class="btn" style="float: right" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#demo"> <span
					class="navbar-toggler-icon"></span>
				</a>
			</nav>
		</div>
		<div class="offcanvas offcanvas-end" id="demo">
			<div class="offcanvas-header">
				<p>
					welcome,<br> <strong>Abc</strong>
				</p>
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>

			<div class="offcanvas-body">
				<div class="devider-line"></div>
				<ul class="side-nav">
					<li class="side-items"><a
						class="side-link text-decoration-none"
						onclick="openCity(event, 'Deshboard')" href="#">Dashboard</a></li>
					<li class="side-items"><a
						class="side-link text-decoration-none"
						onclick="openCity(event, 'History')" href="#">Service History</a>
					</li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="#">Service
							Schedule</a></li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="#">Favourite Pros</a>
					</li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="#">Invoices</a></li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="#">Notification</a></li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="#">My Settings</a></li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="logout">Logout</a></li>
				</ul>
				<div class="devider-line"></div>
				<ul class="side-nav">
					<li class="side-items"><a
						class="side-link text-decoration-none" href="bookservice">Book
							now</a></li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="price.html">Prices
							& services</a></li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="#">Warranty</a></li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="#">Blog</a></li>
					<li class="side-items"><a
						class="side-link text-decoration-none" href="contactUs.html">Contact</a>
					</li>
				</ul>

			</div>
		</div>

	</section>

	<div class="position-absolute w-100 d-flex justify-content-center"
		style="top: 10px; z-index: 100000;">
		<div
			class="alert alert-danger alert-dismissible fade show d-none w-75"
			${displayError } role="alert">
			${error }
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<div
			class="alert alert-success alert-dismissible fade show d-none w-75"
			${displaySuccess } role="alert">
			${success }
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>


	</div>

	<section id="title" class="text-center">
		<div class="main-text">
			<h2>
				Welcome, <strong><span id="usernameid">${htmlusername }! </span></strong>
			</h2>
		</div>
		<div class="div-line-below-user-profile"></div>
	</section>

	<section id="tab_data">
		<div class="tab">
			<button class="tablinks" onclick="openCity(event, 'Deshboard')"
				id="defaultOpen">Deshboard</button>
			<button class="tablinks" onclick="openCity(event, 'History')">Service
				History</button>
			<button class="tablinks" onclick="openCity(event, 'Schedule')">Service
				Schedule</button>

			<button class="tablinks" onclick="openCity(event, 'Pros')">Favourite
				Pros</button>

			<button class="tablinks" onclick="openCity(event, 'Invoices')">Invoices</button>

			<button class="tablinks" onclick="openCity(event, 'Notification')">Notification</button>
		</div>


		<div id="Deshboard" class="tabcontent">
			<div class="d-flex flex-row justify-content-between">
				<div class="float-left">
					<h3 class="link-text">Current Service Request</h3>
				</div>

				<button class="btn addrequestbuttton tablinks" style="width: 200px;">Add
					new service request</button>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<table id="example" class="display table nowrap" cellspacing="0"
							style="width: 100%">
							<thead>
								<tr>
									<th scope="col" class="serviceidrow">Service ID</th>
									<th scope="col" class="servicedate">Service date</th>
									<th scope="col" class="provider">Service Provider</th>
									<th scope="col" class="payment">Payment</th>
									<th scope="col" class="action">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td scope="row text-color-table number-and-km"><a href="#"
										data-toggle="modal"
										data-target="#withoutServiceProviderdashboardModalCenter"
										class="text-decoration-none link-text">323436</a></td>
									<td>
										<div class="col">
											<div class="d-flex custom-margin-table">
												<img
													src="<c:url value="/resources/images/calculator.png" />"
													class="calander-img"> <a href="#" data-toggle="modal"
													data-target="#withoutServiceProviderdashboardModalCenter"
													class="text-decoration-none link-text"><strong>31/03/2018</strong></a>
											</div>
											<div class="d-flex">
												<img class="clock" src="images/layer-712.png"> <a
													href="#" data-toggle="modal"
													data-target="#withoutServiceProviderdashboardModalCenter"
													class="text-decoration-none link-text">12:00 - 18:00</a>
											</div>
										</div>
									</td>
									<td></td>
									<td class="eurotext">
										<div class="d-flex flex-row custom-margin-table-two-data">
											<p class="euro-text">€</p>
											<p class="number-text">63</p>
										</div>
									</td>
									<td>
										<div class="d-flex flex-row">
											<button class="btn Reschedule-button" data-toggle="modal"
												data-target="#rescheduleModalCenter">Reschedule</button>
											<button class="btn Cancle-button" data-toggle="modal"
												data-target="#cancelModalCenter">Cancle</button>
										</div>
									</td>
								</tr>

								<tr>
									<td scope="row text-color-table number-and-km"><a href="#"
										data-toggle="modal"
										data-target="#withServiceProviderdashboardModalCenter"
										class="text-decoration-none link-text">323436</a></td>
									<td>
										<div class="col">
											<div class="d-flex custom-margin-table">
												<img
													src="<c:url value="/resources/images/calculator.png" />"
													class="calander-img"> <a href="#" data-toggle="modal"
													data-target="#withServiceProviderdashboardModalCenter"
													class="text-decoration-none link-text"><strong>31/03/2018</strong></a>
											</div>
											<div class="d-flex">
												<img class="clock"
													src="<c:url value="/resources/images/layer-712.png" />">
												<a href="#" data-toggle="modal"
													data-target="#withServiceProviderdashboardModalCenter"
													class="text-decoration-none link-text">12:00 - 18:00</a>
											</div>
										</div>
									</td>
									<td>
										<div class="d-flex flex-row">
											<img src="<c:url value="/resources/images/hat.png" />"
												class="hat-img">
											<div class="col">
												<p class="link-text">Lyum Watson</p>
												<div class="d-flex">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/brownstar.png" />">
													<p>4</p>
												</div>
											</div>
										</div>
									</td>
									<td class="eurotext">
										<div class="d-flex flex-row custom-margin-table-two-data">
											<p class="euro-text">€</p>
											<p class="number-text">63</p>
										</div>
									</td>
									<td>
										<div class="d-flex flex-row">
											<button class="btn Reschedule-button" data-toggle="modal"
												data-target="#rescheduleModalCenter">Reschedule</button>
											<button class="btn Cancle-button" data-toggle="modal"
												data-target="#cancelModalCenter">Cancle</button>
										</div>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>



		<div id="History" class="tabcontent">
			<div class="d-flex flex-row justify-content-between">
				<div class="float-left">
					<h3 class="link-text">Service History</h3>
				</div>

				<button class="btn addrequestbuttton" style="width: 200px;">Export</button>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<table id="selectedColumn" class="display table nowrap"
							cellspacing="0" style="width: 100%">
							<thead>
								<tr>
									<th scope="col">Service ID</th>
									<th scope="col">Service date</th>
									<th scope="col">Service Provider</th>
									<th scope="col">Payment</th>
									<th scope="col">Report</th>
									<th scope="col">Status</th>
									<th scope="col">Rate SP</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td scope="row text-color-table number-and-km"><a href="#"
										data-toggle="modal"
										data-target="#withServiceProviderModalCenter"
										class="text-decoration-none link-text">323436</a></td>
									<td>
										<div class="col">
											<div class="d-flex custom-margin-table">
												<img
													src="<c:url value="/resources/images/calculator.png" />"
													class="calander-img"> <a href="#" data-toggle="modal"
													data-target="#withServiceProviderModalCenter"
													class="text-decoration-none link-text"><strong>31/03/2018</strong></a>
											</div>
											<div class="d-flex">
												<img class="clock"
													src="<c:url value="/resources/images/layer-712.png" />">
												<a href="#" data-toggle="modal"
													data-target="#withServiceProviderModalCenter"
													class="text-decoration-none link-text">12:00 - 18:00</a>
											</div>
										</div>
									</td>
									<td>
										<div class="d-flex flex-row">
											<img src="<c:url value="/resources/images/hat.png" />"
												class="hat-img">
											<div class="col">
												<p class="link-text">Lyum Watson</p>
												<div class="d-flex">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/brownstar.png" />">
													<p>4</p>
												</div>
											</div>
										</div>
									</td>
									<td class="eurotext">
										<div class="d-flex flex-row custom-margin-table-two-data">
											<p class="euro-text">€</p>
											<p class="number-text">63</p>
										</div>
									</td>
									<td><img
										src="<c:url value="/resources/images/icons8-mail-64.png" />"
										alt="reportimg"></td>
									<td>
										<button
											class="Not-Applicable-button align-items-center justify-content-center custom-margin-table-two-data">Cancelled</button>
									</td>
									<td><button
											class="btn custom-margin-table-two-data-button">Rate
											SP</button></td>
								</tr>
								<tr>
									<td scope="row text-color-table number-and-km"><a href="#"
										data-toggle="modal"
										data-target="#withoutServiceProviderModalCenter"
										class="text-decoration-none link-text">323436</a></td>
									<td>
										<div class="col">
											<div class="d-flex custom-margin-table">
												<img
													src="<c:url value="/resources/images/calculator.png" />"
													class="calander-img"> <a href="#" data-toggle="modal"
													data-target="#withoutServiceProviderModalCenter"
													class="text-decoration-none link-text"><strong>31/03/2018</strong></a>
											</div>
											<div class="d-flex">
												<img class="clock"
													src="<c:url value="/resources/images/layer-712.png" />">
												<a href="#" data-toggle="modal"
													data-target="#withoutServiceProviderModalCenter"
													class="text-decoration-none link-text">12:00 - 18:00</a>
											</div>
										</div>
									</td>
									<td></td>
									<td class="eurotext">
										<div class="d-flex flex-row custom-margin-table-two-data">
											<p class="euro-text">€</p>
											<p class="number-text">63</p>
										</div>
									</td>
									<td><img
										src="<c:url value="/resources/images/icons8-mail-64.png" />"
										alt="reportimg"></td>
									<td>
										<button
											class="Not-Applicable-button align-items-center justify-content-center custom-margin-table-two-data">Cancelled</button>
									</td>
									<td><button
											class="btn custom-margin-table-two-data-button">Rate
											SP</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div id="Invoices" class="tabcontent">
			<div class="d-flex flex-row justify-content-between">
				<div class="float-left">
					<h3 class="link-text">Invoice</h3>
				</div>

				<button class="btn addrequestbuttton" style="width: 200px;">Export</button>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<table id="InvoiceColumn" class="display table nowrap"
							cellspacing="0" style="width: 100%">
							<thead>
								<tr>
									<th scope="col">Service ID</th>
									<th scope="col">Invoice Number</th>
									<th scope="col">Service Provider</th>
									<th scope="col">Invoice Date</th>
									<th scope="col">Invoice Amount</th>
									<th scope="col">Invoice</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td scope="row text-color-table number-and-km">323436</td>
									<td scope="row text-color-table number-and-km">141415616151</td>
									<td>
										<div class="col">
											<div class="d-flex custom-margin-table">
												<img
													src="<c:url value="/resources/images/calculator.png" />"
													class="calander-img">
												<p>
													<strong>31/03/2018</strong>
												</p>
											</div>
											<div class="d-flex">
												<img class="clock"
													src="<c:url value="/resources/images/layer-712.png" />">
												<p>12:00 - 18:00</p>
											</div>
										</div>
									</td>
									<td>
										<div class="d-flex flex-row">
											<img src="images/hat.png" class="hat-img">
											<div class="col">
												<p>Lyum Watson</p>
												<div class="d-flex">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/yellowstar.png" />">
													<img class="clock"
														src="<c:url value="/resources/images/brownstar.png" />">
													<p>4</p>
												</div>
											</div>
										</div>
									</td>
									<td class="eurotext">
										<div class="d-flex flex-row custom-margin-table-two-data">
											<p class="">€</p>
											<p class="">63</p>
										</div>
									</td>
									<td><img
										src="<c:url value="/resources/images/icons8-pdf-50.png" />"
										alt="reportimg"></td>
								</tr>
								<tr>
									<td scope="row text-color-table number-and-km">323436</td>
									<td scope="row text-color-table number-and-km">141415616151</td>
									<td>
										<div class="col">
											<div class="d-flex custom-margin-table">
												<img
													src="<c:url value="/resources/images/calculator.png" />"
													class="calander-img">
												<p>
													<strong>31/03/2018</strong>
												</p>
											</div>
											<div class="d-flex">
												<img class="clock"
													src="<c:url value="/resources/images/layer-712.png" />">
												<p>12:00 - 18:00</p>
											</div>
										</div>
									</td>
									<td></td>
									<td class="eurotext">
										<div class="d-flex flex-row custom-margin-table-two-data">
											<p class="">€</p>
											<p class="">63</p>
										</div>
									</td>
									<td><img
										src="<c:url value="/resources/images/icons8-pdf-50.png" />"
										alt="reportimg"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div id="mySettings" class="tabcontent">
			<div class="d-flex flex-row container">

				<div class="faq-questions-list " style="width: 100%;">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item text-center text-dark"><a
							class="nav-link active w-100" data-toggle="tab" href="#mydetails">My
								Details</a></li>
						<li class="nav-item text-center text-dark"><a
							class="nav-link w-100" data-toggle="tab" id="realtimeaddress" href="#myaddresses">My
								Addresses</a></li>
						<li class="nav-item text-center text-dark"><a
							class="nav-link w-100" data-toggle="tab" href="#changepassword">Change
								Password</a></li>

					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div id="mydetails" class="container tab-pane active">
							<br>

							<form method="post" id="settingupdateform"
								name="settingupdateform">
								
								
								<%-- <div
									class="alert alert-danger alert-dismissible fade show d-none w-75"
									${displayError } role="alert">
									${error }
									<button type="button" class="btn-close" data-bs-dismiss="alert"
										aria-label="Close"></button>
								</div>
								<div
									class="alert alert-success alert-dismissible fade show d-none w-75"
									${displaySuccess } role="alert">
									${success }
									<button type="button" class="btn-close" data-bs-dismiss="alert"
										aria-label="Close"></button>
								</div> --%>
								<div class="form-row">
									<div class="col">
										<label for="exampleFormControlInput1">First name</label> 
										<%-- <input required
											type="text" class="form-control" value= "${htmlusername }" 
											name="first_name" id="edtfirstname"> --%>
											<input required
											type="text" class="form-control" value= "${htmlusername }"
											name="first_name" id="edtfirstname">
									</div>
									<div class="col">
										<label for="exampleFormControlInput1">Last name</label> <input required
											type="text" class="form-control" value= "${htmllastname }"
											name="last_name" id="edtlastname">
									</div>
									<div class="col">
										<fieldset disabled>
											<label for="exampleFormControlInput1">Email</label> <input 
												type="text" id="email" class="form-control" name="email"
												placeholder="${htmluseremail }" placeholder="Disabled input">

										</fieldset>
									</div>
								</div>
								<div class="form-row">
									<div class="justify-content-center col-md-4"
										style="padding-top: 5px;">
										<label for="exampleFormControlInput1">Mobile Number</label>
										<div class="number_input d-flex">
											<div class="input-group mb-2">
												<div class="input-group-prepend">
													<div class="input-group-text">+42</div>
												</div>
												<input type="text" class="form-control" name="mobile" required
													id="edtmobile" value= ${htmlMobile }>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-top: 5px;">
										<label for="exampleFormControlInput1">Date of birth</label>
										<div class="d-flex flex-row">
											<select class="custom-select select-dob-date" required
												id="edtbdate" name="date_of_birth">
												<option value>Day</option>
												<option value="1">01</option>
												<option value="2">02</option>
												<option value="3">03</option>
												<option value="4">04</option>
												<option value="5">05</option>
												<option value="6">06</option>
												<option value="7">07</option>
												<option value="8">08</option>
												<option value="9">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
												<option value="31">31</option>
											</select> <select class="custom-select select-dob-month ml-2" required
												id="edtbmonth" name="date_of_birth">
												<option value>Month</option>
												<option value="January">January</option>
												<option value="February">February</option>
												<option value="March">March</option>
												<option value="April">April</option>
												<option value="May">May</option>
												<option value="June">June</option>
												<option value="July">July</option>
												<option value="August">August</option>
												<option value="September">September</option>
												<option value="October">October</option>
												<option value="November">November</option>
												<option value="December">December</option>
											</select> <select class="custom-select select-dob-year ml-2" required
												id="edtbyear" name="date_of_birth">
												<option value>Year</option>
												<option value="2022">2022</option>
												<option value="2021">2021</option>
												<option value="2020">2020</option>
												<option value="2019">2019</option>
												<option value="2018">2018</option>
												<option value="2017">2017</option>
												<option value="2016">2016</option>
												<option value="2015">2015</option>
												<option value="2014">2014</option>
												<option value="2013">2013</option>
												<option value="2012">2012</option>
												<option value="2011">2011</option>
												<option value="2010">2010</option>
												<option value="2009">2009</option>
												<option value="2008">2008</option>
												<option value="2007">2007</option>
												<option value="2006">2006</option>
												<option value="2005">2005</option>
												<option value="2004">2004</option>
												<option value="2003">2003</option>
												<option value="2002">2002</option>
												<option value="2001">2001</option>
												<option value="2000">2000</option>
												<option value="1999">1999</option>
												<option value="1998">1998</option>
												<option value="1997">1997</option>
												<option value="1996">1996</option>
												<option value="1995">1995</option>
												<option value="1994">1994</option>
												<option value="1993">1993</option>
												<option value="1992">1992</option>
												<option value="1991">1991</option>
												<option value="1990">1990</option>
												<option value="1989">1989</option>
												<option value="1988">1988</option>
												<option value="1987">1987</option>
												<option value="1986">1986</option>
												<option value="1985">1985</option>
												<option value="1984">1984</option>
												<option value="1983">1983</option>
												<option value="1982">1982</option>
											</select>
										</div>
									</div>
								</div>
								<div class="devider-line" style="margin-top: 15px;"></div>
								<div class="col language-select-parent-class"
									style="padding-left: 0px;">
									<label for="exampleFormControlInput1">My Preferred
										Language</label><br> <select required
										class="custom-select language-select"
										id="edtlanguage" name="language">
										<option selected>Language</option>
										<option value="English">English</option>
										<option value="German">German</option>
									</select>
								</div>
								<button class="save-btn">save</button>
							</form>

						</div>

						<div id="myaddresses" class="container tab-pane details fade">
							<br>
							<div id="showadd" class="table-responsive  mt-2 mb-2 p-2">
								<table class="table">
									<thead>
										<tr>
											<th>Invoicing</th>
											<th>Addresses</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										
									</tbody>
								</table>
								
							</div>
							<button class="address-btn" data-toggle="modal"
									data-target="#addModalCenter">Add New Address</button>
						</div>
						<div id="changepassword" class="container tab-pane fade">
							<br>
							<form style="margin-top: 20px;" method="get" id="settingupdatepasswordform"
								name="settingupdateform"
								oninput='confirmpassword.setCustomValidity(confirmpassword.value != password.value ? "Passwords do not match." : "")'>
								<div class="form-group">
									<label for="exampleFormControlInput1">Old Password</label> <input
										type="password" class="form-control" required
										id="old_password" name="old_password" placeholder="current password">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">New Password</label> <input
										type="password" class="form-control" required name="password"
										id="updtpassword" placeholder="Password">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">Confirm Password</label>
									<input type="password" class="form-control" required name="confirmpassword"
										id="updtconfirmpassword" placeholder="Confirm Password">
								</div>
								<button class="save-btn" style="margin-left: 0px;">save</button>
							</form>
						</div>

					</div>
				</div>


			</div>
		</div>

	</section>


	<section id="model">
		<div class="modal fade" id="deleteModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered  login-model"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Delete
							Address</h4>
						<button type="button" class="close" id="closedltmodal" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					<form id="deleteaddressformsettings" name="deleteaddressformsettings">
						<span>Are you sure you want to delete this address?</span>
						<button class="Delete-btn" type="submit" title="Login">Delete</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="editModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered  login-model"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Edit
							Address</h4>
						<button type="button" class="close" id="closeupdtmodal" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="updateaddressformsettings" name="updateaddressformsettings">
							<div class="form-row">
                          <div class="form-group col-md-6">
                            <label for="inputEmail4">Street name</label>
                            <input style="height: 46px;" type="text" class="form-control" id="AddressLine1" name="AddressLine1" placeholder="Street name">
                          </div>
                          <div class="form-group col-md-6">
                            <label for="inputPassword4">House number</label>
                            <input style="height: 46px;" type="text" class="form-control" name="AddressLine2" id="AddressLine2"
                              placeholder="House number">
                          </div>
                        </div>
                        <div class="form-row">
                          <div class="form-group col-md-6">
                            <label for="inputEmail4">Postal code</label>
                            <input style="height: 46px;" type="text" class="form-control" id="pincode" name="postalcode" placeholder="Postal code">
                          </div>
                          <div class="form-group col-md-6">
                            <label for="inputPassword4">City</label>
                            <select class="custom-select" id="City" name="City"
                              style="margin-left: 5px; width: 200px; height: 46px;">
                              <option selected value="ABC">ABC</option>
                              <option value="DEF">DEF</option>
                              <option value="GHI">GHI</option>
                              <option value="JKL">JKL</option>
                            </select>
                          </div>
                        </div>
							<div class="form-row">
                          <div class="form-group col-md-6">
                            <label for="exampleFormControlInput1">Mobile Number</label>
                            <div class="input-group mb-2">
                              <div class="input-group-prepend">
                                <div class="input-group-text">+42</div>
                              </div>
                              <input type="text" class="form-control" id="Mobile" name="Mobile" placeholder="Mobile number">
                            </div>
                          </div>
              
                        </div>
							<button type="submit" class="Edit-btn" title="Login">Edit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="addModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered  login-model"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Add
							Address</h4>
						<button type="button" class="close" id="closeaddmodal" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="addaddressformsettings" name="addaddressformsettings">
							<div class="form-row">
                          <div class="form-group col-md-6">
                            <label for="inputEmail4">Street name</label>
                            <input style="height: 46px;" type="text" class="form-control" id="AddressLine1" name="AddressLine1" placeholder="Street name">
                          </div>
                          <div class="form-group col-md-6">
                            <label for="inputPassword4">House number</label>
                            <input style="height: 46px;" type="text" class="form-control" name="AddressLine2" id="AddressLine2"
                              placeholder="House number">
                          </div>
                        </div>
                        <div class="form-row">
                          <div class="form-group col-md-6">
                            <label for="inputEmail4">Postal code</label>
                            <input style="height: 46px;" type="text" class="form-control" id="pincode" name="postalcode" placeholder="Postal code">
                          </div>
                          <div class="form-group col-md-6">
                            <label for="inputPassword4">City</label>
                            <select class="custom-select" id="City" name="City"
                              style="margin-left: 5px; width: 200px; height: 46px;">
                              <option selected value="ABC">ABC</option>
                              <option value="DEF">DEF</option>
                              <option value="GHI">GHI</option>
                              <option value="JKL">JKL</option>
                            </select>
                          </div>
                        </div>
                        <div class="form-row">
                          <div class="form-group col-md-6">
                            <label for="exampleFormControlInput1">Mobile Number</label>
                            <div class="input-group mb-2">
                              <div class="input-group-prepend">
                                <div class="input-group-text">+42</div>
                              </div>
                              <input type="text" class="form-control" id="Mobile" name="Mobile" placeholder="Mobile number">
                            </div>
                          </div>
              
                        </div>
							<button type="submit" class="Edit-btn" title="Login">Add Address</button>
							<div id="successmessage"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="withoutServiceProviderModalCenter"
			tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-centered mx-auto modal-lg custom-size-modal-normal"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Service
							Details</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="strong-color" style="font-size: 25px;">
							07/01/2022 15:30 - 18:30<br>
							<strong>Duration:</strong> <small>3 Hrs</small>
						</p>
						<div class="model-deviderline"></div>
						<span class="link-text"><strong class="strong-color">Service
								Id:</strong> 8521 <br>
						<strong class="strong-color">Extras:</strong><br>
						<strong class="strong-color">Net Amount:</strong>54,00 €</span>
						<div class="model-deviderline"></div>
						<span class="link-text"><strong class="strong-color">Service
								Address:</strong> Street 54, 5344 Troisdorf<br>
						<strong class="strong-color">Billing Address:</strong> Same as
							cleaning Address <br>
						<strong class="strong-color">Phone:</strong> +49 9988556644 <br>
						<strong class="strong-color">Email:</strong> cust001@yopmail.com</span>
						<div class="model-deviderline"></div>
						<span class="link-text"><strong class="strong-color">Comments</strong><br>
							<img
							src="<c:url value="/resources/images/icons8-check-circle-48.png" />">
							I have pets at home </span>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="withServiceProviderModalCenter"
			tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered custom-size-modal"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Service
							Details</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="d-flex flex-row" id="main-content-flex">
							<div class="col-lg-8">
								<p class="strong-color" style="font-size: 25px;">
									07/01/2022 15:30 - 18:30<br>
									<strong>Duration:</strong> <small>3 Hrs</small>
								</p>
								<div class="model-deviderline"></div>
								<span class="link-text"><strong class="strong-color">Service
										Id:</strong> 8521 <br>
								<strong class="strong-color">Extras:</strong><br>
								<strong class="strong-color">Net Amount:</strong>54,00 €</span>
								<div class="model-deviderline"></div>
								<span class="link-text"><strong class="strong-color">Service
										Address:</strong> Street 54, 5344 Troisdorf<br>
								<strong class="strong-color">Billing Address:</strong> Same as
									cleaning Address <br>
								<strong class="strong-color">Phone:</strong> +49 9988556644 <br>
								<strong class="strong-color">Email:</strong> cust001@yopmail.com</span>
								<div class="model-deviderline"></div>
								<span class="link-text"><strong class="strong-color">Comments</strong><br>
									<img
									src="<c:url value="/resources/images/icons8-check-circle-48.png" />">
									I have pets at home </span>
							</div>
							<div class="col-lg-4">
								<span class="strong-color" style="font-size: 25px;">Service
									Provider <br> Details
								</span>
								<div class="d-flex flex-row">
									<img src="images/hat.png" class="hat-img">
									<div class="col">
										<p class="link-text">Lyum Watson</p>
										<div class="d-flex">
											<img class="clock"
												src="<c:url value="/resources/images/yellowstar.png" />">
											<img class="clock"
												src="<c:url value="/resources/images/yellowstar.png" />">
											<img class="clock"
												src="<c:url value="/resources/images/yellowstar.png" />">
											<img class="clock"
												src="<c:url value="/resources/images/yellowstar.png" />">
											<img class="clock"
												src="<c:url value="/resources/images/brownstar.png" />">
											<p>4</p>
										</div>
									</div>
								</div>
								<small class="link-text">1 cleaning</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade"
			id="withoutServiceProviderdashboardModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-centered custom-size-modal-normal"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Service
							Details</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="strong-color" style="font-size: 25px;">
							07/01/2022 15:30 - 18:30<br>
							<strong>Duration:</strong> <small>3 Hrs</small>
						</p>
						<div class="model-deviderline"></div>
						<span class="link-text"><strong class="strong-color">Service
								Id:</strong> 8521 <br>
						<strong class="strong-color">Extras:</strong><br>
						<strong class="strong-color">Net Amount:</strong>54,00 €</span>
						<div class="model-deviderline"></div>
						<span class="link-text"><strong class="strong-color">Service
								Address:</strong> Street 54, 5344 Troisdorf<br>
						<strong class="strong-color">Billing Address:</strong> Same as
							cleaning Address <br>
						<strong class="strong-color">Phone:</strong> +49 9988556644 <br>
						<strong class="strong-color">Email:</strong> cust001@yopmail.com</span>
						<div class="model-deviderline"></div>
						<span class="link-text"><strong class="strong-color">Comments</strong><br>
							<img
							src="<c:url value="/resources/images/icons8-check-circle-48.png" />">
							I have pets at home </span>
						<div class="model-deviderline"></div>
						<div class="d-flex flex-row">
							<button class="btn Reschedule-button" data-toggle="modal"
								data-target="#rescheduleModalCenter">Reschedule</button>
							<button class="btn Cancle-button" data-toggle="modal"
								data-target="#cancelModalCenter">Cancle</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="withServiceProviderdashboardModalCenter"
			tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered custom-size-modal"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Service
							Details</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="d-flex flex-row">
							<div class="col-lg-8">
								<p class="strong-color" style="font-size: 25px;">
									07/01/2022 15:30 - 18:30<br>
									<strong>Duration:</strong> <small>3 Hrs</small>
								</p>
								<div class="model-deviderline"></div>
								<span class="link-text"><strong class="strong-color">Service
										Id:</strong> 8521 <br>
								<strong class="strong-color">Extras:</strong><br>
								<strong class="strong-color">Net Amount:</strong>54,00 €</span>
								<div class="model-deviderline"></div>
								<span class="link-text"><strong class="strong-color">Service
										Address:</strong> Street 54, 5344 Troisdorf<br>
								<strong class="strong-color">Billing Address:</strong> Same as
									cleaning Address <br>
								<strong class="strong-color">Phone:</strong> +49 9988556644 <br>
								<strong class="strong-color">Email:</strong> cust001@yopmail.com</span>
								<div class="model-deviderline"></div>
								<span class="link-text"><strong class="strong-color">Comments</strong><br>
									<img
									src="<c:url value="/resources/images/icons8-check-circle-48.png" />">
									I have pets at home </span>
								<div class="model-deviderline"></div>
								<div class="d-flex flex-row">
									<button class="btn Reschedule-button" data-toggle="modal"
										data-target="#rescheduleModalCenter">Reschedule</button>
									<button class="btn Cancle-button" data-toggle="modal"
										data-target="#cancelModalCenter">Cancle</button>
								</div>
							</div>
							<div class="col-lg-4">
								<span class="strong-color" style="font-size: 25px;">Service
									Provider <br> Details
								</span>
								<div class="d-flex flex-row">
									<img src="<c:url value="/resources/images/hat.png" />"
										class="hat-img">
									<div class="col">
										<p class="link-text">Lyum Watson</p>
										<div class="d-flex">
											<img class="clock"
												src="<c:url value="/resources/images/yellowstar.png" />">
											<img class="clock"
												src="<c:url value="/resources/images/yellowstar.png" />">
											<img class="clock"
												src="<c:url value="/resources/images/yellowstar.png" />">
											<img class="clock"
												src="<c:url value="/resources/images/yellowstar.png" />">
											<img class="clock"
												src="<c:url value="/resources/images/brownstar.png" />">
											<p>4</p>
										</div>
									</div>
								</div>
								<small class="link-text">1 cleaning</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="cancelModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered cancle-model"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Cancel
							Service Request</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<span class="link-text">Why you want to cancel the service
							request?</span>
						<form>
							<div class="form-group">
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="3"></textarea>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="rescheduleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered cancle-model"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Reschedule
							Service Request</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<span class="link-text">Select New Date & Time</span>
						<form style="margin-top: 15px;">
							<div class="d-flex flex-row">
								<div class="col-lg-6">
									<input type="date" id="date-picker"
										class="date-picker link-text" name="date-picker">
								</div>
								<div class="col-lg-6">
									<select class="custom-select" id="inlineFormCustomSelectPref">
										<option selected>Choose...</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
							</div>
							<button type="submit" class="btn-submit btn-lg" title="Login">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>


	</section>

	<div style="flex-grow: 1;"></div>

	<div class="footer_section w-100">
		<div
			class="footer_main d-flex justify-content-around align-items-center">
			<div class="footer_left">
				<img
					src="<c:url value="/resources/images/white-logo-transparent-background.png" />"
					alt="" height="78" width="106">
			</div>
			<div class="footer_mid">
				<ul class="d-flex p-0 text-center">
					<li><a href="homepage" class="text-decoration-none">HOME</a></li>
					<li><a href="aboutus" class="text-decoration-none">ABOUT</a></li>
					<li><a href="" class="text-decoration-none">TESTIMONIAL</a></li>
					<li><a href="faq" class="text-decoration-none">FAQS</a></li>
					<li><a href="" class="text-decoration-none">INSURANCE
							POLICY</a></li>
					<li><a href="" class="text-decoration-none">IMPRESSUM</a></li>
				</ul>
			</div>
			<div class="footer_right d-flex">
				<svg xmlns="http://www.w3.org/2000/svg" width="9" height="18">
                    <path fill-rule="evenodd" fill="#CCC"
						d="M1.947 3.48v2.481H0v3.033h1.947V18.1h4.001V8.995h2.685S8.885 7.541 9.7 5.95H5.963V3.876c0-.31.437-.728.868-.728H9.11V.9H6.46C1.848.9 1.947 3.27 1.947 3.48z" />
                </svg>
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                    <path fill-rule="evenodd" fill="#CCC"
						d="M14.48 20H5.519A5.524 5.524 0 0 1 0 14.482V5.52C0 2.477 2.475.2 5.519.2h8.961c3.043 0 5.519 2.277 5.519 5.32v8.962A5.525 5.525 0 0 1 14.48 20zm3.744-5.518V5.52a3.748 3.748 0 0 0-3.744-3.744H5.519A3.749 3.749 0 0 0 1.774 5.52v8.962a3.749 3.749 0 0 0 3.745 3.744h8.961a3.748 3.748 0 0 0 3.744-3.744zm-2.855-8.536c-.099 0-.678-.14-.92-.381-.242-.243.221-.578.221-.921 0-.342-.463-.678-.221-.92.242-.242.821-.381.92-.381.343 0 1.111.139.92.381.242.242.381.578.381.92 0 .342-.139.678-.381.921.171.241-.577.381-.92.381zm-5.37 9.208c-2.841 0-5.153-2.312-5.153-5.054 0-2.941 2.312-5.252 5.153-5.252 2.842 0 5.153 2.311 5.153 5.252 0 2.742-2.311 5.054-5.153 5.054zm0-8.532c-1.863 0-3.379 1.516-3.379 3.478 0 1.764 1.516 3.28 3.379 3.28s3.379-1.516 3.379-3.28c0-1.962-1.516-3.478-3.379-3.478z" />
                </svg>
			</div>
		</div>
		<div class="footer_border mx-auto"></div>
		<div
			class="footer_end d-flex align-items-center justify-content-center">
			<p class="m-0 text-center">©2018 Helperland. All rights reserved.
				Terms and Conditions | Privacy Policy</p>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
		integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>

	<script
		src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- <script>
		
		function name(){
			var temp = "${htmlusername }!";
			
			document.getElementById('usernameid').innerHTML = temp;
			
			console.log(temp)
		}
		
		</script> -->
	<script>
        $(document).ready(function () {
            $('#example').DataTable({

                responsive: true,
                "dom": '<"top">rt<"bottom"lip><"clear">',
                "aaSorting": [],
                columnDefs: [{
                    orderable: false,
                    targets: 4
                }]
            });
        });

        $(document).ready(function () {
            $('#selectedColumn').DataTable({
                responsive: true,
                "dom": '<"top">rt<"bottom"lip><"clear">',
                "aaSorting": [],
                columnDefs: [{
                    orderable: false,
                    targets: 4
                }]
            });
        });

        $(document).ready(function () {
            $('#InvoiceColumn').DataTable({

                responsive: true,
                "dom": '<"top">rt<"bottom"lip><"clear">',
                "aaSorting": [],
                columnDefs: [{
                    orderable: false,
                    targets: 4
                }]
            });
        });

    </script>

	<script>
        function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
    </script>

	<script>
	jQuery(document).ready(function($){
		$("#settingupdateform").submit(function(event){
			event.preventDefault();
			updtdetails();
		});
	});

	function updtdetails(){
		
		$.ajax({
			type:"GET",
			url:"/helperland/mydetails/" + $("#edtfirstname").val() + "," + $("#edtlastname").val() + ","+ $("#edtmobile").val() + ","+ $("#edtbdate").val() + ","+ $("#edtbmonth").val() + ","+ $("#edtbyear").val() + ","+ $("#edtlanguage").val(),
			success:function(data){
				console.log("SUCCESS: ", data);
				/* name(); */
				/* hello(); */
			},
			error: function(e){
				console.log("ERROR: ", e);
			},
			done: function(e){
				console.log("Done");
			}
		});
	}
	
	
	
	</script>

	<script>
	jQuery(document).ready(function($){
		$("#settingupdatepasswordform").submit(function(event){
			event.preventDefault();
			updtpasswordfunction();
		});
	});

	function updtpasswordfunction(){
		
		
		$.ajax({
			type:"GET",
			url:"/helperland/updtpassword/" + $("#old_password").val() + "," + $("#updtpassword").val(),
			success:function(response){
				console.log("SUCCESS: ", response);
				/* name(); */
				if(response == 0){
					alert("please check your old password!!!");
				}
				else{
					alert("success!!!!");
				}
			},
			error: function(e){
				console.log("ERROR: ", e);
			},
			done: function(e){
				console.log("Done");
			}
		});
	}
	</script>
	
	<script>
	jQuery(document).ready(function($){
		$("#addaddressformsettings").submit(function(event){
			event.preventDefault();
			addaddresssettings();
		});
	});

	function addaddresssettings(){
		var search={}
		
		$.ajax({
			type:"GET",
			url:"/helperland/addaddresssettings/" + $("#AddressLine1").val()+ "," + $("#AddressLine2").val() + "," + $("#pincode").val() + "," + $("#City").val() + "," + $("#Mobile").val(),
			success:function(data){
				console.log("SUCCESS: ", data);
				document.getElementById('successmessage').innerHTML = 'successmessage';
				$('#realtimeaddress').click();
				$("#closeaddmodal").click();
			},
			error: function(e){
				console.log("ERROR: ", e);
			},
			done: function(e){
				console.log("Done");
			}
		});
	}
	
	$(document).on('click','#realtimeaddress',function (){
		$.ajax({
    		type:"GET",
    		url:"/helperland/showaddresssettings",
    		contentType: "application/json",
    		success:function(response){
    			var result = '<table class="table"><thead><tr><th>Invoicing</th><th>Addresses</th><th>Action</th></tr></thead>'
    				result += "<tbody>";
    				$.each(response, function(k, v) {
    					
    					//console.log(v.state);
    					//document.getElementById("showadd").innerHTML = document.getElementById("showadd").innerHTML + v.addressLine1;
    					result += "<tr>";
    					result += "<td>";
    					result +='<div class="form-check"><input class="form-check-input position-static address_id" type="radio" name="address_id" id="address_id" value='+v.user_address_id+' aria-label="..."></div>';
    					result += "</td>";
    					result += "<td>";
    					result += '<div class="row"><span><strong>Address:  </strong>'+v.addressLine1+', '+v.addressLine2+'</span> <span><strong>Phone number:  </strong>'+v.mobile+'</span></div>';
    					result += "</td>";
    					result += "<td>";
    					result += '<div class="d-flex flex-row image-table"><a class="text-decoration-none" onclick="addressidfunction('+ v.user_address_id +')" data-toggle="modal"data-target="#editModalCenter" href="#"><img src="<c:url value="/resources/images/icons8-edit-property-50.png" />"></a><a class="text-decoration-none" data-toggle="modal" data-target="#deleteModalCenter" onclick="addressiddelfunction('+ v.user_address_id +')" href="#"><img src="<c:url value="/resources/images/icons8-delete-48.png" />"></a></div>';
    					result += "</td>";
    					result += "</tr>";
    				});
    				console.log("SUCCESS: ", response);
    				result += "</tbody>";
    				result += '</table>';
    				$("#showadd").html(result);
    				
    		},
    		error: function(e){
    			console.log("ERROR: ", e);
    		},
    		done: function(e){
    			console.log("Done");
    		}
    	});
	});
	 
  function addressidfunction(id){
	  console.log(id);
	  jQuery(document).ready(function($){
			$("#updateaddressformsettings").submit(function(event){
				event.preventDefault();
				updateaddresssettings(id);
			});
		});
  }
  
  function updateaddresssettings(id){
		
		$.ajax({
			type:"GET",
			url:"/helperland/updateaddresssettings/" + $("#AddressLine1").val()+ "," + $("#AddressLine2").val() + "," + $("#pincode").val() + "," + $("#City").val() + "," + $("#Mobile").val() + "," + id,
			success:function(data){
				console.log("SUCCESS: ", data);
				document.getElementById('successmessage').innerHTML = 'successmessage';
				$('#realtimeaddress').click();
				$("#closeupdtmodal").click();
			},
			error: function(e){
				console.log("ERROR: ", e);
			},
			done: function(e){
				console.log("Done");
			}
		});
	}
  
  function addressiddelfunction(id){
	  console.log(id);
	  jQuery(document).ready(function($){
			$("#deleteaddressformsettings").submit(function(event){
				event.preventDefault();
				deleteaddresssettings(id);
			});
		});
  }
  
  function deleteaddresssettings(id){
		
		$.ajax({
			type:"GET",
			url:"/helperland/deleteaddresssettings/" + id,
			success:function(data){
				console.log("SUCCESS: ", data);
				document.getElementById('successmessage').innerHTML = 'successmessage';
				$('#realtimeaddress').click();
				$("#closedltmodal").click();
			},
			error: function(e){
				console.log("ERROR: ", e);
			},
			done: function(e){
				console.log("Done");
			}
		});
	}
  
  
 

</script>
	
	

</body>
</html>