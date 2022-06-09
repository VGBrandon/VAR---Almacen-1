<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cuadro de Requerimiento</title>
<%@ include file="Snippets/BooststrapEstyles.jsp"%>
<link href="Estyles/ModalGenerarCuadroRqmts.css" rel="stylesheet">
</head>
<style>
	.tbodyDiv{
		max-height: clamp(30vh,10vh,250px);
		overflow: auto;
    }
    .tbodyDetalle{
    	max-height: clamp(60vh,10vh,250px);
		overflow: auto;
    }
</style>
<body>
	<%@ include file="Snippets/Encabezado.jsp" %>
	<div class="dashboard_content">
		<%@ include file="Snippets/MenuLateral.jsp" %>
		<section class="generarRequ">
			<h3 class="text-center">Cuadros de Requerimientos</h3>
			<div class="mt-4">
				<div class="card">
				  <div class="card-header bg-warning">
				    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="btnGenerar">GENERAR</button>
				  </div>
				  <div class="card-body">
				    	<table id="tableRequerimientos" class="table table-striped table-bordered">
						     <thead>
						        <tr>
								<th width="5%">NRO</th>
								<th width="10%">DNI</th>
								<th width="50%">REMITENTE</th>
								<th width="15%">ESTADO</th>
								<th width="15%">FECHA</th>
								</tr>
							</thead>
							<tbody>
								<tr>
				                <td>000014</td>
				                <td>Lorem Ipsum</td>
				                <td>Lorem Ipsum</td>
				                <td>Lorem Ipsum</td>
				                <td>10/12/2022</td>
				                </tr>
							</tbody>
						</table>
				  </div>
				</div>
			</div>
			<!-- MODAL PRINCIPAL - GENERAR CUADRO DE REQUERIMIENTOS -->
			<div class="modal" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="false">
			<div class="modal-dialog modal-xl modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title text-white" id="staticBackdropLabel">Nuevo Cuadro de Requerimiento</h5>
						<button type="button" class="btn-close" aria-label="Close" data-bs-dismiss="modal">�</button>
					</div>
					<div class="modal-body">
						<form id="form-generarCuadroRqmt" method="post" action="" class="grid-formCuadroRqrmt">
							<div class="form-group input-group-sm">
								<label for="exampleInputEmail1" class="form-label">N�mero</label>
								<input type="text" class="form-control" name="numero"
									id="idNumero" readonly>
							</div>
							<div class="form-group input-group-sm">
									<label for="exampleInputEmail1" class="form-label">Fecha de Emisi�n</label>
									<input type="date" class="form-control" name="fecha"
										id="idFecha" readonly>
							</div>
							<div class="modal-body__block-responsable">
								<img class="modal-body__perfil grid-perfil-responsable" src="img/perfil.png">
								<div class="form-group input-group-sm">
									<label for="exampleInputEmail1" class="form-label">C�digo</label>
									<input type="text" class="form-control" name="codigoUsuario"
										id="idCodigoUsuario" readonly>
								</div>
								<div class="form-group grid-responsable input-group-sm">
									<label for="exampleInputEmail1" class="form-label"> Nombres </label>
									<input type="text" class="form-control" name="responsable"
										id="idResponsable" readonly>
								</div>
								<div class="input-group input-group-sm mb-3  grid-unidadOrganica">
									<span class="input-group-text" id="inputGroup-sizing-sm">De:</span>
									<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" name="responsable"
										id="idResponsable" readonly>
								</div>
							</div>
							<div class="modal-body__block-destinatario">
								<div class="input-group input-group-sm mb-3  grid-destinario">
									<span class="input-group-text" id="inputGroup-sizing-sm">Destinatario:</span>
									<!-- Button Modal -->
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#idBuscarTrabajador" id="btnBuscarTrabajador">+</button>
									<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" name="CodDestinatario"
										id="idCodDestinatario" readonly>
								</div>
								<div class="input-group input-group-sm mb-3  grid-destinario">
									<span class="input-group-text" id="inputGroup-sizing-sm">Nombre:</span>
									<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" name="nombreDestinatario"
										id="idNombreDestinatario" readonly>
								</div>
								<div class="input-group input-group-sm mb-3  grid-destinario">
									<span class="input-group-text" id="inputGroup-sizing-sm">De:</span>
									<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" name="unidadOrgDestinatario"
										id="idUnidadOrgDestinatario" readonly>
								</div>
								<img class="modal-body__perfil grid-perfil-destinatario" src="img/trabajador.png">
							</div>
							<div class="modal-body__block-table-bienes tbodyDiv">
								<table id="example" class="table table-bordered text-center table-sm table-hover" style="width: 100%">
									<thead class="table-light sticky-top">
										<tr>
											<th width="5%">C�DIGO</th>
											<th>DESCRIPCION</th>
											<th width="5%"></th>
										</tr>
									</thead>
									<tbody>
											<tr>
												<td>1</td>
												<td>Pantalones Jeans</td>
												<td><button type="button" class="btn btn-success"
														data-bs-toggle="modal" data-bs-target="#staticBackdrop">+</button></td>
											</tr>
									</tbody>
								</table>
			                </div>
			                <div class="form-group input-group-sm mt-5">
									<label for="exampleInputEmail1" class="form-label">Cantidad a solicitar</label>
									<input type="text" class="form-control" name="cantidad"
										id="idCantidad">
							</div>
							<div class="modal-body__block-table-detalle tbodyDetalle">
								<table id="example" class="table table-bordered text-center table-sm" style="width: 100%">
									<thead class="table-danger sticky-top">
										<tr>
											<th width="5%">C�DIGO</th>
											<th>DESCRIPCION</th>
											<th>UNIDAD DE MEDIDA</th>
											<th>CANTIDAD</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
											<tr>
												<td>1</td>
												<td>Pantalones Jeans</td>
												<td>UNIDAD</td>
												<td>15</td>
												<td><button type="button" class="btn btn-primary"
														data-bs-toggle="modal" data-bs-target="#staticBackdrop">X</button></td>
											</tr>
									</tbody>
								</table>
			                </div>
							<div class="modal-footer d-flex justify-content-center">
									<button type="submit" class="btn btn-success">Generar</button>
									<button type="button" class="btn btn-danger">Limpiar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- FIN DE MODAL PRINCIPAL -->
		<!-- MODAL BUSCAR TRABAJADOR -->
		<div class="modal fade" id="idBuscarTrabajador" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">BUSCAR TRABAJADOR</h5>
		      </div>
		      <div class="grid_buscarTrabajador">
		      			<div class="table-buscarTrabajador tbodyDetalle">
							<table id="tblBuscarTrabajador" class="table table-bordered text-center table-sm table-hover" style="width: 100%">
								<thead class="table-danger sticky-top">
									<tr>
										<th width="10%">DNI</th>
										<th>NOMBRE Y APELLIDOS</th>
										<th>UNIDAD ORGANICA</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
		                </div>
				        <form id="idBuscar" method="post" action="" class="criterios_Trabajador">
				        	<div class="form-group input-group-sm">
								<label for="exampleInputEmail1" class="form-label"> DNI </label>
								<input type="text" class="form-control" name="dniTrabajador"
									id="idDniTrabajador">
							</div>
							<div class="form-group input-group-sm">
								<label for="exampleInputEmail1" class="form-label"> Nombre y apellidos </label>
								<input type="text" class="form-control" name="nombreTrabajador"
									id="idNombreTrabajador">
							</div>
							<div class="form-group input-group-sm">
								<label for="exampleInputEmail1" class="form-label"> Unidad Organica </label>
								<select class="form-select"  name="unidadorganica" id="idUnidadOrganica">
				   	  				<option value="">[Todos]</option>
								</select>
							</div>
						    	<button type="button" class="btn btn-danger" id="btnBuscar">Buscar</button>
				            	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="btnRegresar">Regresar</button>
						</form>
		      </div>		     
		    </div>
		  </div>
		</div>
	</div>
	<!-- FIN DE MODAL BUSCAR TRABAJADOR -->
