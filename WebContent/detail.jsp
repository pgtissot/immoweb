<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>Détails d'un bien immobilier</title>
	<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap-4.3.1/css/bootstrap.css" />
	<link rel="stylesheet" href="css/styles.css" />
	<link rel="stylesheet" href="fontawesome/css/all.css" />
	<script src="jquery/jquery-3.4.1.js"></script>
	<script src="jquery-validation/dist/jquery.validate.js"></script>
	<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
	<script src="bootstrap-4.3.1/js/bootstrap.bundle.js"></script>
	<script src="typeahead/bootstrap3-typeahead.js"></script>
	<script src="js/codes.js"></script>
</head>

<body>

	<!--  HEADER -->
	<%@ include file="header.jsp" %>

	<!-- NAVIGATION -->

	<!-- CONTENT -->

	<!-- DETAILS DE L'ANNONCE -->

	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<section>
						<div class="row annoncedetail">
							<div class="col-lg-7">
								<div class="row">
									<div class="col-lg-1 my-auto"><a href="#"><i class="fas fa-chevron-left"></i></a>
									</div>
									<div class="col-lg-10"><img src="images/diapo1.jpg" class="img-fluid"></div>
									<div class="col-lg-1 my-auto"><a href="#"><i class="fas fa-chevron-right"></i></a>
									</div>
								</div>
							</div>
							<div class="col-lg-5 text-center my-auto">
								<div class="row">
									<div class="col-lg-12 text-center">
										<div data-type="detail-realestate">Maison 10 pièces</div>
										<div>370 m²</div>
										<div>Paris 2e (75002)</div>
										<div data-type="detail-price">1736000 €</div>
										<div>Postée le 29/02/2019</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 text-center">
										<div><a href="#"><i class="far fa-heart"></i> Favoris</a></div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<section>
						<div class="row">
							<div class="col-lg-12 text-center sectiontitle">
								Description
							</div>
							<div class="col-lg-12 text-justify">
								<div>Super description sans accent.</div>
								<div>Contacter Mr GERARD agent commercial.</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 text-center contactAdvertiserButton">
								<button type="button" class="btn btn-info" data-toggle="modal"
									data-target="#contactAdvertiserModal">
									<i class="far fa-envelope"></i> Contacter le vendeur
								</button>
							</div>
						</div>
					</section>

					<!-- OPTIONS -->
					<section>
						<div class="row">
							<div class="col-lg-12 text-center sectiontitle">
								Options
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 text-center" data-option="optionsApartment">
								<div class="row">
									<div class="col-lg-3 ok">
										<i class="far fa-bell"></i> Alarme <i class="fas fa-check"></i>
									</div>
									<div class="col-lg-3 nok">
										<i class="far fa-building"></i> Ascenseur <i class="fas fa-times"></i>
									</div>
									<div class="col-lg-3 ok">
										<i class="fas fa-seedling"></i> Balcon <i class="fas fa-check"></i>
									</div>
									<div class="col-lg-3 ok">
										<i class="fas fa-lock"></i> Digicode <i class="fas fa-check"></i>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 ok">
										<i class="fas fa-car"></i> Garage <i class="fas fa-check"></i>
									</div>
									<div class="col-lg-3 ok">
										<i class="fab fa-intercom"></i> Intercom <i class="fas fa-check"></i>
									</div>
									<div class="col-lg-3 nok">
										<i class="fas fa-parking"></i> Parking <i class="fas fa-times"></i>
									</div>
									<div class="col-lg-3 ok">
										<i class="fas fa-fan"></i> Terrasse <i class="fas fa-check"></i>
									</div>
								</div>
							</div>
							<div class="col-lg-12" data-option="optionsHouse">
								<div class="row">
									<div class="col-lg-4 ok">
										<i class="far fa-bell"></i> Alarme <i class="fas fa-check"></i>
									</div>
									<div class="col-lg-4 nok">
										<i class="fas fa-wine-bottle"></i> Cave <i class="fas fa-times"></i>
									</div>
									<div class="col-lg-4 ok">
										<i class="fas fa-swimming-pool"></i> Piscine <i class="fas fa-check"></i>
									</div>
								</div>
							</div>
						</div>
					</section>

					<!-- ENERGETIQUE  -->
					<section>
						<div class="row">
							<div class="col-lg-12 text-center sectiontitle">
								Diagnostic énergétique
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12" data-option="optionsEnergy">
								<div class="row">
									<div class="col-lg-6 energy-d">
										<i class="far fa-lightbulb"></i> Consommation énergétique :
										D
									</div>
									<div class="col-lg-6 gas-d">
										<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
										D
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>

				<!-- AUTRES ANNONCES -->

				<div class="col-lg-4">
					<section class="border">
						<div class="container-fluid">
							<div class="row">
								<div class="col-lg-12 text-center sectiontitle">
									Autres annonces à proximité
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12 text-center">
									<article>
										<div class="row">
											<div class="col-lg-12 text-center">
												<a href="detail.html">
													<div class="row">
														<div class="col-lg-12 text-center">
															<img src="images/diapo2.jpg" class="img-fluid">
														</div>
													</div>
													<div class="row" data-type="caption">
														<div class="col-lg-4 text-center my-auto"
															data-type="sm-realestate">
															<div class="text-center">Maison 190m²</div>
														</div>
														<div class="col-lg-4 text-center my-auto" data-type="sm-city">
															<div class="text-center">Bordeaux</div>
														</div>
														<div class="col-lg-4 text-center my-auto" data-type="sm-price">
															<div class="text-center">2000000 €</div>
														</div>
													</div>
												</a>
											</div>
										</div>
									</article>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12 text-center">
									<article>
										<div class="row">
											<div class="col-lg-12 text-center">
												<a href="detail.html">
													<div class="row">
														<div class="col-lg-12 text-center">
															<img src="images/diapo3.jpg" class="img-fluid">
														</div>
													</div>
													<div class="row" data-type="caption">
														<div class="col-lg-4 text-center my-auto"
															data-type="sm-realestate">
															<div class="text-center">Maison 100m²</div>
														</div>
														<div class="col-lg-4 text-center my-auto" data-type="sm-city">
															<div class="text-center">Perpignan</div>
														</div>
														<div class="col-lg-4 text-center my-auto" data-type="sm-price">
															<div class="text-center">1000000 €</div>
														</div>
													</div>
												</a>
											</div>
										</div>
									</article>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</section>

	<aside>
	</aside>

	<!-- MODAL DE CONTACT DU VENDEUR -->
	<%@ include file="contact-modal.html" %>

	<!-- FOOTER -->
	<%@ include file="footer.jsp" %>
</body>

</html>