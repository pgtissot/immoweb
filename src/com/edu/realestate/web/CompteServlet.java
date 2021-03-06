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

import com.edu.realestate.model.Favorite;
import com.edu.realestate.model.User;
import com.edu.realestate.services.FavoriteService;
import com.edu.realestate.services.UserService;

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
		ServletContext context = getServletContext();
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(context);
		us = ctx.getBean(UserService.class);
		fs = ctx.getBean(FavoriteService.class);
	}
	
	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		us = null;
		fs = null;
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
		request.setAttribute("moderator", user.getClass().getSimpleName().equals("Moderator") ? true : false);
		request.setAttribute("listFavs", favs);		
		getServletContext().getRequestDispatcher("/compte.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
