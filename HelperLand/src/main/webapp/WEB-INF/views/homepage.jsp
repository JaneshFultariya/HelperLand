<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css" />">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="icon" type="image/x-icon"
	href="<c:url value="/resources/images/white-logo-transparent-background.png" />">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet'>
<title>Halperland</title>
</head>
<body>
	<div class="header" id="topheader">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="#"> <img id="my_image"
				src="<c:url value="/resources/images/white-logo-transparent-background.png" />">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto nav-ul-margin">
					<li class="nav-item">
						<div class="nav-btn" href="#">
							<a class="nav-btn-item text-decoration-none" href="bookservice">
								Book a cleaner </a>
						</div>
					</li>
					<li class="nav-item">
						<div class="nav-btnn" href="#">
							<a class="nav-btn-item text-decoration-none" href="price">
								Price </a>
						</div>
					</li>

					<li class="nav-item">
						<div class="nav-btnn" href="#">
							<a class="nav-btn-item text-decoration-none" href="#"> Our
								Guarantee </a>
						</div>
					</li>

					<li class="nav-item">
						<div class="nav-btnn" href="#">
							<a class="nav-btn-item text-decoration-none" href="#"> Blog </a>
						</div>
					</li>
					<li class="nav-item">
						<div class="nav-btnn" href="#">
							<a class="nav-btn-item text-decoration-none" href="contactUs">
								contact us </a>
						</div>
					</li>
					<li class="nav-item" id="loginlink">
						<div class="nav-btn" href="#">
							<a class="nav-btn-item text-decoration-none" href="#" 
								data-toggle="modal" data-target="#exampleModalCenter"> login
							</a>
						</div>
					</li>
					<li class="nav-item" id="becomelink">
						<div class="nav-btn" href="#">
							<a class="nav-btn-item text-decoration-none" href="becomeapro">
								Become a cleaner </a>
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
					aria-haspopup="true" aria-expanded="false"><i
					class="fa fa-user"></i> <img
					src="<c:url value="/resources/images/forma-1-1-1.png" />"> </a>
				<div
					class="dropdown-menu dropdown-menu-right dropdown-cyan text-color-nav"
					aria-labelledby="navbarDropdownMenuLink-4">
					<span style="padding-left: 15px;">Welcome,<br>
					<strong style="padding-left: 15px;">${htmlusername }</strong></span>
					<div class="devider-line"></div>
					<c:if test="${user_type == 2 }">
									<a class="dropdown-item" href="serviceprovider">Dashboard</a>
								</c:if>
								
								<c:if test="${user_type == 3 }">
									<a class="dropdown-item" href="user">Dashboard</a>
								</c:if>
								
								<c:if test="${user_type == 1 }">
									<a class="dropdown-item text-color-nav text-decoration-none" href="admin">Dashboard</a>
								</c:if>  <a
						class="dropdown-item text-color-nav text-decoration-none"
						href="logout">Log out</a>
				</div>
			</div>
			<a class="btn" style="float: right" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#demo"> <span
				class="navbar-toggler-icon"></span>
			</a>
		</nav>

