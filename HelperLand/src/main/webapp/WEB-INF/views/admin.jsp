<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/admin.css" />">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="icon" type="image/x-icon" href="<c:url value="/resources/images/white-logo-transparent-background.png" />">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <title>User Management</title>

</head>
<body>

<section id="header">
        <div class="header" id="topheader">
            <nav class="navbar navbar-expand-lg navbar-light py-2" style="background-color: #1fb6ff;">

                <a class="navbar-brand text-light" href="homepage.html">
                    <h3>HelperLand</h3>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse text-left" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <div class="profile-dropedown nav-btnn-img">
                                <a class="nav-link  dropdown-toggle text-decoration-none" id="navbarDropdownMenuLink-4"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
                                        class="fa fa-user"></i>
                                    <img src=" <c:url value="/resources/images/forma-1-1-1.png" />"> </a>
                                <!-- <div class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav"
                                    aria-labelledby="navbarDropdownMenuLink-4">
                                    <a class="dropdown-item text-color-nav text-decoration-none" href="#">My account</a>
                                    <a class="dropdown-item text-color-nav text-decoration-none" href="#">Log out</a>
                                </div> -->
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btnn">
                                <a class="nav-link" href="#">Tatvasoft Admin</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <div class="nav-btnn-img">
                                <a class="nav-link" href="logout"><img src="<c:url value="/resources/images/logout.png" />"></a>
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
                <p>welcome,<br> <strong>Abc</strong></p>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
            </div>

            <div class="offcanvas-body">
                <div class="devider-line"></div>
                <ul class="side-nav">
                    <li class="side-items">
                        <a class="side-link text-decoration-none tablinks" onclick="openTab(event, 'ServiceRequests')"
                            id="defaultOpen" href="#">Service Requests</a>
                    </li>
                    <li class="side-items">
                        <a class="side-link text-decoration-none tablinks" onclick="openTab(event, 'UserManagement')"
                            href="#">User Management</a>
                    </li>
                    <li class="side-items">
                        <a class="side-link text-decoration-none tablinks" href="#">Coupon Code Management</a>
                    </li>
                    <li class="side-items">
                        <a class="side-link text-decoration-none tablinks" href="#">Content Management</a>
                    </li>
                    <li class="side-items">
                        <a class="side-link text-decoration-none tablinks" onclick="openTab(event, 'Invoices')"
                            href="#">Invoices</a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <div class="tab">
        <button class="tablinks" onclick="openTab(event, 'ServiceRequests')" id="realtimeservicerequest">Service Requests</button>
        <div class="deviderline"></div>
        <button class="tablinks" onclick="openTab(event, 'UserManagement')" id="usermanagementtab">User Management</button>
        <div class="deviderline"></div>
        <button class="tablinks">Coupon Code Management</button>
        <div class="deviderline"></div>
        <button class="tablinks">Content Management</button>
        <div class="deviderline"></div>
        <button class="tablinks" onclick="openTab(event, 'Invoices')">Invoices</button>
        <div class="deviderline"></div>
    </div>

    <div id="ServiceRequests" class="tabcontent">
        <h1 style="padding-top: 15px; padding-bottom: 15px;">Service Requests</h1>

        <div class="service-request-color">
            <div class="first-row">
                <div class="row">
                    <div class="col">
                        <input type="text" style="height: 46px;" id="serviceId" class="form-control" placeholder="Service Id">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" style="height: 46px;" id="postalCode" placeholder="Postal Code">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" style="height: 46px;" id="customerName" placeholder="Customer name">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" style="height: 46px;" id="serviceProviderName" placeholder="Service Provider name">
                    </div>
                    <div class="col">
                        <select id="status" style="height: 46px;" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                

                    
                    <!-- <div class="col" style="max-width: 140px;">
                        <input type="text" id="From_Date" style="height: 46px;" placeholder="From Date" onfocus="(this.type='date')" onblur="(this.type='text')">
                    </div>
                    <div class="col" style="max-width: 140px;">
                         <input type="text" id="To_Date" style="height: 46px;" placeholder="To Date" onfocus="(this.type='date')" onblur="(this.type='text')">
                    </div> -->
                    
                    <div class="col-auto">
                        <button type="submit" style="height: 46px;" class="btn btn-primary mb-2">clear</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-12" id="allservicerequest">
                    <table id="example" class="display table nowrap" cellspacing="0" style="width:100%">
                        <thead>
                            <tr>
                                <th scope="col">Service ID
                                </th>
                                <th scope="col">Service date
                                </th>
                                <th scope="col">Customer details
                                </th>
                                <th scope="col">Service Provider
                                </th>
                                <th scope="col">Gross Amount
                                </th>
                                <th scope="col">net Amount
                                </th>
                                <th scope="col">Discount
                                </th>
                                <th scope="col">Status
                                </th>
                                <th scope="col">Payment Status
                                </th>
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

    <div id="UserManagement" class="tabcontent">
        <h1 style="padding-top: 15px; padding-bottom: 15px;">
            User Management
        </h1>

        <div class="service-request-color">
            <div class="first-row" style="padding-bottom: 0px;">
                <div class="row">
                    <div class="col">
                        <input type="text" style="height: 46px;" class="form-control" id="namesearch"
                                placeholder="Name">
                    </div>
                    <div class="col" id="UserTypeSearch">
                        <select id="inputState" style="height: 46px;" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="col">
                        <div class="input-group mb-2" style="height: 46px;">
                            <div class="input-group-prepend">
                                <div class="input-group-text">+91</div>
                            </div>
                            <input type="text" style="height: 46px;" class="form-control" id="Phonenumber"
                                placeholder="Mobile number">
                        </div>
                    </div>
                    <div class="col">
                        <input type="text" id="Postalcode" class="form-control" style="height: 46px;" placeholder="Postalcode">
                    </div>
                    <div class="col">
                        <input type="text" id="Email" style="height: 46px;" class="form-control" placeholder="Email">
                    </div>
                    <!-- <div class="col">
                        <input type="date" class="link-text form-control" style="width: 150px; margin-right: 20px;"
													id="startdate_to" placeholder="From Date">
						<input type="text" id="From_Date" style="height: 46px;" placeholder="From Date" onfocus="(this.type='date')" onblur="(this.type='text')">
                    </div>
                    <div class="col">
                        <input type="text" id="To_Date" style="height: 46px;" placeholder="To Date" onfocus="(this.type='date')" onblur="(this.type='text')">
                    </div> -->
                    <!-- <div class="col-auto">
                        <button type="submit" style="height: 46px;" class="btn btn-primary mb-2">Serach</button>
                    </div> -->
                    <div class="col-auto">
                        <button type="submit" style="height: 46px;" class="btn btn-primary mb-2">clear</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                <div id="displayusersdata">
                    <table id="usermanagementdt" class="display table nowrap" cellspacing="0" style="width:100%">
                        <thead>
                            <tr>
                                <th scope="col">User Name
                                </th>
                                <th scope="col">Role
                                </th>
                                <th scope="col">Date of Registration
                                </th>
                                <th scope="col">User Type
                                </th>
                                <th scope="col">Phone
                                </th>
                                <th scope="col">Postal code
                                </th>
                                <th scope="col">Status
                                </th>
                                <th scope="col">Action
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- <tr>
                                <td scope="row text-color-table number-and-km">Abhishek Vadhadiya</td>
                                <td></td>
                                <td style="padding: 0px; padding-top: 13px;">
                                    <div class="col">
                                        <div class="d-flex custom-margin-table">
                                            <img src="images/calculator.png" class="calander-img">
                                            <p>09/04/2018</p>
                                        </div>
                                    </div>
                                </td>
                                <td scope="row text-color-table number-and-km">Customer</td>
                                <td scope="row text-color-table number-and-km">9925177550</td>
                                <td></td>
                                <td><button
                                        class="Not-Applicable-button align-items-center justify-content-center custom-margin-table-two-data">Inactive</button>
                                </td>
                                <td>
                                    <div class="profile-dropedown nav-btnn-img float-left">
                                        <a class="nav-link  dropdown-toggle text-decoration-none"
                                            id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"><i class="fa fa-user"></i>
                                            <img src="images/icons8-menu-vertical-30.png"> </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav"
                                            aria-labelledby="navbarDropdownMenuLink-4">
                                            <a class="dropdown-item text-color-nav text-decoration-none" href="#">Delete</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td scope="row text-color-table number-and-km">Sandip Patel</td>
                                <td scope="row text-color-table number-and-km">Call Center Employee</td>
                                <td style="padding: 0px; padding-top: 13px;">
                                    <div class="col">
                                        <div class="d-flex custom-margin-table">
                                            <img src="images/calculator.png" class="calander-img">
                                            <p>09/04/2018</p>
                                        </div>
                                    </div>
                                </td>
                                <td scope="row text-color-table number-and-km">Admin</td>
                                <td scope="row text-color-table number-and-km">999988887777</td>
                                <td></td>
                                <td><button
                                        class="complete-button align-items-center justify-content-center custom-margin-table-two-data">Active</button>
                                </td>
                                <td>
                                    <div class="profile-dropedown nav-btnn-img float-left">
                                        <a class="nav-link  dropdown-toggle text-decoration-none"
                                            id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"><i class="fa fa-user"></i>
                                            <img src="images/icons8-menu-vertical-30.png"> </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav"
                                            aria-labelledby="navbarDropdownMenuLink-4">
                                            <a class="dropdown-item text-color-nav text-decoration-none" href="#">Delete</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td scope="row text-color-table number-and-km">First Provider</td>
                                <td></td>
                                <td style="padding: 0px; padding-top: 13px;">
                                    <div class="col">
                                        <div class="d-flex custom-margin-table">
                                            <img src="images/calculator.png" class="calander-img">
                                            <p>09/04/2018</p>
                                        </div>
                                    </div>
                                </td>
                                <td scope="row text-color-table number-and-km">Service Provider</td>
                                <td scope="row text-color-table number-and-km">9966554477</td>
                                <td scope="row text-color-table number-and-km">53225</td>
                                <td><button
                                        class="complete-button align-items-center justify-content-center custom-margin-table-two-data">Active</button>
                                </td>
                                <td>
                                    <div class="profile-dropedown nav-btnn-img float-left">
                                        <a class="nav-link  dropdown-toggle text-decoration-none"
                                            id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false"><i class="fa fa-user"></i>
                                            <img src="images/icons8-menu-vertical-30.png"> </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav"
                                            aria-labelledby="navbarDropdownMenuLink-4">
                                            <a class="dropdown-item text-color-nav text-decoration-none" href="#">Delete</a>
                                        </div>
                                    </div>
                                </td>
                            </tr> -->
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="Invoices" class="tabcontent">
        <h1 style="padding-top: 15px; padding-bottom: 15px;">Invoices</h1>
        <div class="service-request-color">
            <div class="first-row">
                <div class="row">
                    <div class="col">
                        <input type="text" style="height: 46px;" class="form-control" placeholder="First name">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" style="height: 46px;" placeholder="Last name">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" style="height: 46px;" placeholder="Email">
                    </div>
                    <div class="col">
                        <select id="inputState" style="height: 46px;" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="col">
                        <select id="inputState" style="height: 46px;" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="col">
                        <select id="inputState" style="height: 46px;" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="col" style="max-width: 140px;">
                        <input type="text" style="height: 46px;" class="form-control" placeholder="From Date">
                    </div>
                    <div class="col" style="max-width: 140px;">
                        <input type="text" style="height: 46px;" class="form-control" placeholder="To Date">
                    </div>
                </div>
            </div>
            <div class="">
                <div class="row">
                    <div class="col-auto">
                        <button type="submit" style="height: 46px;" class="btn btn-primary mb-2">Serach</button>
                    </div>
                    <div class="col-auto">
                        <button type="submit" style="height: 46px;" class="btn btn-primary mb-2">clear</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <section id="models">
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Edit Service Requests</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editAndRescheduleForm" name="editAndRescheduleForm">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Date</label>
                                    <input type="date" class="link-text form-control datepicker"
										style="width: 150px;" id="service_start_date"
										name="service_start_date">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputState">Time</label>
                                    <select class="custom-select" id="startTime"
										name="service_start_time">
										<option value="8.00">8:00</option>
										<option value="8.30">8:30</option>
										<option value="9.00">9:00</option>
										<option value="9.30">9:30</option>
										<option value="10.00">10:00</option>
									</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <span>Service Address</span>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Street name</label>
                                    <input type="text" class="form-control" id="AddressLine1" placeholder="Street name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">House number</label>
                                    <input type="text" class="form-control" id="AddressLine2" placeholder="111">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">Postal Code</label>
                                    <input type="text" class="form-control" id="Postal_Code" placeholder="Postal Code">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputState">City</label>
                                    <select
										class="custom-select" id="City" name="City"
										style="margin-left: 5px; width: 200px; height: 46px;">
										<option selected value="ABC">ABC</option>
										<option value="DEF">DEF</option>
										<option value="GHI">GHI</option>
										<option value="JKL">JKL</option>
									</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Why do you want to reschedule service request?</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Why do you want to reschedule service request?"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Cell Center EMP Notes</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Notes" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-update">Update</button>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>



    <script>
        function openTab(evt, cityName) {
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

        document.getElementById("defaultOpen").click();
    </script>



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

    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>

    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   
    <script>
    function servicerequestdatatable(){
        $(document).ready(function () {
        	var table = $('#example').DataTable({

            	"aLengthMenu": [[25, 50, 75, -1], [25, 50, 75, "All"]],
                "pageLength": 25,
                "order": [[ 0, "desc" ]],
                /* responsive: true, */
                "dom": '<"top">rt<"bottom"lip><"clear">'
                /* "aaSorting": [],
                columnDefs: [{
                    orderable: false,
                    targets: [4, 5, 6, 8, 9],
                }] */
        	});
                	$('#serviceId').on('keyup', function () {
                        table
                            .columns(0)
                            .search(this.value)
                            .draw();
                    });
                	$('#postalCode').on('keyup', function () {
                        table
                            .columns(2)
                            .search(this.value)
                            .draw();
                    });
                	/* $('#From_Date').on('keyup', function () {
                        table
                            .columns(1)
                            .search(this.value)
                            .draw();
                    });
                	$('#To_Date').on('keyup', function () {
                        table
                            .columns(1)
                            .search(this.value)
                            .draw();
                    }); */
                	
                	$('#customerName').on('keyup', function () {
                        table
                            .columns(2)
                            .search(this.value)
                            .draw();
                    });
                	$('#serviceProviderName').on('keyup', function () {
                        table
                            .columns(3)
                            .search(this.value)
                            .draw();
                    });
                	$("#status").each(function () {
                        var select = $('<select style="height: 46px;"><option value=""></option></select>')
                            .appendTo($(this).empty())
                            .on('change', function () {
                                table.column(5)
                                    .search($(this).val())
                                    .draw();
                            });

                        table.column(5).data().unique().sort().each(function (d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>')
                        });
                    });
            
        });
    }
        
        function usermanagementdatatablequery() {
        $(document).ready(function () {
        	var table = $('#usermanagementdt').DataTable({

               /* responsive: true, */
                /* "dom": '<"top">rt<"bottom"lip><"clear">', */
                /* "aaSorting": [], */
                /* columnDefs: [{
                    orderable: false,
                    targets: [4, 5, 6, 8, 9],
                }] */
            	"dom": '<"top">rt<"bottom"lip><"clear">',
            	"order": [[ 1, "desc" ]]
            });
        	$('#Postalcode').on('keyup', function () {
                table
                    .columns(4)
                    .search(this.value)
                    .draw();
            });
        	$('#Phonenumber').on('keyup', function () {
                table
                    .columns(3)
                    .search(this.value)
                    .draw();
            });
        	/* $('#From_Date').on('keyup', function () {
                table
                    .columns(1)
                    .search(this.value)
                    .draw();
            });
        	$('#To_Date').on('keyup', function () {
                table
                    .columns(1)
                    .search(this.value)
                    .draw();
            }); */
        	
        	$('#namesearch').on('keyup', function () {
                table
                    .columns(0)
                    .search(this.value)
                    .draw();
            });
        	$("#UserTypeSearch").each(function () {
                var select = $('<select style="height: 46px;"><option value=""></option></select>')
                    .appendTo($(this).empty())
                    .on('change', function () {
                        table.column(2)
                            .search($(this).val())
                            .draw();
                    });

                table.column(2).data().unique().sort().each(function (d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>')
                });
            });
        });
        }
        
        
        function usermanagement(){
      	  $.ajax({
        		type:"GET",
        		url:"/helperland/usermanagement",
        		contentType: "application/json",
        		success:function(response){
        			var result = '<table id="usermanagementdt" class="display table nowrap" cellspacing="0" style="width:100%"><thead><tr><th scope="col">User Name</th><th scope="col">Date of Registration</th><th scope="col">User Type</th><th scope="col">Phone</th><th scope="col">Postal code</th><th scope="col">Status</th><th scope="col">Approve Status</th><th scope="col">Action</th></tr></thead>';
        				result += "<tbody>";
        				 $.each(response, function(k, v) {
        					 
        					 var postalcodetext = "";
        					if(v[1] == null){
        						 postalcodetext = "";
        					 }
        					 else{
        						 postalcodetext = v[1].postalcode;
        					 }
        					
        					
        					var statusactivity = "";
        					var statustext = "";
        					var dropdownstatus = "";
        					if(v[0].is_active == 1){
        						statusactivity = "complete-button";
        						statustext = "Active";
        						dropdownstatus = "Deactivate";
        					}
        					else{
        						statusactivity = "Not-Applicable-button";
        						statustext = "Inactive";
        						dropdownstatus = "Active";
        					}
        					
        					var statusdropdown = "";
        					if(v[0].user_type_id == 2){
        						statusdropdown = '<a class="dropdown-item text-color-nav text-decoration-none" href="#" onclick="statuschangeadmin('+ v[0].user_id + ',' + v[0].is_active +')">'+dropdownstatus+'</a>';
        					}
        					else{
        						statusdropdown = '';
        					}
        					
        					var approvedoption = "";
        					var approvetext = "";
        					var approvetextcolor = "";
        					if(v[0].is_approved == 0){
        						approvetext = "NotApproved";
        						approvetextcolor = "Not-Applicable-button"
        						approvedoption = '<a class="dropdown-item text-color-nav text-decoration-none" href="#" onclick="adminapproval('+ v[0].user_id +')">Approve</a>';
        					}
        					else{
        						approvedoption = "";
        						approvetext = "Approved";
        						approvetextcolor = "complete-button"
        					}
        					
        					var roletext ="";
        					if(v[0].user_type_id==1){
        						roletext = "Admin";
        					}
        					else if(v[0].user_type_id==2){
        						roletext = "Service Provider";
        					}
        					else{
        						roletext = "Customer";
        					}
        					 
        					var createddate = v[0].created_date;
    
        					 result += "<tr>";
        					 result += '<td scope="row text-color-table number-and-km">'+v[0].first_name+' '+v[0].last_name+'</td>';
        					 result += '<td style="padding: 0px; padding-top: 13px;">';
        					 result += '<div class="col">';
        					 result += '<div class="d-flex custom-margin-table">';
        					 result += '<img src="<c:url value="/resources/images/calculator.png" />" class="calander-img">';
        					 result += '<p>'+createddate.substring(0, createddate.indexOf(" "))+'</p>';
        					 result += '</div></div>';
        					 result += '</td>';
        					 result += '<td scope="row text-color-table number-and-km">'+roletext+'</td>';
        					 result += '<td scope="row text-color-table number-and-km">'+v[0].mobile+'</td>';
        					 result += '<td>'+postalcodetext+'</td>';
        					 result += '<td><button class="'+statusactivity+' align-items-center justify-content-center custom-margin-table-two-data">'+statustext+'</button></td>';
        					 result += '<td>';
        					 result += '<button class="'+approvetextcolor+' align-items-center justify-content-center custom-margin-table-two-data">'+approvetext+'</button>';
        					 result += '</td>';
        					 result += '<td>';
        					 result += '<div class="profile-dropedown nav-btnn-img float-left">';
        					 result += '<a class="nav-link  dropdown-toggle text-decoration-none" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i>';
        					 result += '<img src="<c:url value="/resources/images/icons8-menu-vertical-30.png" />"> </a>';
        					 result += '<div class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav" aria-labelledby="navbarDropdownMenuLink-4">';
        					 result += statusdropdown;
        					 result += approvedoption;
        					 result += '<a class="dropdown-item text-color-nav text-decoration-none" href="#" onclick="adminuserdelete('+ v[0].user_id +')">Delete</a>';
        					 result += '</div></div></td></tr>';
        				}); 
        				console.log("SUCCESS: ", response);
        				 result += "</tbody>";
        				result += '</table>';
        				$("#displayusersdata").html(result);
        				usermanagementdatatablequery();
        				
        		},
        		error: function(e){
        			console.log("ERROR: ", e);
        		},
        		done: function(e){
        			console.log("Done");
        		}
        	}); 
        }
        

        $(document).on('click','#usermanagementtab',function (){
        	usermanagement();
        });
        
        
        function statuschangeadmin(uid,activestatus){
        	event.preventDefault();
      		console.log(uid + activestatus + "Hiiiiiiiiiiiiiiiiiii");
      		$.ajax({
      			type:"GET",
      			url:"/helperland/adminchangestatus/" + uid + "," + activestatus,
      			success:function(data){
      				console.log("SUCCESS: ", data);
      				 if(data == 1){
      					usermanagement();
      				}
      				else{
      					alert("Please Try again!!	!");
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
        function adminapproval(uid,activestatus){
        	event.preventDefault();
      		console.log(uid + activestatus + "Hiiiiiiiiiiiiiiiiiii");
      		$.ajax({
      			type:"GET",
      			url:"/helperland/adminapproval/" + uid,
      			success:function(data){
      				console.log("SUCCESS: ", data);
      				 if(data == 1){
      					usermanagement();
      				}
      				else{
      					alert("Please Try again!!	!");
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
        function adminuserdelete(uid,activestatus){
        	event.preventDefault();
      		console.log(uid + activestatus + "Hiiiiiiiiiiiiiiiiiii");
      		$.ajax({
      			type:"GET",
      			url:"/helperland/adminuserdelete/" + uid,
      			success:function(data){
      				console.log("SUCCESS: ", data);
      				 if(data == 1){
      					usermanagement();
      				}
      				else{
      					alert("Please Try again!!	!");
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
        
        $(document).on('click', '#realtimeservicerequest', function() {
			servicerequests();
		});
        
        window.onload = servicerequests();

        function servicerequests() {
        	$.ajax({
      			type:"GET",
      			url:"/helperland/servicerequests",
      			success:function(data){
      				console.log("SUCCESS: ", data);
      				var result = '<table id="example" class="display table nowrap" cellspacing="0" style="width:100%"><thead><tr><th scope="col">Service ID</th><th scope="col">Service date</th><th scope="col">Customer details</th><th scope="col">Service Provider</th><th scope="col">Total Amount</th><th scope="col">Status</th><th scope="col">Payment Status</th><th scope="col">Actions</th></tr></thead>';
      				result += "<tbody>";
      				 $.each(data, function(k, v) {
      					
      					var firstname = "";
						var lastname = "";
						var avatar = "";
						var avg_rating = "";
						if (v[17] != 0) {
							firstname = v[7];
							lastname = v[8];
							avatar = '<img class="img-custom-class" src="<c:url value="/resources/images/avatar-'+ v[9] +'.png" />" style="width: 50px; height: 50px;"  alt="">';
							avg_rating = '<p>Avg ratings: '+v[6]+'/5</p>';
						}
						else{
							firstname = "";
							lastname = "";
							avatar = "";
							avg_rating = "";
						}
						
						var editandrescheduledropedown = "";
						if(v[15] == "cancel" || v[15] == "Completed"){
							editandrescheduledropedown = "";
						}
						else{
							editandrescheduledropedown = '<a class="dropdown-item text-color-nav text-decoration-none" data-toggle="modal" data-target="#exampleModalCenter" href="#" onclick="editserviceRequest('+v[0]+')">Edit & Reschedule</a>';
						}
						
						var addClass = ""
						if(v[15] == "new"){
							addClass = "new-button";
						}
						else if(v[15] == "Accepted"){
							addClass = "addClass";
						}
						else if(v[15] == "cancel"){
							addClass = "Refunded-button";
						}
						else{
							addClass = "complete-button";
						}
						
						var addPaymentStatusClass = "";
						if(v[16] == "Completed"){
							addPaymentStatusClass = "complete-button";
						}
						else if(v[16] == "cancel"){
							addPaymentStatusClass = "Refunded-button";
						}
						else{
							addPaymentStatusClass = "Expired-button";
						}
      					 
      					result += "<tr>";
      					result += '<td scope="row text-color-table number-and-km">'+v[0]+'</td>';
      					result += '<td style="padding: 0px; padding-top: 13px;"><div class="col"><div class="d-flex custom-margin-table"><img src="<c:url value="/resources/images/calculator.png" />" class="calander-img"><p>'+v[1]+'</p></div>';
      					result += '<div class="d-flex"><img class="clock" src="<c:url value="/resources/images/layer-712.png" />"><p>'+v[2]+' (Total Time: '+v[3]+')</p></div></div></td>';
      					result += '<td style="padding: 0px; padding-top: 13px;"><div class="col"><div class="d-flex custom-margin-table"><p>'+v[4]+' '+v[5]+'</p></div><div class="d-flex"><img src="<c:url value="/resources/images/layer-15.png" />" style="width: 20px; height: 22px; margin-right: 7px;"><p>'+v[10]+', '+v[11]+'</p></div><p style="margin-left:25px">'+v[12]+' '+v[13]+'</p></div></td>';
      					result += "<td>";
						result += '<div class="d-flex flex-row">'
								+ avatar
								+ '<div class="col"><p class="link-text">'
								+ firstname
								+ ' '
								+ lastname
								+ avg_rating
								+ '</p></div></div></div>';
						result += "</td>";
      					result += '<td class="eurotext"><div class="d-flex flex-row custom-margin-table-two-data"><p class="euro-text">&euro;</p><p class="number-text">'+v[14]+'</p></div></td>';
      				 	result += '<td><button class="'+addClass+' align-items-center justify-content-center custom-margin-table-two-data">'+v[15]+'</button></td>';
      				 	result += '<td><button class="'+addPaymentStatusClass+' align-items-center justify-content-center custom-margin-table-two-data">'+v[16]+'</button></td>';
      				 	result += '<td><div class="profile-dropedown nav-btnn-img"><a class="nav-link  dropdown-toggle text-decoration-none" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<c:url value="/resources/images/icons8-menu-vertical-30.png" />"> </a><div class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav" aria-labelledby="navbarDropdownMenuLink-4">';
      				 	result += editandrescheduledropedown;
      				 	result += '<a class="dropdown-item text-color-nav text-decoration-none" href="#">Refund</a>';
      				 	result += '<a class="dropdown-item text-color-nav text-decoration-none" href="#">Inquiry</a>';
      				 	result += '<a class="dropdown-item text-color-nav text-decoration-none" href="#">History Log</a>';
      				 	result += '<a class="dropdown-item text-color-nav text-decoration-none" href="#">Download Invoice</a>';
      				 	result += '<a class="dropdown-item text-color-nav text-decoration-none" href="#">Other Transactions</a>';
      				 	result += '</div></div></td></tr>';
      				 }); 
      				result += "</tbody>";
    				result += '</table>';
    				$("#allservicerequest").html(result);
    				
    				servicerequestdatatable();
      			},
      			error: function(e){
      				console.log("ERROR: ", e);
      			},
      			done: function(e){
      				console.log("Done");
      			}
      		});
		}
        
        
        function editserviceRequest(srId) {
        	$.ajax({
				type : "GET",
				url : "/helperland/getServiceREquestAddress/" + srId,
				success : function(data) {
					console.log("SUCCESS: ", data);
					$("#AddressLine1").val(data.AddressLine1);
					$("#AddressLine2").val(data.AddressLine2);
					$("#Postal_Code").val(data.PostalCode);
					$("#City").val(data.City);
				},
				error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("Done");
				}
			});
        	jQuery(document).ready(function($) {
				$("#editAndRescheduleForm").submit(function(event) {
					event.preventDefault();
					editandrescheduleserviceRequest(srId);
				});
			});
		}
        
        function editandrescheduleserviceRequest(srId) {
        	$.ajax({
				type : "GET",
				url : "/helperland/editserviceRequest/" + srId + "," + $("#service_start_date").val() + "," + $("#startTime").val() + "," + $("#AddressLine1").val() + "," +$("#AddressLine2").val() + "," + $("#Postal_Code").val() + "," + $("#City").val(),
				success : function(data) {
					console.log("SUCCESS: ", data);
					servicerequests();
				},
				error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("Done");
				}
			});
		}
    </script>

</body>
</html>