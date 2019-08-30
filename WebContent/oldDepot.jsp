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
	<link rel="stylesheet" type="text/css" href="styles/listings.css">
	<link rel="stylesheet" type="text/css" href="styles/listings_responsive.css">
	<script src="jquery/jquery-3.4.1.js"></script>
	<script src="bootstrap-4.3.1/js/bootstrap.bundle.js"></script>
	<script src="bootstrap-4.3.1/js/bootstrap.js"></script>
	<script src="typeahead/bootstrap3-typeahead.js"></script>
	<script src="js/codes.js"></script>
</head>
<body>

	<%@ include file="header.jsp" %>

	<!-- ENTETE HEADER -->
		
<div class="col-lg-6 offset-lg-3">		
	<!-- ENTETE HEADER -->
		<!-- Menu -->
		
		
		
	
	<form action="search" method="POST" name="depot">					
        <!---Adv1 Advertisement--->
	

	<div class="form-row">
		<div class="col-lg-8 offset-lg-2">
			<div class="row">
				<div class="col-lg-12 form-group">
					<h1>Déposez votre annonce  </h1>
					<p> Vous désirez vendre ou mettre en location un bien immobilier, notre agence vous permet de réaliser votre transaction dans les meilleures conditions. </p>
					<h3> Ready !</h3>
					<p> Veuillez sélectionner votre type de bien et compléter au minimum les informations obligatoires.	</p>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12 form-group">
					<label>Titre de l'annonce*</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="Tapez le titre de votre annonce" required>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 form-group">				
				
				
							<form action="search" method="POST" data-form="filters">
							
							
							
			<!-- -------------------------------------- -->		
			
			
			<!-- ------------------------------------------ -->		
							
								<div class="row">
									<div class="col-lg-12 text-center">
										<div class="btn btn-group-toggle" data-toggle="buttons">
											<label class="btn btn-info active">
				
												<input type="radio" name="transactionType" id="Sale" autocomplete="off"
													checked>Achat
											</label>
											<label class="btn btn-info">
												<input type="radio" name="transactionType" id="Rent" autocomplete="off">Louer
											</label>
										</div>
									</div>
								</div>
								</div>
			<!-- ------------------la ville ------------- -->
		
					<!-- -<select class="form-control" name="city_id" id ="city_id" required >
						<option value="id_ville">Choisissez la ville </option>
					</select>
				</div>	
			</div>	
			</div>--->
	<!-- ------------------------------------------- -->
	
								
	<!-- ---------------------type de bien --------------------------- -->
	
			
			<!-- div class="col-lg-12 form-group">
					<label>Types de bien*</label> 
			<select class="form-control" name="type_propriete" id="type_propriete" required>
				<option value="">Choisissez le type de bien</option>
				<option value="1">Appartement
						
				
				</option>
				<option value="2">Maison</option>
				<option value="3">Local commercial</option>
				<option value="4">Parking</option>
				<option value="5">terrain</option>
				<option value="6">Autre Propriete</option>
			</select>
			</div> -->
	<!-- ---------------------------------------------------------------- -->
	<div class="col-lg-12 form-group">
		
					
					
							
									<select class="form-control col-lg-12" name="realestate" id="realestate"></select>
								
								</div>
								<div class="col-lg-12 form-group">
								<label>Choisissez votre ville</label>
								<div class="row">
									<input type="text" class="form-control col-lg-8" name="city" placeholder="Ville" required>
									
								</div>
								</div>
							
								<div class="row">
									<input type="text" class="form-control col-lg-5" name="price" placeholder="Prix">
							
								</div>
								<div class="row">
								<label>Surface*</label> 
									<input type="text" class="form-control col-lg-5" name="surface" placeholder="m²" required>
									
								</div>
								<div class="row" data-search="land">
									<input type="text" class="form-control col-lg-5" name="land" placeholder="Terrain">
								</div>
								<div class="row" data-search="rooms">
									<input type="text" class="form-control col-lg-5" name="rooms" placeholder="Pièces">
							
								</div>
								<div class="row" data-search="floor">
									<input type="number" class="form-control col-lg-5" name="floor" placeholder="Etage">
							
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
														<input type="checkbox" name="alarm" autocomplete="off"><i
															class="far fa-bell"></i> Alarme
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" name="cellar" autocomplete="off"><i
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
													<label class="btn btn-info">
														<input type="checkbox" name="alarm" autocomplete="off"><i
															class="far fa-bell"></i> Alarme
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" name="elevator" autocomplete="off"><i
															class="far fa-building"></i> Ascenseur
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" name="balcony" autocomplete="off"><i
															class="fas fa-seedling"></i> Balcon
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
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
													<label class="btn btn-info">
														<input type="checkbox" name="garage" autocomplete="off"><i
															class="fas fa-car"></i>
														Garage
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" name="intercom" autocomplete="off"><i
															class="fab fa-intercom"></i> Intercom
													</label>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
														<input type="checkbox" name="parking" autocomplete="off"><i
															class="fas fa-parking"></i>
														Parking
													</label>
												</div>
											</div>
											<div class="col-lg-6 text-center">
												<div class="btn-group-toggle" data-toggle="buttons">
													<label class="btn btn-info">
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
	
<!-- ----------------------------------------------- -->						
	<div class="col-lg-12" data-option="options">
									<div class="row">
										<div class="col-lg-12 text-center optiontitle">
											Options
										</div>
									</div>
			
	
			<!-- une ligne de formulaire-->
			<div class="row">
				<div class="col-lg-12 form-group">
					<label>La description du bien *</label>
					<textarea class="form-control" name="description" id="description" maxlength="2000" minlength="100" required></textarea>
				</div>
			</div>	
			<!--fin ligne de formulaire-->	

		
			<!---->
			<div class="row">
				<div class="col-lg-12 form-group">
					<label>Prix*</label>
					<input type="number" class="form-control" name="price" id="price" placeholder="0" required >
				</div>
			</div>
			<!---------->
			<div class="row">
				<div class="col-lg-12 form-group">
					<label>Surface*</label>
					<input type="number" class="form-control" name="area" id="area"  placeholder="0" required >
				</div>
			</div>	
			<!---------->
			<div class="row">
				<div class="col-lg-12 form-group">
					<label>chambres*</label>
					<input type="number" class="form-control"  name="rooms" id="rooms" placeholder="0" required >
				</div>
			</div>
				
	
		<div class="row">
			<div class="col-lg-12 form-group">		

		<label>Etages</label> 
		<input  class="form-control"type="number" name="floor">
	
			
	</div>
	</div>	
		<div>
				<input type="submit" class="col-lg-12 btn btn-primary" value="Envoyé">

		</div>
		
		</div>
	</form>
</div>

	<!-- PIED-PAGE/FOOTER -->
	<%@ include file="footer.jsp" %>

</body>
</html>





