<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bookservice.css" />">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon"
	href="<c:url value="/resources/images/white-logo-transparent-background.png" />">
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <title>Upcoming Services</title>
</head>
<body>
    <div class="header" id="topheader">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #525252;">
            <a class="navbar-brand" href="#">
                <img src="<c:url value="/resources/images/white-logo-transparent-background.png" />" style="  width: 73px; height: 54px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <div class="nav-btn-blue">
                            <a class="nav-link" href="bookservice">Book now</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="nav-btn">
                            <a class="nav-link" href="#">Prices & services</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="nav-btnn">
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
                            <a class="nav-link" href="#">Contact</a>
                        </div>
                    </li>
                    <li class="nav-item" id="loginlink">
                        <div class="nav-btn-blue">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModalCenter">Login</a>
                        </div>
                    </li>
                    <li class="nav-item" id="becomelink">
                        <div class="nav-btn-blue">
                            <a class="nav-link" href="#">Become a Helper</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="d-flex mx-auto" id="notificon">
				<div class="vertical-line"></div>
				<img class="notification-icon"
					src="<c:url value="/resources/images/icon-notification.png" />">
				<div class="vertical-line"></div>
			</div>
			<div class="profile-dropedown" id="profilepic">
				<a class="nav-link  dropdown-toggle text-decoration-none"
					id="navbarDropdownMenuLink-4" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"><img
					src="<c:url value="/resources/images/forma-1-1-1.png" />"> </a>
				<div
					class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav"
					aria-labelledby="navbarDropdownMenuLink-4">
					<%-- <span style="padding-left: 15px;">Welcome,<br>
					<strong style="padding-left: 15px;">${htmlusername }</strong></span>
					<div class="devider-line"></div> --%>
					<a class="dropdown-item text-color-nav text-decoration-none" id="customerdashboard"
						href="user">My Dashboard</a>  <a
						class="dropdown-item text-color-nav text-decoration-none"
						href="logout">Log out</a>
				</div>
			</div>
            <a class="btn btn-background-color" style="float:right" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
                <span class="navbar-toggler-icon"></span>
            </a>
        </nav>
    </div>

    <div class="offcanvas offcanvas-end" id="demo">
        <div class="offcanvas-header">
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body">

            <ul class="side-nav">
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="bookservice">Book now</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="#">Prices & services</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="#">Warranty</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="#">Blog</a>
                </li>
                <li class="side-items">
                    <a class="side-link text-decoration-none" href="#">Contact</a>
                </li>
                
						<li class="side-items" id="offcanvasDashboard"><c:if test="${user_type == 2 }">
									<a class="side-link text-decoration-none" href="serviceprovider">Dashboard</a>
								</c:if>
								
								<c:if test="${user_type == 3 }">
									<a class="side-link text-decoration-none" href="user">Dashboard</a>
								</c:if>
								
								<c:if test="${user_type == 1 }">
									<a class="side-link text-decoration-none" href="admin">Dashboard</a>
								</c:if></li>
				<li class="side-items" id="offcanvasLogout"><a
						class="side-link text-decoration-none"
						href="logout">Log out</a></li>
            </ul>

        </div>
    </div>


<div id="loading-image" style="display: none;">
<div class="loader"></div>
</div>


	<section id="modal">
		<div class="modal fade" id="addnewaddress" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered  login-model" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title strong-color" id="exampleModalLongTitle">Add Address</h4>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <form method="post" id="addaddressform" name="addaddressform">
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
                              style="margin-left: 5px; width: 200px;">
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
                                <div class="input-group-text">+91</div>
                              </div>
                              <input type="text" class="form-control" id="Mobile" name="Mobile" placeholder="Mobile number">
                            </div>
                          </div>
              
                        </div>
                        <button type="submit" class="Save-btn" title="Save">Save</button>
                       	<div id="successmessage"></div>
                       	<div id="mobilevalidationcheck"></div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
              
