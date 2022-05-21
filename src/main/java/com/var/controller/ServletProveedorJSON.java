package com.var.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.var.dao.MySqlProveedorDAO;
import com.var.entidad.Proveedor;

/**
 * Servlet implementation class ServletProveedorJSON
 */
@WebServlet("/ServletProveedorJSON")
public class ServletProveedorJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MySqlProveedorDAO proveedorDAO; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletProveedorJSON() {
        super();
        proveedorDAO = new MySqlProveedorDAO();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codigo = request.getParameter("codigo");
		Proveedor data = proveedorDAO.findById(Integer.parseInt(codigo)); 
		
		Gson gson=new Gson();
		String json = gson.toJson(data);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter salida=response.getWriter();
		salida.println(json);
	}

}