<%@ include file="Snippets/BooststrapJS.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		leerCondicionJSON();
		$('#idBuscar').bootstrapValidator({
			fields:{
				dniTrabajador:{
					validators:{
						regexp:{
				 			regexp:/^(\d{8})$/,
				 			message:'Debe tener 8 digitos'
				 		}
					}
				},
				nombreTrabajador:{
					validators:{
						regexp:{
				 			regexp:/^[a-zA-Z�-�\u00f1\u00d1 ]{3,30}$/,
				 			message:'Campo Nombre hasta 30 digitos alfabeticos'
				 		}
					}
				}
			}
		});
	});
	
	function leerCondicionJSON(){
		$.get("ServletCondicionJSON?comboBox=UO",function(response){
			$.each(response,function(index,item){ 
				$("#idUnidadOrganica").append("<option value='"+item.nombre+"'>"+item.nombre+"</option>");
			})
		})
	}
	$(document).on("click","#btnBuscar", function(){
		let dni,nomApe,unidadOrg;
		dni = $("#idDniTrabajador").val();
		nomApe = $("#idNombreTrabajador").val();
		unidadOrg = $("#idUnidadOrganica").val();
		$("#tblBuscarTrabajador tbody").empty();
		$.get("ServletTrabajadorJSON?dni="+dni+"&nomApe="+nomApe+"&unidadOrg="+unidadOrg, function(response){
			$.each(response, function(index,item){
    			$("#tblBuscarTrabajador").append("<tr><td>"+item.dni+"</td><td>"+item.nomApe+"</td><td>"+
    										item.codUnidadOrga+"</td><td><button id='btnCodTrab' type='button' data-bs-toggle='modal' data-bs-target='#staticBackdrop' class='btn btn-success btn-codTrab' value='"+item.codTrab+"'>"+item.codTrab+"</button></td></tr>");
    		})
		})
	});
	
	$(document).on("click",".btn-codTrab",function(){
		let cod, nom, uni;
		cod = $(this).val();
		nom = $(this).parents("tr").find("td")[1].innerHTML;
		uni = $(this).parents("tr").find("td")[2].innerHTML;
		$("#idCodDestinatario").val(cod);
		$("#idNombreDestinatario").val(nom);
		$("#idUnidadOrgDestinatario").val(uni);
	});
	
	$(document).on("click","#btnRegresar",function(){
		//limpiar controles del formularios
		$("#idBuscar").trigger("reset");
		$("#idBuscar").data("bootstrapValidator").resetForm(true);
		$("#tblBuscarTrabajador tbody").empty();
	})
	$(document).on("click","#btnCodTrab",function(){
		//limpiar controles del formularios
		$("#idBuscar").trigger("reset");
		$("#idBuscar").data("bootstrapValidator").resetForm(true);
		$("#tblBuscarTrabajador tbody").empty();
	})
</script>
</body>
</html>