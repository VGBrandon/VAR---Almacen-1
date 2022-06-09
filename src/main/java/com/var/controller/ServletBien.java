package com.var.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.time.LocalDate; 

import com.var.dao.MySqlBienesDAO;
import com.var.entidad.Bien;


/**
 * Servlet implementation class ServletBien
 */
@WebServlet("/ServletBien")
public class ServletBien extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MySqlBienesDAO bienesDAO;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBien() {
        super();
        bienesDAO = new MySqlBienesDAO();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("tipo");
		if(accion.equals("LISTAR")) 
			listarBienes(request, response);
			else if(accion.equals("REGISTRAR"))
				registrarBien(request,response);
			else if(accion.equals("ELIMINAR"))
				eliminarBien(request,response);
		
	}
	
		
	private void eliminarBien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//recuperar el c�digo a eliminar
			String cod;
			cod=request.getParameter("codigoEliminar");
			//invocar al m�todo deleteById y enviar la variable cod
			int salida;
			salida=bienesDAO.deleteById(Integer.parseInt(cod));
			//
			if(salida>0) {
				//crear atributo MENSAJE
				request.setAttribute("MENSAJE", "Bien eliminado...");
				//
				//request.getRequestDispatcher("/Proveedor.jsp").forward(request, response);
				listarBienes(request,response);
			}
			else {
				//crear atributo MENSAJE
				request.setAttribute("MENSAJE", "El Bien esta en uso...");
				//
				//request.getRequestDispatcher("/Proveedor.jsp").forward(request, response);
				listarBienes(request,response);
			}
			
	}	

	private void registrarBien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//variables
		String codBien,descripcion,unidMed,precUni,idCategoria,stockDisponible,fecIngreso;
		//leer los controles del formulario que se encuentra en la p�gina Bienes.jsp "usar el name de cada control"
		codBien=request.getParameter("codigo");
		descripcion=request.getParameter("descripcion");
		unidMed=request.getParameter("unidadmedida");
		precUni=request.getParameter("precio");
		idCategoria=request.getParameter("categoria");
		stockDisponible=request.getParameter("stock");
		fecIngreso=request.getParameter("fechaingreso");
		//crear un objeto de la clase Proveedor
		Bien bean=new Bien();
		//setear objeto con las variables
		bean.setDescBien(descripcion);
		bean.setUniMed(unidMed);
		bean.setPrecUni(Double.parseDouble(precUni));
		bean.setCategoria(idCategoria);
		bean.setStockDisponible(Integer.parseInt(stockDisponible));
		bean.setFecIngreso(fecIngreso);
		//De aqui para abajo modificar
		//validar variable codigo bien (cambiar)
		if(Integer.parseInt(codBien)==0) {
			//invocar al m�todo save y enviar el objeto "bean"

			int salida;
			salida=bienesDAO.save(bean);
			if(salida>0) {
				//crear atributo MENSAJE
				request.setAttribute("MENSAJE", "Bienes registrado...");
				
				//request.getRequestDispatcher("/Bienes.jsp").forward(request, response);
				listarBienes(request,response);
			}
			else {
				//crear atributo MENSAJE
				request.setAttribute("MENSAJE", "Error en el registro...");
				
				//request.getRequestDispatcher("/Bienes.jsp").forward(request, response);
				listarBienes(request,response);
			}
		}
		else {
					
			//setear el atributo codigo
			bean.setCodBien(Integer.parseInt(codBien));
			//invocar al m�todo update y enviar el objeto "bean"
			int salida;
			salida=bienesDAO.update(bean);			
			if(salida>0) {
				//crear atributo MENSAJE
				request.setAttribute("MENSAJE", "Bien actualizado...");
				
				//request.getRequestDispatcher("/Bienes.jsp").forward(request, response);
				listarBienes(request,response);
			}
			else {
				//crear atributo MENSAJE
				request.setAttribute("MENSAJE", "Error en la actualizaci�n...");
				
				//request.getRequestDispatcher("/Bienes.jsp").forward(request, response);
				listarBienes(request,response);
			}
		}
		
	}

	private void listarBienes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Bien> lista = bienesDAO.listAll();
		//crear un atributo y guardar el valor de "lista"
		request.setAttribute("bienes", lista);
		//enviar atributo "bienes" a la p�gina Bienes.jsp
		request.getRequestDispatcher("/Bienes.jsp").forward(request, response);
	}
}
