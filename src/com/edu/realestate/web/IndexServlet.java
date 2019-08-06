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
import com.edu.realestate.services.AdvertisementService;
import com.edu.realestate.services.AdvertisementServiceImpl;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/home")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdvertisementService service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		service = new AdvertisementServiceImpl();
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

		try {
			List<Advertisement> lads = service.findLatestAds(8);
			request.setAttribute("listAds", lads);
		} catch (Exception e) {
			response.sendError(500, "Problème inattendu côté serveur");
		}

		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
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
