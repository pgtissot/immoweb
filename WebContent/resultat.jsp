<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<%@ page import="com.edu.realestate.services.ReferenceServiceImpl"%>
<jsp:useBean id="refService" class="com.edu.realestate.services.ReferenceServiceImpl" />


<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8" />
	<title>Résultats de la recherche</title>
	<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap-4.3.1/css/bootstrap.css" />
	<link rel="stylesheet" href="fontawesome/css/all.css" />
	<link rel="stylesheet" href="css/styles.css" />
	<script src="jquery/jquery-3.4.1.js"></script>
<!-- 	<script src="bootstrap-4.3.1/js/bootstrap.bundle.js"></script>
 -->	<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
	<script src="typeahead/bootstrap3-typeahead.js"></script>
	<script src="js/codes.js"></script>

</head>

<body>

	<!-- HEADER -->
	<%@ include file="header.jsp" %>
	
	<!-- NAVIGATION -->

	<c:set var="oldRequest" value="${requestScope.searchRequest}" />
	
	<!-- DROP DOWNS -->
	<section class="shadow">
		<form action="search" method="POST">
			<div class="container-fluid" id="searchheader">
				<div class="row">
					<div class="col-lg-8 my-auto bigfont">
					Recherche de tous les biens disponibles : <c:out value="${requestScope.countAds}" /> résultats
					</div>
					<div class="col-lg-2 text-center">
						<select class="form-control" name="sort">
							<option value="price ASC">Prix / croissant</option>
							<option value="price DESC">Prix / décroissant</option>
							<option value="surface ASC">Surface / croissant</option>
							<option value="surface DESC">Surface / décroissant</option>
						</select>
					</div>
					<div class="col-lg-2 text-center">
						<input class="btn btn-info" type="submit" value="Trier">
					</div>
				</div>
			</div>
		</form>
	</section>
		

	<!-- FILTRES & ANNONCES  -->
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4">
					<section class="shadow">
						<div class="container-fluid">
							<div class="row">
								<div class="col-lg-12 text-center sectiontitle">
									Filtres
								</div>
							</div>
							<form action="search" method="POST" data-form="filters">
								<div class="row">
									<div class="col-lg-12 text-center">
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-info active">
												<input type="radio" name="transactionType" value="Sale" autocomplete="off" checked>Acheter
											</label>
											<label class="btn btn-info">
												<input type="radio" name="transactionType" value="Rent" autocomplete="off">Louer
											</label>
										</div>
									</div>
								</div>
								<div class="row">
									<select class="form-control col-lg-12" name="realestate" id="realestate"></select>
									<input type="hidden" name="oldre" id="oldre" value="<c:out value="${oldRequest.getParameter('realestate')}" />">
								</div>
								<div class="row">
									<input type="text" class="form-control col-lg-8" name="city" id="city" placeholder="Ville" value="<c:out value="${oldRequest.getParameter('city')}" />">
									<input type="hidden" name="cityId" id="cityId">
									<input type="text" class="form-control col-lg-3 offset-lg-1" name="distance" placeholder="Dist.(km)" value="<c:out value="${oldRequest.getParameter('distance')}" />">
								</div>
								<div class="row">
									<input type="text" class="form-control col-lg-5" name="price-min" placeholder="Prix Min" value="<c:out value="${oldRequest.getParameter('price-min')}" />">
									<input type="text" class="form-control col-lg-5 offset-lg-1" name="price-max" placeholder="Prix Max"value="<c:out value="${oldRequest.getParameter('price-max')}" />">
								</div>
								<div class="row">
									<input type="text" class="form-control col-lg-5" name="area-min" placeholder="Surf. Min" value="<c:out value="${oldRequest.getParameter('area-min')}" />">
									<input type="text" class="form-control col-lg-5 offset-lg-1" name="area-max" placeholder="Surf. Max" value="<c:out value="${oldRequest.getParameter('area-max')}" />">
								</div>
								<div class="row" data-search="land">
									<input type="text" class="form-control col-lg-5" name="land-min" placeholder="Terrain Min" value="<c:out value="${oldRequest.getParameter('land-min')}" />">
									<input type="text" class="form-control col-lg-5 offset-lg-1" name="land-max" placeholder="Terrain Max" value="<c:out value="${oldRequest.getParameter('land-max')}" />">
								</div>
								<div class="row" data-search="rooms">
									<input type="text" class="form-control col-lg-5" name="rooms-min" placeholder="Pièces Min" value="<c:out value="${oldRequest.getParameter('rooms-min')}" />">
									<input type="text" class="form-control col-lg-5 offset-lg-1" name="rooms-max" placeholder="Pièces Max" value="<c:out value="${oldRequest.getParameter('rooms-max')}" />">
								</div>
								<div class="col-lg-12" data-option="options">
									<div class="row">
										<div class="col-lg-12 text-center optiontitle">
											Options
										</div>
									</div>
									<div class="col-lg-12" data-option="optionsHouse">
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('alarm').equals('on')}">active</c:if> ">
														<input type="checkbox" name="alarm" autocomplete="off"><i
															class="far fa-bell"></i>
															Alarme
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('cellar').equals('on')}">active</c:if> ">
														<input type="checkbox" name="cellar"autocomplete="off"><i
															class="fas fa-wine-bottle"></i>
														Cave
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('swimmingPool').equals('on')}">active</c:if> ">
														<input type="checkbox" name="swimmingPool" autocomplete="off"><i
															class="fas fa-swimming-pool"></i>
														Piscine
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-12" data-option="optionsApartment">
										<div class="row">
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('alarm').equals('on')}">active</c:if> ">
														<input type="checkbox" name="alarm" autocomplete="off"><i
															class="far fa-bell"></i> Alarme
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('elevator').equals('on')}">active</c:if> ">
														<input type="checkbox" name="elevator" autocomplete="off"><i
															class="far fa-building"></i> Ascenseur
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('balcony').equals('on')}">active</c:if> ">
														<input type="checkbox" name="balcony" autocomplete="off"><i
															class="fas fa-seedling"></i> Balcon
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('digicode').equals('on')}">active</c:if> ">
														<input type="checkbox" name="digicode" autocomplete="off"><i
															class="fas fa-lock"></i>
														Digicode
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('garage').equals('on')}">active</c:if> ">
														<input type="checkbox" name="garage" autocomplete="off"><i
															class="fas fa-car"></i>
														Garage
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('intercom').equals('on')}">active</c:if> ">
														<input type="checkbox" name="intercom" autocomplete="off"><i
															class="fab fa-intercom"></i> Intercom
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('parking').equals('on')}">active</c:if> ">
														<input type="checkbox" name="parking" autocomplete="off"><i
															class="fas fa-parking"></i>
														Parking
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info <c:if test="${oldRequest.getParameter('terrace').equals('on')}">active</c:if> ">
														<input type="checkbox" name="terrace" autocomplete="off"><i
															class="fas fa-fan"></i>
														Terrasse
													</label>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12 text-center optiontitle">
											Diagnostic énergétique
										</div>
									</div>
									<div class="col-lg-12" data-option="optionsEnergy">
										<div class="row">
											<select class="form-control col-lg-12" name="energyLevel" id="energy-level">
												<option disabled selected>Énergie (kWh/m²/an)</option>
												<option class="energy-a" value="A">A (jusqu'à 50)</option>
												<option class="energy-b" value="B">A-B (jusqu'à 90)</option>
												<option class="energy-c" value="C">A-C (jusqu'à 150)</option>
												<option class="energy-d" value="D">A-D (jusqu'à 230)</option>
												<option class="energy-e" value="E">A-E (jusqu'à 330)</option>
												<option class="energy-f" value="F">A-F (jusqu'à 450)</option>
												<option class="energy-g" value="G">A-G (Tous)</option>
											</select>
											<input type="hidden" name="oldenergy" id="oldenergy" value="<c:out value="${oldRequest.getParameter('energyLevel')}" />">
										</div>
										<div class="row">
											<select class="form-control col-lg-12" name="gasLevel" id="gas-level">
												<option disabled selected>GES (Kg éqCO2/m²/an)</option>
												<option class="gas-a" value="A">A (jusqu'à 5)</option>
												<option class="gas-b" value="B">A-B (jusqu'à 10)</option>
												<option class="gas-c" value="C">A-C (jusqu'à 20)</option>
												<option class="gas-d" value="D">A-D (jusqu'à 35)</option>
												<option class="gas-e" value="E">A-E (jusqu'à 55)</option>
												<option class="gas-f" value="F">A-F (jusqu'à 80)</option>
												<option class="gas-g" value="G">A-G (Tous)</option>
											</select>
											<input type="hidden" name="oldgas" id="oldgas" value="<c:out value="${oldRequest.getParameter('gasLevel')}" />">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 text-center" id="submit">
										<input class="btn btn-info" type="submit" value="Rechercher">
									</div>
								</div>
							</form>
						</div>
					</section>
				</div>

				<div class="col-lg-8">
					<div class="row">
					
						<c:forEach items="${requestScope.listAds}" var="ad">

							<div class="col-lg-6">
								<article>
									<form method="POST" action="detail" id="${ad.id}">
										<a role="button" href="#" id="${ad.id}">
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
				</div>
			</div>
		</div>

		<!-- PAGINATION -->
<!-- 		<nav aria-label="Page navigation example">
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


	<!-- FOOTER -->
	<%@ include file="footer.jsp" %>
	
</body>

</html>