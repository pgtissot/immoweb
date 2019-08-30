<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="erreur.jsp"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
	<title>Dépot d'annonces</title>
	<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap-4.3.1/css/bootstrap.css" />
	<link rel="stylesheet" href="fontawesome/css/all.css" />
	<link rel="stylesheet" href="css/styles.css" />
	<script src="jquery/jquery-3.4.1.js"></script>
	<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
	<script src="typeahead/bootstrap3-typeahead.js"></script>
	<script src="js/codes.js"></script>
</head>
<body>

	<%@ include file="header.jsp" %>

	<!-- ENTETE HEADER -->
		
	<section class="shadow">
		<div class="container-fluid" id="searchheader">
			<div class="row">
				<div class="col-lg-10 my-auto bigfont">
				Dépôt d'une annonce
				</div>
			</div>
		</div>
	</section>
		
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">
					<section class="shadow">
						<div class="container-fluid">
							<div class="row">
								<div class="col-lg-12 text-center sectiontitle">
									Informations Générales :
								</div>
							</div>
							<form action="depot" method="POST" data-form="filters">
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
									<label class="col-lg-4 my-auto">Titre* : </label>
									<input type="text" class="form-control col-lg-8" name="title" value="<c:out value="${oldRequest.getParameter('title')}" />" required>
								</div>
								<div class="row">
									<label class="col-lg-4 my-auto">Type de bien* : </label>
									<select class="form-control col-lg-8" name="realestate" id="realestate"></select>
									<input type="hidden" name="oldre" id="oldre" value="<c:out value="${oldRequest.getParameter('realestate')}" />">
								</div>
								<div class="row">
									<label class="col-lg-4 my-auto">Ville* : </label>
									<input type="text" class="form-control col-lg-8" name="city" id="city" placeholder="Ville" value="<c:out value="${oldRequest.getParameter('city')}" />" required>
									<input type="hidden" name="cityId" id="cityId">
								</div>
								<div class="row">
									<label class="col-lg-4 my-auto">Prix* (&euro;): </label>
									<input type="number" class="form-control col-lg-8" name="price" value="<c:out value="${oldRequest.getParameter('price')}" />" required>
								</div>
								<div class="row">
									<label class="col-lg-4 my-auto">Surface* (m²) : </label>
									<input type="number" class="form-control col-lg-8" name="area" value="<c:out value="${oldRequest.getParameter('area')}" />" required>
								</div>
								<div class="row" data-search="land">
									<label class="col-lg-4 my-auto">Terrain (m²) : </label>
									<input type="number" class="form-control col-lg-8" name="landArea" value="<c:out value="${oldRequest.getParameter('land')}" />">
								</div>
								<div class="row" data-search="rooms">
									<label class="col-lg-4 my-auto">Pièces : </label>
									<input type="number" class="form-control col-lg-8" name="rooms" value="<c:out value="${oldRequest.getParameter('rooms')}" />">
								</div>
								<div class="row" data-search="floor">
									<label class="col-lg-4 my-auto">Étage : </label>
									<input type="text" class="form-control col-lg-8" name="floor" value="<c:out value="${oldRequest.getParameter('floor')}" />">
								</div>
								<div class="row">
									<label class="col-lg-4 my-auto">Description* : </label>
									<textarea class="form-control col-lg-8" name="description" rows="3" value="<c:out value="${oldRequest.getParameter('description')}" />" required></textarea>
								</div>
<!-- 								<div class="row">
									<label class="col-lg-4 my-auto">Images : </label>
									<input type="file" class="file-input col-lg-8" id="pictureFileName" name="pictureFileName" accept=".jpg">
								</div>
 -->								
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
												<option class="energy-a" value="A">A (inférieur à 50)</option>
												<option class="energy-b" value="B">B (de 51 à 90)</option>
												<option class="energy-c" value="C">C (de 91 à 150)</option>
												<option class="energy-d" value="D">D (de 151 à 230)</option>
												<option class="energy-e" value="E">E (de 231 à 330)</option>
												<option class="energy-f" value="F">F (de 331 à 450)</option>
												<option class="energy-g" value="G">G (supérieur à 450)</option>
											</select>
											<input type="hidden" name="oldenergy" id="oldenergy" value="<c:out value="${oldRequest.getParameter('energyLevel')}" />">
										</div>
										<div class="row">
											<select class="form-control col-lg-12" name="gasLevel" id="gas-level">
												<option disabled selected>GES (Kg éqCO2/m²/an)</option>
												<option class="gas-a" value="A">A (inférieur à 5)</option>
												<option class="gas-b" value="B">B (de 6 à 10)</option>
												<option class="gas-c" value="C">C (de 11 à 20)</option>
												<option class="gas-d" value="D">D (de 21 à 35)</option>
												<option class="gas-e" value="E">E (de 36 à 55)</option>
												<option class="gas-f" value="F">F (de 56 à 80)</option>
												<option class="gas-g" value="G">G (supérieur à 80)</option>
											</select>
											<input type="hidden" name="oldgas" id="oldgas" value="<c:out value="${oldRequest.getParameter('gasLevel')}" />">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 text-center" id="submit">
										<input class="btn btn-info" type="submit" value="Enregistrer">
									</div>
								</div>
							</form>
						</div>
					</section>
				</div>
			</div>
		</div>

	</section>

	<!-- PIED-PAGE/FOOTER -->
	<%@ include file="footer.jsp" %>

</body>
</html>





