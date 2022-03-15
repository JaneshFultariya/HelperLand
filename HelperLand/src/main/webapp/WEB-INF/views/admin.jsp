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
                    <div class="col">
                        <select id="inputState" style="height: 46px;" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="">
                <div class="row">

                    <div class="col" style="max-width: 200px;">
                        <select id="inputState" style="height: 46px;" class="form-control">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="col" style="max-width: 150px;">
                        <div class="form-check">
                            <input class="form-check-input" style="margin-top: 15px;" type="checkbox" id="gridCheck1">
                            <label class="form-check-label" style="margin-top: 12px;" for="gridCheck1">
                                Has Issue
                            </label>
                        </div>
                    </div>
                    <div class="col" style="max-width: 140px;">
                        <input type="text" style="height: 46px;" class="form-control" placeholder="From Date">
                    </div>
                    <div class="col" style="max-width: 140px;">
                        <input type="text" style="height: 46px;" class="form-control" placeholder="To Date">
                    </div>
                    <div class="col-auto">
                        <button type="submit" style="height: 46px;" class="btn btn-primary mb-2">Serach</button>
                    </div>
                    <div class="col-auto">
                        <button type="submit" style="height: 46px;" class="btn btn-primary mb-2">clear</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
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
                    <div class="col">
                        <!-- <input type="date" class="link-text form-control" style="width: 150px; margin-right: 20px;"
													id="startdate_to" placeholder="From Date"> -->
						<input type="text" id="From_Date" style="height: 46px;" placeholder="From Date" onfocus="(this.type='date')" onblur="(this.type='text')">
                    </div>
                    <div class="col">
                        <input type="text" id="To_Date" style="height: 46px;" placeholder="To Date" onfocus="(this.type='date')" onblur="(this.type='text')">
                    </div>
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
                        <form>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Date</label>
                                    <input type="email" class="form-control" id="inputEmail4" placeholder="30/09/2021">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputState">Time</label>
                                    <select id="inputState" class="form-control">
                                        <option selected>12:30</option>
                                        <option>1:00</option>
                                        <option>1:30</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <span>Service Address</span>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Street name</label>
                                    <input type="email" class="form-control" id="inputEmail4" placeholder="Street name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">House number</label>
                                    <input type="email" class="form-control" id="inputEmail4" placeholder="111">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">Postal Code</label>
                                    <input type="text" class="form-control" id="inputCity" placeholder="Postal Code">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputState">City</label>
                                    <select id="inputState" class="form-control">
                                        <option selected>Choose</option>
                                        <option>Berlin</option>
                                        <option>Hamburg</option>
                                        <option>München</option>
                                        <option>Köln</option>
                                        <option>Frankfurt am Main</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <span>Invoice Address</span>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Street name</label>
                                    <input type="email" class="form-control" id="inputEmail4" placeholder="Street name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">House number</label>
                                    <input type="email" class="form-control" id="inputEmail4" placeholder="111">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputCity">Postal Code</label>
                                    <input type="text" class="form-control" id="inputCity" placeholder="Postal Code">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputState">City</label>
                                    <select id="inputState" class="form-control">
                                        <option selected>Choose</option>
                                        <option>Berlin</option>
                                        <option>Hamburg</option>
                                        <option>München</option>
                                        <option>Köln</option>
                                        <option>Frankfurt am Main</option>
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
        $(document).ready(function () {
            $('#example').DataTable({

                responsive: true,
                "dom": '<"top">rt<"bottom"lip><"clear">',
                "aaSorting": [],
                columnDefs: [{
                    orderable: false,
                    targets: [4, 5, 6, 8, 9],
                }]
            });
        });
        
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
        	$('#From_Date').on('keyup', function () {
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
            });
        	
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
        				/* spservicehistorydatatable();  */
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
      				var result = '<table id="example" class="display table nowrap" cellspacing="0" style="width:100%"><thead><tr><th scope="col">Service ID</th><th scope="col">Service date</th><th scope="col">Customer details</th><th scope="col">Service Provider</th><th scope="col">Gross Amount</th><th scope="col">net Amount</th><th scope="col">Discount</th><th scope="col">Status</th><th scope="col">Payment Status</th><th scope="col">Actions</th></tr></thead>';
      				result += "<tbody>";
      				$.each(response, function(k, v) {
      					result += "<tr>";
      					result += '<td scope="row text-color-table number-and-km">'+v[0].service_req_id+'</td>';
      					result += "<tr>";
      					result += "<tr>";
      					result += "<tr>";
      					result += "<tr>";
      					
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

</body>
</html>