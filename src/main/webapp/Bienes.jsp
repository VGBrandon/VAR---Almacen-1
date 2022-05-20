<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bienes</title>
	<%@ include file="Snippets/BooststrapEstyles.jsp" %>

</head>
<body>
	<div class="container">
		<h1 class="text-center mt-5">BIENES</h1>
			<c:if test="${requestScope.MENSAJE!=null}">
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
				  <strong>MENSAJE : </strong> ${requestScope.MENSAJE}
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</c:if>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		  Registrar un BIEN
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">BIEN</h5>
		      </div>
		      <div class="modal-body">
		        <form id="idRegistrar" method="post" action="ServletBien?tipo=REGISTRAR">
		           <div class="form-group">
				    <label for="exampleInputEmail1" class="form-label">Codigo</label>
				    <input type="text" class="form-control" name="codigo" id="idCodigo" readonly value="0">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputEmail1" class="form-label">Descripcion</label>
				    <input type="text" class="form-control" name="descripcion" id="idDescripcion">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1" class="form-label">Unidad Medida</label>
				   <select class="form-select"  name="unidadmedida" id="idUnidadmedida">
				   	  <option value="">Seleccione Unidad de Medida</option>
				   	  <option value="UNIDAD">UNIDAD</option>
				   	  <option value="KILO">KILO</option>				   	
					</select>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1" class="form-label">Precio Unit.</label>
				   	<input type="text" class="form-control"  name="precio" id="idPrecio">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1" class="form-label">Categoria</label>
				   <select class="form-select"  name="categoria" id="idCategoria">
				   	  <option value="">Seleccione Categoria</option>
				   	  
					</select>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1" class="form-label">Stock Disponible</label>
				   <input type="text" class="form-control"  name="stock" id="idStock">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1" class="form-label">Fecha </label>
				   <input type="text" class="form-control"  name="fecha" id="idFecha"  value="">
				  </div>
				   <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" id="btn-cerrar" data-bs-dismiss="modal">Cerrar</button>
			        <button type="submit" class="btn btn-primary">Grabar</button>
			      </div>	
				</form>
		      </div>		     
		    </div>
		  </div>
		</div>
			
		<!-- modal para eliminar -->
		<div class="modal fade" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">ELIMINAR</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form method="post" action="ServletBien?tipo=ELIMINAR">
				    <input type="hidden" class="form-control" id="idCodigoEliminar" name="codigoEliminar">
				   <h4>Seguro de eliminar registro?</h4>
				   <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
			        <button type="submit" class="btn btn-primary">SI</button>
			      </div>				  
				  
				</form>
		      </div>		     
		    </div>
		  </div>
		</div>
		
		<div class="mt-3">
			<table id="example" class="table table-striped" style="width:100%">
		        <thead>
		            <tr>
		                <th>CÓDIGO</th>
		                <th>DESCRIPCION</th>
		                <th>UNIDAD MEDIDA</th>
		                <th>PRECIO</th>
		                <th>CATEGORIA</th>
		                <th>STOCK</th>
		                <th>FECHA INGRESO</th>
		                <th></th>
		                <th></th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach items="${requestScope.bienes}" var="row">
			            <tr>
			                <td>${row.codBien}</td>
			                <td>${row.descBien}</td>
			                <td>${row.uniMed}</td>
			                <td>${row.precUni}</td>
			                <td>${row.categoria}</td>
			                <td>${row.stockDisponible}</td>
			                <td>${row.fecIngreso}</td>
			                <td><button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar</button></td>
			                <td><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modalEliminar">Eliminar</button></td>
			            </tr>
			        </c:forEach>
		        </tbody>
	    	</table>		
		</div>
	</div>
	<%@ include file="Snippets/BooststrapJS.jsp" %>
	<script>
		$(document).ready(function() {
		    $('#example').DataTable();
		    $('#idRegistrar').bootstrapValidator({      
	        	 fields:{
	        		 descripcion:{
	        			 	validators:{
	        			 		notEmpty:{
	        			 			message:'Campo descripcion es obligatorio'	
	        			 		},
	         			 		regexp:{
	        			 			regexp:/^.{1,50}$/,
	        			 			message:'Campo de 50 caracteres'
	        			 		}
	        			 	}
	        		 },    
	        		 precio:{
	     			 	validators:{
	     			 		notEmpty:{
	     			 			message:'Campo precio es obligatorio'	
	     			 		},
	     			 		regexp:{
	    			 			regexp:/^(\d{1,4}|\d{1,4}\.\d{1,2})$/,
	    			 			message:'Campo precio hasta 4 digitos enteros y 2 decimales'
	    			 		}
	     			 	}
	     		 	 },
	     		 	 stock:{
	     		 		 validators:{
	     		 			 notEmpty:{
	     		 				 message:'Campo stock es obligatorio'
	     		 			 },
	     		 			between:{
	     		 				 min:1,
	     		 				 max:850,
	     		 				message:'No debe superar 850'
	     		 			 }
	     		 		 }
	     		 	 }
	        	 }
	        }); 
		} );
		
		//asignar evento click a los botones con clase "btn-danger"
		$(document).on("click",".btn-danger",function(){
			//variable para almacenar el código del proveedor según el botón eliminar que se pulso
			let cod;
			cod=$(this).parents("tr").find("td")[0].innerHTML;
			$("#idCodigoEliminar").val(cod);
		})
		
		//asignar evento click a los botones con clase "btn-success"
		$(document).on("click",".btn-success",function(){
			//variables
			let codigo,desc,unim,pre,cate,stock,fecha;
			//leer las columnas de según el botón editar que se pulso
			codigo=$(this).parents("tr").find("td")[0].innerHTML;
			desc=$(this).parents("tr").find("td")[1].innerHTML;
			unim=$(this).parents("tr").find("td")[2].innerHTML;
			pre=$(this).parents("tr").find("td")[3].innerHTML;
			cate=$(this).parents("tr").find("td")[4].innerHTML;
			stock=$(this).parents("tr").find("td")[5].innerHTML;
			fecha=$(this).parents("tr").find("td")[6].innerHTML;

			//mostrar en las cajas del modal con id "staticBackdrop" los valores de las variables
			$("#idCodigo").val(codigo)
			$("#idDescripcion").val(desc);
			$("#idUnidadmedida").val(unim);
			$("#idPrecio").val(pre);
			$("#idCategoria").val(cate);
			$("#idStock").val(stock);
			$("#idFecha").val(fecha);

			
		})
		//asignar evento click al botón con id "btn-cerrar"
		$(document).on("click","#btn-cerrar",function(){
			//limpiar controles del formularios
			$("#idRegistrar").trigger("reset");
			$("#idRegistrar").data("bootstrapValidator").resetForm(true);
			$("#idCodigo").val("0");
		})
		
	</script>
</body>
</html>