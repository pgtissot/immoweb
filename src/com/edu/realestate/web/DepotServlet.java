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

import com.edu.realestate.model.Advertisement;
import com.edu.realestate.model.AdvertisementModel;
import com.edu.realestate.model.RealEstateType;
import com.edu.realestate.model.TransactionType;
import com.edu.realestate.services.AdvertisementService;

/**
 * Servlet implementation class CompteServlet
 */

@WebServlet("/depot")
public class DepotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdvertisementService service;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public DepotServlet() {
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
		getServletContext().getRequestDispatcher("/depot.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {

			AdvertisementModel am = new AdvertisementModel(
					(String)request.getSession().getAttribute("username"),
					TransactionType.valueOf(request.getParameter("transactionType")),
					request.getParameter("title"),
					RealEstateType.valueOf(request.getParameter("realestate")),
					Integer.parseInt(request.getParameter("cityId")),
					Integer.parseInt(request.getParameter("price")),
					Short.parseShort(request.getParameter("area")),
					!request.getParameter("landArea").equals("") ? Integer.parseInt(request.getParameter("landArea")) : 0,
					!request.getParameter("rooms").equals("") ? Integer.parseInt(request.getParameter("rooms")) : 0,
					request.getParameter("floor"),
					request.getParameter("description"),
					null,
					request.getParameter("cellar") != null ? request.getParameter("cellar").equals("on") : false,
					request.getParameter("alarm") != null ? request.getParameter("alarm").equals("on") : false,
					request.getParameter("swimmingPool") != null ? request.getParameter("swimmingPool").equals("on") : false,
					request.getParameter("elevator") != null ? request.getParameter("elevator").equals("on") : false,
					request.getParameter("intercom") != null ? request.getParameter("intercom").equals("on") : false,
					request.getParameter("balcony") != null ? request.getParameter("balcony").equals("on") : false,
					request.getParameter("terrace") != null ? request.getParameter("terrace").equals("on") : false,
					request.getParameter("garage") != null ? request.getParameter("garage").equals("on") : false,
					request.getParameter("parking") != null ? request.getParameter("parking").equals("on") : false,
					request.getParameter("digicode") != null ? request.getParameter("digicode").equals("on") : false,
					request.getParameter("energyLevel"),
					request.getParameter("gasLevel")
					);
					
			Advertisement ad = service.createAdFromModel(am);
			service.placeAdvertisement(ad);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500, "Problème inattendu côté serveur");
		}

		getServletContext().getRequestDispatcher("/home").forward(request, response);

	}
	

}