<div class="modal fade bookingsuccesmodallllll" id="bookingsuccesmodallllll" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm mx-auto" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="d-flex align-items-center justify-content-center flex-column">
                    <div class="success-symbol d-flex align-items-center justify-content-center success-booking-img">
                        <img src="<c:url value="/resources/images/correct-white-medium.png" />" alt="">
                    </div>
                    <div class="text-center mt-3">
                        <h5>Booking has been successfully submitted</h5>
                    </div>
                    <div class="mt-3 mb-2">Service Request id: <span id="service-id">8848</span></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- <div class="modal fade" id="bookingsuccessmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> -->
	</section>


    <section id="banner">
        <img class="img-fluid w-100" src="<c:url value="/resources/images/book-service-banner.jpg" />" />
    </section>

    <section id="main-body" style="padding-top: 30px;">
        <div class="text-center">
            <h1>Set up your cleaning service</h1>
        </div>
        <div class="faq-divider text-center d-flex align-items-center justify-content-center" style="margin-bottom: 30px;">
            <img src="<c:url value="/resources/images/forma-1-copy-5.png" />">
        </div>

        <div class="d-flex paymentmedia container">

            <div class="faq-questions-list " style="width: 100%;">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item text-center text-dark" id="firsttab">
                        <button class="nav-link active w-100" id="firstbtncolor" data-toggle="tab" href="#home" disabled><img src="<c:url value="/resources/images/setup-service-white.png" />"> Setup Service</button>
                    </li>
                    <li class="nav-item text-center text-dark" id="secondtab">
                        <button class="nav-link w-100" data-toggle="tab" id="secondbtncolor" href="#Schedule" disabled><img src="<c:url value="/resources/images/schedule-white.png" />"> Schedule & Plan</button>
                    </li>
                    <li class="nav-item text-center text-dark" id="thirdtab">
                        <button class="nav-link w-100" data-toggle="tab" id="thirdbtncolor" href="#Details" disabled><img src="<c:url value="/resources/images/details-white.png" />">Your Details</button>
                    </li>
                    <li class="nav-item text-center text-dark" id="fourthtab">
                        <button class="nav-link w-100" data-toggle="tab" id="fourthbtncolor" href="#Payment" disabled><img src="<c:url value="/resources/images/payment-white.png" />"> Make Payment</button>
                    </li>
                </ul>


		

                <!-- Tab panes -->
                <div class="tab-content">
                    <div id="home" class="container tab-pane "><br>

                        <span>Enter your Postal Code</span>

  						<form method="post" id="postalCodeForm" name="postalCodeForm">
                            <div class="row">
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" placeholder="Postal Code" id="postalcode" name="postal_code">
                                </div>
                                <div class="col">
                                    <button type="submit" class="btn mb-2 submit-btn">Check Availability</button>
                                </div>
                                <div id="postalerror"></div>
                            </div>
						</form>

                    </div>

                    <div id="Schedule" class="container tab-pane details"><br>
                        <div class="d-flex flex-row justify-content-between dateandtimeflex">
                            <div>
                                <span>When do you need the cleaner?</span>
                        
                                    <div class="d-flex flex-row">
                                        <div class="col-lg-6">
                                            <input type="date" class="link-text form-control" style="width: 150px; margin-right: 20px;"
													id="service_start_date" name="service_start_date">
                                        </div>
                                        <div class="col-lg-6">
                                            <select class="custom-select" name="servicetime" id="startTime" name="service_start_time">
                                                <option value="8.00">8:00</option>
                                                <option value="8.30">8:30</option>
                                                <option value="9.00">9:00</option>
                                                <option value="9.30">9:30</option>
                                                <option value="10.00">10:00</option>
                                            </select>
                                        </div>
                                    </div>

                            </div>
                            <div>
                                <span>How long do you need your cleaner to stay?</span>
                                <form style="margin-top: 15px;">
                                    <div class="d-flex flex-row">

                                        <div class="col-lg-6">
                                            <select class="custom-select" title="Time" id="extratime" name="service_hours" form="mainServiceForm" onclick="clicktime()">
                        <option value="3.0">3.0 Hrs</option>
                        <option value="4.0">4.0 Hrs</option>
                        <option value="5.0">5.0 Hrs</option>
                        <option value="6.0">6.0 Hrs</option>
                      </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="devider-line">

                        </div>
                        <span>Extra Services</span>

                        <div class="container-fluid extra-services">
              <div class="d-flex justify-content-center align-items-center extra-services-img wrapper" id="uncheckallcheckbox"
                style="padding-bottom: 41px; padding-top: 30px;">
                <div class="flex-column col d-flex justify-content-center align-items-center">
                  <div class=" d-flex justify-content-center align-items-center">
                    <label class="option_item">
                      <input type="checkbox" class="checkbox" id="Insidecabinets" value="Inside_cabinets">
                      <div class="option_inner facebook" style="border-radius:200px">
                        <div class="icon "><img src="<c:url value="/resources/images/3.png" />"></div>
                      </div>
                    </label>
                  </div>
                  <div class="text-center" style="margin-top: 15px;">
                    <h6 style="color: #4F4F4F;">Inside cabinets</h6>
                  </div>
                </div>
                <div class="flex-column col d-flex justify-content-center align-items-center">
                  <div class=" d-flex justify-content-center align-items-center">
                    <label class="option_item">
                      <input type="checkbox" class="checkbox" id="Insidefridge" value="Inside_fridge">
                      <div class="option_inner twitter" style="border-radius:200px">
                        <div class="icon"><img src="<c:url value="/resources/images/5.png" />"></div>
                      </div>
                    </label>
                  </div>
                  <div class="text-center" style="margin-top: 15px;">
                    <h6 style="color: #4F4F4F;">Inside fridge</h6>
                  </div>
                </div>
                <div class="flex-column col d-flex justify-content-center align-items-center">
                  <div class=" d-flex justify-content-center align-items-center">
                    <label class="option_item">
                      <input type="checkbox" class="checkbox" id="Insideoven" value="Inside_oven">
                      <div class="option_inner instagram" style="border-radius:200px">
                        <div class="icon"><img src="<c:url value="/resources/images/4.png" />"></div>
                      </div>
                    </label>
                  </div>
                  <div class="text-center" style="margin-top: 15px;">
                    <h6 style="color: #4F4F4F;">Inside oven</h6>
                  </div>
                </div>
                <div class="flex-column col d-flex justify-content-center align-items-center">
                  <div class="d-flex justify-content-center align-items-center">
                    <label class="option_item">
                      <input type="checkbox" class="checkbox" id="Laundrywash" value="Laundry_wash">
                      <div class="option_inner instagram" style="border-radius:200px">
                        <div class="icon"><img src="<c:url value="/resources/images/2.png" />"></div>
                      </div>
                    </label>
                  </div>
                  <div class="text-center" style="margin-top: 15px;">
                    <h6 style="color: #4F4F4F;">Laundry wash </h6>
                  </div>
                </div>
                <div class="flex-column col d-flex justify-content-center align-items-center">
                  <div class="d-flex justify-content-center align-items-center">

                    <label class="option_item">
                      <input type="checkbox" class="checkbox" id="Interiorwindows" value="Interior_windows">
                      <div class="option_inner instagram" style="border-radius:200px">
                        <div class="icon"><img src="<c:url value="/resources/images/1.png" />"></div>
                      </div>
                    </label>
                  </div>
                  <div class="text-center">
                    <h6 style="color: #4F4F4F;">Interior windows</h6>
                  </div>
                </div>
              </div>


            </div>
                        <div class="devider-line">

                        </div>

                        <div>
                            <span>Comments</span>
                        </div>
       
                            <div class="form-group">
                                <textarea class="form-control commentsection" id="comments" name="comments" rows="4"
                                    placeholder="Comments"></textarea>
                            </div>
                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="petcheck">
                                    <label class="form-check-label" for="gridCheck">
                                        I have pets at home
                                    </label>
                                </div>
                            </div>
       
       <div class="justify-content-between d-flex flex-row btnalignclass">
                                <button onclick="FirstTab()"  class="back-btn">Back</button>
                            <button type="submit" onclick="ThirdTab()" style="margin-top: 20px" class="btn mb-2 submit-btn">Continue</button>
                        </div>
                    </div>
                    <div id="Details" class="container tab-pane"><br>

                        <span>Enter your contact details, so we can serve you in better way!</span>

