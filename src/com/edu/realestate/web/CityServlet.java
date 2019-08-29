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
import com.edu.realestate.model.City;
import com.edu.realestate.services.ReferenceService;
import com.google.gson.Gson;

/**
 * Servlet implementation class City
 */
@WebServlet("/city")
public class CityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReferenceService service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CityServlet() {
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
		service = ctx.getBean(ReferenceService.class);
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
		List<City> list = new ArrayList<>();
		response.setCharacterEncoding("UTF-8");

		try {
			boolean exact = (request.getParameter("exact") != null && request.getParameter("exact").equals("1"));
			list = service.findCitiesByName(request.getParameter("input"), exact);
			response.getWriter().append(new Gson().toJson(list));
		} catch (RealEstateException e) {
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
