<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

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
	<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
	<script src="typeahead/bootstrap3-typeahead.js"></script>
	<script src="js/codes.js"></script>
	<!-- 	
	<script src="bootstrap-4.3.1/js/bootstrap.bundle.js"></script>
 -->
</head>

<body>

	<!-- HEADER -->
	<%@ include file="header.jsp" %>

	<!-- NAVIGATION -->

	<!-- DROP DOWNS -->
	<section class="shadow">
		<div class="container-fluid" id="searchheader">
			<div class="row">
				<div class="col-lg-10 my-auto bigfont">Recherche de tous les biens disponibles en France : 1895
					résultats
				</div>
				<div class="col-lg-2 text-center">
					<div class="dropdown">
						<button class="btn btn-info dropdown-toggle" type="button" id="searchSort"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Trier
						</button>
						<div class="dropdown-menu" aria-labelledby="searchSort">
							<a class="dropdown-item" href="#">Prix / croissant</a>
							<a class="dropdown-item" href="#">Prix / décroissant</a>
							<a class="dropdown-item" href="#">Surface / croissant</a>
							<a class="dropdown-item" href="#">Surface / décroissant</a>
						</div>
					</div>
				</div>
			</div>
		</div>
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
							<form action="resultat.html" method="POST" data-form="filters">
								<div class="row">
									<div class="col-lg-12 text-center">
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-info active">
												<input type="radio" name="action" id="acheter" autocomplete="off"
													checked>Acheter
											</label>
											<label class="btn btn-info">
												<input type="radio" name="action" id="louer" autocomplete="off">Louer
											</label>
										</div>
									</div>
								</div>
								<div class="row">
									<select class="form-control col-lg-12" id="realestate"></select>
								</div>
								<div class="row">
									<input type="text" class="form-control col-lg-12" id="city" placeholder="Ville">
									<input type="hidden" id="cityid">
								</div>
								<div class="row">
									<input type="text" class="form-control col-lg-5" id="price-min"
										placeholder="Prix Min">
									<input type="text" class="form-control col-lg-5 offset-lg-1" id="price-max"
										placeholder="Prix Max">
								</div>
								<div class="row">
									<input type="text" class="form-control col-lg-5" id="surface-min"
										placeholder="Surface Min">
									<input type="text" class="form-control col-lg-5 offset-lg-1" id="price-max"
										placeholder="Surface Max">
								</div>
								<div class="row" data-search="land">
									<input type="text" class="form-control col-lg-5" id="land-min"
										placeholder="Terrain Min">
									<input type="text" class="form-control col-lg-5 offset-lg-1" id="land-max"
										placeholder="Terrain Max">
								</div>
								<div class="row" data-search="rooms">
									<input type="text" class="form-control col-lg-5" id="rooms-min"
										placeholder="Pièces Min">
									<input type="text" class="form-control col-lg-5 offset-lg-1" id="rooms-max"
										placeholder="Pièces Max">
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
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="far fa-bell"></i> Alarme
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="fas fa-wine-bottle"></i>
														Cave
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
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
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="far fa-bell"></i> Alarme</i>
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="far fa-building"></i> Ascenseur</i>
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="fas fa-seedling"></i> Balcon</i>
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="fas fa-lock"></i>
														Digicode</i>
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="fas fa-car"></i>
														Garage</i>
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="fab fa-intercom"></i> Intercom</i>
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="fas fa-parking"></i>
														Parking</i>
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" autocomplete="off"><i
															class="fas fa-fan"></i>
														Terrasse</i>
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
											<select class="form-control col-lg-12" id="energy-level">
												<option disabled selected>Énergie (kWh/m²/an)</option>
												<option class="energy-a" value="A">A (jusqu'à 50)</option>
												<option class="energy-b" value="B">B (de 51 à 90)</option>
												<option class="energy-c" value="C">C (de 91 à 150)</option>
												<option class="energy-d" value="D">D (de 151 à 230)</option>
												<option class="energy-e" value="E">E (de 231 à 330)</option>
												<option class="energy-f" value="F">F (de 331 à 450)</option>
												<option class="energy-g" value="G">G (au-dessus de 450)</option>
											</select>
										</div>
										<div class="row">
											<select class="form-control col-lg-12" id="gas-level">
												<option disabled selected>GES (Kg éqCO2/m²/an)</option>
												<option class="gas-a" value="A">A (jusqu'à 5)</option>
												<option class="gas-b" value="B">B (de 6 à 10)</option>
												<option class="gas-c" value="C">C (de 11 à 20)</option>
												<option class="gas-d" value="D">D (de 21 à 35)</option>
												<option class="gas-e" value="E">E (de 36 à 55)</option>
												<option class="gas-f" value="F">F (de 56 à 80)</option>
												<option class="gas-g" value="G">G (au-dessus de 80)</option>
											</select>
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
						<div class="col-lg-6">
							<article>
								<div class="row">
									<div class="col-lg-12 text-center">
										<a href="detail.jsp">
											<div class="row">
												<div class="col-lg-12 text-center">
													<img src="images/diapo1.jpg" class="img-fluid">
												</div>
											</div>
											<div class="row" data-type="caption">
												<div class="col-lg-4 text-center my-auto" data-type="realestate">
													<div class="text-center">Maison 150m²</div>
												</div>
												<div class="col-lg-4 text-center my-auto" data-type="city">
													<div class="text-center">Paris 15e</div>
												</div>
												<div class="col-lg-4 text-center my-auto" data-type="price">
													<div class="text-center">1500000 €</div>
												</div>
											</div>
										</a>
									</div>
								</div>
							</article>
						</div>
						<div class="col-lg-6 text-center">
							<article>
								<div class="row">
									<div class="col-lg-12 text-center">
										<a href="detail.jsp">
											<div class="row">
												<div class="col-lg-12 text-center">
													<img src="images/diapo2.jpg" class="img-fluid">
												</div>
											</div>
											<div class="row" data-type="caption">
												<div class="col-lg-4 text-center my-auto" data-type="realestate">
													<div class="text-center">Maison 190m²</div>
												</div>
												<div class="col-lg-4 text-center my-auto" data-type="city">
													<div class="text-center">Bordeaux</div>
												</div>
												<div class="col-lg-4 text-center my-auto" data-type="price">
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
						<div class="col-lg-6 text-center">
							<article>
								<div class="row">
									<div class="col-lg-12 text-center">
										<a href="detail.jsp">
											<div class="row">
												<div class="col-lg-12 text-center">
													<img src="images/diapo3.jpg" class="img-fluid">
												</div>
											</div>
											<div class="row" data-type="caption">
												<div class="col-lg-4 text-center my-auto" data-type="realestate">
													<div class="text-center">Maison 250m²</div>
												</div>
												<div class="col-lg-4 text-center my-auto" data-type="city">
													<div class="text-center">Perpignan</div>
												</div>
												<div class="col-lg-4 text-center my-auto" data-type="price">
													<div class="text-center">3500000 €</div>
												</div>
											</div>
										</a>
									</div>
								</div>
							</article>
						</div>
						<div class="col-lg-6 text-center">
							<article>
								<div class="row">
									<div class="col-lg-12 text-center">
										<a href="detail.jsp">
											<div class="row">
												<div class="col-lg-12 text-center">
													<img src="images/diapo4.jpg" class="img-fluid">
												</div>
											</div>
											<div class="row" data-type="caption">
												<div class="col-lg-4 text-center my-auto" data-type="realestate">
													<div class="text-center">Appartement 75m²</div>
												</div>
												<div class="col-lg-4 text-center my-auto" data-type="city">
													<div class="text-center">Toulouse</div>
												</div>
												<div class="col-lg-4 text-center my-auto" data-type="price">
													<div class="text-center">200000 €</div>
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
		</div>

		<!-- PAGINATION -->
		<nav aria-label="Page navigation example">
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

	</section>


	<!-- FOOTER -->
	<%@ include file="footer.jsp" %>
	
</body>

</html>