<!-- <div id="showadd"></div> -->

<div id="showadd" class="table-responsive  mt-2 mb-2 p-2">
								<table class="table">
									<thead>
										<tr>
											<th></th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										
									</tbody>
								</table>
							</div>


                            <button type="button" class="bookservice-btn" data-toggle="modal" data-target="#addnewaddress">
                + Add New Address
              </button>
                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck">
                                    <label class="form-check-label" for="gridCheck">
                                        Send invoice on this address
                                    </label>
                                </div>
                            </div>
                        <div class="devider-line">

                        </div>
                        <div class="justify-content-between d-flex flex-row">
                            <div class="float-left">
                                <button onclick="SecondTab()"  class="back-btn">Back</button>
                            </div>
                        <div class="float-right">
                            <button type="submit" id="continue-btn-thirdtab" onclick="FourthTab()" class="Continue-btn">Continue</button>
                        </div>
                        </div>

                    </div>
                    <div id="Payment" class="container tab-pane"><br>

                        <h4>Pay securely with Helperland payment getway!</h4>

                        <p>Promo code(optional)</p>
                        <form>
                            <form>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <input type="text" class="form-control" placeholder="First name">
                                    </div>
                                    <div class="col">
                                        <button type="submit" class="bookservice-btn"
                                            style="margin-top: 0px;">Apply</button>
                                    </div>
                                </div>
                            </form>
                        </form>
                        <div class="devider-line">
                        </div>
                        <form>
                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck" required>
                                    <label class="form-check-label" for="gridCheck">
                                        I accepted terms and conditions, the cancellation policy and the privacy policy.
                                        I confirm that Helperland starts to execute the contract before the expiry of
                                        the withdrawal period and I lose my right of withdrawal as a consumer with full
                                        performance of the contract.
                                    </label>
                                </div>
                            </div>
                        </form>

                        <div class="devider-line">

                        </div>
                        <div class="justify-content-between d-flex flex-row">
                            <div class="float-left">
                                <button onclick="ThirdTab()"  class="back-btn">Back</button>
                            </div>
                        <div class="float-right">
                            <button type="submit" class="Continue-btn" onclick="finalcontinue()">Continue</button>
                        </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="classbeforcard">
                <div class="card">
                    <div class="card-header">
                        Payment Summary
                    </div>
                    <div class="card-body">
                        <p class="card-text px-3 py-2">12/01/2022 08:00</p>
                        <p class="card-text px-3"><strong>Duration</strong></p>
                        <div class="d-flex justify-content-between px-3 py-2">
                            <p>Basic</p>
                            <p id="timevalue">3 Hrs</p>
                        </div>
                        
                        <div class="print-values justify-content-between pl-3 pr-3 pb-2 pt-2">
              <p id="valueList"></p>
            </div>
                        
                        <div class="total-divider-line mx-auto"></div>
                        <div class="d-flex justify-content-between px-3" style="margin-bottom: 20px;">
                            <p><strong>Total Service Time</strong></p>
                            <p><span class="totalservicetime" id="totaltime">3</span> Hrs</p>
                        </div>

                        <div class="devider-line">

                        </div>
                        <div class="d-flex justify-content-between px-3" style="margin-bottom: 20px; margin-top: 20px;">
                            <p>Per cleaning</p>
                            <p><span id="EuroValue" class="firstEuroValue">54</span> &euro;</p>
                        </div>

                        <div class="devider-line">

                        </div>

                        <div class="d-flex justify-content-between px-3" style="margin-top: 20px;">
                            <p style="font-size: 20px; color: #1d7a8c; padding-top: 25px;">Total Payment</p>
                            <p style="font-size: 42px; font-weight: 700; color: #1d7a8c;"><span id="firstEuroValue">54</span> &euro;</p>
                        </div>
                        
                        
                    </div>
                    <div class="card-footer text-muted">
                        <p>🙂 See what is always included</p>
                    </div>
                </div>

                <div class="text-center">
                    <span>Questions?</span>
                </div>
                <div class="accordion">
                    <div class="accordion-item" id="question1">
                        <a class="accordion-link" href="#question1">
                            <img class="up-arrow" src='<c:url value="/resources/images/vector-smart-object-copy.png" />' style="margin-right: 15px;">

                            <img class="down-arrow" src='<c:url value="/resources/images/vector-smart-object.png" />' style="margin-right: 15px;">

                            What's included in a cleaning?

                        </a>
                        <div class="devider-line"></div>
                        <div class="answer">
                            <p>Bedroom, Living Room & Common Areas,Bathrooms,Kitchen,Extras </p>
                        </div>
                    </div>
                    <div class="accordion-item" id="question2">
                        <a class="accordion-link" href="#question2">
                            <img class="up-arrow" src='<c:url value="/resources/images/vector-smart-object-copy.png" />' style="margin-right: 15px; height: 24px">

                            <img class="down-arrow" src='<c:url value="/resources/images/vector-smart-object.png" />' style="margin-right: 15px; height: 24px">

                            Which Helperland professional will come to my place?

                        </a>
                        <div class="devider-line"></div>
                        <div class="answer">
                            <p>Helperland has a vast network of experienced,<br> top-rated cleaners. Based on the time
                                and <br> date of your request, we work to assign the<br> best professional
                                available.Like working with a<br> specific pro? Add them to your Pro Team from<br> the
                                mobile app and they'll be requested first<br> for all future bookings.You will receive
                                an<br> email with details about your professional prior<br> to your appointment.</p>
                        </div>
                    </div>
                    <div class="accordion-item" id="question3">
                        <a class="accordion-link" href="#question3">
                            <img class="up-arrow" src='<c:url value="/resources/images/vector-smart-object-copy.png" />' style="margin-right: 15px;">

                            <img class="down-arrow" src='<c:url value="/resources/images/vector-smart-object.png" />' style="margin-right: 15px;">

                            Can I skip or reschedule bookings?

                        </a>
                        <div class="devider-line"></div>
                        <div class="answer">
                            <p>You can reschedule any booking for free at<br> least 24 hours in advance of the
                                scheduled<br> start time. If you need to skip a booking within<br> the minimum
                                commitment, weâll credit the<br> value of the booking to your account. You can<br> use
                                this credit on future cleanings and other<br> Helperland services.</p>
                        </div>
                    </div>
                </div>
                <p style="color: #1d7a8c;"><strong>For more help</strong></p>
            </div>
        </div>
    </section>

