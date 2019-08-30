package com.edu.realestate.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.edu.realestate.exceptions.RealEstateException;
import com.edu.realestate.model.Advertisement;
import com.edu.realestate.model.Favorite;
import com.edu.realestate.model.RealEstateType;
import com.edu.realestate.model.SearchCriteria;
import com.edu.realestate.services.AdvertisementService;
import com.edu.realestate.services.FavoriteService;
import com.edu.realestate.services.ReferenceService;
import com.edu.realestate.yelp.YelpResult;
import com.google.gson.Gson;

/**
 * Servlet implementation class City
 */
@WebServlet("/adNumber")
public class AdNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdvertisementService adService;
	private FavoriteService favService;
	private ReferenceService refService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdNumberServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ServletContext context = getServletContext();
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);
		adService = ctx.getBean(AdvertisementService.class);
		favService = ctx.getBean(FavoriteService.class);
		refService = ctx.getBean(ReferenceService.class);
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		adService = null;
		favService = null;
		refService = null;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> list = new ArrayList<>();

		try {
			boolean exact = (request.getParameter("exact") != null && request.getParameter("exact").equals("1"));
			list = adService.findAdNumbers(request.getParameter("input"), exact);
			response.getWriter().append(new Gson().toJson(list));
		} catch (RealEstateException e) {
			e.printStackTrace();
			response.sendError(500, "Problème inattendu côté serveur");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SearchCriteria sc = null;

		try {
			String adNumber = request.getParameter("adNumber");
			Advertisement ad = adService.findAdvertisementByNumber(adNumber);
			request.setAttribute("ad", ad);
			
			String username = (String)request.getSession().getAttribute("username");
			Favorite favorite = favService.getFavByAdId(username, ad.getId());
			request.setAttribute("favorite", favorite);

			YelpResult yelpResult = adService.findYelpData(ad.getRealEstate().getCity());
			request.setAttribute("yelpResult", yelpResult);

			sc = new SearchCriteria();
			sc.setCityId(ad.getRealEstate().getCity().getId());
			sc.setRealEstateType(RealEstateType.valueOf(ad.getRealEstate().getType()));
			sc.setTransactionType(ad.getTransactionType());
			sc.setExclude(ad.getId());
			sc.setLimit(3);

			List<Advertisement> lads = refService.findAdsByCriteria(sc);
			request.setAttribute("listAds", lads);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500, "Problème inattendu côté serveur");
		}

		getServletContext().getRequestDispatcher("/detail.jsp").forward(request, response);
	}

}
