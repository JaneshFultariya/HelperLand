<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/contactUs.css" />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="icon" type="image/x-icon"
	href="<c:url value="/resources/images/white-logo-transparent-background.png" />">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet'>
<title>Contact Us</title>
</head>
<body>
	<div class="header" id="topheader">
		<nav class="navbar navbar-expand-lg navbar-light"
			style="background-color: #525252;">
			<a class="navbar-brand" href="homepage "> <img
				src="<c:url value="/resources/images/white-logo-transparent-background.png" />"
				style="width: 73px; height: 54px;">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<div class="nav-btn-blue">
							<a class="nav-link" href="bookservice ">Book now</a>
						</div>
					</li>
					<li class="nav-item">
						<div class="nav-btn">
							<a class="nav-link" href="price ">Prices & services</a>
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
							<a class="nav-link" href="contactUs ">Contact</a>
						</div>
					</li>
					<li class="nav-item" id="loginlink">
						<div class="nav-btn-blue">
							<a class="nav-link" href="#" data-toggle="modal"
								data-target="#exampleModalCenter">Login</a>
						</div>
					</li>
					<li class="nav-item" id="becomelink">
						<div class="nav-btn-blue">
							<a class="nav-link" href="becomeapro ">Become a Helper</a>
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
					<div class="devider-line"></div>
					<a class="dropdown-item text-color-nav text-decoration-none"
						href="user">My Dashboard</a>  <a
						class="dropdown-item text-color-nav text-decoration-none"
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
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>

		<div class="offcanvas-body">

			<ul class="side-nav">
				<li class="side-items"><a
					class="side-link text-decoration-none" href="bookservice ">Book
						now</a></li>
				<li class="side-items"><a
					class="side-link text-decoration-none" href="price">Prices &
						services</a></li>
				<li class="side-items"><a
					class="side-link text-decoration-none" href="#">Warranty</a></li>
				<li class="side-items"><a
					class="side-link text-decoration-none" href="#">Blog</a></li>
				<li class="side-items"><a
					class="side-link text-decoration-none" href="contactUs ">Contact</a>
				</li>
				<li class="side-items" id="offcanvasLogin"><a
					class="side-link text-decoration-none" data-toggle="modal" data-bs-dismiss="offcanvas" 
					data-target="#exampleModalCenter" href="#">Login</a></li>
				<li class="side-items" id="offcanvasBecomeapro"><a 
					class="side-link text-decoration-none" data-bs-dismiss="offcanvas" href="becomeapro">Become
						a cleaner</a></li>
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



	<section id="banner">
		<img class="img-fluid w-100"
			src="<c:url value="/resources/images/group-16_2.png" />" />
	</section>

	<section id="model">


		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered  login-model"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Login to
							your account</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="login" method="post">
							<%-- <div
								class="alert alert-danger alert-dismissible fade show d-none "
								${displayError } role="alert">
								${error }
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
							<div
								class="alert alert-success alert-dismissible fade show d-none "
								${displaySuccess } role="alert">
								${success }
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div> --%>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Remember me</label>
							</div>
							<button type="submit" class="btn btn-primary btn-lg"
								title="Login">Login</button>
						</form>
						<div class="text-center">
							<a class="forgetpassword text-decoration-none" href="#"
								data-toggle="modal" data-dismiss="modal"
								data-target="#forgetpasswordModalCenter">Forget password?</a>
						</div>

						<div class="text-center">
							<span>Don't have an account?<a
								class="forgetpassword text-decoration-none" href="#"
								data-toggle="modal" data-dismiss="modal"
								data-target="#createaccountModalCenter"> Create an account </a></span>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="modal fade" id="forgetpasswordModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered forgetpasswordmodel"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Modal
							title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					<form action="forgetpassword" method="post">
					<%-- <div class="alert alert-danger alert-dismissible fade show d-none "
				${displayError } role="alert">
				${error }
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-success alert-dismissible fade show d-none "
				${displaySuccess } role="alert">
				${success }
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div> --%>
						<div class="form-group">
							<input type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" required name="email" placeholder="Enter email">
						</div>

						<button type="submit" class="btn btn-primary btn-lg" title="Send">Send</button>
