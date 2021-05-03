object espada {
	var fueUsada = false
	
	method poderQueAporta(personaje) {
		return personaje.poderBase() * self.factorDeUso()
	}
	
	method usar() {
		fueUsada = true
	}
	
	method factorDeUso() {
		return if (fueUsada) 0.5 else 1 
	} 
}

object collar {
	var cantidadDeUsos = 0
	
	method poderQueAporta(personaje) {
		return 3 + self.poderExtra(personaje)
	}
	
	method usar() {
		cantidadDeUsos += 1
	}
	
	method poderExtra(personaje) {
		return if (personaje.poderBase() > 6) cantidadDeUsos else 0
	}	
}

object armadura {
	method poderQueAporta(personaje) {
		return 6
	}
	
	method usar() {
		// No hace nada
	}
}


object libro {
	var property hechizos = []
	
	method poderQueAporta(personaje) {
		return if (self.tieneHechizo()) 
			self.hechizoActual().poderDeMagia(personaje)
		else
			0 
	}
	
	method usar() {
		hechizos.remove(self.hechizoActual())
	}
	
	method hechizoActual() {
		return hechizos.head()
	}
	
	method tieneHechizo() {
		return not hechizos.isEmpty() 
	}
}

object bendicion {
	method poderDeMagia(personaje) {
		return 4
	}
}

object invisibilidad {
	method poderDeMagia(personaje) {
		return personaje.poderBase()
	}
}

object invocacion {
	method poderDeMagia(personaje) {
		return personaje.artefactoMasPoderosoEnCasa().poderQueAporta(personaje)
	}
}


