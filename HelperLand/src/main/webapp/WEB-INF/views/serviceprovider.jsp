<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/serviceprovider.css" />">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon"
	href="<c:url value="/resources/images/white-logo-transparent-background.png" />">
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <title>Upcoming Services</title>
</head>

<body>
    <div class="header" id="topheader">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #525252;">
            <a class="navbar-brand" href="homepage">
                <img src="<c:url value="/resources/images/white-logo-transparent-background.png" />" style="width: 73px; height: 54px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse text-left" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
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
                    <li class="nav-item">
                        <div class="vertical-line"></div>
                    </li>
                    <li class="nav-item">
                        <div class="nav-btn-img">
                            <img src="<c:url value="/resources/images/icon-notification.png" />">
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="vertical-line"></div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i> <img
                                src="<c:url value="/resources/images/forma-1-1-1.png" />"> </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav"
                            aria-labelledby="navbarDropdownMenuLink-4">
                            <span style="padding-left: 15px;">Welcome,<br><strong style="padding-left: 15px;"><span class="instantdisplayname">${htmlusername }!</span></strong></span>
                            <div class="devider-line"></div>
                            <a class="dropdown-item text-color-nav text-decoration-none" href="#">My Dashboard</a>
                            <a class="dropdown-item text-color-nav text-decoration-none"
                                onclick="openCity(event, 'mySettings')" href="#">My Settings</a>
                            <a class="dropdown-item text-color-nav text-decoration-none" href="logout">Log out</a>
                        </div>
                    </li>
                </ul>
            </div>

            <a class="btn" style="float:right" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
                <span class="navbar-toggler-icon"></span>
            </a>
        </nav>
    </div>

    <div class="offcanvas offcanvas-end" id="demo">
        <div class="offcanvas-header">
            <p>welcome,<br> <strong><span class="instantdisplayname">${htmlusername }! </span></strong></p>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body">
            <div class="devider-line"></div>
            <ul class="side-nav">
                <li class="side-items">
                    <a class="side-link text-decoration-none" onclick="openCity(event, 'Deshboard')"
                        href="#">Dashboard</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" onclick="openCity(event, 'History')" href="#">New Service
                    </a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" onclick="openCity(event, 'Upcoming')" href="#">Upcoming
                        Service</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="#" onclick="openCity(event, 'Schedule')">Service
                        Schedule</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" onclick="openCity(event, 'History')" href="#">Service
                        History</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" onclick="openCity(event, 'ratings')">My Ratings</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" onclick="openCity(event, 'block-cust')">Block Customer</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" onclick="openCity(event, 'Invoices')"
                        href="#">Invoices</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" onclick="openCity(event, 'Notification')"
                        href="#">Notification</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" onclick="openCity(event, 'mySettings')" href="#">My Settings</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="#">Logout</a>
                </li>
            </ul>
            <div class="devider-line"></div>
            <ul class="side-nav">
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="bookservice.html">Book now</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="price.html">Prices & services</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="#">Warranty</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="#">Blog</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="contactUs.html">Contact</a>
                </li>
            </ul>

        </div>
    </div>

    <section id="title" class="text-center">
        <div class="main-text">
            <h2>Welcome, <strong><span class="instantdisplayname">${htmlusername }!</span></strong></h2>
        </div>
        <div class="div-line-below-user-profile"></div>
    </section>

