<div class="modal fade" id="addFavoriteModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<section class="shadow">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-12 closeX">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true"><i class="far fa-window-close"></i></span>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 text-center sectiontitle">
							<i class="far fa-envelope"></i>
							Ajouter l'annonce <c:out value="${ad.adNumber}" /> aux favoris
						</div>
					</div>
					<form action="favorite" method="POST" id="addFavorite">
						<div class="row form-group">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg text-left">
										<label>Priorité (1 = minimum, 5 = maximum) :</label>
									</div>
								</div>
								<div class="row">
									<div class="col-lg text-center">
										<input type="range" class="custom-range" min="1" max="5" step="1" id="priority" name="priority">
										<output name="priorityValue" id="priorityValue" for="priority">3</output>
									</div>
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg text-left">
										<label>Message :</label>
									</div>
								</div>
								<div class="row">
									<div class="col-lg">
										<textarea class="form-control" name="comments" aria-label="comments" rows="10"
											aria-describedby="message"></textarea>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" id="advertisementId" name="advertisementId" value="<c:out value="${ad.id}" />">
						<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="Ajouter">
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
</div>


<div class="modal fade" id="removeFavoriteModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<section class="shadow">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-lg-12 closeX">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true"><i class="far fa-window-close"></i></span>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 text-center sectiontitle">
							<i class="far fa-envelope"></i>
							Retirer l'annonce <c:out value="${ad.adNumber}" /> des favoris
						</div>
					</div>
					<form action="favorite" method="POST" id="removeFavorite">
						<div class="row form-group">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg text-left">
										Confirmez-vous le retrait de cette annonce de vos favoris ?
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" id="advertisementId" name="advertisementId" value="<c:out value="${ad.id}" />">
						<input type="hidden" id="favoriteId" name="favoriteId" value="<c:out value="${favorite.id}" />">
						<div class="modal-footer">
							<input type="submit" class="btn btn-danger" value="Retirer">
							<input type="submit" class="btn btn-info" data-dismiss="modal" value="Annuler">
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
</div>