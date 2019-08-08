package com.edu.realestate.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.realestate.exceptions.RealEstateException;
import com.edu.realestate.model.Advertisement;
import com.edu.realestate.model.RealEstateType;
import com.edu.realestate.model.SearchCriteria;
import com.edu.realestate.model.TransactionType;
import com.edu.realestate.services.ReferenceService;
import com.edu.realestate.services.ReferenceServiceImpl;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReferenceService service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		service = new ReferenceServiceImpl();
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		service = null;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SearchCriteria sc = null;
		RealEstateType re = null;
		
		System.out.println(request.getParameter("sort"));
		
		try {
			sc = new SearchCriteria();
			re = RealEstateType.valueOf(request.getParameter("realestate"));
			sc.setRealEstateType(re);

			if (request.getParameter("transactionType") != null)
				sc.setTransactionType(TransactionType.valueOf(request.getParameter("transactionType")));

			if (request.getParameter("cityId") != null && !request.getParameter("cityId").equals(""))
				sc.setCityId(Integer.parseInt(request.getParameter("cityId")));

			if (request.getParameter("distance") != null && !request.getParameter("distance").equals(""))
				sc.setDistance(Integer.parseInt(request.getParameter("distance")));

			if (request.getParameter("area-min") != null && !request.getParameter("area-min").equals(""))
				sc.setAreaMin(Integer.parseInt(request.getParameter("area-min")));

			if (request.getParameter("area-max") != null && !request.getParameter("area-max").equals(""))
				sc.setAreaMax(Integer.parseInt(request.getParameter("area-max")));

			if (request.getParameter("price-min") != null && !request.getParameter("price-min").equals(""))
				sc.setPriceMin(Integer.parseInt(request.getParameter("price-min")));

			if (request.getParameter("price-max") != null && !request.getParameter("price-max").equals(""))
				sc.setPriceMax(Integer.parseInt(request.getParameter("price-max")));

			if (request.getParameter("land-min") != null && !request.getParameter("land-min").equals(""))
				sc.setLandMin(Integer.parseInt(request.getParameter("land-min")));

			if (request.getParameter("land-max") != null && !request.getParameter("land-max").equals(""))
				sc.setLandMax(Integer.parseInt(request.getParameter("land-max")));
			
			if (request.getParameter("rooms-min") != null && !request.getParameter("rooms-min").equals(""))
				sc.setRoomsMin(Integer.parseInt(request.getParameter("rooms-min")));

			if (request.getParameter("rooms-max") != null && !request.getParameter("rooms-max").equals(""))
				sc.setRoomsMax(Integer.parseInt(request.getParameter("rooms-max")));
			
			sc.setAlarm(request.getParameter("alarm") != null && request.getParameter("alarm").equals("on"));
			sc.setCellar(request.getParameter("cellar") != null && request.getParameter("cellar").equals("on"));
			sc.setSwimmingPool(request.getParameter("swimmingPool") != null && request.getParameter("swimmingPool").equals("on"));
			sc.setElevator(request.getParameter("elevator") != null && request.getParameter("elevator").equals("on"));
			sc.setBalcony(request.getParameter("balcony") != null && request.getParameter("balcony").equals("on"));
			sc.setDigicode(request.getParameter("digicode") != null && request.getParameter("digicode").equals("on"));
			sc.setGarage(request.getParameter("garage") != null && request.getParameter("garage").equals("on"));
			sc.setIntercom(request.getParameter("intercom") != null && request.getParameter("intercom").equals("on"));
			sc.setParking(request.getParameter("parking") != null && request.getParameter("parking").equals("on"));
			sc.setTerrace(request.getParameter("terrace") != null && request.getParameter("terrace").equals("on"));

			if (request.getParameter("energyLevel") != null)
				sc.setEnergyLevel(request.getParameter("energyLevel").charAt(0));
				
			if (request.getParameter("gasLevel") != null)
				sc.setEnergyLevel(request.getParameter("gasLevel").charAt(0));
			
			System.out.println(sc);
			
			sc.setLimit(20);
			
		} catch (Exception e) {
			response.sendError(422, "Problème de paramètre");
		}

		List<Advertisement> lads = new ArrayList<>();
		try {
			lads = service.findAdsByCriteria(sc);
			//TODO : maybe, add the YelpSearch call

		} catch (RealEstateException ree) {
			response.sendError(500, "Problème inattendu côté serveur");
		}

		request.setAttribute("searchRequest", request);
		request.setAttribute("listAds", lads);
		request.setAttribute("realEstate", re);
		request.setAttribute("countAds", lads.size());

		getServletContext().getRequestDispatcher("/resultat.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