<a class="text-decoration-none" id="backtoTopbutton"></a>

    <div class="footer_section w-100" style="margin-top: 53px;">
        <div class="footer_main d-flex justify-content-around align-items-center">
            <div class="footer_left">
                <img src="<c:url value="/resources/images/white-logo-transparent-background.png" />" alt="" height="78" width="106">
            </div>
            <div class="footer_mid">
                <ul class="d-flex p-0 text-center">
                    <li>
                        <a href="" class="text-decoration-none">HOME</a>
                    </li>
                    <li>
                        <a href="" class="text-decoration-none">ABOUT</a>
                    </li>
                    <li>
                        <a href="" class="text-decoration-none">TESTIMONIAL</a>
                    </li>
                    <li>
                        <a href="" class="text-decoration-none">FAQS</a>
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
        <div class="footer_end d-flex align-items-center justify-content-center">
            <p class="m-0 text-center">Â©2018 Helperland. All rights reserved. Terms and Conditions | Privacy Policy
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

<script src="<c:url value="/resources/js/jquery.js" />"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>

    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    
    <script>

    window.onload = Postalcodetab();
    	
    	function Postalcodetab() {
    	document.getElementById("home").style.display = "block";
    	
    	document.getElementById("firsttab").style.color = "#fff";
    	document.getElementById("firsttab").style.color = "#1d7a8c";
    }
    
    
    function FirstTab() {
document.getElementById("home").style.display = "block";
document.getElementById("Schedule").style.display = "none";
    	document.getElementById("firsttab").style.color = "#fff";
    	document.getElementById("firsttab").style.color = "#1d7a8c";
    	$("#firstbtncolor").addClass("active");
    	$("#secondbtncolor").removeClass("active");
	}
    
    function SecondTab() {
    	document.getElementById("home").style.display = "none";
    	document.getElementById("Schedule").style.display = "block";
    	document.getElementById("Details").style.display = "none";
    	document.getElementById("Payment").style.display = "none";
    	
/*     	document.getElementById("firsttab").style.color = "#646464";
    	document.getElementById("firsttab").style.color = "#f3f3f3"; */
    	
    	$("#firstbtncolor").removeClass("active");
    	$("#secondbtncolor").addClass("active");
    	$("#thirdbtncolor").removeClass("active");
    	
/*     	document.getElementById("secondtab").style.color = "#fff";
    	document.getElementById("secondtab").style.color = "#1d7a8c"; */
	}
    function ThirdTab() {
    	document.getElementById("home").style.display = "none";
    	document.getElementById("Schedule").style.display = "none";
    	document.getElementById("Details").style.display = "block";
    	document.getElementById("Payment").style.display = "none";
    	
    	$("#secondbtncolor").removeClass("active");
    	$("#thirdbtncolor").addClass("active");
    	$("#fourthbtncolor").removeClass("active");
    	
    	$.ajax({
    		type:"GET",
    		url:"/helperland/showaddress",
    		contentType: "application/json",
    		success:function(response){
    			var result = "<thead><tr><th></th><th></th><th></th></tr></thead>"
    				result += "<tbody>";
    				$.each(response, function(k, v) {
    					
    					//console.log(v.state);
    					//document.getElementById("showadd").innerHTML = document.getElementById("showadd").innerHTML + v.addressLine1;
    					result += "<tr>";
    					result += "<td>";
    					result +='<div class="form-check"><input required class="form-check-input position-static address_id" type="radio" name="address_id" id="address_id" value='+v.user_address_id+' aria-label="..."></div>';
    					result += "</td>";
    					result += "<td>";
    					result += "</td>";
    					result += "<td>";
    					result += '<div class="row"><span><strong>Address:  </strong>'+v.addressLine1+', '+v.addressLine2+'</span> <span><strong>Phone number:  </strong>'+v.mobile+'</span></div>';
    					result += "</td>";
    					result += "</tr>";
    				});
    				console.log("SUCCESS: ", response);
    				result += "</tbody>";
    				$("#showadd").html(result);
    				
    		},
    		error: function(e){
    			console.log("ERROR: ", e);
    		},
    		done: function(e){
    			console.log("Done");
    		}
    	});
    	
    	
	}
    function FourthTab() {
    	document.getElementById("home").style.display = "none";
    	document.getElementById("Schedule").style.display = "none";
    	document.getElementById("Details").style.display = "none";
    	document.getElementById("Payment").style.display = "block";
    	
    	$("#thirdbtncolor").removeClass("active");
    	$("#fourthbtncolor").addClass("active");
	}
    
    
    
    
    
    