<div class="position-absolute w-100 d-flex justify-content-center"
		style="top: 10px; z-index: 100000;">
		<div
			class="alert alert-danger alert-dismissible fade show d-none w-75" id="errorMessage"
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
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" class="form-control" required
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input required
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
									data-target="#createaccountModalCenter"> Create an account
								</a></span>
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
									<input type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp" required
										name="email" placeholder="Enter email">
								</div>

								<button type="submit" class="btn btn-primary btn-lg"
									title="Send">Send</button>
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
								<h3 class="modal-title" id="exampleModalLongTitle">Create
									an account</h3>
							</div>
							<div
								class="faq-divider text-center d-flex align-items-center justify-content-center">
								<img
									src="<c:url value="/resources/images/forma-1-copy-5.png" />">
							</div>
							<form class="mx-auto" style="margin-top: 15px;" method="post"
								action="registerUser" id="createuseraccount"
								oninput='confirmpassword.setCustomValidity(confirmpassword.value != password.value ? "Passwords do not match." : "")'>
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
									<div class="row">
										<div class="col">
											<input type="text" class="form-control" required
												name="first_name" placeholder="First name">
										</div>
										<div class="col">
											<input type="text" class="form-control" required
												name="last_name" placeholder="Last name">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col">
											<input type="text" class="form-control" required name="email"
												placeholder="email">
										</div>
										<div class="col">
											<div class="input-group mb-2">
												<div class="input-group-prepend">
													<div class="input-group-text">+91</div>
												</div>
												<input type="text" class="form-control"
													id="mobile" name="mobile"
													placeholder="Mobile number" required>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col">
											<input type="password" class="form-control"
												id="password" required name="password"
												placeholder="Password">
										</div>
										<div class="col">
											<input type="password" class="form-control"
												id="exampleInputPassword2" required name="confirmpassword"
												placeholder="Confirm Password">
										</div>
									</div>
								</div>
								<div class="form-check" style="margin-left: 15px;">
									<input type="checkbox" class="form-check-input" required
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">I have read <a href="#"
										class="privercypolicy text-decoration-none forgetpassword">privercy
											policy</a></label>
								</div>
								
								<div class="mt-2 text-center mb-2" id="passwordvalidation"></div>
								<div class="mt-2 text-center mb-2" id="Phonevalidation"></div>
								
								<button type="submit" class="btn btn-primary btn-lg" 
									title="Send">Register</button>
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



		<div class="header-text">
			<h1>Lorem ipsum text</h1>
			<p class="text-md-left">
				<img
					src="<c:url value="/resources/images/forma-1-copy-10(1).svg" />"
					style="margin-right: 5px;">Lorem ipsum dolor sit amet,
				consectetur adipiscing <br> <img
					src="<c:url value="/resources/images/forma-1-copy-10(1).svg" />"
					style="margin-right: 5px;">Lorem ipsum dolor sit amet,
				consectetur adipiscing<br> <img
					src="<c:url value="/resources/images/forma-1-copy-10(1).svg" />"
					style="margin-right: 5px;">Lorem ipsum dolor sit amet,
				consectetur adipiscing
			</p>
		</div>

		<div class="main_button position-relative rounded-pill mx-auto"
			style="margin-bottom: 45px;">
			<a class="button_link  text-decoration-none text-light">Let's
				Book a Cleaner</a>
		</div>

		<div
			class="text-center container mx-auto d-flex flex-row text-image-steps justify-content-center row grid-row"
			style="padding-top: 150px;">
			<div class="col grid-col">
				<image src="<c:url value="/resources/images/forma-1-copy.png" />">
				<p>Enter your postcode</p>
			</div>
			<div class="col arr grid-col">
				<image src="<c:url value="/resources/images/step-arrow-1.png" />">
			</div>
			<div class="col grid-col">
				<image src="<c:url value="/resources/images/group-22.png" />">
				<p>Select your plan</p>
			</div>
			<div class="col grid-col arr">
				<image
					src="<c:url value="/resources/images/step-arrow-1-copy.png" />">
			</div>
			<div class="col grid-col">
				<image src="<c:url value="/resources/images/forma-1-1.png" />">
				<p>Pay securely online</p>
			</div>
			<div class="col grid-col arr">
				<image
					src="<c:url value="/resources/images/step-arrow-1-copy-2.png" />">
			</div>
			<div class="col grid-col">
				<image src="<c:url value="/resources/images/forma-1.png" />">
				<p>Enjoy amazing service</p>
			</div>
		</div>

		<div class="text-center two-images">
			<img src="<c:url value="/resources/images/group-18_5.png" />"
				class="img-fluid" alt="Responsive image">
		</div>

	</div>

	<div class="offcanvas offcanvas-end" id="demo">
		<div class="offcanvas-header">
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>

		<div class="offcanvas-body">

			<ul class="side-nav">
				<li class="side-items"><a
					class="side-link text-decoration-none" data-bs-dismiss="offcanvas" href="bookservice">Book
						now</a></li>
				<li class="side-items"><a
					class="side-link text-decoration-none" data-bs-dismiss="offcanvas" href="price">Prices &
						services</a></li>
				<li class="side-items"><a
					class="side-link text-decoration-none" data-bs-dismiss="offcanvas" href="#">Warranty</a></li>
				<li class="side-items"><a
					class="side-link text-decoration-none" data-bs-dismiss="offcanvas" href="#">Blog</a></li>
				<li class="side-items"><a
					class="side-link text-decoration-none" data-bs-dismiss="offcanvas" href="contactUs">Contact</a>
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

	<section id="why-helperland">
		<div class="container-fluid home-container-2 container">
			<div class="col-md-12 text-center"
				style="margin-top: 50px; margin-bottom: 50px;">
				<h1 class="text-40 font-weight-bold whyhl-head">Why helperland</h1>
			</div>
			<div
				class="row whyhl-row justify-content-center align-items-start why-helperland-content">
				<div class="col whyhl-col text-center first-img p-0">
					<img src="<c:url value="/resources/images/helper-img-1.png" />"
						style="margin-top: -25px;" alt="">
					<div
						class="d-flex whyhl-content flex-column justify-content-between align-items-center">
						<h4>Experience & Vetted Professionals</h4>
						<p>dominate the industry in scale and scope with an adaptable,
							extensive network that consistently delivers exceptional results.</p>
					</div>
				</div>
				<div class="col whyhl-col text-center why-helperland-content-mid">
					<img src="<c:url value="/resources/images/group-23.png" />" alt="">
					<div
						class="d-flex whyhl-content flex-column justify-content-between align-items-center">
						<h4 style="margin-top: 30px;">Secure Online Payment</h4>
						<p>Payment is processed securely online. Customers can safely
							pay online and manage the booking.</p>
					</div>
				</div>
				<div class="col whyhl-col text-center p-0">
					<img src="<c:url value="/resources/images/group-24.png" />" alt="">
					<div
						class="d-flex flex-column whyhl-col justify-content-between align-items-center">
						<h4 style="margin-top: 30px;">Dedicated Customer Service</h4>
						<p>to our customers and are guided in all we do by their
							needs. The team is always happy to support you and offer all the
							information.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="spacing  position-relative">
		<img src="<c:url value="/resources/images/blog-left-bg.png" />"
			class="position-absolute" style="left: 0;"> <img
			src="<c:url value="/resources/images/blog-right-bg.png" />"
			class="position-absolute" style="right: 0;">

		<div class="Bloger" id="thirdheader">
			<!-- <img src="images/blog-left-bg.png" class="float-left img-fluid" alt="Responsive image">
    <img src="images/blog-right-bg.png" class="float-right img-fluid" alt="Responsive image"> -->

			<div class="container">
				<div class="row text-image-above-blog">
					<div class="col-6 p-0 order-1">
						<h2>
							Lorem ipsum dolor sit amet, <br>consectetur
						</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Donec nisi sapien, suscipit ut accumsan vitae, pulvinar ac
							libero. Aliquam erat volutpat. Nullam quis ex odio. Nam bibendum
							cursus purus, vel efficitur urna finibus vitae. Nullam finibus
							aliquet pharetra. Morbi in sem dolor. Integer pretium hendrerit
							ante quis vehicula. Mauris consequat ornare enim, sed lobortis
							quam ultrices sed.</p>
					</div>
					<div class="col-6 p-0 order-2">
						<img src="<c:url value="/resources/images/group-36.png" />"
							class="img-fluid float-right" alt="Responsive image">
					</div>
				</div>
			</div>

			<div class="text-center justify-content-left"
				style="margin-top: 30px;">
				<h1>Our Blog</h1>
			</div>
		</div>

		<div
			class="card-deck card-deck-class container mx-auto our-blog-card row"
			style="margin-top: 15px;">
			<div class="extra-div card">
				<img class="card-img-top"
					src="<c:url value="/resources/images/group-28.png" />"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title mb-1">Lorem ipsum dolor sit amet</h5>
					<p class="card-text">
						<small class="text-muted">January 28, 2019</small>
					</p>
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Sed fermentum metus pulvinar aliquet.</p>

				</div>
			</div>
			<div class="extra-div card">
				<img class="card-img-top"
					src="<c:url value="/resources/images/group-29.png" />"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title mb-1">Lorem ipsum dolor sit amet</h5>
					<p class="card-text">
						<small class="text-muted">January 28, 2019</small>
					</p>
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Sed fermentum metus pulvinar aliquet.</p>

				</div>
			</div>
			<div class="extra-div card">
				<img class="card-img-top"
					src="<c:url value="/resources/images/group-30.png" />"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title mb-1">Lorem ipsum dolor sit amet</h5>
					<p class="card-text">
						<small class="text-muted">January 28, 2019</small>
					</p>
					<p class="card-text">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Sed fermentum metus pulvinar aliquet.</p>

				</div>
			</div>
		</div>
		</div>
	</section>

	<section class="spacing background">
		<div class="Customersay-part" id="forthheader">
			<div class="text-center" style="margin-top: 30px;">
				<h1>What Our Customers Say</h1>
			</div>
			<div class="card-deck container mx-auto" style="margin-top: 50px;">
				<div class="extra-div card">
					<div class="card-body">
						<div class="message justify-content-right"
							style="float: right; margin-top: 15px;">
							<img src="<c:url value="/resources/images/message.png" />">
						</div>
						<div class="d-flex flex-row" style="margin-top: 15px;">
							<img src="<c:url value="/resources/images/group-31.png" />">
							<h5 style="margin-top: 10px; padding-left: 18px;">
								Lary Watson<br> <small class="text-muted">Manchester</small>
							</h5>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Sed fermentum metus pulvinar aliquet consequat. Praesent nec
							malesuada nibh.</p>
						<p>Nullam et metus congue, auctor augue sit amet, consectetur
							tortor.</p>

					</div>
				</div>
				<div class="extra-div card">
					<div class="card-body">
						<div class="message justify-content-right"
							style="float: right; margin-top: 15px;">
							<img src="<c:url value="/resources/images/message.png" />">
						</div>
						<div class="d-flex flex-row" style="margin-top: 15px;">
							<img src="<c:url value="/resources/images/group-32.png" />">
							<h5 style="margin-top: 10px; padding-left: 18px;">
								John Smith<br> <small class="text-muted">Manchester</small>
							</h5>
						</div>
						<div class="box-text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Sed fermentum metus pulvinar aliquet consequat. Praesent nec
								malesuada nibh.</p>
							<p>Nullam et metus congue, auctor augue sit amet, consectetur
								tortor.</p>
						</div>

					</div>
				</div>
				<div class="extra-div card">
					<div class="card-body">
						<div class="message justify-content-right"
							style="float: right; margin-top: 15px;">
							<img src="<c:url value="/resources/images/message.png" />">
						</div>
						<div class="d-flex flex-row" style="margin-top: 15px;">
							<img src="<c:url value="/resources/images/group-33.png" />">
							<h5 style="margin-top: 10px; padding-left: 18px;">
								Lars Johnson<br> <small class="text-muted">Manchester</small>
							</h5>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Sed fermentum metus pulvinar aliquet consequat. Praesent nec
							malesuada nibh.</p>
						<p>Nullam et metus congue, auctor augue sit amet, consectetur
							tortor.</p>

					</div>
				</div>
			</div>

			<div id="get-news-letter">
				<div class="align-items-center" style="padding-top: 47.67px;">

					<div
						class="news-letter-news-letters-email-submit d-flex flex-column">
						<div
							class="news-letter-news-letters text-center text-up-news-letter">
							<h5>GET OUR NEWSLETTER</h5>
						</div>
						<div
							class="email-submit-btn d-flex flex-row justify-content-center"
							style="margin-top: 15px; margin-bottom: 30px;">
							<input type="email" class="text-md-left"
								style="border-radius: 20px;" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter email">
							<button class="btn">Submit</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


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
			<p class="m-0 text-center">©2018 Helperland. All rights
				reserved. Terms and Conditions | Privacy Policy</p>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<script>
		let temp =
	<%=request.getAttribute("notfoundalert")%>
		if (temp !== null) {
			alert("Please Login !!!");
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
	
	$("#errorMessage").fadeTo(2000, 500).slideUp(500, function(){
	    $("#errorMessage").slideUp(500);
	});
	</script>



</body>
</html>