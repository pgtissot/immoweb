package com.edu.realestate.web;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.realestate.model.Advertiser;
import com.edu.realestate.model.Moderator;
import com.edu.realestate.services.UserService;
import com.edu.realestate.services.UserServiceImpl;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService us;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    

    /**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		us = new UserServiceImpl();
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		us = null;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("genre");
		String firstName = request.getParameter("nom");
		String lastName = request.getParameter("prenom");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");

		String name = request.getParameter("name");
		String ut = request.getParameter("user_type");
		
		try {
			if (ut.equals("A")) {
		
			Advertiser ad = new Advertiser(username, password, title, firstName, lastName, phone);
			us.register(ad);
			
			
			}
			
			if (ut.equals("M")) {
				Moderator md = new Moderator(username, password, name);
				us.register(md);
			
				
			}
			
			request.getSession().setAttribute("username", username);
			
			getServletContext().getRequestDispatcher("/compte").forward(request, response);		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
