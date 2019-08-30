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

import com.edu.realestate.model.User;
import com.edu.realestate.services.UserService;

/**
 * Servlet implementation class CompteServlet
 */

@WebServlet("/dataModify")
public class DataModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public DataModifyServlet() {
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
		String username = (String) request.getSession().getAttribute("username");
		String password = request.getParameter("newPassword");
		User user = us.read(username);
		user.setPassword(password);
		us.update(user);
		
		getServletContext().getRequestDispatcher("/logout").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
