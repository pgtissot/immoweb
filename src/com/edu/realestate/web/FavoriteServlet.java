package com.edu.realestate.web;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.realestate.services.FavoriteService;
import com.edu.realestate.services.FavoriteServiceImpl;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/favorite")
public class FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private FavoriteService service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FavoriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		service = new FavoriteServiceImpl();
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

//		service.addFavAds(request.getParameter("username"),
//					Integer.parseInt(request.getParameter("advertisementId")),
//					Integer.parseInt(request.getParameter("priority")),
//					request.getParameter("comments"));

		if (request.getParameter("favoriteId") == null) {
			service.addFavAds("pgthebest@blah.fr",
					Integer.parseInt(request.getParameter("advertisementId")),
					Integer.parseInt(request.getParameter("priority")),
					request.getParameter("comments"));
		} else {
			service.removeFavAds(Integer.parseInt(request.getParameter("favoriteId")));
		}

		request.setAttribute("advertisementId", request.getParameter("advertisementId"));
		
		getServletContext().getRequestDispatcher("/detail").forward(request, response);

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
