<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/2.3.1/css/flag-icon.min.css"
	rel="stylesheet" />
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Javascript use dropdown -->
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="assets/css/main2.css">
<script src="assets/js/main1.js"></script>
<title>Ted Garden</title>
<link rel="icon" type="image/x-icon" href="assets/img/icon.png">

</head>

<body>
	<!-- Language Button -->
	<div class="language d-none d-sm-block mb-3">
		<div class="container d-flex">
			<div class="me-auto text ">Super Value Deals - Save more with
				coupons</div>
			<div class="dropdown ms-auto">
				<button class="btn btn-sm dropdown-toggle border-0" type="button"
					data-bs-toggle="dropdown" aria-expanded="false">
					<i class="flag-icon flag-icon-us"></i> En
				</button>
				<ul class="dropdown-menu text-center">
					<li><a class="dropdown-item" href="#"><i
							class="flag-icon flag-icon-vn me-1"></i>Vn</a></li>
					<li><a class="dropdown-item" href="#"><i
							class="flag-icon flag-icon-us me-1"></i>En</a></li>

				</ul>
			</div>
		</div>

	</div>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg mb-3 ">
		<div class="container">
			<!-- Logo -->
			<a class="navbar-brand" href="#"> <img src="assets/img/logo.png"
				alt="Logo" class="">
			</a>
			<!-- End Logo -->

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto mb-2 mb-lg-0 ">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Garden </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#">Blog</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Voucher</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Us</a></li>

				</ul>
				<div class="search-and-icons d-flex align-items-center">
					<!-- Search Form -->
					<form class="me-3 " role="search">
						<input class="form-control " type="search" placeholder="Search"
							aria-label="Search">

					</form>
					<!--End Search Form -->

					<!-- User Icon -->
					<div class="user-icons d-flex justify-content-center gap-2 ">
						<div class="wishlist icon position-relative">
							<i class="bi bi-heart"></i></i><span
								class="position-absolute top-10 start-80 translate-middle badge rounded-pill  ">1
								<span class="visually-hidden">unread messages</span>
							</span>
						</div>
						<div class="profile icon">
							<i class="bi bi-person"></i>
						</div>
						<div class="cart icon position-relative">
							<i class="bi bi-cart3"></i></i><span
								class="position-absolute top-10 start-80 translate-middle badge rounded-pill ">5
								<span class="visually-hidden">unread messages</span>
							</span>
						</div>

					</div>
					<!--End User Icon -->
				</div>

			</div>
		</div>

	</nav>

</body>
</html>