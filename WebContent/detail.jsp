<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<%@ page import="com.edu.realestate.services.AdvertisementService"%>
<%@ page import="com.edu.realestate.model.Advertisement"%>
<%@ page import="com.edu.realestate.model.Apartment"%>
<%@ page import="com.edu.realestate.model.House"%>

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
	<c:set var="ad" value="${requestScope.ad}" />

	<section class="shadow">
		<div class="container-fluid" id="searchheader">
			<div class="row">
				<div class="col-lg-10 my-auto bigfont">
				Détails de l'annonce : Référence <c:out value="${ad.adNumber}" />
				</div>
			</div>
		</div>
	</section>

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
										<div data-type="detail-realestate">
											<c:out value="${ad.transactionTypeToFrench()}" /> / <c:out value="${ad.realEstate.toFrench()}" />
										</div>
										<div><c:out value="${ad.realEstate.area}" /> m²</div>
										<div><c:out value="${ad.realEstate.city.fullName}" /></div>
										<div data-type="detail-price"><c:out value="${ad.realEstate.priceFrench()}" /> &euro;</div>
										<div>Postée le <c:out value="${ad.getFrenchReleaseDate()}" /></div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 text-center">
										<div id="favoris"><a href="#"><i class="far fa-heart"></i> Favoris</a></div>
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
								<div><c:out value="${ad.title}" /></div>
								<div><c:out value="${ad.description}" /></div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 text-center contactAdvertiserButton">
								<button type="button" class="btn btn-info" data-toggle="modal"
									data-target="#contactAdvertiserModal">
									<i class="far fa-envelope"></i> Contacter le vendeur : <c:out value="${ad.advertiser.username}" />
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

							<c:choose>
								<c:when test="${ad.realEstate.getType().equals('Apartment')}">
									<div class="col-lg-12 text-center" data-option="detailOptionsApartment">
										<div class="row">
											<c:choose>
												<c:when test="${ad.realEstate.alarm eq true}">
													<div class="col-lg-3 ok">
														<i class="far fa-bell"></i> Alarme <i class="fas fa-check"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.alarm eq false}">
													<div class="col-lg-3 nok">
														<i class="far fa-bell"></i> Alarme <i class="fas fa-times"></i>
													</div>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ad.realEstate.elevator eq true}">
													<div class="col-lg-3 ok">
														<i class="far fa-building"></i> Ascenseur <i class="fas fa-check"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.elevator eq false}">
													<div class="col-lg-3 nok">
														<i class="far fa-building"></i> Ascenseur <i class="fas fa-times"></i>
													</div>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ad.realEstate.balcony eq true}">
													<div class="col-lg-3 ok">
														<i class="fas fa-seedling"></i> Balcon <i class="fas fa-times"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.balcony eq false}">
													<div class="col-lg-3 nok">
														<i class="fas fa-seedling"></i> Balcon <i class="fas fa-check"></i>
													</div>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ad.realEstate.digicode eq true}">
													<div class="col-lg-3 ok">
														<i class="fas fa-lock"></i> Digicode <i class="fas fa-times"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.digicode eq false}">
													<div class="col-lg-3 nok">
														<i class="fas fa-lock"></i> Digicode <i class="fas fa-check"></i>
													</div>
												</c:when>
											</c:choose>
										</div>
										<div class="row">
											<c:choose>
												<c:when test="${ad.realEstate.garage eq true}">
													<div class="col-lg-3 ok">
														<i class="fas fa-car"></i> Garage <i class="fas fa-check"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.garage eq false}">
													<div class="col-lg-3 nok">
														<i class="fas fa-car"></i> Garage <i class="fas fa-times"></i>
													</div>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ad.realEstate.intercom eq true}">
													<div class="col-lg-3 ok">
														<i class="fab fa-intercom"></i> Intercom <i class="fas fa-check"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.intercom eq false}">
													<div class="col-lg-3 nok">
														<i class="fab fa-intercom"></i> Intercom <i class="fas fa-times"></i>
													</div>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ad.realEstate.parking eq true}">
													<div class="col-lg-3 ok">
														<i class="fas fa-parking"></i> Parking  <i class="fas fa-times"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.parking eq false}">
													<div class="col-lg-3 nok">
														<i class="fas fa-parking"></i> Parking  <i class="fas fa-check"></i>
													</div>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ad.realEstate.terrace eq true}">
													<div class="col-lg-3 ok">
														<i class="fas fa-fan"></i> Terrasse <i class="fas fa-times"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.terrace eq false}">
													<div class="col-lg-3 nok">
														<i class="fas fa-fan"></i> Terrasse <i class="fas fa-check"></i>
													</div>
												</c:when>
											</c:choose>
										</div>
									</div>
								</c:when>
								<c:when test="${ad.realEstate.getType().equals('House')}">
									<div class="col-lg-12" data-option="detailOptionsHouse">
										<div class="row">
											<c:choose>
												<c:when test="${ad.realEstate.alarm eq true}">
													<div class="col-lg-4 ok">
														<i class="far fa-bell"></i> Alarme <i class="fas fa-check"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.alarm eq false}">
													<div class="col-lg-4 nok">
														<i class="far fa-bell"></i> Alarme <i class="fas fa-times"></i>
													</div>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ad.realEstate.cellar eq true}">
													<div class="col-lg-4 ok">
														<i class="fas fa-wine-bottle"></i> Cave <i class="fas fa-check"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.cellar eq false}">
													<div class="col-lg-4 nok">
														<i class="fas fa-wine-bottle"></i> Cave <i class="fas fa-times"></i>
													</div>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ad.realEstate.swimmingPool eq true}">
													<div class="col-lg-4 ok">
														<i class="fas fa-swimming-pool"></i> Piscine <i class="fas fa-check"></i>
													</div>
												</c:when>
												<c:when test="${ad.realEstate.swimmingPool eq false}">
													<div class="col-lg-4 nok">
														<i class="fas fa-swimming-pool"></i> Piscine <i class="fas fa-times"></i>
													</div>
												</c:when>
											</c:choose>
										</div>
									</div>
								</c:when>
							</c:choose>
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
							<div class="col-lg-12" data-option="detailOptionsEnergy">
								<div class="row">
								<c:choose>
									<c:when test="${ad.realEstate.energyLevel eq '-'.charAt(0)}">
										<div class="col-lg-6 energy-na">
											<i class="far fa-lightbulb"></i> Consommation énergétique :
											N/R
										</div>
									</c:when>
									<c:when test="${ad.realEstate.energyLevel eq 'A'.charAt(0)}">
										<div class="col-lg-6 energy-a">
											<i class="far fa-lightbulb"></i> Consommation énergétique :
											A
										</div>
									</c:when>
									<c:when test="${ad.realEstate.energyLevel eq 'B'.charAt(0)}">
										<div class="col-lg-6 energy-b">
											<i class="far fa-lightbulb"></i> Consommation énergétique :
											B
										</div>
									</c:when>
									<c:when test="${ad.realEstate.energyLevel eq 'C'.charAt(0)}">
										<div class="col-lg-6 energy-c">
											<i class="far fa-lightbulb"></i> Consommation énergétique :
											C
										</div>
									</c:when>
									<c:when test="${ad.realEstate.energyLevel eq 'D'.charAt(0)}">
										<div class="col-lg-6 energy-d">
											<i class="far fa-lightbulb"></i> Consommation énergétique :
											D
										</div>
									</c:when>
									<c:when test="${ad.realEstate.energyLevel eq 'E'.charAt(0)}">
										<div class="col-lg-6 energy-e">
											<i class="far fa-lightbulb"></i> Consommation énergétique :
											E
										</div>
									</c:when>
									<c:when test="${ad.realEstate.energyLevel eq 'F'.charAt(0)}">
										<div class="col-lg-6 energy-f">
											<i class="far fa-lightbulb"></i> Consommation énergétique :
											F
										</div>
									</c:when>
									<c:when test="${ad.realEstate.energyLevel eq 'G'.charAt(0)}">
										<div class="col-lg-6 energy-g">
											<i class="far fa-lightbulb"></i> Consommation énergétique :
											G
										</div>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${ad.realEstate.gasLevel eq '-'.charAt(0)}">
										<div class="col-lg-6 energy-na">
											<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
											N/R
										</div>
									</c:when>
									<c:when test="${ad.realEstate.gasLevel eq 'A'.charAt(0)}">
										<div class="col-lg-6 energy-a">
											<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
											A
										</div>
									</c:when>
									<c:when test="${ad.realEstate.gasLevel eq 'B'.charAt(0)}">
										<div class="col-lg-6 energy-b">
											<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
											B
										</div>
									</c:when>
									<c:when test="${ad.realEstate.gasLevel eq 'C'.charAt(0)}">
										<div class="col-lg-6 energy-c">
											<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
											C
										</div>
									</c:when>
									<c:when test="${ad.realEstate.gasLevel eq 'D'.charAt(0)}">
										<div class="col-lg-6 energy-d">
											<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
											D
										</div>
									</c:when>
									<c:when test="${ad.realEstate.gasLevel eq 'E'.charAt(0)}">
										<div class="col-lg-6 energy-e">
											<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
											E
										</div>
									</c:when>
									<c:when test="${ad.realEstate.gasLevel eq 'F'.charAt(0)}">
										<div class="col-lg-6 energy-f">
											<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
											F
										</div>
									</c:when>
									<c:when test="${ad.realEstate.gasLevel eq 'G'.charAt(0)}">
										<div class="col-lg-6 energy-g">
											<i class="fas fa-burn"></i> Émission de gaz à effet de serre :
											G
										</div>
									</c:when>
								</c:choose>
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

							<c:forEach items="${requestScope.listAds}" var="ad">

							<div class="row">
								<div class="col-lg-12 text-center">
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
					</section>
				</div>
			</div>
		</div>
	</section>

	<aside>
	</aside>

	<!-- MODAL DE CONTACT DU VENDEUR -->
	<%@ include file="contact-modal.jsp" %>

	<!-- FOOTER -->
	<%@ include file="footer.jsp" %>
</body>

</html>