object erethia {
	const habitantes = #{archibaldo, caterina, astra}
	
	method enemigosVenciblesPara(personaje) {
		return habitantes.filter({ enemigo => personaje.leGanasA(enemigo) })
	}
	
	method moradasConquistablesPara(personaje) {
		return self.enemigosVenciblesPara(personaje)
				.map({ enemigo => enemigo.morada() })
				.asSet()
	}
	
	method esPoderoso(personaje) {
//		return self.enemigosVenciblesPara(personaje) == habitantes
		return habitantes.all({ enemigo => personaje.leGanasA(enemigo) })
	}
}

object archibaldo {
	method poderDePelea() {
		return 16
	}
	
	method morada() {
		return palacio
	}
}

object caterina {
	method poderDePelea() {
		return 28
	}
	
	method morada() {
		return fortaleza
	}
}

object astra {
	method poderDePelea() {
		return 14
	}
	
	method morada() {
		return torre
	}
}

// Moradas
object palacio { }
object fortaleza { }
object torre { }