</script>

<script>

$("#continue-btn-thirdtab").click(function(){
	console.log($("#petcheck").is(":checked"));
});

</script>


<script>
jQuery(document).ready(function($){
	$("#postalCodeForm").submit(function(event){
		event.preventDefault();
		serachPostalCode();
	});
});

function serachPostalCode(){
	var search={}
	
	$.ajax({
		type:"GET",
		url:"/helperland/postalcode/" + $("#postalcode").val(),
		success:function(data){
			console.log("SUCCESS: ", data);
			if(data == "true"){
				SecondTab();
			}
			else{
				console.log("hiiii")
				document.getElementById('postalerror').innerHTML = 'reenter postal code';
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
	$("#addaddressform").submit(function(event){
		event.preventDefault();
		addaddress();
	});
});

function addaddress(){
	var search={}
	
	$.ajax({
		type:"GET",
		url:"/helperland/addaddress/" + $("#AddressLine1").val()+ "," + $("#AddressLine2").val() + "," + $("#pincode").val() + "," + $("#City").val() + "," + $("#Mobile").val(),
		success:function(data){
			console.log("SUCCESS: ", data);
			document.getElementById('successmessage').innerHTML = 'successmessage';  
			ThirdTab();
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

var list = document.getElementById('valueList');

var text = '<span> you have selected: <br> </span>'

var Basic = "54";

var normal = "100";

var listArray = [];

var checkboxes = document.querySelectorAll('.checkbox');



for (var checkbox of checkboxes) {
  checkbox.addEventListener('click', function () {
    if (this.checked == true) {
      listArray.push(this.value);
      valueList.innerHTML = text + listArray.join('<br>');
      addcost();
    }
    else {
      listArray = listArray.filter(e => e !== this.value);
      valueList.innerHTML = text + listArray.join('<br>');
      removecost();
    }
    console.log(listArray.length)
    var TotalTimeMenu = $("#extratime").val();
    var firstEuroValueMenu = $("#firstEuroValue").text();
    if (listArray.length == 0) {


      $("#totaltime").html(TotalTimeMenu);

    }
    else if (listArray.length == 1) {
      // EuroValue.innerHTML = '63,00 €'
      $("#totaltime").html(parseInt(TotalTimeMenu)+(0.5));
      
      // var totaltime = parseFloat(document.getElementById('totaltime').value);

      // document.getElementById('totaltime').innerHTML = "3.5 Hrs";
      // console.log(totaltime.value)
      
    }
    else if (listArray.length == 2) {
      // EuroValue.innerHTML = '72,00 €'
      $("#totaltime").html(parseInt(TotalTimeMenu)+(1));
    }
    else if (listArray.length == 3) {
      // EuroValue.innerHTML = '81,00 €'
      $("#totaltime").html(parseInt(TotalTimeMenu)+(1.5));
    }
    else if (listArray.length == 4) {
      // EuroValue.innerHTML = '90,00 €'
      $("#totaltime").html(parseInt(TotalTimeMenu)+(2));  
    }
    else if (listArray.length == 5) {
      // EuroValue.innerHTML = '99,00 €'
      $("#totaltime").html(parseInt(TotalTimeMenu)+(2.5));
    }
    console.log(listArray)
  });
  
}
function addcost(){
	var firstEuroValueMenu = $("#firstEuroValue").text();
    if (listArray.length == 0) {
      $("#totaltime").html(TotalTimeMenu);
    }
    else if (listArray.length == 1) {
      // EuroValue.innerHTML = '63,00 €'
      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)+9);
      $("#EuroValue").html(parseInt(firstEuroValueMenu)+9);
      
      // var totaltime = parseFloat(document.getElementById('totaltime').value);

      // document.getElementById('totaltime').innerHTML = "3.5 Hrs";
      // console.log(totaltime.value)
      
    }
    else if (listArray.length == 2) {
      // EuroValue.innerHTML = '72,00 €'
      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)+9);
      $("#EuroValue").html(parseInt(firstEuroValueMenu)+9);
    }
    else if (listArray.length == 3) {
      // EuroValue.innerHTML = '81,00 €'
      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)+9);
      $("#EuroValue").html(parseInt(firstEuroValueMenu)+9);
    }
    else if (listArray.length == 4) {
      // EuroValue.innerHTML = '90,00 €'
      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)+9);
      $("#EuroValue").html(parseInt(firstEuroValueMenu)+9);
    }
    else if (listArray.length == 5) {
      // EuroValue.innerHTML = '99,00 €'
      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)+9);
      $("#EuroValue").html(parseInt(firstEuroValueMenu)+9);
    }
}


