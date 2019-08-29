package com.edu.realestate.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.edu.realestate.services.AdvertisementService;

/**
 * Servlet implementation class City
 */
@WebServlet("/adsData")
public class AdsDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private AdvertisementService service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdsDataServlet() {
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String,Long> adsData = new HashMap<>();
		
		try {
			adsData = service.getAdvertisementsData();
			response.getWriter().append(adsData.toString());
		} catch (Exception e) {
			response.sendError(500, "Problème inattendu côté serveur");
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
