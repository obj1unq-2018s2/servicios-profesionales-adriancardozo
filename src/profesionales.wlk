import asociacionDeProfesionalesDelLitoral.*
// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Rios", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	method cobrar(monto){
		asociacionDeProfesionalesDelLitoral.recibirDonacion(monto)
	}
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method honorariosPorHora() { return universidad.honorariosRecomendados() }
	method provinciasDondePuedeTrabajar() { return #{ universidad.provincia() } }
	method cobrar(monto){
		universidad.recibirDonacion(monto / 2)
	}
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	var property provinciasDondePuedeTrabajar = #{}
	var property honorariosPorHora
	var totalRecaudado = 0
	
	method totalRecaudado() = totalRecaudado
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method cobrar(monto){
		totalRecaudado += monto
	}
	method pasarDinero(profesionalLibre, monto){
		totalRecaudado -= monto
		profesionalLibre.recibirDinero(monto)
	}
	method recibirDinero(monto){
		totalRecaudado += monto
	}
}