function removecost(){
	var firstEuroValueMenu = $("#firstEuroValue").text();
	console.log(firstEuroValueMenu + "hiiiii");
	if (listArray.length == 0) {

	      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)-9);
	      $("#EuroValue").html(parseInt(firstEuroValueMenu)-9);

	    }
	    else if (listArray.length == 1) {
	    	console.log(parseInt(firstEuroValueMenu)-9 + "111111111");
	    	console.log("111111111");
	      // EuroValue.innerHTML = '63,00 €'
	      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)-9);
	      $("#EuroValue").html(parseInt(firstEuroValueMenu)-9);
	      
	      // var totaltime = parseFloat(document.getElementById('totaltime').value);

	      // document.getElementById('totaltime').innerHTML = "3.5 Hrs";
	      // console.log(totaltime.value)
	      
	    }
	    else if (listArray.length == 2) {
	      // EuroValue.innerHTML = '72,00 €'
	      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)-9);
	      $("#EuroValue").html(parseInt(firstEuroValueMenu)-9);
	    }
	    else if (listArray.length == 3) {
	      // EuroValue.innerHTML = '81,00 €'
	      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)-9);
	      $("#EuroValue").html(parseInt(firstEuroValueMenu)-9);
	    }
	    else if (listArray.length == 4) {
	      // EuroValue.innerHTML = '90,00 €'
	      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)-9);
	      $("#EuroValue").html(parseInt(firstEuroValueMenu)-9);  
	    }
	    else if (listArray.length == 5) {
	      // EuroValue.innerHTML = '99,00 €'
	      $("#firstEuroValue").html(parseInt(firstEuroValueMenu)-9);
	      $("#EuroValue").html(parseInt(firstEuroValueMenu)-9);
	    }
}