<%-- <div class="position-absolute w-100 d-flex justify-content-center"
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
 --%>
   
    
    <section id="modal">
    <div class="modal fade" id="withoutServiceProviderdashboardModalCenter" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered custom-size-modal-normal" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title strong-color" id="exampleModalLongTitle">Service Details</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p class="strong-color" style="font-size: 25px;"><span id="serviceStartDateModal"></span>&nbsp;<span id="serviceTotalTimeModal"></span><br><strong>Duration:</strong> <small><span id="serviceDurationModal"></span></small></p>
                        <hr>
                        <span class="link-text"><strong class="strong-color">Service Id:</strong> <span id="serviceIdModal"></span> <br><strong
                                class="strong-color">Extras:</strong><span id="ExtraServiceModal"></span><br><strong class="strong-color">Net
                                Amount:</strong><span id="NetAmountModal"></span>&euro;</span>
                        <hr>
                        <span class="link-text"><strong class="strong-color">Service Address:</strong> <span id="AddressLine1Modal"></span>, <span id="AddressLine2Modal"></span>
                            <br><strong class="strong-color">Phone:</strong> <span id="MobileModal"></span> <br><strong
                                class="strong-color">Email:</strong> <span id="EmailModal"></span></span>
                        <hr>
                        <span class="link-text"><strong class="strong-color">Comments</strong><br>
                          <span id="CommentsModal"></span><br>
                           <span id="PetModal"></span>
                        </span>
                        
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
						<button type="button" class="close" data-dismiss="modal" id="closecanclemodal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<span class="link-text">Are you sure to cancel the service
							request?</span>
						<form id="cancelbtnspupcomingserviceform" name="cancelbtnspupcomingserviceform">
							<button class="btn cancel-custom" >Cancel</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="completeModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered cancle-model"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title strong-color" id="exampleModalLongTitle">Cancel
							Service Request</h4>
						<button type="button" class="close" data-dismiss="modal" id="closecompletemodal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<span class="link-text">Are you sure to cancel the service
							request?</span>
						<form id="completebtnspupcomingserviceform" name="completebtnspupcomingserviceform">
							<button class="btn Complete-button-Modal" >Complete</button>
						</form>
					</div>
				</div>
			</div>
		</div>
    </section>

    <section id="tab_data">
        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'Deshboard')">Deshboard</button>
            <button class="tablinks" onclick="openCity(event, 'NewService')" id="servicerequesttab">New Service
                Request</button>
            <button class="tablinks" onclick="openCity(event, 'Upcoming')" id="realtimedashboard">Upcoming Service</button>
            <button class="tablinks" onclick="openCity(event, 'Schedule')">Service Schedule</button>
            <button class="tablinks" onclick="openCity(event, 'History')" id="realtimeservicehistorysp">Service History</button>

            <button class="tablinks" onclick="openCity(event, 'ratings')" id="realtimeratingssp">My Ratings</button>
            <button class="tablinks" onclick="openCity(event, 'block-cust')">Block Customer</button>

            <button class="tablinks" onclick="openCity(event, 'Invoices')">Invoices</button>

            <button class="tablinks" onclick="openCity(event, 'Notification')">Notifications</button>
        </div>
        
        <div id="ratings" class="tabcontent">
        	<div id="ratingData">
        		<table class="display" id="ratingTablenormal" style="width:100%">
        			<thead></thead>
        			<tbody></tbody>
        		</table>
        	</div>
       	
        </div>


        <div id="NewService" class="tabcontent">
            <div class="d-flex flex-row">
                <h3 class="link-text" style="margin-right: 5px;" for="exampleFormControlSelect1">New Service Requests</h3>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                    <div id="dashboarddatashow">
                        <table id="example" class="display table nowrap" cellspacing="0" style="width:100%">
                            <thead>
                                <tr>
                                    <th scope="col" class="serviceidrow">Service ID
                                    </th>
                                    <th scope="col" class="servicedate">Service date
                                    </th>
                                    <th scope="col" class="provider">Customer Details
                                    </th>
                                    <th scope="col" class="payment">Payment
                                    </th>
                                    <th scope="col" class="payment">Time Conflict
                                    </th>
                                    <th scope="col" class="action">Actions
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div id="Upcoming" class="tabcontent">
            
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                    <div id="upcomingservicetabledata">
                        <table id="upcoming" class="display table nowrap" cellspacing="0" style="width:100%">
                            <thead>
                                <tr>
                                    <th scope="col">Service ID
                                    </th>
                                    <th scope="col">Service date
                                    </th>
                                    <th scope="col">Customer details
                                    </th>
                                    <th scope="col">Payment
                                    </th>