</form>
						<div class="text-center">
							<a class="forgetpassword text-decoration-none" href="#"
								data-toggle="modal" data-dismiss="modal"
								data-target="#exampleModalCenter">Login</a>
						</div>
					</div>
					<div></div>

				</div>
			</div>
		</div>

		<div class="modal fade" id="createaccountModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered createaccountmodal"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h3 class="modal-title" id="exampleModalLongTitle">Create an
								account</h3>
						</div>
						<div
							class="faq-divider text-center d-flex align-items-center justify-content-center">
							<img
								src="<c:url value="/resources/images/forma-1-copy-5.png" />">
						</div>
						<form class="mx-auto" style="margin-top: 15px;" method="post" action="registerUser" id="createuseraccount"
						oninput='confirmpassword.setCustomValidity(confirmpassword.value != password.value ? "Passwords do not match." : "")'
						>
						<%-- <div class="alert alert-danger alert-dismissible fade show d-none "
				${displayError } role="alert">
				${error }
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-success alert-dismissible fade show d-none "
				${displaySuccess } role="alert">
				${success }
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div> --%>
							<div class="form-group">
								<div class="row">
									<div class="col">
										<input type="text" class="form-control" required name="first_name"
											placeholder="First name">
									</div>
									<div class="col">
										<input type="text" class="form-control" required name="last_name"
											placeholder="Last name">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col">
										<input type="text" class="form-control" required name="email" placeholder="email">
									</div>
									<div class="col">
										<div class="input-group mb-2">
											<div class="input-group-prepend">
												<div class="input-group-text">+91</div>
											</div>
											<input type="text" class="form-control"
												id="mobile"  name="mobile" placeholder="Phone number">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col">
										<input type="password" class="form-control" id="password" required name="password" placeholder="Password">
									</div>
									<div class="col">
										<input type="password" class="form-control" id="exampleInputPassword2" required name="confirmpassword"
											placeholder="Confirm Password">
									</div>
								</div>
							</div>
							<div class="mt-2 text-center mb-2" id="passwordvalidation"></div>
								<div class="mt-2 text-center mb-2" id="Phonevalidation"></div>
							<div class="form-check" style="margin-left: 15px;">
								<input type="checkbox" class="form-check-input" required
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">I have read <a href="#"
									class="privercypolicy text-decoration-none forgetpassword">privercy
										policy</a></label>
							</div>
							<button type="submit" class="btn btn-primary btn-lg" title="Send">Register</button>
							<div class="text-center">
								<span>already register? <a
									class="forgetpassword text-decoration-none" href="#"
									data-toggle="modal" data-dismiss="modal"
									data-target="#exampleModalCenter">Login</a></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


	</section>

	<section id="contactUs">
		<div class="text-center" style="margin-top: 31px;">
			<h1 style="color: #4F4F4F;">Contact us</h1>
		</div>
		<div
			class="faq-divider text-center d-flex align-items-center justify-content-center">
			<img
				src="<c:url value="/resources/images/forma-1-copy-5.png" />
            ">
		</div>

		<div class="con_logo d-flex align-items-center justify-content-center">
			<div
				class="innerlogo d-flex flex-column align-items-center justify-content-start">
				<div class="logo">
					<img
						src="<c:url value="/resources/images/forma-1_2.png" />
                    ">
				</div>
				<div class="logos_content">
					<p class="mb-0 text-center">
						1111 Lorem ipsum text 100,<br>Lorem ipsum AB
					</p>
				</div>
			</div>
			<div
				class="innerlogo d-flex flex-column align-items-center justify-content-start">
				<div class="logo">
					<img
						src="<c:url value="/resources/images/phone-call.png" />
                    ">
				</div>
				<div class="logos_content">
					<p class="mb-0 text-center">+49 (40) 123 56 7890</p>
					<p class="mb-0 text-center">+49 (40) 987 56 0000</p>
				</div>
			</div>
			<div
				class="innerlogo d-flex flex-column align-items-center justify-content-start mb-0">
				<div class="logo">
					<img
						src="<c:url value="/resources/images/mail.png" />
                    ">
				</div>
				<div class="logos_content">
					<p class="mb-0 text-center">
						info@helperland.com <br> &nbsp
					</p>
				</div>
			</div>
		</div>

		<div class="deviderline  mx-auto"></div>
	</section>
	<div class="container get-in-touch-form">
		<div class="text-center">
			<h3>Get in touch with us</h3>
		</div>
		<form class="mx-auto" method="post" action="contactUs" id="contactusformvalidation" enctype="multipart/form-data">
			<div class="alert alert-danger alert-dismissible fade show d-none "
				${displayError } role="alert">
				${error }
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-success alert-dismissible fade show d-none " id="successMessage"
				${displaySuccess } role="alert">
				${success }
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<input type="text" required name="firstname" path="firstname"
							placeholder="First name" class="form-control">
					</div>
					<div class="col">
						<input type="text" name="lastname" placeholder="Last name"
							class="form-control">
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col">
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<div class="input-group-text">+91</div>
							</div>
							<input type="text" required name="phone_number" id="phone_number"
								placeholder="Mobile number" class=" form-control">
						</div>
					</div>
					<div class="col">
						<input type="email" required name="email"
							placeholder="Email address" class="form-control">
					</div>
				</div>
			</div>

			<div class="form-group">
				<select class="form-control" id="exampleFormControlSelect1" required
					aria-label="Default select" name="subject_type">
					<option value="general">General</option>
					<option value="inquiry">Inquiry</option>
					<option value="renewal">renewal</option>
					<option value="revocation">revocation</option>
				</select>
			</div>

			<div class="form-group">
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" name="message" placeholder="Message"></textarea>
			</div>
			<div class="form-group" id="fileUpd">
    <label for="exampleFormControlFile1">Example file input</label>
    <input type="file" class="form-control-file" name="file" id="exampleFormControlFile1">
  </div>
			<div class="mt-2 text-center mb-2" id="Phonevalidationcontact"></div>
			<div class="container text-center">
				<button type="submit"
					class="submit_btn rounded-pill text-white main_button">
					Submit</button>
			</div>
			<input type="hidden" name="created_on" id="created_on"> <input
				type="hidden" name="is_deleted" value="0">
		</form>

	</div>


	<section id="map">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3671.698050238408!2d72.49824711566968!3d23.034856384946902!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e8352e403437b%3A0xdc9d4dae36889fb9!2sTatvaSoft!5e0!3m2!1sen!2sin!4v1641377683077!5m2!1sen!2sin"
			width="100%" height="450" style="border: 0;" allowfullscreen=""
			loading="lazy"></iframe>
	</section>


	<section id="get-news-letter">
		<div class="align-items-center" style="padding-top: 47.67px;">

			<div class="news-letter-news-letters-email-submit d-flex flex-column">
				<div class="news-letter-news-letters text-center"
					style="margin-top: 45px; margin-left: -15px;">
					<h5>GET OUR NEWSLETTER</h5>
				</div>
				<div class="email-submit-btn d-flex flex-row justify-content-center"
					style="margin-top: 15px; margin-bottom: 30px;">
					<input type="email" class="text-md-left"
						style="border-radius: 20px;" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter email">
					<button class="btn">Submit</button>
				</div>
			</div>
		</div>
	</section>
	
	<a class="text-decoration-none" id="backtoTopbutton"></a>

	<div class="footer_section w-100" style="margin-top: 53px;">
		<div
			class="footer_main d-flex justify-content-around align-items-center">
			<div class="footer_left">
				<img
					src="<c:url value="/resources/images/white-logo-transparent-background.png" />
                "
					alt="" height="78" width="106">
			</div>
			<div class="footer_mid">
				<ul class="d-flex p-0 text-center">
					<li><a href="homepage " class="text-decoration-none">HOME</a>
					</li>
					<li><a href="aboutus " class="text-decoration-none">ABOUT</a>
					</li>
					<li><a href="" class="text-decoration-none">TESTIMONIAL</a></li>
					<li><a href="faq " class="text-decoration-none">FAQS</a></li>
					<li><a href="" class="text-decoration-none">INSURANCE
							POLICY</a></li>
					<li><a href="" class="text-decoration-none">IMPRESSUM</a></li>
				</ul>
			</div>
			<div class="footer_right d-flex">
				<a class="text-decoration-none"
					href="https://www.facebook.com/helperDE/"> <svg
						xmlns="http://www.w3.org/2000/svg" width="9" height="18">
                    <path fill-rule="evenodd" fill="#CCC"
							d="M1.947 3.48v2.481H0v3.033h1.947V18.1h4.001V8.995h2.685S8.885 7.541 9.7 5.95H5.963V3.876c0-.31.437-.728.868-.728H9.11V.9H6.46C1.848.9 1.947 3.27 1.947 3.48z" />
                </svg>
				</a> <a class="text-decoration-none"
					href="https://www.instagram.com/helperlandde/"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                    <path fill-rule="evenodd" fill="#CCC"
							d="M14.48 20H5.519A5.524 5.524 0 0 1 0 14.482V5.52C0 2.477 2.475.2 5.519.2h8.961c3.043 0 5.519 2.277 5.519 5.32v8.962A5.525 5.525 0 0 1 14.48 20zm3.744-5.518V5.52a3.748 3.748 0 0 0-3.744-3.744H5.519A3.749 3.749 0 0 0 1.774 5.52v8.962a3.749 3.749 0 0 0 3.745 3.744h8.961a3.748 3.748 0 0 0 3.744-3.744zm-2.855-8.536c-.099 0-.678-.14-.92-.381-.242-.243.221-.578.221-.921 0-.342-.463-.678-.221-.92.242-.242.821-.381.92-.381.343 0 1.111.139.92.381.242.242.381.578.381.92 0 .342-.139.678-.381.921.171.241-.577.381-.92.381zm-5.37 9.208c-2.841 0-5.153-2.312-5.153-5.054 0-2.941 2.312-5.252 5.153-5.252 2.842 0 5.153 2.311 5.153 5.252 0 2.742-2.311 5.054-5.153 5.054zm0-8.532c-1.863 0-3.379 1.516-3.379 3.478 0 1.764 1.516 3.28 3.379 3.28s3.379-1.516 3.379-3.28c0-1.962-1.516-3.478-3.379-3.478z" />
                </svg>
				</a>
			</div>
		</div>
		<div
			class="footer_end d-flex align-items-center justify-content-center">
			<p class="m-0 text-center">
				©2018 Helperland. All rights reserved. <a
					class="termsandcon text-decoration-none" href="#">Terms and
					Conditions </a>| <a class="termsandcon text-decoration-none" href="#">Privacy
					Policy</a>
			</p>
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

	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		
		
		<script src="<c:url value="/resources/js/jquery.js" />"></script>
		<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
		
		
		<script>
		function matchPassword() {  
			  var pw1 = document.getElementById("password");  
			  var pw2 = document.getElementById("confirmpassword");  
			  if(pw1 != pw2)  
			  {   
			    alert("Passwords did not match");  
			  } else {  
			    alert("Password created successfully");  
			  }  
			}  
		</script>
		
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
			$("#offcanvasLogin").css("display", "block");
			$("#offcanvasBecomeapro").css("display", "block");
			$("#offcanvasDashboard").css("display", "none");
			$("#offcanvasLogout").css("display", "none");
			console.log("hiiiiiiiiiiiiiiiiiii");
		}
		else{
			$("#notificon").addClass( "d-flex" );
			$("#notificon").css("display", "block");
			$("#profilepic").css("display", "block");
			$("#loginlink").css("display", "none");
			$("#becomelink").css("display", "none");
			$("#offcanvasLogin").css("display", "none");
			$("#offcanvasBecomeapro").css("display", "none");
			$("#offcanvasDashboard").css("display", "block");
			$("#offcanvasLogout").css("display", "block");
			$('#my_image').css("width", "73px");
			$('#my_image').css("height", "54px"); 
			console.log("hiiiiiiiiiiiiiiiiiii");
	 		
		}
		
		$(document).ready(function() {
			$("#password").on('keyup', function() {
				var password = $("#password").val();
				var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
				if(!regularExpression.test(password)){
					$('#passwordvalidation').html("Password must be in length 6-14<br>Should contain atleast one uppercase letter, lowercase letter, number and special character.<br><hr>").css("color", "red");
				}
				else{
					$('#passwordvalidation').html("Password strength : Good<br><hr>").css("color", "green");
				}
				
			});
			$("#mobile").on('keyup', function() {
				var a = document.forms["createuseraccount"]["mobile"].value;
				var filter = /[0-9]{10}/;
				if (!filter.test(a)) {
					$('#Phonevalidation').html("Enter Correct Phone number").css("color", "red");
				}
				else {
					$('#Phonevalidation').html("");
				}
			});
			$("#phone_number").on('keyup', function() {
				var a = document.forms["contactusformvalidation"]["phone_number"].value;
				var filter = /[0-9]{10}/;
				if (!filter.test(a)) {
					$('#Phonevalidationcontact').html("Enter Correct Phone number").css("color", "red");
				}
				else {
					$('#Phonevalidationcontact').html("");
				}
			});
		});
		
		
		$("#createuseraccount").submit(function(event) {
			var password = document.forms["createuseraccount"]["password"].value;
			var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,14}$/;
			var a = document.forms["createuseraccount"]["mobile"].value;
			var filter = /[0-9]{10}/;
			if(!regularExpression.test(password) || !filter.test(a)){
				return false;
			}
			else{
				return true;
			}
		});
		$("#contactusformvalidation").submit(function(event) {
			var a = document.forms["contactusformvalidation"]["phone_number"].value;
			var filter = /[0-9]{10}/;
			if(!filter.test(a)){
				return false;
			}
			else{
				return true;
			}
		});
		
		$("#errorMessage").fadeTo(2000, 500).slideUp(500, function(){
		    $("#errorMessage").slideUp(500);
		});
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