function finalcontinue(){
	$('#loading-image').show();
	var allitems = "";

	listArray.map(e => {
		allitems += e + " ";
	});
	
	console.log(allitems);
	$.ajax({
		type:"GET",
		url:"/helperland/finalsave/" + $('#address_id:checked').val()+ "," +$("#firstEuroValue").text() + "," + $("#EuroValue").text() + "," + $("#comments").val() + "," + $("#extratime").val() + "," + $("#postalcode").val() + "," + $("#service_start_date").val() +","+ $("#petcheck").is(":checked").toString() + "," + allitems + "," + $("#startTime").val() + "," + $("#totaltime").text(),
		success:function(response){
				console.log("SUCCESS: ", response);
				/* alert("service request sent..."); */
				$("#bookingsuccesmodallllll").modal("show");
		},
		error: function(e){
			console.log("ERROR: ", e);
			alert("please select address....");
		},
		done: function(e){
			console.log("Done");
		},
		complete: function(){
  		    $('#loading-image').hide();
  		}
	});
}


function clicktime() {
  var time = parseFloat(document.getElementById('extratime').value);

  document.getElementById('timevalue').innerHTML = time + " Hrs";
  document.getElementById('totaltime').innerHTML = time;
  
  listArray = [];
  
  console.log(listArray.length);
  
  listArray = listArray.filter(e => e !== this.value);
  valueList.innerHTML = text + listArray.join('<br>');
  
  $('#uncheckallcheckbox input[type=checkbox]').prop('checked', false);

  if (time == 3) {
		document.getElementById('firstEuroValue').innerHTML = "54";
		document.getElementById('EuroValue').innerHTML = "54";
	} else if (time == 4) {
		document.getElementById('firstEuroValue').innerHTML = "72";
		document.getElementById('EuroValue').innerHTML = "72";
	} else if (time == 5) {
		document.getElementById('firstEuroValue').innerHTML = "90";
		document.getElementById('EuroValue').innerHTML = "90";
	} else {
		document.getElementById('firstEuroValue').innerHTML = "108";
		document.getElementById('EuroValue').innerHTML = "108";
	}
  
  console.log(extratime.value)
}

