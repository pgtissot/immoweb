<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>Modération d'annonces</title>
<link rel="shortcut icon" href="./images/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="bootstrap-4.3.1/css/bootstrap.css" />
<link rel="stylesheet" href="fontawesome/css/all.css" />
<link rel="stylesheet" href="css/styles.css" />
<script src="jquery/jquery-3.4.1.js"></script>
<script src="bootstrap-4.3.1/js/bootstrap.bundle.js"></script>
<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
<script src="typeahead/bootstrap3-typeahead.js"></script>
<script src="js/codes.js"></script>
</head>

<body>

	<!-- HEADER -->
	<%@ include file="header.jsp"%>


	<!-- NAVIGATION -->

	<!-- DROP DOWNS -->
	<section class="shadow">
		<div class="container-fluid" id="searchheader">
			<div class="row">
				<div class="col-lg-9 my-auto bigfont">Annonces à traiter</div>
				<div class="col-lg-3 my-auto bigfont"><a href="compte" class="btn btn-info" role="button">Revenir à la page de compte</a></div>
			</div>
		</div>
	</section>

	<!-- ANNONCES  -->
	<section class="shadow">
		<div class="container-fluid">
			<section class="row">
				<div class="col-lg-12 sectiontitle">
					<div class="row">
						<div class="col-lg-9 text-center my-auto">
							<div class="row">
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Type de bien / Surface</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Ville</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Prix</div>
								</div>
								<div class="col-lg-3 text-center my-auto">
									<div class="text-center">Date de dépôt</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 text-center my"></div>
					</div>
				</div>
			</section>

			<c:forEach items="${requestScope.listAds}" var="ad">
				<c:set var="isHouse" value="${ad.realEstate.getType().equals('House')}" />
				<c:set var="isApartment" value="${ad.realEstate.getType().equals('Apartment')}" />
				
				
   				<section class="row border">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-9 text-center my-auto">
								<div class="row">
									<div class="col-lg-3 text-center my-auto">
 										<div class="text-center">
											<c:out value="${ad.realEstate.toFrench()}" /> (<c:out value="${ad.realEstate.area}" /> m²)
										</div>
									</div>
									<div class="col-lg-3 text-center my-auto">
 										<div class="text-center">
											<c:out value="${ad.realEstate.city.fullName}" />
										</div>
									</div>
									<div class="col-lg-3 text-center my-auto" data-type="price">
 										<div class="text-center">
											<c:out value="${ad.realEstate.priceFrench()}" /> &euro;
										</div>
									</div>
 									<div class="col-lg-3 text-center my-auto">
										<div class="text-center">
											<c:out value="${ad.getFrenchReleaseDate()}" />
										</div>
									</div>
								</div>
							</div>
 							<div class="col-lg-3 text-center my-auto" id="submit">
								<input class="btn btn-info adShow" data-toggle="collapse"
									href="#adModeration-<c:out value="${ad.adNumber}" />"
									type="submit" value="Montrer">
							</div>
						</div>
						<div class="row collapse" id="adModeration-<c:out value="${ad.adNumber}" />">
							<div class="col-lg-10 offset-lg-1">
								<section>
									<div class="row annoncedetail">
										<div class="col-lg-7">
											<div class="row">
												<c:choose>
													<c:when test="${ad.pictures.size() == 0 }">
														<img src="images/image-not-found.jpg" class="img-fluid">
													</c:when>
													<c:when test="${ad.pictures.size() > 0 }">
														<img src="<c:out value="${ad.pictures[0].data}" />"
															class="img-fluid">
													</c:when>
												</c:choose>
											</div>
										</div>
										<div class="col-lg-5 text-center my-auto">
											<div class="row">
												<div class="col-lg-12 text-center">
													<div data-type="detail-ref">
														Référence : <c:out value="${ad.adNumber}" />
													</div>
													<div data-type="detail-realestate">
														<c:out value="${ad.transactionTypeToFrench()}" /> /	<c:out value="${ad.realEstate.toFrench()}" />
													</div>
													<div>
														<c:if
															test="${(isHouse || isApartment) && ad.realEstate.rooms gt 0}">
															<c:out value="${ad.realEstate.rooms}" /> pièce<c:if
																test="${ad.realEstate.rooms gt 1}">s</c:if>
														</c:if>
													</div>
													<div>
														<c:out value="${ad.realEstate.area}" />	m²
													</div>
													<div>
														<c:if test="${isApartment && ad.realEstate.floor ne null}">
															Étage : <c:out value="${ad.realEstate.floor}" />
														</c:if>
													</div>
													<div>
														<c:if test="${isHouse && ad.realEstate.landArea gt 0}">
															Terrain : <c:out value="${ad.realEstate.landArea}" /> m²
														</c:if>
													</div>
													<div data-type="detail-city">
														<c:out value="${ad.realEstate.city.fullName}" />
													</div>
													<div data-type="detail-price">
														<c:out value="${ad.realEstate.priceFrench()}" /> &euro;
													</div>
													<div>
														Postée le <c:out value="${ad.getFrenchReleaseDate()}" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<section>
									<div class="row">
										<div class="col-lg-12 text-center sectiontitle">
											Description</div>
										<div class="col-lg-12 text-justify">
											<div>
												<c:out value="${ad.title}" />
											</div>
											<div>
												<c:out value="${ad.description}" />
											</div>
										</div>
									</div>
								</section>

								<!-- OPTIONS -->
								<c:if test="${isHouse || isApartment}">
									<section>
										<div class="row">
											<div class="col-lg-12 text-center sectiontitle">
												Options</div>
										</div>
										<div class="row">

											<c:choose>
												<c:when test="${isApartment}">
													<div class="col-lg-12 text-center"
														data-option="detailOptionsApartment">
														<div class="row">
															<c:choose>
																<c:when test="${ad.realEstate.alarm eq true}">
																	<div class="col-lg-3 ok">
																		<i class="far fa-bell"></i> Alarme <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.alarm eq false}">
																	<div class="col-lg-3 nok">
																		<i class="far fa-bell"></i> Alarme <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
															</c:choose>
															<c:choose>
																<c:when test="${ad.realEstate.elevator eq true}">
																	<div class="col-lg-3 ok">
																		<i class="far fa-building"></i> Ascenseur <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.elevator eq false}">
																	<div class="col-lg-3 nok">
																		<i class="far fa-building"></i> Ascenseur <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
															</c:choose>
															<c:choose>
																<c:when test="${ad.realEstate.balcony eq true}">
																	<div class="col-lg-3 ok">
																		<i class="fas fa-seedling"></i> Balcon <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.balcony eq false}">
																	<div class="col-lg-3 nok">
																		<i class="fas fa-seedling"></i> Balcon <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
															</c:choose>
															<c:choose>
																<c:when test="${ad.realEstate.digicode eq true}">
																	<div class="col-lg-3 ok">
																		<i class="fas fa-lock"></i> Digicode <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.digicode eq false}">
																	<div class="col-lg-3 nok">
																		<i class="fas fa-lock"></i> Digicode <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
															</c:choose>
														</div>
														<div class="row">
															<c:choose>
																<c:when test="${ad.realEstate.garage eq true}">
																	<div class="col-lg-3 ok">
																		<i class="fas fa-car"></i> Garage <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.garage eq false}">
																	<div class="col-lg-3 nok">
																		<i class="fas fa-car"></i> Garage <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
															</c:choose>
															<c:choose>
																<c:when test="${ad.realEstate.intercom eq true}">
																	<div class="col-lg-3 ok">
																		<i class="fab fa-intercom"></i> Intercom <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.intercom eq false}">
																	<div class="col-lg-3 nok">
																		<i class="fab fa-intercom"></i> Intercom <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
															</c:choose>
															<c:choose>
																<c:when test="${ad.realEstate.parking eq true}">
																	<div class="col-lg-3 ok">
																		<i class="fas fa-parking"></i> Parking <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.parking eq false}">
																	<div class="col-lg-3 nok">
																		<i class="fas fa-parking"></i> Parking <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
															</c:choose>
															<c:choose>
																<c:when test="${ad.realEstate.terrace eq true}">
																	<div class="col-lg-3 ok">
																		<i class="fas fa-fan"></i> Terrasse <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.terrace eq false}">
																	<div class="col-lg-3 nok">
																		<i class="fas fa-fan"></i> Terrasse <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
															</c:choose>
														</div>
													</div>
												</c:when>
												<c:when test="${isHouse}">
													<div class="col-lg-12" data-option="detailOptionsHouse">
														<div class="row">
															<c:choose>
																<c:when test="${ad.realEstate.alarm eq true}">
																	<div class="col-lg-4 ok">
																		<i class="far fa-bell"></i> Alarme <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.alarm eq false}">
																	<div class="col-lg-4 nok">
																		<i class="far fa-bell"></i> Alarme <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
															</c:choose>
															<c:choose>
																<c:when test="${ad.realEstate.cellar eq true}">
																	<div class="col-lg-4 ok">
																		<i class="fas fa-wine-bottle"></i> Cave <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.cellar eq false}">
																	<div class="col-lg-4 nok">
																		<i class="fas fa-wine-bottle"></i> Cave <i
																			class="fas fa-times"></i>
																	</div>
																</c:when>
															</c:choose>
															<c:choose>
																<c:when test="${ad.realEstate.swimmingPool eq true}">
																	<div class="col-lg-4 ok">
																		<i class="fas fa-swimming-pool"></i> Piscine <i
																			class="fas fa-check"></i>
																	</div>
																</c:when>
																<c:when test="${ad.realEstate.swimmingPool eq false}">
																	<div class="col-lg-4 nok">
																		<i class="fas fa-swimming-pool"></i> Piscine <i
																			class="fas fa-times"></i>
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
												Diagnostic énergétique</div>
										</div>
										<div class="row">
											<div class="col-lg-12" data-option="detailOptionsEnergy">
												<div class="row">
													<c:choose>
														<c:when test="${ad.realEstate.energyLevel eq null}">
															<div class="col-lg-6 energy-na">
																<i class="far fa-lightbulb"></i> Consommation
																énergétique : N/R
															</div>
														</c:when>
														<c:when test="${ad.realEstate.energyLevel ne null}">
															<div
																class="col-lg-6 energy-<c:out value="${ad.realEstate.energyLevel.toLowerCase()}"/>">
																<i class="far fa-lightbulb"></i> Consommation
																énergétique :
																<c:out value="${ad.realEstate.energyLevel}" />
															</div>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${ad.realEstate.gasLevel eq null}">
															<div class="col-lg-6 gas-na">
																<i class="fas fa-burn"></i> Émission de gaz à effet de
																serre : N/R
															</div>
														</c:when>
														<c:when test="${ad.realEstate.gasLevel ne null}">
															<div
																class="col-lg-6 gas-<c:out value="${ad.realEstate.gasLevel.toLowerCase()}"/>">
																<i class="far fa-lightbulb"></i> Consommation
																énergétique :
																<c:out value="${ad.realEstate.gasLevel}" />
															</div>
														</c:when>
													</c:choose>
												</div>
											</div>
										</div>
									</section>
								</c:if>

								<!-- VALIDATION / REFUS -->
								<section class="shadow">
									<form action="moderation" method="POST">
										<div class="row">
											<div class="col-lg-4 offset-lg-4 text-center my-auto">
												<input class="btn btn-info" type="submit" value="Valider">
												<input class="btn btn-info" type="submit" value="Refuser">
												<div class="form-group text-center my-auto adRefus">
													<label for="refus">Raison du refus :</label>
													<textarea class="form-control" id="refusedComment" name="refusedComment" rows="3"></textarea>
												</div>
											</div>
										</div>
										<input type="hidden" id="advertisementId" name="advertisementId" value="<c:out value="${ad.id}" />">
									</form>
								</section>
							</div>
						</div>
					</div>
				</section>
 
			</c:forEach>

		</div>
	</section>


	<!-- FOOTER -->
	<%@ include file="footer.jsp"%>

</body>

</html>