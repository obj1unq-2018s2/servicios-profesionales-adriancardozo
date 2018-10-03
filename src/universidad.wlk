class Universidad {
	var property provincia
	var property honorariosRecomendados
	var totalDonacionesRecibidas = 0
	method recibirDonacion(monto){
		totalDonacionesRecibidas += monto
	}
	method totalDonacionesRecibidas(){
		return totalDonacionesRecibidas
	}
}
