object asociacionDeProfesionalesDelLitoral {
	var totalDonacionesRecibidas = 0
	method recibirDonacion(monto){
		totalDonacionesRecibidas += monto
	}
	method totalDonacionesRecibidas(){
		return totalDonacionesRecibidas
	}
}
