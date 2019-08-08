<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>Accueil</title>
<link
	href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="bootstrap-4.3.1/css/bootstrap.css" />
<link rel="stylesheet" href="fontawesome/css/all.css" />
<link rel="stylesheet" href="css/styles.css" />
<script src="jquery/jquery-3.4.1.js"></script>
<script src="jquery-validation/dist/jquery.validate.js"></script>
<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
<script src="bootstrap-4.3.1/js/bootstrap.bundle.js"></script>
<script src="typeahead/bootstrap3-typeahead.js"></script>
<!-- <script src="pagination/pagination.js"></script> -->
<script src="js/codes.js"></script>
</head>

<body>
	<!-- HEADER -->
	<%@ include file="header.jsp"%>

	<!-- NAVIGATION -->

	<!-- CONTENT -->

	<!-- CARROUSEL & FORMULAIRE -->
	<section>
		<div id="backgroundCarousel" class="carousel slide"
			data-ride="carousel" data-interval="100000">
			<div class="carousel-inner outer imgcarousel">
				<ol class="carousel-indicators">
					<li data-target="#backgroundCarousel" data-slide-to="0"
						class="active"></li>
					<li data-target="#backgroundCarousel" data-slide-to="1"></li>
					<li data-target="#backgroundCarousel" data-slide-to="2"></li>
					<li data-target="#backgroundCarousel" data-slide-to="3"></li>
				</ol>
				<div class="carousel-item active">
					<img class="d-block w-100 tinted" src="images/diapo1.jpg">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100 tinted" src="images/diapo2.jpg">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100 tinted" src="images/diapo3.jpg">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100 tinted" src="images/diapo4.jpg">
				</div>

				<div class="container-fluid inner">
					<form action="search" method="POST" id="searchform">
						<div class="searchmenu">
							<div class="row">
								<div class="col-lg-2 my-auto text-center">
									<div class="btn-group btn-group-toggle btn-group-vertical" data-toggle="buttons">
										<label class="btn btn-info active">
											<input type="radio" name="transactionType" value="Sale" autocomplete="off" checked>Acheter
										</label>
										<label class="btn btn-info">
											<input type="radio" name="transactionType" value="Rent" autocomplete="off">Louer
										</label>
									</div>
								</div>
								<div class="col-lg-8 my-auto">
									<div class="row searchrow">
										<div class="col-lg-4">
											<div class="row">
												<select class="form-control col-lg-12" name="realestate" id="realestate"></select>
											</div>
										</div>
										<div class="col-lg-3 offset-lg-1">
											<div class="row">
												<input type="text" class="form-control" name="city" id="city" placeholder="Ville">
													<input type="hidden" name="cityId" id="cityId">
											</div>
										</div>
										<div class="col-lg-3 offset-lg-1">
											<div class="row">
												<input type="text" class="form-control" name="distance" placeholder="Distance (km)">
											</div>
										</div>
									</div>
									<div class="row searchrow">
										<div class="col-lg-6">
											<div class="row">
												<input type="text" class="form-control col-lg-5" name="price-min" placeholder="Min €">
												<input type="text" class="form-control col-lg-5 offset-lg-1" name="price-max" placeholder="Max €">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="row">
												<input type="text" class="form-control col-lg-5" name="area-min" placeholder="Min m²">
												<input type="text" class="form-control col-lg-5 offset-lg-1" name="area-max" placeholder="Max m²">
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-2 my-auto text-center">
									<input class="btn btn-info" type="submit" value="Rechercher">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- DERNIERES ANNONCES -->
	<section class="border">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 text-center sectiontitle">Les dernières annonces parues</div>
			</div>


			<div class="row data-container">

				<c:forEach items="${requestScope.listAds}" var="ad">

					<div class="col-lg-3 text-center container-fluid">
						<article>
							<form method="POST" action="detail" id="advertisement-<c:out value="${ad.id}" />">
								<a role="button" href="#" id="advertisement-<c:out value="${ad.id}" />">
									<div class="row">
										<div class="col-lg-12 text-center">
											<div class="row">
												<div class="col-lg-12 text-center">
													<img src="images/diapo1.jpg" class="img-fluid">
												</div>
											</div>
											<div class="row" data-type="caption">
												<div class="col-lg-6 align-left my-auto" data-type="realestate">
													<div>
														<c:out value="${ad.transactionTypeToFrench()}" />
													</div>
													<div>
														<c:out value="${ad.realEstate.toFrench()}" />
													<div>
													</div>
														<c:out value="${ad.realEstate.area}" /> m²
													</div>
													<div>
														<c:out value="${ad.realEstate.city.name}" />
													</div>
												</div>
												<div class="col-lg-6 my-auto" data-type="price">
													<div>
														<c:out value="${ad.realEstate.priceFrench()}" /> &euro;
													</div>
												</div>
											</div>
										</div>
									</div>
								</a>
								<input type="hidden" id="advertisementId" name="advertisementId" value="<c:out value="${ad.id}" />">
							</form>
						</article>
					</div>

				</c:forEach>

			</div>

			<!-- PAGINATION -->
			<!-- 		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled">
					<a class="page-link" href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a>
				</li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item">
					<a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>
				</li>
			</ul>
		</nav>
 -->
	</section>


	<!--- RECHERCHE RAPIDE -->
	<section class="border">
		<div class="container-fluid" id="qksrchbox">
			<div class="row">
				<div class="col-lg-12 text-center sectiontitle">Liens rapides
					de recherche</div>
				<div class="col-lg-2 text-center my-auto mediumfont">
					<form method="POST" action="search" id="quick-link-House" >
						<a role="button" href="#" id="quick-link-House">
								Maisons
						</a>
						<input type="hidden" id="realestate" name="realestate" value="House">
					</form>
				</div>
				<div class="col-lg-2 text-center my-auto mediumfont">
					<form method="POST" action="search" id="quick-link-Apartment" >
						<a role="button" href="#" id="quick-link-Apartment">
								Appartements
						</a>
						<input type="hidden" id="realestate" name="realestate" value="Apartment">
					</form>
				</div>
				<div class="col-lg-2 text-center my-auto mediumfont">
					<form method="POST" action="search" id="quick-link-Parking" >
						<a role="button" href="#" id="quick-link-Parking">
								Parkings
						</a>
						<input type="hidden" id="realestate" name="realestate" value="Parking">
					</form>
				</div>
				<div class="col-lg-2 text-center my-auto mediumfont">
					<form method="POST" action="search" id="quick-link-Commercial" >
						<a role="button" href="#" id="quick-link-Commercial">
								Locaux Commerciaux
						</a>
						<input type="hidden" id="realestate" name="realestate" value="Commercial">
					</form>
				</div>
				<div class="col-lg-2 text-center my-auto mediumfont">
					<form method="POST" action="search" id="quick-link-Land" >
						<a role="button" href="#" id="quick-link-Land">
								Terrains
						</a>
						<input type="hidden" id="realestate" name="realestate" value="Land">
					</form>
				</div>
				<div class="col-lg-2 text-center my-auto mediumfont">
					<form method="POST" action="search" id="quick-link-Other" >
						<a role="button" href="#" id="quick-link-Other">
								Autres
						</a>
						<input type="hidden" id="realestate" name="realestate" value="Other">
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>

</body>

</html>