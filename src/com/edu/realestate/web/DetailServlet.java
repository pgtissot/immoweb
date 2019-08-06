package com.edu.realestate.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.realestate.model.Advertisement;
import com.edu.realestate.model.RealEstateType;
import com.edu.realestate.model.SearchCriteria;
import com.edu.realestate.services.AdvertisementService;
import com.edu.realestate.services.AdvertisementServiceImpl;
import com.edu.realestate.services.ReferenceService;
import com.edu.realestate.services.ReferenceServiceImpl;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdvertisementService adService;
	private ReferenceService refService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		adService = new AdvertisementServiceImpl();
		refService = new ReferenceServiceImpl();
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		adService = null;
		refService = null;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SearchCriteria sc = null;

		try {
			String id = request.getParameter("advertisementId");
			Advertisement ad = adService.findAdvertisementById(id);
			request.setAttribute("ad", ad);

			sc = new SearchCriteria();
			sc.setCityId(ad.getRealEstate().getCity().getId());
			sc.setRealEstateType(RealEstateType.valueOf(ad.getRealEstate().getType()));
			sc.setTransactionType(ad.getTransactionType());

			if (request.getParameter("advertisementId") != null)
				sc.setExclude(Integer.parseInt(request.getParameter("advertisementId")));

			sc.setLimit(3);

			List<Advertisement> lads = refService.findAdsByCriteria(sc);
			request.setAttribute("listAds", lads);

		} catch (Exception e) {
			response.sendError(500, "Problème inattendu côté serveur");
		}

		getServletContext().getRequestDispatcher("/detail.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
