package com.edu.realestate.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edu.realestate.model.Favorite;
import com.edu.realestate.model.User;
import com.edu.realestate.services.FavoriteService;
import com.edu.realestate.services.FavoriteServiceImpl;
import com.edu.realestate.services.UserService;
import com.edu.realestate.services.UserServiceImpl;

/**
 * Servlet implementation class CompteServlet
 */

@WebServlet("/compte")
public class CompteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us;
	FavoriteService fs;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public CompteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    

    /**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		us = new UserServiceImpl();
		fs = new FavoriteServiceImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("username");
		User user = us.read(username);
		List<Favorite> favs = new ArrayList<>();
		favs = fs.getFavByUser(username);
		request.setAttribute("user", user);		
		request.setAttribute("listFavs", favs);		
		getServletContext().getRequestDispatcher("/compte").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("username");
		String password = request.getParameter("newPassword");
		System.out.println(password);
		User user = us.read(username);
		user.setPassword(password);
		us.update(user);
		
		getServletContext().getRequestDispatcher("/logout").forward(request, response);		
	}

}
