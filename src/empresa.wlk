class Empresa {
	var property honorarioDeReferencia
	const profesionales = #{}
	const clientes = #{}
	method puedeSatisfacerA(solicitante){
		// TODO GRAVE. Debería usar polimorfismo entre personas y empresas.
		return if(solicitante.esPersona()) self.estaCubierta(solicitante.provincia()) 
			else profesionales.any { profesional => 
				// TODO Repite código.
				solicitante.universidades().contains(profesional.universidad())
			}
	}
	
	method darServicio(solicitante){
		if(self.puedeSatisfacerA(solicitante)){
			const profesional = self.profesionalPara(solicitante)
			profesional.cobrar(profesional.honorariosPorHora())
			clientes.add(solicitante)
		}
		else{
			self.error("No se puede satisfacer al solicitante")
		}
	}
	
	method cantidadDeClientes(){
		return clientes.asSet().size()
	}
	
	method esCliente(solicitante){
		return clientes.contains(solicitante)
	}
	
	method profesionalPara(solicitante){
		// TODO Grave, no usa polimorfismo y repite código
		if(solicitante.esPersona()){
			return profesionales.find { profesional => profesional.provinciasDondePuedeTrabajar().contains(solicitante.provincia())  }
		}
		else{
			return profesionales.find { profesional => solicitante.universidades().contains(profesional.universidad())}
		}
	}
	
	method contratar(profesional){
		profesionales.add(profesional)
	}
	method profesionalesCaros(){
		return profesionales.filter { profesional => profesional.honorariosPorHora() > honorarioDeReferencia }
	}
	method universidadesFormadoras(){
		return profesionales.map { profesional => profesional.universidad() }.asSet()
	}
	method profesionalMasBarato(){
		return profesionales.min { profesional => profesional.honorariosPorHora() }
	}
	method estaCubierta(provincia){
		return profesionales.any { profesional => profesional.provinciasDondePuedeTrabajar().contains(provincia) }
	}
	method cantidadDeProfesionalesFormadosEn(universidad){
		return profesionales.count { profesional => profesional.universidad() == universidad }
	}

	// TODO Dividir en subtareas
	method esProfesionalPocoAtractivo(profesionalAEvaluar){
		return profesionalAEvaluar.provinciasDondePuedeTrabajar().all { provincia => 
			profesionales.any { profesional => 
				profesional.provinciasDondePuedeTrabajar().contains(provincia)
				and (profesional.honorariosPorHora() < profesionalAEvaluar.honorariosPorHora())
			}
		}
	}
}
