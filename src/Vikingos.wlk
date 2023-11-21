import Expediciones.*
import Castas.*

class Vikingo {
	var tipo
	var oro
	
	method oro() = oro
	
	method tipo(nuevoTipo) {
		tipo = nuevoTipo
	}
	
	method esProductivo()
	method extra()
	method cobrarVida(){}
	method irAExpedicion(expedicion) {
		if(self.esProductivo())
			expedicion.anotar(self)
		else
			throw new DomainException(message = "No puede ir a la expedicion")
	}
	method escalar() {
		tipo.ascender(self)
	}
	
	method aumentarRiqueza(aumento) {
		oro += aumento
	}
}

class Soldado inherits Vikingo {
	var vidasCobradas
	var cantArmas
	
	method tieneArmas() = cantArmas > 0
	override method esProductivo() = self.tieneArmas() && vidasCobradas > 20 && tipo != jarl
	override method cobrarVida() {
		vidasCobradas += 1
	}
	override method extra() {
		cantArmas += 10
	}
}

class Granjero inherits Vikingo {
	var cantHijos
	var hectareas
	
	method puedeAlimentarASusHijos() = hectareas/cantHijos >= 2
	override method esProductivo() = self.puedeAlimentarASusHijos()
	override method extra() {
		cantHijos += 2
		hectareas += 2
	}
}
