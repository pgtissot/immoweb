package com.edu.realestate.ws;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import com.edu.realestate.exceptions.RealEstateException;
import com.edu.realestate.model.Advertisement;
import com.edu.realestate.model.RealEstateType;
import com.edu.realestate.model.SearchCriteria;
import com.edu.realestate.model.TransactionType;
import com.edu.realestate.services.AdvertisementService;
import com.edu.realestate.services.AdvertisementServiceImpl;
import com.edu.realestate.services.ReferenceService;
import com.edu.realestate.services.ReferenceServiceImpl;
import com.google.gson.Gson;

@Path("/search")
public class AdvertisementResource {

	AdvertisementService adService = new AdvertisementServiceImpl();
	ReferenceService refService = new ReferenceServiceImpl();
	
	@GET
	@Path("{advertisementId}")
	public String findAdvertisementById(@PathParam("advertisementId") String id) throws RealEstateException {
	
		Advertisement ad = adService.findAdvertisementById(Integer.parseInt(id));
		return ad.toString();
		
	}
	
	
	@POST
	@Consumes("application/x-www-form-urlencoded")
	@Produces("application/json")
	public String findAdsByCriteria(@FormParam("cityId") int cityId,
									@FormParam("realestate") String realEstate,
									@FormParam("transactionType") String transactionType,
									@DefaultValue("0") @FormParam("area-min") int areaMin,
									@DefaultValue("0") @FormParam("area-max") int areaMax,
									@DefaultValue("0") @FormParam("price-min") int priceMin,
									@DefaultValue("0") @FormParam("price-max") int priceMax
									) throws RealEstateException {
	
		SearchCriteria sc = new SearchCriteria();
		sc.setRealEstateType(RealEstateType.valueOf(realEstate));

		if (transactionType != null)
			sc.setTransactionType(TransactionType.valueOf(transactionType));

		if (cityId != 0)
			sc.setCityId(cityId);
		
		sc.setAreaMin(areaMin);
		sc.setAreaMax(areaMax);
		sc.setPriceMin(priceMin);
		sc.setPriceMax(priceMax);
		
		List<Advertisement> lads = refService.findAdsByCriteria(sc);
		System.out.println(lads);
		return new Gson().toJson(lads);
		
	}

}
