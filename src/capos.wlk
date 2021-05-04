import artefactos.*

object castillo {
	
	const property artefactos = #{}
		
	method agregarArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)		
	}
	
	method artefactoMasPoderoso(personaje) {
		return artefactos.max({ artefacto => artefacto.poderQueAporta(personaje) })
	}
	
}


object rolando {

	const property artefactos = #{}
	var property capacidad = 2
	const casa = castillo // TODO: Renombrar a morada
	const property historia = []
	var property poderBase = 5

	method poderDePelea() {
		return poderBase + self.poderDeArtefactos()
	}
	
	method poderDeArtefactos() {
			// Hace la sumatoria de los poderes que aportan todos lo artefactos 
		return artefactos.sum({ artefacto => artefacto.poderQueAporta(self) })
	}

	method luchar() {
			// Le envía una orden a cada artefacto - ACCIÓN
		artefactos.forEach({ artefacto => artefacto.usar() })
		poderBase = poderBase + 1
	}

	method encontrar(artefacto) {
		if(self.tieneEspacio()) {
			artefactos.add(artefacto)
		}
		historia.add(artefacto)
	}
	
	method volverACasa() {
		casa.agregarArtefactos(artefactos)
		artefactos.clear()
	}
	
	method artefactoMasPoderosoEnCasa() {
		return casa.artefactoMasPoderoso(self) 
	}
	
	method leGanasA(enemigo) {
		return enemigo.poderDePelea() < self.poderDePelea()
	}
	
	method tieneArtefactoFatalContra(enemigo) {
		return self.posesiones()
			.any({ artefacto => self.leGanasUsando(artefacto, enemigo) })
	}
	
	method artefactoFatalContra(enemigo) {
		return self.posesiones()
			.find({ artefacto => self.leGanasUsando(artefacto, enemigo) })
	}
	
	method posesiones() {
		return self.artefactos() + casa.artefactos()
	}
	
	method posee(artefacto) {
		return self.posesiones().contains(artefacto)	
	}
	
	method tieneEspacio() {
		return artefactos.size() < capacidad 
	}
	
	method leGanasUsando(artefacto, enemigo) {
		return artefacto.poderQueAporta(self) > enemigo.poderDePelea()
	}
		
}

