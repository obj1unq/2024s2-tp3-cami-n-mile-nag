object knightRider {
	const property bulto = 1
	
	method peso() = 500
	
	method nivelDePeligrosidad() = 10
	
	method serCargada() {
		
	}
}

object bumblebee {
	const property bulto = 2
	var property estado = auto
	
	method peso() = 800
	
	method nivelDePeligrosidad() = estado.nivelDePeligrosidad()
	
	method serCargada() {
		self.estado(robot)
	}
}

object auto {
	method nivelDePeligrosidad() = 15
}

object robot {
	method nivelDePeligrosidad() = 30
}

object paqueteDeLadrillos {
	var cantidadDeLadrillos = 0
	
	method peso() = 2 * cantidadDeLadrillos
	
	method nivelDePeligrosidad() = 2
	
	method cantidadDeLadrillos() = cantidadDeLadrillos
	
	method bulto() = self.bultoSegunCantidadDeLadrillos()
	
	method bultoSegunCantidadDeLadrillos() {
		if (cantidadDeLadrillos <= 100) {
			return 1
		}
		if (cantidadDeLadrillos <= 300) {
			return 2
		}
		return 3
	}
	
	method serCargada() {
		cantidadDeLadrillos = cantidadDeLadrillos + 12
	}
}

object arenaAGranel {
	var peso = 0
	const property bulto = 1
	
	method peso() {
	  return peso
	}

	method nivelDePeligrosidad() = 1
	
	method serCargada() {
		peso += 20
	}
}

object bateriaAntiaerea {
	var property estado = conMisiles
	
	method bulto() = estado.bulto()
	
	method peso() = estado.peso()
	
	method nivelDePeligrosidad() = estado.nivelDePeligrosidad()
	
	method serCargada() {
		self.estado(conMisiles)
	}
}

object conMisiles {
	const property bulto = 2
	
	method peso() = 300
	
	method nivelDePeligrosidad() = 100
}

object sinMisiles {
	const property bulto = 1
	
	method peso() = 200
	
	method nivelDePeligrosidad() = 0
}

object contenedorPorturario {
	const cosasAdentro = []
	
	method agregarCosa(cosa) {
		cosas.add(cosa)
	}
	
	method bulto() = cosasAdentro.sum({ cosa => cosa.bulto() }) + 1
	
	method cantDeCosasQueTieneAdentro() = cosasAdentro.size()
	
	method peso() = 100 + self.cantDeCosasQueTieneAdentro()
	
	method nivelDePeligrosidad() = self.nivelDePeligrosidadDeTodasLasCosas().maxIfEmpty(
		{ 0 }
	)
	
	method nivelDePeligrosidadDeTodasLasCosas() = cosasAdentro.map(
		{ cosa => cosa.nivelDePeligrosidad() }
	)
	
	method serCargada() {
		cosasAdentro.foreach({ cosa => cosa.serCargada() })
	}
}

object residuosRadioactivos {
	const property bulto = 1
	var peso = 0
	
	method peso() {
	  return peso
	}

	method nivelDePeligrosidad() = 200
	
	method serCargada() {
		peso +=15
	}
}

object embalajeDeSeguridad {
	const property bulto = 2
	var property cosaQueRecubre = residuosRadioactivos
	
	method peso() = cosaQueRecubre.peso()
	
	method nivelDePeligrosidad() = cosaQueRecubre.nivelDePeligrosidad() / 2
	
	method serCargada() {
		
	}
}