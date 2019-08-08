<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="bootstrap-4.3.1/css/bootstrap.css">
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<link rel="stylesheet" href="css/styles.css">
<script src="jquery/jquery-3.4.1.js"></script>
<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
<script src="js/codes.js"></script>
<title>Mon Compte</title>
</head>


<body>
	<!-- ENTETE HEADER -->

		<%@ include file="header.jsp"%>


	<!-- NAV -->
	<div id="container">

		<!-- CONTENT -->
		<div id="welcome">
			<section class="shadow">
				<div class="container-fluid" id="searchheader">
					<div class="row">
						<div class="col-lg-12 my-auto bigfont text-center">Bonjour
							[PRENOM], voici ta page personnelle!</div>
					</div>
				</div>
			</section>
		</div>

		<section class="shadow">


			<div class="row">
				<div class="col-lg-12">
					<div class="row" id="personnel">
						<div class="col-lg-12">
							<h2>Personnel</h2>
						</div>
					</div>
					<div class="row" id="showData">
						<div class="col-lg-12">
							<div>
								<header>Ton profil</header>
								<section>
									<div class="col-lg-12 form-group">

										<div class="row">
											<div class="col-lg-1">
												<span>Mme/M</span>
											</div>
											<div class="col-lg-2">
												<span>Ton nom</span>
											</div>
											<div class="col-lg-2">
												<span>Ton prenom:</span>
											</div>
											<div class="col-lg-3">
												<span>Email@youremail.com</label>
											</div>
											<div class="col-lg-2">
												<span>123456789</span>
											</div>
											<div class="col-lg-2 text-right">
												<button type="button" class="btn btn-info" data-toggle="modal" data-target="#dataModal">
														 Modification des données
												</button>
											</div>

										</div>

									</div>
								</section>
							</div>

						</div>
					</div>
					
				</div>
			</div>
	</div>
	</section>
	<!-- DROP DOWNS -->




	<section class="shadow">
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-lg-8">
						<h2>Favoris</h2>
					</div>
					<div class="col-lg-4">
						<div class="dropdown text-right">
							<button class="btn btn-info dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">Trier </button>
							<div class="dropdown-menu" aria-labelledby="searchSort">
							<a class="dropdown-item" href="#">Prix / croissant</a>
							<a class="dropdown-item" href="#">Prix / décroissant</a>
							<a class="dropdown-item" href="#">Surface / croissant</a>
							<a class="dropdown-item" href="#">Surface / décroissant</a>
						</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-4 text-center">
						<article>
							<div class="row">
								<div class="col-lg-12 text-center">
									<a href="detail.jsp">
										<div class="row">
											<div class="col-lg-12 text-center">
												<img src="images/diapo3.jpg" class="img-fluid">
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="row">
													<div class="col-lg-4 text-center my-auto"
														data-type="realestate">
														<div class="text-center">Maison 250m²</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="city">
														<div class="text-center">Perpignan</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="price">
														<div class="text-center">3500000 €</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</article>
					</div>
					<div class="col-lg-4 text-center">
						<article>
							<div class="row">
								<div class="col-lg-12 text-center">
									<a href="detail.jsp">
										<div class="row">
											<div class="col-lg-12 text-center">
												<img src="images/diapo4.jpg" class="img-fluid">
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="row">
													<div class="col-lg-4 text-center my-auto"
														data-type="realestate">
														<div class="text-center">Appartement 75m²</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="city">
														<div class="text-center">Toulouse</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="price">
														<div class="text-center">200000 €</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</article>
					</div>
					<div class="col-lg-4 text-center">
						<article>
							<div class="row">
								<div class="col-lg-12 text-center">
									<a href="detail.jsp">
										<div class="row">
											<div class="col-lg-12 text-center">
												<img src="images/diapo3.jpg" class="img-fluid">
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="row">
													<div class="col-lg-4 text-center my-auto"
														data-type="realestate">
														<div class="text-center">Maison 250m²</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="city">
														<div class="text-center">Perpignan</div>
													</div>
													<div class="col-lg-4 text-center my-auto" data-type="price">
														<div class="text-center">3500000 €</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</article>
					</div>
				</div>



			</div>
		</div>


	</section>
	</div>
	<!-- FOOTER -->
<%@ include file="dataModify-modal.html" %>	
<%@ include file="footer.jsp"%>
</body>

</html>