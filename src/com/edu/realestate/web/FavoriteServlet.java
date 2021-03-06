package com.edu.realestate.web;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.edu.realestate.services.FavoriteService;

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
		ServletContext context = getServletContext();
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);
		service = ctx.getBean(FavoriteService.class);
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

		if (request.getParameter("favoriteId") == null) {
			service.addFavAds(
					(String)request.getSession().getAttribute("username"),
					Integer.parseInt(request.getParameter("advertisementId")),
					Integer.parseInt(request.getParameter("priority")),
					request.getParameter("comments"));
		} else {
			service.removeFavAd(Integer.parseInt(request.getParameter("favoriteId")));
		}

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
