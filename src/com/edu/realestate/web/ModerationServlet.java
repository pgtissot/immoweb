package com.edu.realestate.web;

import java.io.IOException;
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

import com.edu.realestate.model.AdStatus;
import com.edu.realestate.model.Advertisement;
import com.edu.realestate.services.AdvertisementService;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/moderation")
public class ModerationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdvertisementService service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModerationServlet() {
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
		service = ctx.getBean(AdvertisementService.class);
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
			if (request.getParameter("refusedComment") == null)
				service.validateAdvertisement(Integer.parseInt(request.getParameter("advertisementId")));
			else
				service.refuseAdvertisement(Integer.parseInt(request.getParameter("advertisementId")), request.getParameter("refusedComment"));

			List<Advertisement> pendingAds = null;
			pendingAds = service.findAdvertisementsByStatus(AdStatus.Pending);
			request.setAttribute("listAds", pendingAds);
		} catch (Exception e) {
			response.sendError(500, "Problème inattendu côté serveur");
		}

		getServletContext().getRequestDispatcher("/moderation.jsp").forward(request, response);

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