$("#date_pick").change(function(){
  console.log( $("#date_pick").val());
});

$("#parentidcheckbox label").click(function(){
  var temp = $(".firstEuroValue").text();
  console.log(temp);
});

$("#addaddressform").submit(function(event) {
	var a = document.forms["addaddressform"]["Mobile"].value;
	var filter = /[0-9]{10}/;
	if(!filter.test(a)){
		return false;
	}
	else{
		return true;
	}
});

$(document).ready(function() {
	$("#Mobile").on('keyup', function() {
		var a = document.forms["addaddressform"]["Mobile"].value;
		var filter = /[0-9]{10}/;
		if (!filter.test(a)) {
			$('#mobilevalidationcheck').html("Enter Correct Phone number").css("color", "red");
		}
		else {
			$('#mobilevalidationcheck').html("");
		}
	});
})

  </script>  
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script>
	let name = <%=request.getAttribute("hideshow")%>
	
	if(name == null){
		/* document.getElementById("notificon").style.display = "none"; */
		/* $("#notificon").hide(); */
		$("#notificon").removeClass( "d-flex" );
		$("#notificon").css("display", "none");
		$("#profilepic").css("display", "none");
		$("#loginlink").css("display", "block");
		$("#becomelink").css("display", "block");
		console.log("hiiiiiiiiiiiiiiiiiii");
	}
	else{
		$("#notificon").addClass( "d-flex" );
		$("#notificon").css("display", "block");
		$("#profilepic").css("display", "block");
		$("#loginlink").css("display", "none");
		$("#becomelink").css("display", "none");
		$('#my_image').css("width", "73px");
		$('#my_image').css("height", "54px"); 
		console.log("hiiiiiiiiiiiiiiiiiii");
 		
	}
	
	
	$(document).ready(function(){
        var dtToday = new Date();
        
        var month = dtToday.getMonth() + 1;
        var day = dtToday.getDate() + 1;
        var year = dtToday.getFullYear();
        if(month < 10)
            month = '0' + month.toString();
        if(day < 10)
            day = '0' + day.toString();
        
        var maxDate = year + '-' + month + '-' + day;
        $('#service_start_date').attr('min', maxDate);
    });
	</script>
    
    <script>

    $('.bookingsuccesmodallllll').on('hidden.bs.modal', function (){
    	console.log("hii");
    	document.getElementById("customerdashboard").click();
    });
    </script>
    
    <script>
	window.onload = function () {
	    if (typeof history.pushState === "function") {
	        history.pushState("jibberish", null, null);
	        window.onpopstate = function () {
	            history.pushState('newjibberish', null, null);
	        };
	    }
	    else {
	        var ignoreHashChange = true;
	        window.onhashchange = function () {
	            if (!ignoreHashChange) {
	                ignoreHashChange = true;
	                window.location.hash = Math.random();
	            }
	            else {
	                ignoreHashChange = false;
	            }
	        };
	    }
	};

	</script>
    
<script>
var btn = $('#backtoTopbutton');

$(window).scroll(function() {
  if ($(window).scrollTop() > 300) {
    btn.addClass('show');
  } else {
    btn.removeClass('show');
  }
});

btn.on('click', function(e) {
  e.preventDefault();
  $('html, body').animate({scrollTop:0}, '300');
});
</script>
    
</body>

</html>