<!--                                     <th scope="col">Distance
                                    </th> -->
                                    <th scope="col">Actions
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div id="newservicerequest" class="tabcontent">
            <div class="text-center">
                <h1>Set up your cleaning service</h1>
                <div class="faq-divider text-center d-flex align-items-center justify-content-center">
                    <img src="<c:url value="/resources/images/forma-1-copy-5.png" />">
                </div>
            </div>
        </div>

        <div id="History" class="tabcontent">
            <div class="d-flex flex-row justify-content-between">
                <div class="float-left">
                    <h3 class="link-text">Service History</h3>
                </div>

                <button class="btn addrequestbuttton" id="exporttabledata" style="width: 200px;">Export</button>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                    <div id="displaysphistory">
                        <table id="selectedColumn" class="display table nowrap" cellspacing="0" style="width:100%">
                            <thead>
                                <tr>
                                    <th scope="col">Service ID
                                    </th>
                                    <th scope="col">Service date
                                    </th>
                                    <th scope="col">Customer details
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        </div>
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
                        <table id="InvoiceColumn" class="display table nowrap" cellspacing="0" style="width:100%">
                            <thead>
                                <tr>
                                    <th scope="col">Service ID
                                    </th>
                                    <th scope="col">Invoice Number
                                    </th>
                                    <th scope="col">Customer Details
                                    </th>
                                    <th scope="col">Invoice Date
                                    </th>
                                    <th scope="col">Invoice Amount
                                    </th>
                                    <th scope="col">Invoice
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td scope="row text-color-table number-and-km">323436</td>
                                    <td scope="row text-color-table number-and-km">141415616151</td>

                                    <td>
                                        <div class="col">
                                            <div class="d-flex custom-margin-table">
                                                <p>David Bough</p>
                                            </div>
                                            <div class="d-flex">
                                                <img src="<c:url value="/resources/images/layer-15.png" />"
                                                    style="width: 20px; height: 22px; margin-right: 7px;">
                                                <p>Musterstrabe 5,12345 Bonn</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col">
                                            <div class="d-flex custom-margin-table">
                                                <img src="<c:url value="/resources/images/calculator.png" />" class="calander-img">
                                                <p><strong>31/03/2018</strong></p>
                                            </div>
                                            <div class="d-flex">
                                                <img class="clock" src="<c:url value="/resources/images/layer-712.png" />">
                                                <p>12:00 - 18:00</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="eurotext">
                                        <div class="d-flex flex-row custom-margin-table-two-data">
                                            <p class="">
                                                €
                                            </p>
                                            <p class="">
                                                63
                                            </p>
                                        </div>
                                    </td>
                                    <td>
                                        <img src="<c:url value="/resources/images/icons8-pdf-50.png" />" alt="reportimg">
                                    </td>
                                </tr>
                                <tr>
                                    <td scope="row text-color-table number-and-km">323436</td>
                                    <td scope="row text-color-table number-and-km">141415616151</td>
                                    <td>

                                    </td>
                                    <td>
                                        <div class="col">
                                            <div class="d-flex custom-margin-table">
                                                <img src="<c:url value="/resources/images/calculator.png" />" class="calander-img">
                                                <p><strong>31/03/2018</strong></p>
                                            </div>
                                            <div class="d-flex">
                                                <img class="clock" src="<c:url value="/resources/images/layer-712.png" />">
                                                <p>12:00 - 18:00</p>
                                            </div>
                                        </div>
                                    </td>

                                    <td class="eurotext">
                                        <div class="d-flex flex-row custom-margin-table-two-data">
                                            <p class="">
                                                €
                                            </p>
                                            <p class="">
                                                63
                                            </p>
                                        </div>
                                    </td>
                                    <td>
                                        <img src="<c:url value="/resources/images/icons8-pdf-50.png" />" alt="reportimg">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div id="block-cust" class="tabcontent">
            <div class="d-flex flex-row">
                <div class="card card-style">
                    <div class="card-body">
                        <div class="d-flex justify-content-center">
                            <img src="<c:url value="/resources/images/hat.png" />" class="hat-img">
                        </div>
                        <div class="text-class-block d-flex justify-content-center">
                            <span><strong>cust1 cust1</strong></span>
                        </div>
                        <div class="text-class-block d-flex justify-content-center">
                            <button class="unblock-btn">Unblock</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="mySettings" class="tabcontent">
            <div class="d-flex flex-row container">

                <div class="faq-questions-list " style="width: 100%;">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item text-center text-dark">
                            <a class="nav-link active w-100" data-toggle="tab" href="#mydetails"><img
                                    src="<c:url value="/resources/images/setup-service-white.png" />">My Details</a>
                        </li>
                        <li class="nav-item text-center text-dark">
                            <a class="nav-link w-100" data-toggle="tab" href="#mypassword"><img
                                    src="<c:url value="/resources/images/schedule-white.png" />">Change Password</a>
                        </li>

                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div id="mydetails" class="container tab-pane active"><br>
                        <form id="spdetailsform">
                            <span><strong>Account Status:</strong>Active</span>

                            <div class="d-flex flex-row">
                                <div class="w-100 custome-margin-my-details">
                                    <span>Basic details</span>
                                    <div class="mydetails-devider-line"></div>
                                </div>
                                <div id="change">
                                    <img src="<c:url value="/resources/images/avatar-${htmlavatar }.png" />" alt="">
                                </div>
                            </div>

                            
                                <div class="form-row name-form">
                                    <div class="col">
                                        <label for="exampleFormControlInput1">First name</label>
                                        <input type="text" class="form-control" placeholder="First name" value= ${htmlusername } required id="firstname">
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlInput1">Last name</label>
                                        <input type="text" class="form-control" placeholder="Last name" value= ${htmllastname } required id="lastname">
                                    </div>
                                    <div class="col">
                                        <fieldset disabled>
                                            <label for="exampleFormControlInput1">E-mail address</label>
                                            <input type="email" id="disabledTextInput" value= ${htmluseremail } required class="form-control"
                                                placeholder="Disabled input">

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
													<div class="input-group-text">+91</div>
												</div>
												<input type="text" class="form-control" name="mobile" required
													id="updtmobile" value= ${htmlMobile }>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-top: 5px;">
										<label for="exampleFormControlInput1">Date of birth</label>
										<div class="d-flex flex-row">
											<select class="custom-select select-dob-date" required
												id="updtbdate" name="date_of_birth">
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
												id="updtbmonth" name="date_of_birth">
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
												id="updtbyear" name="date_of_birth">
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
                                    <div class="col-md-4 mt-1">
                                        <label for="exampleFormControlInput1">Nationality</label>
                                        <select id="updtnationality" class="custom-select Nationality-select">
                                            <option selected value="Indian">Indian</option>
                                            <option value="German">German</option>
                                        </select>
                                    </div>
                                </div>
                                <div>
									<p>Gender</p>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender"
                                            id="inlineRadio1" value="Male">
                                        <label class="form-check-label" for="inlineRadio1">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender"
                                            id="inlineRadio2" value="Female">
                                        <label class="form-check-label" for="inlineRadio2">Female</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender"
                                            id="inlineRadio3" value="Rather not to say">
                                        <label class="form-check-label" for="inlineRadio3">Rather not to say</label>
                                    </div>
                                </div>
                                <label>Select Avatar</label>
                                <div class="d-flex justify-content-left align-items-center extra-services-img"
                                    style="padding-bottom: 41px; padding-top: 30px;">
                                    <div class="flex-column col d-flex justify-content-center align-items-center">
                                        <div class="img-col d-flex justify-content-center align-items-center">
                                        <input type="radio" name="avatar" id="car" class="input-hidden" value="car"/>
						                <label for="car">
						                    <img src="<c:url value="/resources/images/avatar-car.png" />" alt="Car" class="avatarimg" />
						                </label>
                                        </div>
                                    </div>
                                    <div class="flex-column col d-flex justify-content-center align-items-center">
                                        <div class="img-col d-flex justify-content-center align-items-center">
                                        <input type="radio" name="avatar" id="female" class="input-hidden" value="female"/>
						                <label for="female">
						                    <img src="<c:url value="/resources/images/avatar-female.png" />" alt="female" class="avatarimg" />
						                </label>
                                        </div>
                                    </div>
                                    <div class="flex-column col d-flex justify-content-center align-items-center">
                                        <div class="img-col d-flex justify-content-center align-items-center">
                                        <input type="radio" name="avatar" id="hat" class="input-hidden" value="hat"/>
						                <label for="hat">
						                    <img src="<c:url value="/resources/images/avatar-hat.png" />" alt="hat" class="avatarimg" />
						                </label>
                                        </div>
                                    </div>
                                    <div class="flex-column col d-flex justify-content-center align-items-center">
                                        <div class="img-col d-flex justify-content-center align-items-center">
                                        <input type="radio" name="avatar" id="iron" class="input-hidden" value="iron"/>
						                <label for="iron">
						                    <img src="<c:url value="/resources/images/avatar-iron.png" />" alt="iron" class="avatarimg" />
						                </label>
                                        </div>
                                    </div>
                                    <div class="flex-column col d-flex justify-content-center align-items-center">
                                        <div class="img-col d-flex justify-content-center align-items-center">
                                        <input type="radio" name="avatar" id="male" class="input-hidden" value="male"/>
						                <label for="male">
						                    <img src="<c:url value="/resources/images/avatar-male.png" />" alt="male" class="avatarimg" />
						                </label>
                                        </div>
                                    </div>
                                    <div class="flex-column col d-flex justify-content-center align-items-center">
                                        <div class="img-col d-flex justify-content-center align-items-center">
                                        <input type="radio" name="avatar" id="ship" class="input-hidden" value="ship"/>
						                <label for="ship">
						                    <img src="<c:url value="/resources/images/avatar-ship.png" />" alt="ship" class="avatarimg" />
						                </label>
                                        </div>
                                    </div>
                                </div>
                                <span>My address</span>
                                <div class="devider-line"></div>
                                <div class="form-row">
                                    <div class="col">
                                        <label for="exampleFormControlInput1">Street name</label>
                                        <input type="text" class="form-control" placeholder="Street name" value=${htmladdline1 } required id="AddressLine1">
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlInput1">House number</label>
                                        <input type="text" class="form-control" placeholder="House number" value=${htmladdline2 } required id="AddressLine2">
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlInput1">Postal code</label>
                                        <input type="text" class="form-control" placeholder="Postal code" value=${htmlpostalcode } required id="PostalCode">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-lg-4">
                                        <label for="exampleFormControlInput1">City</label>
                                        <input type="text" class="form-control" placeholder="City name" value=${htmlcity } required id="City">
                                    </div>
                                </div>

                                <div class="submit-devider-line">

                                </div>
                                <button class="settings-submit">Submit</button>
                            </form>
                        </div>

                        <div id="mypassword" class="container tab-pane details fade"><br>
                            <br>
							<form style="margin-top: 20px;" method="get" id="settingspupdatepasswordform"
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

    <div style="flex-grow: 1;"></div>


    <div class="footer_section w-100">
        <div class="footer_main d-flex justify-content-around align-items-center">
            <div class="footer_left">
                <img src="<c:url value="/resources/images/white-logo-transparent-background.png" />" alt="" height="78" width="106">
            </div>
            <div class="footer_mid">
                <ul class="d-flex p-0 text-center">
                    <li>
                        <a href="homepage.html" class="text-decoration-none">HOME</a>
                    </li>
                    <li>
                        <a href="aboutus.html" class="text-decoration-none">ABOUT</a>
                    </li>
                    <li>
                        <a href="" class="text-decoration-none">TESTIMONIAL</a>
                    </li>
                    <li>
                        <a href="faq.html" class="text-decoration-none">FAQS</a>
                    </li>
                    <li>
                        <a href="" class="text-decoration-none">INSURANCE POLICY</a>
                    </li>
                    <li>
                        <a href="" class="text-decoration-none">IMPRESSUM</a>
                    </li>
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
        <div class="footer_end d-flex align-items-center justify-content-center">
            <p class="m-0 text-center">©2018 Helperland. All rights reserved. Terms and Conditions | Privacy Policy
            </p>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
        integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>

    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
    function dashboarddatatable(){
        $(document).ready(function () {
            $('#example').DataTable({
                responsive: true,
                "dom": '<"top">rt<"bottom"lip><"clear">',
                "aaSorting": [],
                "order": [[ 0, "desc" ]],
                columnDefs: [{
                    orderable: false,
                    targets: 5
                }]
            });
        });
    }
        function upcomingdatatable(){
        $(document).ready(function () {
            $('#upcoming').DataTable({
               responsive: true,
                "dom": '<"top">rt<"bottom"lip><"clear">',
                "aaSorting": [],
                "order": [[ 1, "asc" ]],
                columnDefs: [{
                    orderable: false,
                    targets: 4
                }]
            });
        });
        }
        function spservicehistorydatatable() {
        $(document).ready(function () {
            $('#selectedColumn').DataTable({
                responsive: true,
                "dom": '<"top">rt<"bottom"lip><"clear">',
                "aaSorting": []
            });
        });
        }
        $(document).ready(function () {
            $('#InvoiceColumn').DataTable({

                /* responsive: true,
                "dom": '<"top">rt<"bottom"lip><"clear">',
                "aaSorting": [],
                columnDefs: [{
                    orderable: false,
                    targets: 4
                }] */
            });
        });
        
        
    window.onload = dashboard();
        
        function dashboard() {
     	  $.ajax({
       		type:"GET",
       		url:"/helperland/displayspdashboard",
       		contentType: "application/json",
       		success:function(response){
       			var result = '<table id="example" class="display table nowrap" cellspacing="0" style="width:100%"><thead><tr><th scope="col" class="serviceidrow">Service ID</th><th scope="col" class="servicedate">Service date</th><th scope="col" class="provider">Customer Details</th><th scope="col" class="payment">Payment</th><th scope="col" class="payment">Time Conflict</th><th scope="col" class="action">Actions</th></tr></thead>';
    				result += "<tbody>";
    				$.each(response, function(k, v) {
						result += "<tr>";
    					result += '<td scope="row text-color-table number-and-km">';
    					result +='<a href="#"  data-toggle="modal" data-target="#withoutServiceProviderdashboardModalCenter" onclick="openModaldetails('+v[0].service_req_id+')" class="text-decoration-none link-text">'+v[0].service_req_id+'</a>';
    					result += "</td>";
						result += "<td>";
    					result += '<div class="col"><div class="d-flex custom-margin-table"><img src="<c:url value="/resources/images/calculator.png" />" class="calander-img"><a href="#"  data-toggle="modal" data-target="#withoutServiceProviderdashboardModalCenter" onclick="openModaldetails('+v[0].service_req_id+')" class="text-decoration-none link-text"><strong>'+v[0].service_start_date+'</strong></a></div><div class="d-flex"><img class="clock" src="<c:url value="/resources/images/layer-712.png" />"> <a  data-toggle="modal" data-target="#withoutServiceProviderdashboardModalCenter" class="text-decoration-none link-text">'+v[0].service_start_time+' (Total Time: '+v[0].service_hours+')</a></div></div>';
    					result += "</td>";
    					result += '<td style="padding: 0px; padding-top: 13px;">';
    					result += '<div class="col"><div class="d-flex custom-margin-table"><p>'+v[2].first_name+' '+v[2].last_name+'</p></div><div class="d-flex"><img src="<c:url value="/resources/images/layer-15.png" />" style="width: 20px; height: 22px; margin-right: 7px;"><p>'+v[1].addressLine1+', '+v[1].addressLine2+'</p></div></div>';
    					result += "</td>";
    					result += '<td>';
    					result += '<p>'+v[0].total_cost+'&euro;</p>';
    					result += "</td>";
    					result += "<td>";
    					result += "</td>";
    					result += "<td>";
    					result += '<div class="d-flex flex-row"><button class="btn Reschedule-button" onclick="acceptbtndashboard('+v[0].service_req_id +')">Accept</button></div>';
    					result += "</td>";  
    					result += "</tr>"
					
				});
    			console.log("SUCCESS: ", response);
				 result += "</tbody>";
 				result += '</table>';
 				$("#dashboarddatashow").html(result);
 				dashboarddatatable();
       		},
       		error: function(e){
       			console.log("ERROR: ", e);
       		},
       		done: function(e){
       			console.log("Done");
       		}
       	});
       }  
        
        
        function acceptbtndashboard(servicerequestid){
        	event.preventDefault();
      		console.log(servicerequestid + "Hiiiiiiiiiiiiiiiiiii");
      		$.ajax({
      			type:"GET",
      			url:"/helperland/acceptbtndashboardform/" + servicerequestid,
      			success:function(data){
      				console.log("SUCCESS: ", data);
      				if(data == 1){
      					alert("You have accepted this service request!!!");
      					dashboard();
      				}
      				else{
      					alert("Please Try again!!!");
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
        
        function openModaldetails(servicerequestid){
      	  $.ajax({
      	  		type:"GET",
      	  		url:"/helperland/displayspdashboardmodal/" + servicerequestid,
      	  		contentType: "application/json",
      	  		success:function(response){
      	  			var pet_stats = response.servicereqfinal.has_pets;
      	  			var servicetime= response.servicereqfinal.service_start_time + 3
      	  			console.log(servicetime);
      	  			var str = "";
      	  			if(pet_stats=="true"){
      	  				str = '<img src="<c:url value="/resources/images/haspets.png" />"> I have a pets';
      	  			}
      	  			else{
      	  				str = '<img src="<c:url value="/resources/images/notpets.png" />"> I don`t have pets';
      	  			}
      	  			console.log(servicerequestid);
      	  			console.log("SUCCESS: ", response);
      	  			
      	  			$("#serviceTotalTimeModal").html(response.servicereqfinal.service_start_time);
      	  			$("#ExtraServiceModal").html(response.allExtras);
      	  			$("#serviceStartDateModal").html(response.servicereqfinal.service_start_date);
      	  			$("#serviceIdModal").html('35'+servicerequestid);
      	  			$("#NetAmountModal").html(response.servicereqfinal.total_cost);
      	  			$("#AddressLine1Modal").html(response.serviceRequestAddress.AddressLine1);
      	  			$("#AddressLine2Modal").html(response.serviceRequestAddress.AddressLine2);
      	  			$("#MobileModal").html(response.serviceRequestAddress.Mobile);
      	  			$("#EmailModal").html(response.serviceRequestAddress.email);
      	  			$("#CommentsModal").html(response.servicereqfinal.comments);
      	  			$("#PetModal").html(str);
      	  		},
      	  		error: function(e){
      	  			console.log("ERROR: ", e);
      	  		},
      	  		done: function(e){
      	  			console.log("Done");
      	  		}
      	  	});
        }
        
        
        function realtimeupcomingservicce(){
      	  $.ajax({
        		type:"GET",
        		url:"/helperland/upcomingservicce",
        		contentType: "application/json",
        		success:function(response){
        			var result = '<table id="upcoming" class="display table nowrap" cellspacing="0" style="width:100%"><thead><tr><th scope="col">Service ID </th><th scope="col">Service date</th><th scope="col">Customer details</th><th scope="col">Payment</th><th scope="col" style="width:270px">Actions</th></tr></thead>'
        				result += "<tbody>";
        				 $.each(response, function(k, v) {
        						result += "<tr>";
            					result += '<td scope="row text-color-table number-and-km">';
            					result +='<a href="#"  data-toggle="modal" data-target="#withoutServiceProviderdashboardModalCenter" onclick="openModaldetails('+v[0].service_req_id+')" class="text-decoration-none link-text">'+v[0].service_req_id+'</a>';
            					result += "</td>";
        						result += "<td>";
            					result += '<div class="col"><div class="d-flex custom-margin-table"><img src="<c:url value="/resources/images/calculator.png" />" class="calander-img"><a href="#"  data-toggle="modal" data-target="#withoutServiceProviderdashboardModalCenter" onclick="openModaldetails('+v[0].service_req_id+')" class="text-decoration-none link-text"><strong>'+v[0].service_start_date+'</strong></a></div><div class="d-flex"><img class="clock" src="<c:url value="/resources/images/layer-712.png" />"> <a  data-toggle="modal" data-target="#withoutServiceProviderdashboardModalCenter" class="text-decoration-none link-text">'+v[0].service_start_time+' (Total Time: '+v[0].service_hours+')</a></div></div>';
            					result += "</td>";
            					result += '<td style="padding: 0px; padding-top: 13px;">';
            					result += '<div class="col"><div class="d-flex custom-margin-table"><p>'+v[2].first_name+' '+v[2].last_name+'</p></div><div class="d-flex"><img src="<c:url value="/resources/images/layer-15.png" />" style="width: 20px; height: 22px; margin-right: 7px;"><p>'+v[1].addressLine1+', '+v[1].addressLine2+'</p></div></div>';
            					result += "</td>";
            					result += '<td>';
            					result += '<p>'+v[0].total_cost+'&euro;</p>';
            					result += "</td>";
            					result += "<td>";
            					result += '<div class="d-flex flex-row"><button class="btn" onclick="cancelbtnspupcomingservice('+ v[0].service_req_id +')" data-toggle="modal" data-target="#cancelModalCenter">Cancel</button><button class="btn Reschedule-button" onclick="completebtnspupcomingservice('+ v[0].service_req_id +')" data-toggle="modal" data-target="#completeModalCenter">Completed</button></div>';
            					result += "</td>";  
            					result += "</tr>"
        					
        				}); 
        				console.log("SUCCESS: ", response);
        				 result += "</tbody>";
        				result += '</table>';
        				$("#upcomingservicetabledata").html(result);
        				upcomingdatatable();
        				/* $.each(response, function(k, v) {
        					
        					console.log(v[1].addressLine1);
        					console.log(v[2].first_name);
        					
        					 $.each(v, function(m,l){
        						if(l.AddressLine1 != null){
        							 console.log(l.AddressLine1+"hiiii"); 
        						}
        						
        						
        					}); 
        				}); */
        		},
        		error: function(e){
        			console.log("ERROR: ", e);
        		},
        		done: function(e){
        			console.log("Done");
        		}
        	}); 
        }
        

        $(document).on('click','#realtimedashboard',function (){
        	realtimeupcomingservicce();
        });
        
        
        function cancelbtnspupcomingservice(servicerequestid){
      	  console.log(servicerequestid);
      	  jQuery(document).ready(function($){
      			$("#cancelbtnspupcomingserviceform").submit(function(event){
      				event.preventDefault();
      				cancelbtnspupcomingform(servicerequestid);
      			});
      		});
        }
        
        function cancelbtnspupcomingform(servicerequestid){
      		console.log(servicerequestid + "Hiiiiiiiiiiiiiiiiiii");
      		$.ajax({
      			type:"GET",
      			url:"/helperland/cancelbtnupcomingservice/" + servicerequestid,
      			success:function(data){
      				console.log("SUCCESS: ", data);
      				$("#closecanclemodal").click();
      				realtimeupcomingservicce();
      			},
      			error: function(e){
      				console.log("ERROR: ", e);
      			},
      			done: function(e){
      				console.log("Done");
      			}
      		});
      	}
        
        function completebtnspupcomingservice(servicerequestid){
        	  console.log(servicerequestid);
        	  jQuery(document).ready(function($){
        			$("#completebtnspupcomingserviceform").submit(function(event){
        				event.preventDefault();
        				completebtnspservice(servicerequestid);
        			});
        		});
          }
          
          function completebtnspservice(servicerequestid){
        		console.log(servicerequestid + "Hiiiiiiiiiiiiiiiiiii");
        		$.ajax({
        			type:"GET",
        			url:"/helperland/completebtnupcomingservice/" + servicerequestid,
        			success:function(data){
        				console.log("SUCCESS: ", data);
        				$("#closecompletemodal").click();
        				realtimeupcomingservicce();
        			},
        			error: function(e){
        				console.log("ERROR: ", e);
        			},
        			done: function(e){
        				console.log("Done");
        			}
        		});
        	}
        
        
        
        function realtimespservicehistory(){
        	  $.ajax({
          		type:"GET",
          		url:"/helperland/spservicehistory",
          		contentType: "application/json",
          		success:function(response){
          			var result = '<table id="selectedColumn" class="display table nowrap" cellspacing="0" style="width:100%"><thead><tr><th scope="col">Service ID </th><th scope="col">Service date</th><th scope="col">Customer details</th></tr></thead>'
          				result += "<tbody>";
          				 $.each(response, function(k, v) {
          						result += "<tr>";
              					result += '<td scope="row text-color-table number-and-km">';
              					result +='<a href="#"  data-toggle="modal" data-target="#withoutServiceProviderdashboardModalCenter" onclick="openModaldetails('+v[0].service_req_id+')" class="text-decoration-none link-text">'+v[0].service_req_id+'</a>';
              					result += "</td>";
          						result += "<td>";
              					result += '<div class="col"><div class="d-flex custom-margin-table"><img src="<c:url value="/resources/images/calculator.png" />" class="calander-img"><a href="#"  data-toggle="modal" data-target="#withoutServiceProviderdashboardModalCenter" onclick="openModaldetails('+v[0].service_req_id+')" class="text-decoration-none link-text"><strong>'+v[0].service_start_date+'</strong></a></div><div class="d-flex"><img class="clock" src="<c:url value="/resources/images/layer-712.png" />"> <a  data-toggle="modal" data-target="#withoutServiceProviderdashboardModalCenter" class="text-decoration-none link-text">'+v[0].service_start_time+' (Total Time: '+v[0].service_hours+')</a></div></div>';
              					result += "</td>";
              					result += '<td style="padding: 0px; padding-top: 13px;">';
              					result += '<div class="col"><div class="d-flex custom-margin-table"><p>'+v[2].first_name+' '+v[2].last_name+'</p></div><div class="d-flex"><img src="<c:url value="/resources/images/layer-15.png" />" style="width: 20px; height: 22px; margin-right: 7px;"><p>'+v[1].addressLine1+', '+v[1].addressLine2+'</p></div></div>';
              					result += "</td>";
              					result += "</tr>"
          					
          				}); 
          				console.log("SUCCESS: ", response);
          				 result += "</tbody>";
          				result += '</table>';
          				$("#displaysphistory").html(result);
          				spservicehistorydatatable();
          				/* $.each(response, function(k, v) {
          					
          					console.log(v[1].addressLine1);
          					console.log(v[2].first_name);
          					
          					 $.each(v, function(m,l){
          						if(l.AddressLine1 != null){
          							 console.log(l.AddressLine1+"hiiii"); 
          						}
          						
          						
          					}); 
          				}); */
          		},
          		error: function(e){
          			console.log("ERROR: ", e);
          		},
          		done: function(e){
          			console.log("Done");
          		}
          	}); 
          }
          

          $(document).on('click','#realtimeservicehistorysp',function (){
        	  realtimespservicehistory();
          });
          
          jQuery(document).ready(function($){
      		$("#settingspupdatepasswordform").submit(function(event){
      			event.preventDefault();
      			updtsppasswordfunction();
      		});
      	});

      	function updtsppasswordfunction(){
      		
      		
      		$.ajax({
      			type:"GET",
      			url:"/helperland/updtsppassword/" + $("#old_password").val() + "," + $("#updtpassword").val(),
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
        
      	
      	$(document).on('click', '.input-hidden', function() {
      		var temp = $('input[name="avatar"]:checked').val();
    		var changedimg = '<img src="<c:url value="/resources/images/avatar-'+ temp +'.png" />" >';
    		$('#change').html(changedimg);
    	});
      	
      	
      	
      	
      	jQuery(document).ready(function($){
      		$("#spdetailsform").submit(function(event){
      			event.preventDefault();
      			spdetailsfunction();
      		});
      	});

      	function spdetailsfunction(){
      		
      		
      		$.ajax({
      			type:"GET",
      			url:"/helperland/updtspdetails/" + $("#firstname").val() + "," + $("#lastname").val() + "," + $("#updtmobile").val() + "," + $("#updtbdate").val() + "," + $("#updtbmonth").val() + "," + $("#updtbyear").val() + "," + $("#updtnationality").val() + "," + $('input[name="gender"]:checked').val() + "," + $('input[name="avatar"]:checked').val() + "," + $("#AddressLine1").val() + "," + $("#AddressLine2").val() + "," + $("#PostalCode").val() + "," + $("#City").val(),
      			success:function(response){
      				console.log("SUCCESS: ", response);
      				$(".instantdisplayname").html($("#firstname").val()+"!");
      			},
      			error: function(e){
      				console.log("ERROR: ", e);
      			},
      			done: function(e){
      				console.log("Done");
      			}
      		});
      	}
      	
      	
      	$(function () {
            $("#exporttabledata").click(function (e) {
                console.log("hu chalu chu bhai");
                var table = $("#selectedColumn");
                if (table && table.length) {
                    $(table).table2excel({
                        exclude: ".noExl",
                        name: "Excel Document Name",
                        filename: "ServiceHistory" + new Date().toISOString().replace(/[\-\:\.]/g, "") + ".xls",
                        fileext: ".xls",
                        exclude_img: true,
                        exclude_links: true,
                        exclude_inputs: true,
                        preserveColors: false
                    });
                }
            });

        });
      	
      	
      	
      	function realtimeratings(){
      	  $.ajax({
        		type:"GET",
        		url:"/helperland/spratingsdetails",
        		contentType: "application/json",
        		success:function(response){
        			var result = '<table class="display" style="width:100%"><thead></thead>'
        				result += "<tbody>";
        				 $.each(response, function(k, v) {
        					 var rating_status = "";
        					 if(v[0].ratings==5){
        						 rating_status = "Excellent";
        					 }
        					 
        					 else if(v[0].ratings==4){
        						 rating_status = "Very Good";
        					 }
        					 
        					 else if(v[0].ratings==3){
        						 rating_status = "Good";
        					 }
        					 
        					 else if(v[0].ratings==2){
        						 rating_status = "Normal";
        					 }
        					 
        					 else {
        						 rating_status = "Poor";
        					 }
        					 
        						result += "<tr>";
        						result += "<td><div>"+v[0].service_req_id+"</div><div>"+v[1].first_name+" "+v[1].last_name+"</div></td>";
        						result += "<td><div>"+v[2].service_start_date+"</div><div>"+v[2].service_start_time+"</div></td>";
        						result += "<td><div>Rating</div><div>"+v[0].ratings+"/5 "+rating_status+"</div></td>";
        						result += "</tr>";
        						result += "<tr>";
        						result += '<td colspan="3"><div><strong>Customer comment</strong></div><div>'+v[0].comments+'</div></td>';
        						result += "</tr>";
        						result += "<tr>";
        						result += '<td colspan="3"></td>';
        						result += "</tr>";
        					
        				}); 
        				console.log("SUCCESS: ", response);
        				 result += "</tbody>";
        				result += '</table>';
        				$("#ratingData").html(result);
        				/* spservicehistorydatatable(); */
        				/* $.each(response, function(k, v) {
        					
        					console.log(v[1].addressLine1);
        					console.log(v[2].first_name);
        					
        					 $.each(v, function(m,l){
        						if(l.AddressLine1 != null){
        							 console.log(l.AddressLine1+"hiiii"); 
        						}
        						
        						
        					}); 
        				}); */
        		},
        		error: function(e){
        			console.log("ERROR: ", e);
        		},
        		done: function(e){
        			console.log("Done");
        		}
        	}); 
        }
        

        $(document).on('click','#realtimeratingssp',function (){
        	realtimeratings();
        });
      	
    </script>
    
    <script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/jquery.table2excel.min.js"></script>
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
         document.getElementById("servicerequesttab").click();
    </script>

</body>

</html>