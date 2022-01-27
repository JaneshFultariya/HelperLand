<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/pricestyle.css" />">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
    <title>AboutUs</title>
</head>
<body>
    <div class="header" id="topheader">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #525252;">
            <a class="navbar-brand" href="homepage">
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
                            <a class="nav-link" href="price">Prices & services</a>
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
                            <a class="nav-link" href="contactUs">Contact</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="nav-btn-blue">
                            <a class="nav-link" href="#">Login</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="nav-btn-blue">
                            <a class="nav-link" href="becomeapro">Become a Helper</a>
                        </div>
                    </li>
                </ul>
            </div>
            <a class="" style="float:right" type="button" data-bs-toggle="offcanvas" data-bs-target="#demo">
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
              <a class="side-link text-decoration-none" href="price">Prices & services</a>
            </li>
            <li class="side-items">
              <a class="side-link text-decoration-none" href="#">Warranty</a>
            </li>
            <li class="side-items">
              <a class="side-link text-decoration-none" href="#">Blog</a>
            </li>
            <li class="side-items">
              <a class="side-link text-decoration-none" href="contactUs">Contact</a>
            </li>
            <li class="side-items">
              <a class="side-link text-decoration-none" data-toggle="modal"
              data-target="#exampleModalCenter" href="#">Login</a>
            </li>
            <li class="side-items">
              <a class="side-link text-decoration-none" href="becomeapro">Become a cleaner</a>
            </li>
          </ul>
    
        </div>
      </div>


    <section id="banner">
        <img class="img-fluid w-100" src="<c:url value="/resources/images/hero-banner-img.png" />" />
    </section>

    <section id="A-Few-words-about-us">
        <div class="text-center" style="margin-top: 31px;">
            <h1 style="color: #4F4F4F;">A Few words about us</h1>
        </div>
        <div class="faq-divider text-center d-flex align-items-center justify-content-center">
            <img src="<c:url value="/resources/images/forma-1-copy-5.png" />">
        </div>
        <div class="text-center container" >
            <p>We are providers of professional home cleaning services, offering hourly based house cleaning options, which mean that you don’t have to fret about getting your house cleaned anymore. We will handle everything for you, so that you can focus on spending your precious time with your family members.</p>
            <p>We have a number of experienced cleaners to help you make cleaning out or shifting your home an easy affair.</p>
        </div>
    </section>

    <section id="Our-Story">
        <div class="text-center" style="margin-top: 39.67px;">
            <h1 style="color: #4F4F4F;">Our Story</h1>
        </div>
        <div class="faq-divider text-center d-flex align-items-center justify-content-center">
            <img src="<c:url value="/resources/images/forma-1-copy-5.png" />">
        </div>
        <div class="text-center container">
            <p>A cleaner is a type of industrial or domestic worker who cleans homes or commercial premises for payment. Cleaners may specialise in cleaning particular things or places, such as window cleaners. Cleaners often work when the people who otherwise occupy the space are not around. They may clean offices at night or houses during the workday.</p>
        </div>
    </section>


    <section id="get-news-letter">
        <div class="align-items-center" style="padding-top: 47.67px;">
            
            <div class="news-letter-news-letters-email-submit d-flex flex-column">
                <div class="news-letter-news-letters text-center" style="margin-top: 45px; margin-left: -15px;">
                    <h5>GET OUR NEWSLETTER</h5>
                </div>
                <div class="email-submit-btn d-flex flex-row justify-content-center" style="margin-top: 15px; margin-bottom: 30px;">
                    <input type="email" class="text-md-left" style="border-radius: 20px;" id="exampleInputEmail1"
                        aria-describedby="emailHelp" placeholder="Enter email">
                    <button class="btn">Submit</button>
                </div>
            </div>
        </div>
    </section>

    
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
                        <a href="aboutus" class="text-decoration-none">ABOUT</a>
                    </li>
                    <li>
                        <a href="" class="text-decoration-none">TESTIMONIAL</a>
                    </li>
                    <li>
                        <a href="faq" class="text-decoration-none">FAQS</a>
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

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    

</body>
</html>